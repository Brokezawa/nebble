#!/usr/bin/env bash
# Build matrix test for Nebble examples
# Tests all examples on all 6 Pebble platforms

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXAMPLES_DIR="$SCRIPT_DIR/examples"
PLATFORMS=(aplite basalt chalk diorite emery flint)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "═══════════════════════════════════════════════════════"
echo "Nebble Build Matrix Test"
echo "═══════════════════════════════════════════════════════"
echo ""

# Find all example projects
EXAMPLES=()
for dir in "$EXAMPLES_DIR"/*/ ; do
    if ls "$dir/src/"*.nim > /dev/null 2>&1; then
        EXAMPLES+=("$(basename "$dir")")
    fi
done

echo "Found ${#EXAMPLES[@]} examples: ${EXAMPLES[*]}"
echo "Testing on ${#PLATFORMS[@]} platforms: ${PLATFORMS[*]}"
echo ""

TOTAL_BUILDS=$((${#EXAMPLES[@]} * ${#PLATFORMS[@]}))
SUCCESSFUL=0
FAILED=0

# Build each example for each platform
for example in "${EXAMPLES[@]}"; do
    echo -e "${BLUE}═══ Testing: $example ═══${NC}"
    cd "$EXAMPLES_DIR/$example"
    
    for platform in "${PLATFORMS[@]}"; do
        printf "  %-20s %-10s ... " "$example" "$platform"
        
        # Build for this platform (suppress most output)
        if ../../cli/bin/nebble build --platform "$platform" > /dev/null 2>&1; then
            # Check if binary exists
            if [ -f "build/$platform/pebble-app.elf" ]; then
                # Get size information
                SIZE_INFO=$(arm-none-eabi-size build/$platform/pebble-app.elf 2>/dev/null | tail -1)
                TOTAL=$(echo "$SIZE_INFO" | awk '{print $4}')
                
                SUCCESSFUL=$((SUCCESSFUL + 1))
                echo -e "${GREEN}✓${NC} ($TOTAL bytes)"
            else
                FAILED=$((FAILED + 1))
                echo -e "${RED}✗ (binary not found)${NC}"
            fi
        else
            FAILED=$((FAILED + 1))
            echo -e "${RED}✗ (build failed)${NC}"
        fi
    done
    
    echo ""
    cd - > /dev/null
done

echo ""
echo "═══════════════════════════════════════════════════════"
echo "Binary Sizes"
echo "═══════════════════════════════════════════════════════"
echo ""

printf "%-20s " "Example"
for platform in "${PLATFORMS[@]}"; do
    printf "%-10s " "$platform"
done
echo ""

printf "%-20s " "--------------------"
for platform in "${PLATFORMS[@]}"; do
    printf "%-10s " "----------"
done
echo ""

for example in "${EXAMPLES[@]}"; do
    printf "%-20s " "$example"
    for platform in "${PLATFORMS[@]}"; do
        if [ -f "$EXAMPLES_DIR/$example/build/$platform/pebble-app.elf" ]; then
            SIZE_INFO=$(arm-none-eabi-size "$EXAMPLES_DIR/$example/build/$platform/pebble-app.elf" 2>/dev/null | tail -1)
            TOTAL=$(echo "$SIZE_INFO" | awk '{print $4}')
            printf "%-10s " "$TOTAL"
        else
            printf "%-10s " "-"
        fi
    done
    echo ""
done

echo ""
echo "═══════════════════════════════════════════════════════"
echo "Aplite RAM Usage (24 KB limit)"
echo "═══════════════════════════════════════════════════════"
echo ""

SIZE_GATE_FAILED=0

for example in "${EXAMPLES[@]}"; do
    if [ -f "$EXAMPLES_DIR/$example/build/aplite/pebble-app.elf" ]; then
        SIZE_INFO=$(arm-none-eabi-size "$EXAMPLES_DIR/$example/build/aplite/pebble-app.elf" 2>/dev/null | tail -1)
        DATA=$(echo "$SIZE_INFO" | awk '{print $2}')
        BSS=$(echo "$SIZE_INFO" | awk '{print $3}')
        RAM_USAGE=$((DATA + BSS))
        RAM_PERCENT=$(awk "BEGIN {printf \"%.1f\", $RAM_USAGE * 100 / 24576}")
        
        printf "%-20s: %5d bytes (%5s%%) " "$example" "$RAM_USAGE" "$RAM_PERCENT"
        
        # Check if over limit (24576 bytes = 24 KB)
        if [ "$RAM_USAGE" -gt 24576 ]; then
            echo -e "${RED}✗ EXCEEDS 24KB LIMIT!${NC}"
            SIZE_GATE_FAILED=1
        elif awk "BEGIN {exit !($RAM_PERCENT < 50)}"; then
            echo -e "${GREEN}✓ Excellent${NC}"
        elif awk "BEGIN {exit !($RAM_PERCENT < 75)}"; then
            echo -e "${YELLOW}⚠ Good${NC}"
        else
            echo -e "${YELLOW}⚠ High (but within limit)${NC}"
        fi
    fi
done

echo ""
echo "═══════════════════════════════════════════════════════"
echo "Results"
echo "═══════════════════════════════════════════════════════"
echo ""
echo "Total builds: $TOTAL_BUILDS"
echo -e "${GREEN}Successful: $SUCCESSFUL${NC}"
echo -e "${RED}Failed: $FAILED${NC}"

if [ $SIZE_GATE_FAILED -ne 0 ]; then
    echo -e "${RED}Binary size gate: FAILED (one or more examples exceed 24KB Aplite limit)${NC}"
fi

echo ""

if [ $FAILED -eq 0 ] && [ $SIZE_GATE_FAILED -eq 0 ]; then
    echo -e "${GREEN}All builds successful and within size limits! ✓${NC}"
    exit 0
elif [ $FAILED -ne 0 ]; then
    echo -e "${RED}Some builds failed! ✗${NC}"
    exit 1
else
    echo -e "${RED}Build size check failed! ✗${NC}"
    exit 1
fi

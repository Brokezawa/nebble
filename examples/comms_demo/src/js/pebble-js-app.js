console.log('JS: Script loaded at top level');

Pebble.addEventListener('ready', function(e) {
  console.log('JS: ready event fired');
  try {
    // Correct API name: showSimpleNotificationOnPebble
    Pebble.showSimpleNotificationOnPebble('Nebble', 'JS Component Ready');
    
    // Send a test message to confirm JS is alive and ready
    console.log('JS: Sending JSReady signal to watch...');
    Pebble.sendAppMessage({ 'JSReady': 1 }, function(e) {
      console.log('JS: Successfully sent JSReady to watch');
    }, function(e) {
      console.log('JS: Error sending JSReady: ' + JSON.stringify(e));
    });
  } catch (err) {
    console.log('JS: Error in ready handler: ' + err.message);
  }
});

Pebble.addEventListener('appmessage', function(e) {
  console.log('JS: Received message from watch: ' + JSON.stringify(e.payload));
  
  if (e.payload.WatchReady) {
    console.log('JS: Received WatchReady, responding with JSReady...');
    Pebble.sendAppMessage({ 'JSReady': 1 });
    return;
  }

  // Use named keys as defined in package.json messageKeys
  var msg = e.payload.Msg;
  if (msg === 'Ping') {
    console.log('JS: Received Ping, sending Pong...');
    Pebble.sendAppMessage({ 'Msg': 'Pong' }, function(e) {
      console.log('JS: Successfully sent Pong back to watch');
    }, function(e) {
      console.log('JS: Error sending Pong: ' + JSON.stringify(e));
    });
  }
});

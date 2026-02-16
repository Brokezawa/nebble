console.log('JS: Script loaded at top level');

Pebble.addEventListener('ready', function(e) {
  console.log('JS: Nebble Comms Demo Ready');
  Pebble.showSimpleNotification('Nebble', 'JS Component Ready');
});

Pebble.addEventListener('appmessage', function(e) {
  console.log('JS: Received message from watch: ' + JSON.stringify(e.payload));
  
  if (e.payload.Msg === 'Ping') {
    console.log('JS: Received Ping, sending Pong...');
    Pebble.sendAppMessage({ 'Msg': 'Pong' }, function(e) {
      console.log('JS: Successfully sent Pong back to watch');
    }, function(e) {
      console.log('JS: Error sending Pong: ' + JSON.stringify(e));
    });
  } else {
    console.log('JS: Received unknown message: ' + JSON.stringify(e.payload));
  }
});

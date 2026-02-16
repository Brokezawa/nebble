Pebble.addEventListener('ready', function(e) {
  console.log('Nebble Comms Demo JS Ready');
});

Pebble.addEventListener('appmessage', function(e) {
  console.log('Received message from watch: ' + JSON.stringify(e.payload));
  
  // If we receive a Ping (Msg key), send back a Pong
  // Assuming Msg key is 0 based on appinfo.json / nebble.json
  if (e.payload.Msg === 'Ping') {
    Pebble.sendAppMessage({ 'Msg': 'Pong' }, function(e) {
      console.log('Successfully sent Pong back to watch');
    }, function(e) {
      console.log('Error sending Pong back to watch: ' + JSON.stringify(e));
    });
  }
});

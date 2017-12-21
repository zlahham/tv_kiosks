App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  // Called when there's incoming data on the websocket for this channel
  received: function(data) {
    if (data.blank == null) {

      if (data.post.category == 'news') {
        $('#category').append('<div class="tab">' + '<div class="card text-black bg-light mb-3" style="max-width: 20rem;">' + '<div class="card-body">' + '<i class="fa fa-rss"></i> News' + '</div>' + '</div>' + '</div>');
        $('#div-center').append('<div class="card border-info post mt-3" duration="' + data.post.duration + '">' + '<div class="card-header text-center">' + data.post.title + '</div>' + '<div class="card-body">' + '<p class="card-text">' + data.post.content + '</p>' +  '</div>' + '<div class="card-footer text-muted">' + data.post.date + '</div>' + '</div>');
      } else if (data.post.category == 'event') {
        $('#category').append('<div class="tab">' + '<div class="card text-black bg-light mb-3" style="max-width: 20rem;">' + '<div class="card-body">' + '<i class="fa fa-calendar"></i> Event' + '</div>' + '</div>' + '</div>');
        $('#div-center').append('<div class="card border-info post mt-3" duration="' + data.post.duration + '">' + '<div class="card-header text-center">' + data.post.title + '</div>' + '<div class="card-body">' + '<p class="card-text">' + data.post.content + '</p>' +  '</div>' + '<div class="card-footer text-muted">' + data.post.date + '</div>' + '</div>');
      } else if (data.post.category == 'emergency') {
        $('#category').empty();
        $('#div-center').empty();
      }
    }
  }
});

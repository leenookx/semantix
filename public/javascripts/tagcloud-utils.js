var myTagCloudTimer = new Countdown({
                        seconds: 5,
                        onCounterEnd: function() {
                          updateTagCloud();
                        }
                      });

function createNewTagCloud(tag, url, src) {
  var req = new Ajax.Request("/tagcloud/", {
          method: 'POST',
          onFailure: function(request) {
            alert('AJAX doesnt work.');
          },
          parameters: {id: 1}
      });
}

function addToTagCloud(tag, url, src) {
  myTagCloudTimer.stop();

  var req = new Ajax.Request("/tagcloud/", {
          method: 'PUT',
          onFailure: function(request) {
            alert('AJAX doesnt work.');
          },
          parameters: {tag: tag, url: url, src: src}
      });

  myTagCloudTimer.start();
}

function updateTagCloud() {
  var req = new Ajax.Request("/tagcloud/1.json", {
          method: 'GET',
          onFailure: function(request) {
            alert('AJAX doesnt work.');
          },
          onComplete: function(request) {
            receiveTagCloudResponse( request.responseXML );
          }
      });
}

function receiveTagCloudResponse( response ) {
  if (response != "") {
    var doc = JSON.parse(response);
    var tags = doc['tags'];
    var point = document.getElementById('tagcloud');
    for (var i = 0; i < tags.length; i++) {
    }
  }
  else {
    showStatus("Something went wrong with the retrieval of the tag cloud information.");
  }
}


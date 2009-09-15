function queryFlickr(keywords) {
  // Clear out any old data that's hanging about.
  var flickr = document.getElementById('flickr');
  flickr.innerHTML = "";

  var req = new Ajax.Request("/flickr/" + sanitize( keywords ) + ".json", {
          method: 'GET',
          onFailure: function(request) {
            alert('AJAX doesnt work.');
          },
          onComplete: function(request) {
            receiveFlickrResponse( request.responseText );
          }
      });

  return true;
}

function receiveFlickrResponse(results) {
  if (results != "") {
    showStatus("done.");
    var jdoc = results.evalJSON();
    var result = jdoc['items'];
    var tmp = "";
    var point = document.getElementById('flickr');
    for (var i = 0; i < result.length; i++) {
      tmp += "<img src='" + result[i]['media']['m'] + "'/>";
    }
    point.innerHTML = tmp;
  }
  else {
    showStatus("Bad Flickr results.");
  }
}


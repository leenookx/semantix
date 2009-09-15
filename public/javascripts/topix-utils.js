function queryTopix(keywords) {
  // Clear out any old data that's hanging about.
  var topix = document.getElementById('topix');
  topix.innerHTML = "";

  var req = new Ajax.Request("/topix/" + sanitize( keywords ) + ".rss", {
          method: 'GET',
          onFailure: function(request) {
            alert('AJAX doesnt work.');
          },
          onComplete: function(request) {
            receiveTopixResponse( request.responseXML );
          }
      });

  return true;
}

function receiveTopixResponse(results) {
  if (results != "") {
    var feeditems = results.getElementsByTagName('item');
    var point = document.getElementById('topix');
    for (var i = 0; i < feeditems.length; i++) {
      var tmp = "<div id='story" + i + "' class='story'>"
                + "<p class='story-header'><a href='" + feeditems[i].getElementsByTagName("link")[0].firstChild.nodeValue + "'>"
                    + feeditems[i].getElementsByTagName("title")[0].firstChild.nodeValue + "</a></p>"
                + "<p class='story-details'>" + feeditems[i].getElementsByTagName("description")[0].firstChild.nodeValue + "</p>"
                + "<p class='story-footer'><b>Source:</b> " + feeditems[i].getElementsByTagName("source")[0].firstChild.nodeValue
                         + " <em>(" + feeditems[i].getElementsByTagName("pubDate")[0].firstChild.nodeValue + ")</em></p>"
                + "<p class='story-categories'>Categories: ";
      var categories = feeditems[i].getElementsByTagName('category');
      for (var j = 0; j < categories.length; j++) {
        if (j > 0) {
          tmp += ", ";
        }
        tmp += categories[j].firstChild.nodeValue;
      }
      tmp += "</p></div>";

      point.innerHTML += tmp;
    }
  }
  else {
    showStatus("Bad results from Topix");
  }
}


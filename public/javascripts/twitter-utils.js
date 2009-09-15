function queryTwitter() {
  var req = new Ajax.Request("/twitter_trends/1.json", {
          method: 'GET',
          onFailure: function(request) {
            alert('AJAX doesnt work.');
          },
          onComplete: function(request) {
            receiveTwitterResponse( request.responseText);
          }
      });
}

function receiveTwitterResponse(results) {
  if (results != "") {
    showStatus("done.");
    var result = JSON.parse(results);
    var point = document.getElementById('twittertrends');
    point.innerHTML = "<ol>";
    for (var i = 0; i < result.length; i++) {
      point.innerHTML += "<li><a href='#' onclick='return doQueries(\"" + result[i]['twitter_trend']['name'] + "\");' onmouseover=\"window.status = 'click me'; return true;\" onmouseout=\"window.status = ''; return true;\">" + result[i]['twitter_trend']['name'] + "</a></li>";
    }
    point.innerHTML += "</ol>";
  }
  else {
    showStatus("Bad AJAX results");
  }
}


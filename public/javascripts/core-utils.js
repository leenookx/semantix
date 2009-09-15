function showStatus(message) {
  var status = document.getElementById('status');
  status.innerHTML = message;
}

// Sanitise a string so it can be passed around more easily
// and safely to queryable sources.
function sanitize(string){
  string = string.replace("#","");
  string = string.replace(/ /g, "+");
  string = string.toLowerCase();

  return encodeURI(string);
}


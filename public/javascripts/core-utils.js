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

function Countdown(options) {
  var timer,
  instance = this,
  seconds = options.seconds || 10,
  updateStatus = options.onUpdateStatus || function () {},
  counterEnd = options.onCounterEnd || function () {};

  function decrementCounter() {
    updateStatus(seconds);
    if (seconds === 0) {
      counterEnd();
      instance.stop();
    }
    seconds--;
  }

  this.start = function () {
    clearInterval(timer);
    timer = 0;
    seconds = options.seconds;
    timer = setInterval(decrementCounter, 1000);
  };

  this.stop = function () {
    clearInterval(timer);
  };
}


function addToTagCloud(tag, url, src) {
  var req = new Ajax.Request("/tagcloud/", {
          method: 'POST',
          onFailure: function(request) {
            alert('AJAX doesnt work.');
          },
          parameters: {tag: tag, url: url, src: src}
      });
}


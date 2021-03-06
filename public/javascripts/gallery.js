$(window).load(function() {
  var items = [];
  $('#gallery > div.sketch > div.container').each(function(index) {
    items.push(this);
  });
  var load = function() {
    var item = items.shift();
    if(item) {
      var $item = $(item);
      var $img = $item.find('img.loading')
      url = $img.attr('data-url');
      $img.replaceWith('<object data="' + url +'" type="image/svg+xml">');
      setTimeout(load, 500);
    }
  };
  setTimeout(load, 500);
});

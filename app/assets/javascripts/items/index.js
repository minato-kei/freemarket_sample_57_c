$(function(){
  var items_height = [];
  $(window).on("scroll", function(){
    
    var scroll_bottom = $(this).scrollTop() + window_size;
    
    $(".list_item").each(function(){
      var item = $(this).offset().top;
      var window_size = $(this).innerHeight();
      var scroll_bottom = $(this).scrollTop() + window_size;
      if (scroll_bottom > item) {
        $(this).
      }
    });
    
  });
});
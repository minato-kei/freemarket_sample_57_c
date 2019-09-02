$(function(){
  $(document).ready(function(){
    $(".list_item").each(function(){
      var item = $(this).offset().top;
      if (scroll_bottom > item) {
        $(this).animate({opacity: 1}, 1000);
      }
    });
  });
  $(window).on("scroll", function(){
    var window_size = $(this).innerHeight();
    var scroll_bottom = $(this).scrollTop() + window_size;
    $(".list_item").each(function(){
      var item = $(this).offset().top;
      if (scroll_bottom > item) {
        $(this).animate({opacity: 1}, 1000);
      }
    });
  });
});
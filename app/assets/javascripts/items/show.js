$(function(){
  $(document).on('turbolinks:load', function() {
    if (document.URL.match("items/")){
      $(".item-edit_delete").on("click", function(e){
        e.preventDefault();
        $(".dialog, .dialog_content").css("display", "flex");
      })
      $(".dialog_content_btn_cancel, .dialog").on("click", function(e){
        e.preventDefault();
        $(".dialog, .dialog_content").css("display", "none");
      });
    }
  });
});
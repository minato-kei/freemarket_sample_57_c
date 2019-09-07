$(document).on('turbolinks:load', function() {
  $('#search-category-root').on('change', function(e){
    var id = $('#search-category-root option:selected').val();
    if (id.length==0){
      console.log("is blank")
      $(".search-category-child").siblings().addClass("hide")
    }
    $(`#category_${id}`).removeClass("hide")
    $(`#category_${id}`).siblings().addClass("hide")
    var child_id = $(`#category_${id}`).val()
    $(`#category_${child_id}`).removeClass("hide")
  });
  $('.search-category-child').on('change',function(e){
    var id = $(this).val();
    console.log(`${id}`);
    if (id.length==0){
      $(this).siblings("div").addClass("hide")
    }
    $(`#category_${id}`).removeClass("hide")
    $(`#category_${id}`).siblings("div").addClass("hide")
  });

});
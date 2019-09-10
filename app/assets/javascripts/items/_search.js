$(document).on('turbolinks:load', function() {
  // category
  $('#search-category-root').on('change', function(e){
    var id = $('#search-category-root option:selected').val();
    if (id.length==0){
      $(".search-category-child").siblings().addClass("hide")
    }
    $(`#category_${id}`).removeClass("hide")
    $(`#category_${id}`).siblings().addClass("hide")
    var child_id = $(`#category_${id}`).val()
    $(`#category_${child_id}`).removeClass("hide")
  });
  $('.search-category-child').on('change',function(e){
    var id = $(this).val();
    if (id.length==0){
      $(this).siblings("div").addClass("hide")
    }
    $(`#category_${id}`).removeClass("hide")
    $(`#category_${id}`).siblings("div").addClass("hide")
  });
  $('#search__reset').on('click', function(e){
    $('#category__child').children().addClass("hide")
  });
  // price
  $("#price_id").on('change', function(e){
    var price = $('#price_id  option:selected').text().split('~')
    $('#min').val(price[0])
    $('#max').val(price[1])

  })
});
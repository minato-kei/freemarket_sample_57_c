$(function(){
  
  $('.left-box__category').on({
    'mouseenter': function(e){
      $(this).children('.left-box__category-dropdown').children('.left-box__category-dropdown-big-category').addClass('display_flex');
      $(this).children('.left-box__category-dropdown').children('.left-box__category-dropdown-big-category').children('.left-box__category-dropdown-big-category-btn').on({'mouseover': function(e){        
        $('.left-box__category-dropdown-middle-category').addClass('display_none');
        $('.left-box__category-dropdown-middle-category').removeClass('display_flex');
        $(this).next('.left-box__category-dropdown-middle-category').removeClass('display_none');
        $(this).next('.left-box__category-dropdown-middle-category').addClass('display_flex');
        $(this).next('.left-box__category-dropdown-middle-category').children('.left-box__category-dropdown-middle-category-btn').on({'mouseover' : function(e){
          $(this).parents('ul').removeClass('display_none');
          $(this).next('.left-box__category-dropdown-small-category').addClass('display_flex');
          $(this).next('.left-box__category-dropdown-small-category').removeClass('display_none');
          
        },'mouseleave': function(e){
          console.log($(":hover").last().attr("class"));
          if ($(":hover").last().attr("class") == $(".left-box__category-dropdown-small-category-btn").attr("class")){
            console.log("success");
            $(this).next('.left-box__category-dropdown-small-category').removeClass('display_none');
            $(this).next('.left-box__category-dropdown-small-category').addClass('display_flex');
          } else if($(":hover").last().attr("id") == $(".left-box__category-dropdown-small-category").attr("id")){
            $(".left-box__category-dropdown-small-category").on("mouseleave", function(){
              $(this).removeClass("display_flex");
              $(this).addClass("display_none");
            });
            console.log("success  black");
            $(this).next('.left-box__category-dropdown-small-category').removeClass('display_none');
            $(this).next('.left-box__category-dropdown-small-category').addClass('display_flex');
          } else {
            console.log("dont");
            $(this).next('.left-box__category-dropdown-small-category').addClass('display_none');
            $(this).next('.left-box__category-dropdown-small-category').removeClass('display_flex');  
          }
        }});
      },'mouseleave': function(e){
     
        console.log('bye_,middle');
        $(this).next('.left-box__category-dropdown-middle-category').addClass('display_none');
      }});
  }, 'mouseleave': function(e){
 
    console.log('bye');
    $(this).children('.left-box__category-dropdown').children('.left-box__category-dropdown-big-category').removeClass('display_flex');
    $(this).children('.left-box__category-dropdown').children('.left-box__category-dropdown-big-category').children('.left-box__category-dropdown-middle-category').removeClass('display_flex');
    $(this).children('.left-box__category-dropdown').children('.left-box__category-dropdown-big-category').children('.left-box__category-dropdown-middle-category').children('.left-box__category-dropdown-small-category').removeClass('display_flex');
    $(this).children('.left-box__category-dropdown').children('.left-box__category-dropdown-big-category').addClass('display_none');
    $(this).children('.left-box__category-dropdown').children('.left-box__category-dropdown-big-category').children('.left-box__category-dropdown-middle-category').addClass('display_none');
    $(this).children('.left-box__category-dropdown').children('.left-box__category-dropdown-big-category').children('.left-box__category-dropdown-middle-category').children('.left-box__category-dropdown-small-category').addClass('display_none');
    
  }});
  
  $('.left-box__brand').on({'mouseenter': function(){
    $(this).children('.left-box__brand-dropdown').removeClass('display_none');
    $(this).children('.left-box__brand-dropdown').addClass('display_flex');
  },'mouseleave': function(){
    $(this).children('.left-box__brand-dropdown').removeClass('display_flex');
    $(this).children('.left-box__brand-dropdown').addClass('display_none');
    
  }});
});
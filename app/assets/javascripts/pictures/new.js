$(function(){
  if (document.URL.match("/pictures/new")){
    var delete_number = [];
    function handleFileSelect(event){
      var files = event.target.files;
      for (var i = 0; i<files.length; i++){
        f = files[i]
        var reader = new FileReader();
        var p = 0;
        reader.onload = (function(theFile){
          return function(e){
            var $html = `<img class="photo image_${p}" src='${e.target.result}'>
                          <h1 class="image_${p}">削除</h1>`
            $(".file_box").append($html);
            p++ ;
          }
        })(f);
        reader.readAsDataURL(f);
      }
    }
    if (window.File){
      console.log('File APIは利用できます');
      $('.image_field').on('change', handleFileSelect);
      $(document).on('click','h1' ,function(){
        var uploaded_file = $("h1").length;
        var index = $(this).index("h1");
        var delete_image = $(this).attr("class");
        
        delete_number.push(index);
        console.log(delete_number);
        $(`.${delete_image}`).css("display", "none");        
      });
      $(document).on('click', '#button',function(e){
        e.preventDefault();
        var form = $("#new_picture");
        var formData = new FormData(form.get(0));
        formData.append("delete", delete_number);
        console.log(formData);
        $.ajax({
          type: 'POST',
          url: '/pictures',
          data: formData,
          dataType: 'json',
          processData: false,
          contentType: false
        })
        .done(function(data){
          console.log("sccess");
          
        })
        .fail(function(){
          console.log("fail");
        });
      });
    }
    else {
      console.log('File APIは利用できません');
    }
  }
});
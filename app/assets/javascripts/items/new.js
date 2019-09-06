$(function(){
  $(document).on('turbolinks:load', function() {
  if (document.URL.match("/items/new")){
      var delete_number = [];
      var p = 0;
      function handleFileSelect(event){
        var files = document.getElementById("item_image").files;
        for (var i = 0; i<files.length; i++){
          f = files[i]
          var reader = new FileReader();
          
          reader.onload = (function(theFile){
            return function(e){
              var $html = `<div class="drop-box-input_upload ${p}">
                            <img class="photo image_${p} ${p}" src="${e.target.result}">
                            <div class="drop-box-input_upload_edit">
                              <span class="drop-box-input_upload_edit_btn drop-box-input_upload_btn image_edit_${p} ${p}">編集</span>
                              <span class="drop-box-input_upload_delete_btn drop-box-input_upload_btn image_delete_${p} ${p}">削除</span>
                            </div>
                          </div>`
              $(".drop-box-input").append($html);
              p++ ;
            }
          })(f);
          reader.readAsDataURL(f);
        }
      }
      $(".drop-box-input").on("dragover", function(e){
        e.preventDefault();
        
      });
  
      $(".image_field").on("drop change", function(e){
        e.preventDefault();
        console.log(document.getElementById("item_image").files[0]);
        document.getElementById("item_image").files = e.originalEvent.dataTransfer.files;
        handleFileSelect(event);
        
      });
      
      $(document).on('change','#item_image', handleFileSelect);
      $(".sell-upload-box__drop").on('click', '.drop-box-input_upload_delete_btn' ,function(e){
        var uploaded_file_box = $(this).attr("class");
        var this_index = $(this).attr("class").split(" ")[3];
        delete_number.push(this_index);
        $(`div.${this_index}`).css("display", "none");
        console.log(delete_number);
      });
      $(document).on('click', '.btn-default',function(e){
        e.preventDefault();
        var form = $("#new_item");
        var formData = new FormData(form.get(0));
        formData.append("delete", delete_number);
        $.ajax({
          type: 'POST',
          url: '/items',
          data: formData,
          dataType: 'html',
          processData: false,
          contentType: false
        })
        .done(function(data){
          window.location.href = "/";
        })
        .fail(function(){
        });
      });
  }
});
});
$(function(){
  $(document).on('turbolinks:load', function() {
  if (document.URL.match("/.+/edit")){
      var params_id = document.URL.split("/")[4];
      var delete_number = [];
      var uploaded_file_box = $(".drop-box-input_upload").length;
      var p = 0 + uploaded_file_box;
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
                              <span class="${p} drop-box-input_upload_edit_btn drop-box-input_upload_btn image_edit_${p}">編集</span>
                              <span class="${p} drop-box-input_upload_delete_btn drop-box-input_upload_btn image_delete_${p}">削除</span>
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
        $(this).empty();
        document.getElementById("item_image").files = e.originalEvent.dataTransfer.files;
        handleFileSelect(event);
      });
      
      $(document).on('change','#item_image', handleFileSelect);
      $(".edit-upload-box__drop").on('click', '.drop-box-input_upload_delete_btn' ,function(e){        
        var this_index = $(this).attr("class").split(" ")[0];
        delete_number.push(this_index);
        $(`div.${this_index}`).css("display", "none");
      });
      $(document).on('click', '.btn-default',function(e){
        e.preventDefault();
        var form = $("#edit_item");
        var formData = new FormData(form.get(0));
        formData.append("delete", delete_number);
        $.ajax({
          type: 'PATCH',
          url: `/items/${params_id}`,
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
    var big_category = 0;
    var middle_category = 0;
    var small_category = 0;

    $("#item_big_category_id").on("change", function(){
      big_category = $(this).val();
      $(".middle_category_select").css("display", "none");
      $(".small_category_select").css("display", "none");
      $(`.middle-${big_category}`).css("display", "block");
    });
    $(".middle_category_select").on("change", function(){
      middle_category = $(this).val();
      $(".small_category_select").css("display", "none");
      $(`.small-${middle_category}`).css("display", "block");
    });
    $(".small_category_select").on("change", function(){
      small_category = $(this).val();
      $(`#item_category_id`).val(small_category);
    });
  }
});
});
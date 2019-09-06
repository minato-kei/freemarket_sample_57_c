$(document).on(`turbolinks:load`, function() {
  if (document.URL.match("/users/sign_up_credit")){
    console.log("pay!");
    Payjp.setPublicKey('pk_test_bf6034aeeb6c0f02de3ad211');
    var form = $('.register_user_register4_contents_form');
    var number = form.find('input[name="number"]');
    var cvc = form.find('input[name="cvc"]');
    var exp_year = form.find('#_exp_year_1i');
    var exp_month = form.find('#_exp_month_2i');
    $(document).on('click','button',function(e){
      e.preventDefault();
      form.find("input[type='submit']").prop("disabled", true);
      var card = {
        number: number.val(),
        cvc: cvc.val(),
        exp_month: exp_month.val(),
        exp_year: exp_year.val()
      };
      Payjp.createToken(card, function(s, response){
        if (response.error){
          form.find('.payment-errors').text(response.error.message);
          form.find('button').prop('disabled', false);
        }
        else {
          console.log("success");
          $(".credit_card_number_form").removeAttr("name");
          $(".credit_card_cvc_form").removeAttr("name");
          $(".credit_card_exp_month_form").removeAttr("name");
          $(".credit_card_exp_year_form").removeAttr("name");
          var token = response.id;
          form.append($("<input type='hidden' name='payjp_token' class='credit_card_token_form' />").val(token));
          form.get(0).submit();
        };
      });
    });
  }
});
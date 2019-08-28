$(function(){
  Payjp.setPublicKey('pk_test_bf6034aeeb6c0f02de3ad211');

  var form = $('.register_user_register4_contents_form');
  
  var number = form.find('input[name="number"]');
  var cvc = form.find('input[name="cvc"]');
  var exp_month = form.find('select[name="exp_month"]');
  var exp_year = form.find('select[name="exp_year"]');
  form.submit(function(e){
    e.preventDefault();
    form.find("input[type='submit']").prop("disabled", true);
    var card = {
      number: number.value(),
      cvc: cvc.value(),
      exp_month: exp_month.value(),
      exp_year: exp_year.value()
    };
    Payjp.createToken(card, function(s, response){
      if (response.error){
        console.log("failure");
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
      }
    });
  });
});
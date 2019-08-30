class CreditsController < ApplicationController
  require 'payjp'
  

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
    customer = Payjp::Customer.create(card: params[:payjp_token])
    #ユーザー新規登録が完了したら、user_idをcurrent_user.idに変える
    if credit = Credit.create(token: customer.id, user_id: 1)
      redirect_to users_sign_up_complete_path
    else
      redirect_to users_sign_up_payment_confirmatio_path
    end
  end

  
  def pay
    card = Credit.where(user_id: 1).last
    Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
    Payjp::Charge.create(
      :amount => 500,
      :customer => card.token,
      :currency => 'jpy'
    )
    redirect_to users_sign_up_payment_confirmation_path
  end

  private
  


end

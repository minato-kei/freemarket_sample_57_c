class CreditsController < ApplicationController
  require 'payjp'
  

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
    binding.pry
    customer = Payjp::Customer.create(card: params[:payjp_token])
    #ユーザー新規登録が完了したら、user_idをcurrent_user.idに変える
    if credit = Credit.create(token: customer.id, user_id: 1)
      redirect_to users_sign_up_complete_path
    else
      redirect_to users_sign_up_payment_confirmatio_path
    end
  end

  # 支払いメソッド
  # def pay
  #   user = User.find(1)
  #   card = Credit.where(user_id: user.id)　ユーザーidからカードを選択、defaultになっているものを選択
  #   Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
  #   Payjp::Charge.create(
  #     :amount => 500,　支払い料金
  #     :customer => card.token,　カードのtokenを顧客IDとして使用する
  #     :currency => 'jpy'
  #   )
  #   redirect_to users_sign_up_payment_confirmation_path
  # end

  private
  


end

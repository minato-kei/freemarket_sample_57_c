class CreditsController < ApplicationController
  require 'payjp'
  
  def create
    Payjp.api_key = Rails.application.credentials.dig(:payment_secret_key)
    customer = Payjp::Customer.create(card: params[:payjp_token])
    if credit = Credit.create(token: customer.id, user_id: current_user.id)
      redirect_to sign_up_complete_users_path
    else
      redirect_to sign_up_credit_users_path
    end
  end

end

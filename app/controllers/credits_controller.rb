class CreditsController < ApplicationController
  require 'payjp'

  def create
    Payjp.api_key = "sk_test_f4c8afd7cd63a69cc9b6fcd6"
    customer = Payjp::Customer.create(card: params[:token])
    customer.cards.create(token: params[:payjp_token], user_id: current_user.id)
  end
end

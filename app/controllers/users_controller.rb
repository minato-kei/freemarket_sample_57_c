class UsersController < ApplicationController
  def user_information_confirmation
    @user = User.new
  end

  def create_session
    session = user_information_params
    redirect_to users_sign_up_phone_confirmation_path
  end

  def sns_confirmation
  end

  def phone_confirmation
  end

  def shipping_confirmation
  end

  def payment_confirmation
  end

  private
  def user_information_params
    birthday = Date.new(params[:"birthday(1i)"].to_i, params[:"birthday(2i)"].to_i, params[:"birthday(3i)"].to_i)
    params.permit(:nickname, :email, :password, :password_confirmation, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana).merge(birthday: birthday)
  end
end

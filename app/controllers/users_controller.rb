class UsersController < ApplicationController

  def sign_up_user_info
    reset_session
    @user = User.new  
  end

  def sign_up_phone
    @user = User.new  
    user_information_params.each do |key, value|
      session[:"#{key}"] = value
    end
  end

  def sign_up_sms
    session[:phone_number] = params.require(:user).permit(:phone_number)[:phone_number]
    # SMS認証番号を生成。
    # SMS認証番号を送信。  
  end

  def sign_up_shipping
    # SMS認証番号を照会
    # if sms_number == params.require(:user).permit(:sign_up_sms)[:sign_up_sms]
    @user = User.new({nickname: session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], first_name_kanji: session[:first_name_kanji], last_name_kanji: session[:last_name_kanji], first_name_kana: session[:first_name_kana], last_name_kana: session[:last_name_kana], phone_number: session[:phone_number], birthday: session[:birthday]})
    if @user.save
      reset_session
      session[:id] = @user.id
      sign_in @user unless user_signed_in?
    else
      render "sign_up_phone"
    end
    @shipping = Shipping.new  
  end

  def sign_up_credit
    if Shipping.create(shipping_params).valid?
      @credit = Credit.new
    else
      render "sign_up_shipping"
    end  
  end

  def sign_up_credit_create
    binding.pry
    if Credit.create(credit_params).valid?
      redirect_to root_path
    else
      render "sign_up_credit"
    end  
  end

  private
  def user_information_params
    birthday = Date.new(params.require(:user)[:"birthday(1i)"].to_i, params.require(:user)[:"birthday(2i)"].to_i, params.require(:user)[:"birthday(3i)"].to_i)
    
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana, :phone_number).to_h.merge(birthday: birthday)
  end

  def shipping_params
    #テーブル不足分
    # params.require(:shipping).permit(:first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana, :zipcode, :pref, :city, :adress, :building, :phone)
    params.require(:shipping).permit(:zipcode, :pref, :city, :address, :building, :phone).merge(user_id: session[:id])
  end

  def credit_params
    params.require(:credit).permit(:number, :cvc).merge(exp_year: params[:credit][:"exp_year(1i)"], exp_month: params[:credit][:"exp_month(2i)"])
  end
end

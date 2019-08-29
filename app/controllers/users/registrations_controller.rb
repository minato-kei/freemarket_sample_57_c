class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def user_information_confirmation
    @user = User.new
  end

  def create_session
    session = user_information_params.to_h
    redirect_to users_sign_up_phone_confirmation_path
  end

  def sns_confirmation
  end

  def phone_confirmation
    @category = Category.find(1)
    binding.pry
    params = session
    @user = User.new
    binding.pry
  end

  def shipping_confirmation
  end

  def payment_confirmation
  end

  private
  def user_information_params
    birthday = Date.new(params.require(:user)[:"birthday(1i)"].to_i, params.require(:user)[:"birthday(2i)"].to_i, params.require(:user)[:"birthday(3i)"].to_i)
    
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana).merge(birthday: birthday)
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def user_information_confirmation
  end

  def sns_confirmation
  end

  def phone_confirmation
  end

  def shipping_confirmation
  end

  def payment_confirmation
  end

  def complete
  end

  def logout
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

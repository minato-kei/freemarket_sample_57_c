class ApplicationController < ActionController::Base
  before_action :basic_auth, if: proc{Rails.env.production?}
  
  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      username == "57c" && password == "1"
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname, :email, :password, :password_confirmation, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana, :birthday]) 
  end
end
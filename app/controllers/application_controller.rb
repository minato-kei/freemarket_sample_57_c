class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: proc{Rails.env.production?}
  before_action :render_header
  before_action :current_user


  def render_header
    @categories = Category.all
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      username == "57c" && password == "1"
    end
  end


end
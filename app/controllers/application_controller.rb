class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  layout :themes_layout

  before_action :all_usr
  before_action :all_tms

  def after_sign_out_path_for(resource_or_scope)
    themes_path
  end

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path(@user)
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :company_name, :country, :address, :city, :region, :postal_code, :show_country, :profile_heading, :profile_text, :available_freelance, :behance, :deviantart, :dribbble, :facebook, :github, :googleplus, :linkedin, :twitter, :youtube, :reddit, :profile, :homepage ) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :firstname, :lastname, :company_name, :country, :address, :city, :region, :postal_code, :show_country, :profile_heading, :profile_text, :available_freelance, :behance, :deviantart, :dribbble, :facebook, :github, :googleplus, :linkedin, :twitter, :youtube, :reddit, :profile, :homepage) }
  end

  def all_usr
    @users = User.all
  end

  def all_tms
    @tms = Theme.all
  end

  def themes_layout
    if devise_controller?
      "themes"
    else
      "application"
    end
  end
end

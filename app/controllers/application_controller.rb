class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :themes_layout

  def after_sign_out_path_for(resource_or_scope)
    themes_path
  end

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path(@user)
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :company_name, :country, :address, :city, :region, :postal_code, :show_country, :profile_heading, :profile_text, :available_freelance, :behance, :deviantart, :dribbble, :facebook, :github, :googleplus, :linkedin, :twitter, :youtube, :reddit, :profile, :homepage ) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :firstname, :lastname, :company_name, :country, :address, :city, :region, :postal_code, :show_country, :profile_heading, :profile_text, :available_freelance, :behance, :deviantart, :dribbble, :facebook, :github, :googleplus, :linkedin, :twitter, :youtube, :reddit, :profile, :homepage) }
  end

  def themes_layout
    if devise_controller?
      "themes"
    else
      "application"
    end
  end
end

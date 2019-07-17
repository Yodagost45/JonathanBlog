class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :exception
  
  def configure_devise_permitted_parameters
    registration_params = [:username, :email, :password, :password_confirmation]
    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update, keys: registration_params)
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up, keys: registration_params)
    end
  end
end

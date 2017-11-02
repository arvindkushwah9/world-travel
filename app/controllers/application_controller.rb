class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include ApplicationHelper
  layout :set_layout

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :check_subscription
  def after_sign_in_path_for(resource)
    resource.is_admin? ? admin_root_path : root_path
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role, :first_name, :last_name, :image, :is_active, :is_admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :role, :first_name, :last_name, :image, :is_active, :is_admin])

  end
  def authentication_admin!
      unless current_user.is_admin?
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
      end
  end
end

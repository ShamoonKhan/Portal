class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   redirect_to welcome_index_path
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :first_name, :lname, :role, :cnic_no, :avatar, :contact, :address)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :first_name, :lname, :role, :cnic_no, :password, :current_password, :avatar, :contact, :address)
    end
  end
end

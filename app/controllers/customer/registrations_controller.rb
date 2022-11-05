class Customer::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :destroy]

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def after_sign_up_path_for(resource)
    root_path(resource)
  end

end
# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    customer_homes_about_path
  end

  def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
  
  # def guest_sign_in
  #   customer = customer.guest
  #   sign_in customer
  #   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  # end
end

# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
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

  def new_guest
    customer = Customer.guest
    sign_in customer
    redirect_to root_path
    flash[:alert] = 'ゲストユーザーとしてログインしました。'
  end
  
  protected
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
      redirect_to new_customer_registration_path
    end
  end

end

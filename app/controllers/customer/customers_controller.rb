class Customer::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])

    @customer_reserves = current_customer.reserves.where("start_time >= ?", DateTime.current).order(day: :desc)
    @visit_historys = current_customer.reserves.where("start_time < ?", DateTime.current).where("start_time > ?", DateTime.current << 12).order(day: :desc)

  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_customer_path, notice: "You have updated user successfully."
    else
      render 'edit'
    end
  end

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
  end
end

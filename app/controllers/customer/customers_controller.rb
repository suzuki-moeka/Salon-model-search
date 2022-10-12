class Customer::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
    if params[:id].to_i == current_customer.id
      @customer_reserves = current_customer.reserves.where("start_time >= ?", DateTime.current).order(day: :desc)
      @visit_historys = current_customer.reserves.where("start_time < ?", DateTime.current).where("start_time > ?", DateTime.current << 12).order(day: :desc)
    else
      @posts = @customer.posts
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_customer_path(@customer.id), notice: "You have updated user successfully."
    else
      render 'edit'
    end
  end
  
  def unsubscribe
    @customer = Customer.find_by(email: params[:email])
  end
  
  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
  end
end

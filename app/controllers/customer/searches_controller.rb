class Customer::SearchesController < ApplicationController
  # before_action :authenticate_customer!

  def search
    range = params[:range]
    if range == "post"
      @posts = Post.postlooks(params[:search], params[:word])
    else
      @posts = Post.titlelooks(params[:search], params[:word])
    end
  end

end

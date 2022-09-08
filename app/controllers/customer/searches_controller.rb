class Customer::SearchesController < ApplicationController
  # before_action :authenticate_customer!

  def search
    @range = params[:range]
    if @range == "post"
      @posts = Post.looks(params[:search], params[:word])
      pp '---------'
      pp @posts
    end
  end
end

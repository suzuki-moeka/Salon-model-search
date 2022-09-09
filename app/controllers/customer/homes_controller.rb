class Customer::HomesController < ApplicationController
  def top
    @posts = Post.all
    @post = Post.all
    
  end
end

class Customer::HomesController < ApplicationController
  def top
    @posts = Post.all
    @post_ranks = Post.includes(:liked_customers).sort {|a,b| b.liked_customers.size <=> a.liked_customers.size}
  end

  def about

  end

end

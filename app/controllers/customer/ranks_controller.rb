class Customer::RanksController < ApplicationController
  def rank
    post_like_count = {}
    customer.all.each do |user|
      post_like_count.store(customer, Like.where(post_id: Post.where(customer_id: customer.id).pluck(:id)).count)
    end
    @customer_post_like_ranks = post_like_count.sort_by { |_, v| v }.reverse.to_h.keys
  end
end

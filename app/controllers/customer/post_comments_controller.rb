class Customer::PostCommentsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  
  def create
    @post = Post.find(params[:post_id])
    comment = @post.post_comments.new(post_comment_params)
    comment.customer_id = current_customer.id
    comment.save
    redirect_to customer_post_path(@post)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to customer_post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
  def ensure_user
    @posts = current_customer.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to new_customer_post_path unless @post
  end
end

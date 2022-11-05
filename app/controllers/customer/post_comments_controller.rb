class Customer::PostCommentsController < ApplicationController
  before_action :set_postcomment, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    comment = @post.post_comments.new(post_comment_params)
    comment.customer_id = current_customer.id
    comment.save
    redirect_to customer_post_path(@post)
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to customer_post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

  def set_postcomment
      @post = Post.find(params[:id])
  end

  def prevent_url
    if @post.customer_id != current_customer.id
      redirect_to root_path
    end
  end
end

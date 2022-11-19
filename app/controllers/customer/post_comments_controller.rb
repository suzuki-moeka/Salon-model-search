class Customer::PostCommentsController < ApplicationController
  before_action :set_postcomment, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    comment = @post.post_comments.new(postcomment_params)
    comment.customer_id = current_customer.id
    if comment.save
      redirect_to customer_post_path(@post)
    else
      redirect_to customer_post_path(@post)
    end
  end

  def edit
    @postcomment = PostComment.find(params[:id])
  end

  def update
    @postcomment = PostComment.find(params[:id])
    if @postcomment.update(postcomment_params)
      redirect_to customer_post_path(params[:post_id])
    else
      render "edit"
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to customer_post_path(params[:post_id])
  end

  private

  def postcomment_params
    params.require(:post_comment).permit(:comment)
  end

  def set_postcomment
      @postcomment = PostComment.find(params[:id])
  end

  def prevent_url
    if @postcomment.customer_id != current_customer.id
      redirect_to root_path
    end
  end
end

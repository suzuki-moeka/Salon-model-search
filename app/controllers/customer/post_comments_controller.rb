class Customer::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = @post.post_comments.new(post_comment_params)
    comment.customer_id = current_customer.id
    comment.save
    redirect_to customer_post_path(@post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

class Customer::PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_customer.posts.new(post_params)
    @post.save
    redirect_to root_path
  end

  def index
    @posts = Post.all.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to customer_post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customer_posts_path
  end

  def search_post
     @post=Post.new
     @posts = Post.search(params[:search_word])
  end

  private

  def post_params
    params.require(:post).permit(:title, :price, :post, :timedate, :category, images: [])
  end

  def postcomment_params
    params.require(:post_comment).permit(:comment)
  end

  def set_post
      @post = Post.find(params[:id])
  end

  def prevent_url
    if @post.customer_id != current_customer.id
      redirect_to root_path
    end
  end
end

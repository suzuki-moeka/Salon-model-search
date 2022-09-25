class Customer::PostsController < ApplicationController
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

  def update
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :price, :post, :timedate, :category, images: [])
  end
end

class Customer::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def search_post
     @post=Pook.new
     @posts = Pook.search(params[:keyword])
  end

  def update
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :price, :image, :post, :timedate, :category)
  end
end

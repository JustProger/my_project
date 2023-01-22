class PostsController < ApplicationController
  before_action :authorize

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def remove
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  rescue
    redirect_to root_path
  end

  def index
    @post = Post.all
  end

  def last
    @post = Post.last(10).reverse
  end

  private
    def post_params
      params.require(:post).merge!(author: current_user.id).permit(:title, :content, :author)
    end
end

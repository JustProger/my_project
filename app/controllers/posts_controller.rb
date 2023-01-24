# frozen_string_literal: true

# PostsController description ...
class PostsController < ApplicationController
  before_action :authorize

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    return if @post.user_id == params[:user_id].to_i

    redirect_to request.referer, notice: 'youuuu'
  end

  # PUT method
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params_for_update)
      redirect_to posts_show_path(id: @post.id), notice: 'Post was successfully updated!'
    else
      redirect_to request.referer
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      redirect_to request.referer
    end
  end

  def remove
    post = Post.find(params[:id])
    if post.user_id == params[:user_id].to_i
      post.destroy
      redirect_to posts_path, notice: 'Post was successfully removed!'
    else
      redirect_to request.referer
    end
  end

  def show
    @post = Post.find(params[:id])
  rescue StandardError
    redirect_to root_path
  end

  def index
    @post = Post.all
  end

  def last
    # @posts = Post.last(10).reverse
    @posts = Post.order(clicks: :desc).page params[:page]
  end

  private

  def post_params
    params.require(:post).merge!(user_id: current_user.id).permit(:title, :content, :user_id)
  end

  def post_params_for_update
    params.require(:post).permit(:title, :content, :user_id)
  end
end

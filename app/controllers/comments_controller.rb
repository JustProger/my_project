class CommentsController < ApplicationController
  before_action :authorize
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to '/posts/show?id=' + @comment[:post].to_s
  end

  def remove
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  def show
    @comment = Comment.where(post: @post.id)
  end

  def index
    @comment = Comment.all
  end

  def last
    @comment = Comment.last(10).reverse
  end

  private
    def comment_params
      params.require(:comment).merge!(author: current_user.id).permit(:post, :author, :content)
    end
end

class CommentsController < ApplicationController
  before_action :authorize
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to '/posts/show?id=' + @comment[:post_id].to_s
  end

  def remove
    comment = Comment.find(params[:id])
    if comment.user_id == params[:user_id].to_i
      comment.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def show
    @comment = Comment.where(post_id: @post.id)
  end

  def index
    @comment = Comment.all
  end

  def last
    @comment = Comment.last(10).reverse
  end

  private
    def comment_params
      params.require(:comment).merge!(user_id: current_user.id).permit(:post_id, :user_id, :content)
    end
end

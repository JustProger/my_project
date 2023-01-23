class CommentsController < ApplicationController
  before_action :authorize
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to '/posts/show?id=' + @comment[:post_id].to_s
  end

  def edit
    @comment = Comment.find(params[:id])
    unless @comment.user_id == params[:user_id].to_i
      redirect_to request.referer, notice: 'you are not the owner of this comment!'
    end
  end

  # PUT method
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params_for_update)
      redirect_to posts_show_path(id: @comment.post_id), notice: 'Comment on this post was successfully updated!'
    else
      redirect_to request.referer, alert: 'smth went wrong:('
    end
  end

  def remove
    comment = Comment.find(params[:id])
    if comment.user_id == params[:user_id].to_i
      comment.destroy
      redirect_to request.referer, notice: 'Comment was successfully removed!'
    else
      redirect_to request.referer, alert: 'Smth went wrong:('
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
  
  def comment_params_for_update
    params.require(:comment).permit(:post_id, :user_id, :content)
  end
end

# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :deny_access_to_authorized, only: %i[new create]
  before_action :authorize, only: %i[profile]

  def index
    @users = User.all
  end

  def profile
    @user = User.find(params[:id])
    # rescue
    #   redirect_to root_path
  end

  def new; end

  def edit
    @user = User.find(params[:id])
    return if @user.id == params[:user_id].to_i

    redirect_to request.referer, notice: 'youuuu!'
  end

  # PUT method
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_profile_path(id: @user.id), notice: 'User was successfully updated!'
    else
      flash[:alert] ||= []
      if @user.errors.any?
        @user.errors.full_messages.each do |message|
          flash[:alert] << message
        end
      end
      redirect_to request.referer
    end
  end

  def create
    @create_user = User.new(user_params)

    if @create_user.save
      session[:user_id] = @create_user.id
      redirect_to root_path
    else
      flash[:alert] ||= []
      if @create_user.errors.any?
        @create_user.errors.full_messages.each do |message|
          flash[:alert] << message
        end
      end
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

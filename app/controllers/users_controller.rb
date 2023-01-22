class UsersController < ApplicationController
  before_action :deny_access_to_authorized, only: %i[new create]
  before_action :authorize, only: %i[profile]

  def profile; end
  def new; end

  # def edit
  # end

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

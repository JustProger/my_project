class UsersController < ApplicationController
  before_action :deny_access_to_authorized, only: %i[new create]
  before_action :authorize, only: %i[profile]

  def profile; end
  def new; end

  # def edit
  # end

  def create
    user = User.new(user_params)

   
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = 'invalid input'
      redirect_to '/signup'
    end
    
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

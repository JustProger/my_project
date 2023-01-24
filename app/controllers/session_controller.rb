# frozen_string_literal: true

# SessionController description ...
class SessionController < ApplicationController
  before_action :deny_access_to_authorized, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = if user
                        'invalid password'
                      else
                        'invalid login'
                      end
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

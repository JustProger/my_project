# frozen_string_literal: true

# ApplicationController description ...
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue StandardError
    redirect_to '/logout'
  end

  def current_user_id
    current_user&.id
  end

  helper_method :current_user, :current_user_id

  def authorize
    return if current_user

    redirect_to '/login', alert: 'Login required!'
  end

  def deny_access_to_authorized
    redirect_to root_path if current_user
  end
end

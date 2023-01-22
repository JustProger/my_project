class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_locale
  
    def set_locale
      session[:locale] = params[:locale] if params[:locale]
      I18n.locale = session[:locale] || I18n.default_locale
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      redirect_to '/logout'
    end
  
    helper_method :current_user
  
    def authorize
      redirect_to '/login' unless current_user
    end
  
    def deny_access_to_authorized
      redirect_to root_path if current_user
    end
end

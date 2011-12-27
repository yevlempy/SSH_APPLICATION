# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    helper  :all
    before_filter :authenticate
    filter_parameter_logging "password"

    before_filter :set_locale

    def set_locale
        session[:locale] = params[:locale] if params[:locale]
        I18n.locale = session[:locale] || I18n.default_locale
    end

    def is_admin
        if session[:username].downcase == ADMIN_USER
            return true
        else
            redirect_to :controller => "login"
        end
    end

    protected
    def authenticate
        unless session[:person]
            session[:return_to] = request.request_uri
            redirect_to :controller => "login"
            return false
        end
      end
end

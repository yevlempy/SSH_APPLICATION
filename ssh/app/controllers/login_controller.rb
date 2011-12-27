require 'ldap_connect'
class LoginController < ApplicationController
    skip_before_filter :authenticate
    def index
    end

    before_filter :set_locale

     def set_locale
         session[:locale] = params[:locale] if params[:locale]
         I18n.locale = session[:locale] || I18n.default_locale
     end

    def authenticate
        begin
            if session[:person] = LDAP.authenticate(params[:login][:name], params[:login][:password])
              session[:username] = params[:login][:name].capitalize
              if params[:login][:name].downcase == ADMIN_USER.downcase
                  redirect_to :controller => :admin
       #           session[:return_to] = nil
                else
                  redirect_to :controller => "sshes"
    #            end
                end
            else
                flash[:notice] = "Login failed!"
                redirect_to :action => :index
            end
        rescue LDAP::ResultError => e
            flash[:notice] = "#{e.message}"
            redirect_to :action => :index
        rescue Exception => e
            
        end
    end

        # logout
        # clears the session
        def logout
            session[:person] = nil
            session[:username] = nil
            flash[:notice] = "Logged out"
            redirect_to :action => "index"
        end
end

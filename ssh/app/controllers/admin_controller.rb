class AdminController < ApplicationController
    before_filter :is_admin
    layout 'sshes'
    def index
    end
    before_filter :set_locale

    def set_locale
        session[:locale] = params[:locale] if params[:locale]
        I18n.locale = session[:locale] || I18n.default_locale
    end


    def search
        if request.get?
            render :template => "/admin/search.html.erb"
        else request.post?
            @sshes =  Ssh.find :all, :conditions => ["email_id like ?",params[:email_id]], :order => :updated_at
            render :template => "/admin/list.html.erb"
        end
    end
    def list
        @sshes = Ssh.find :all, :order => :updated_at
    end
end

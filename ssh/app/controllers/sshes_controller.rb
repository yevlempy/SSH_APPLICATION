class SshesController < ApplicationController
  # GET /sshes
  # GET /sshes.xml
  def index
    @sshes = Ssh.find(:all,:conditions => ["user_id = ?", session[:username]])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sshes }
    end
  end

  # GET /sshes/1
  # GET /sshes/1.xml
  def show
    @ssh = Ssh.find(:first, :conditions => ["id =? and user_id =?", params[:id], session[:username]])
    if @ssh.nil?
        render :text => "Record Not found!/Not authorised"
    else
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @ssh }
        end
    end
  end

  # GET /sshes/new
  # GET /sshes/new.xml
  def new
    @ssh = Ssh.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ssh }
    end
  end

  # GET /sshes/1/edit
  def edit
    @ssh = Ssh.find(:first, :conditions => ["id =? and user_id =?", params[:id], session[:username]])
    if @ssh.nil?
        render :text => "Record Not found!/Not authorised!"
    else
    end
  end

  # POST /sshes
  # POST /sshes.xml
  def create
    @ssh = Ssh.new(params[:ssh])
    @ssh.user_id = session[:username]
    @ssh.Email_id = session[:person].to_s

    respond_to do |format|
      if @ssh.save
        flash[:notice] = ":Ssh was successfully created."
        format.html { redirect_to(@ssh) }
        format.xml  { render :xml => @ssh, :status => :created, :location => @ssh }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ssh.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sshes/1
  # PUT /sshes/1.xml
  def update
    @ssh = Ssh.find(params[:id])
    @ssh.user_id = session[:username]
    @ssh.Email_id = session[:person].to_s

    respond_to do |format|
      if @ssh.update_attributes(params[:ssh])
        flash[:notice] = ":Ssh was successfully updated."
        format.html { redirect_to(@ssh) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ssh.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sshes/1
  # DELETE /sshes/1.xml
  def destroy
    @ssh = Ssh.find(params[:id])
    @ssh.destroy

    respond_to do |format|
      format.html { redirect_to(sshes_url) }
      format.xml  { head :ok }
    end
  end
end

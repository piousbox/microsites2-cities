
class UsersController < ApplicationController

  before_filter :set_tags_global, :only => [ :show, :index ]

  def edit
    @user = User.find current_user.id
    authorize! :edit, @user
    render :layout => 'application'
  end

  def show
    if Rails.env.production? && 'piousbox.com' != @domain
      authorize! :not_found, User.new
      redirect_to "http://piousbox.com#{request.path}"

    else
      @user = User.where( :username => params[:username] ).first
      authorize! :show, @user
      if @user.blank?
        render :not_found
      else
        @title = @user.username
      end
    end
  end
  
  def index
    authorize! :index, User.new
    @title = 'All Users'
    @users = User.all
    
    unless params[:cityname].blank?
      @city = City.where( :cityname => params[:cityname] ).first
      @users = @users.where( :current_city => @city )
    end

    if !params[:q].blank?
      @users = @users.where( :username => /#{params[:q]}/i )
    else
      @users = @users.select do |user|
        user.reports.length > 0 || user.galleries.length > 0
      end
    end
    n = User.per_page # n = 16
    p = params[:users_page] || 1 # page
    b = (p-1)*n # begin
    e = p*n # end
    @users = @users[b...e]

    respond_to do |format|
      format.html do
        if params[:cityname]
          @features = []
          render :action => :list
        else
          render
        end
      end
      format.json do
        render :json => @users
      end
    end
  end
  
  def update
    @user = User.find params[:id]
    old_group_id = @user.group_id
    authorize! :update, @user
    params[:user][:group_id] = old_group_id

    if @user.update_attributes params[:user]
      flash[:notice] = 'Success'
      redirect_to organizer_path
    else
      flash[:error] = 'No Luck. ' + @user.errors.inspect
      render :action => :edit
    end   
  end

  private

  def set_tags_global
    @tags_global = Tag.where( :is_trash => false, :is_public => true, :parent_tag => nil )
  end

end

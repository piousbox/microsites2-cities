
class PhotosController < ApplicationController

  # skip_before_filter :verify_authenticity_token, :only => [ :create ]
  # skip_authorization_check :only => [ :create, :new ]
  
  def new
    @photo = Photo.new
    authorize! :new, @photo
    render :layout => false
  end

  def create
    @photo = Photo.new :photo => params[:photo][:photo]
    authorize! :create, @photo
    @photo.save
    @city = City.where( :cityname => params[:cityname] ).first unless params[:cityname].blank?
    
    respond_to do |format|
      format.json
      format.html do
        if @photo.save
          flash[:notice] = 'Success.'
          redirect_to cities_path
        else
          flash[:error] = @photo.errors
          render :action => :new
        end
      end
    end
  end

end

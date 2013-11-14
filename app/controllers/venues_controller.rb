
class VenuesController < ApplicationController

  def show
    if @venue = Venue.where( :name_seo => params[:venuename] ).first
      authorize! :show, @venue
      set_ch
      @city = @venue.city unless @venue.city.blank?
      
      respond_to do |format|
        format.html do
          # render :layout => 'application'
          @aa = { :one => :two, :three => :four }
          render 'empty'
        end
        format.json do
          render :json => @venue
        end
      end
    else
      authorize! :not_found, Venue.new
      respond_to do |format|
        format.html do
          render :not_found
        end
        format.json do
          render :json => Venue.new( :name => 'Venue not Found' )
        end
      end
    end
  end

  def index
    @venues = Venue.all
    authorize! :index, Venue.new

    if params[:cityname]
      @city = City.where( :cityname => params[:cityname] ).first
      @venues = @venues.where( :city => @city )
    end

    @venues = @venues.page( params[:venues_page] )

    respond_to do |format|
      format.json do
        @venues = @venues.to_a
        @venues.each_with_index do |v, idx|
          @venues[idx][:photo_url_thumb] = v.profile_photo.blank? ? '/assets/missing.png' : v.profile_photo.photo.url(:thumb)
          @venues[idx][:path] = venue_path(v.name_seo)
        end
        render :json => @venues
      end
    end
  end

  def news
    if @venue = Venue.where( :name_seo => params[:name_seo] ).first
      set_ch
      authorize! :news, @venue

      respond_to do |format|
        format.json do
          render :json => @venue
        end
      end
    else
      authorize! :not_found, Venue.new
      render :not_found
    end
  end

  private

  def set_ch
    @reports = @venue.reports.all.page( params[:reports_page] )
    @galleries = @venue.galleries.all.page( params[:galleries_page] )
    @users = @venue.users.all.page( params[:users_page] )

    @newsitems = @venue.newsitems.all.page( params[:newsitems_page] ) # @venue.newsitems.page( params[:newsitems_page] )
    @features = @venue.features.all    
  end
  
end

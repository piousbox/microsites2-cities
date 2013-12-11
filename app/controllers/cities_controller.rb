class CitiesController < ApplicationController
  skip_authorization_check
  layout 'cities'

  def set_city
    next_cityname = params[:user][:cityname]
    city = City.where( :cityname => next_cityname ).first
    if city.blank?
      session[:current_city] = nil
    else
      session[:current_city] = {
        :name => city['name_'+@locale.to_s],
        :cityname => city.cityname
      }
    end
    unless current_user.blank?
      current_user.current_city = city
      current_user.save
      flash[:notice] = 'Current city set.'
    else
      flash[:notice] = 'Current city set. Login to save your selection & customize other features of this website.'
    end
    redirect_to request.referrer
  end

  def profile
    @city = City.where( :cityname => params[:cityname] ).first
    if @city.blank?
      begin
        @city = City.find params[:cityname]
        if @city.blank?
          render :action => :not_found
        else
          redirect_to city_path(@city.cityname)
        end
      rescue
        render :action => :not_found
      end
    else
      @city.name = @city['name_'+@locale.to_s]
      @features = @city.features.all.sort_by{ |f| [ f.weight, f.created_at ] }.reverse[0...4]
      @newsitems = @city.newsitems.order_by( :created_at => :desc ).page( params[:newsitems_page] )
      @reports = Report.all.where( :lang => @locale,
                                   :city => @city
                                   ).order_by( :created_at => :desc ).page( params[:reports_page] )
      @galleries = []
      @greeter = @city.guide
      @today = {}
      @feature_venues = Venue.where( :city => @city, :is_feature => true )
      
      @n_reports = @reports.length
      @n_galleries = @galleries.length
      @n_users = @city.current_users.length
      @n_videos = @city.videos.length
      @n_venues = @city.venues.length
      
      respond_to do |format|
        format.html do
          render :action => 'empty'
        end
        format.json do
          @city[:events] = @city.events.to_a
          # @city[:n_events] = @city.events.length

          @city[:j_galleries] = []
          @city[:j_users] = []

          @city.galleries.where( :is_trash => false, :is_public => true ).each do |gallery|
            if gallery.photos[0]
              gallery[:photo_url] = gallery.photos[0].photo.url(:thumb)
            else
              gallery[:photo_url] = ''
            end
            @city[:j_galleries] << gallery
          end

          @city.current_users.order_by( :created_at => :desc ).each do |user|
            if user.profile_photo.blank?
              user[:profile_photo_path] =  '/assets/no_photo.png'
            else
              user[:profile_photo_path] = user.profile_photo.photo.url(:thumb)
            end
            @city[:j_users] << user
          end

          @city[:j_reports] = @city.j_reports

          @city[:videos] = @city.videos.to_a
          # @city[:n_videos] = @city.videos.length

          @city[:venues] = @city.venues.to_a
          # @city[:n_venues] = @city.venues.length

          @city[:permalink] = city_path(@city.cityname)

          render :json => @city
        end
      end
    end
  end
  
  def index
    @cities = City.for_homepage

    respond_to do |format|
      format.html do        
        render :action => 'empty'
      end
      format.json do
        render :json => @cities
      end
      format.tablet do
        render :action => 'empty'
      end
      format.mobile do
        render :action => 'empty', :layout => 'mobile'
      end
    end
  end

  def venues
    @venues = Venue.all
    render :controller => :venues, :action => :index
  end

  def users
    @users = User.all
    render :controller => :users, :action => :index
  end

  def today
    @city = City.where( :cityname => params[:cityname] ).first
    @events = Event.all.where( :city => @city )
    @events = [ { :name => 'Event Name', :date => DateTime.now } ]
    respond_to do |format|
      format.html
      format.json do
        render :json => @events
      end
    end
  end

  def features
    @features = []
    City.all.each do |city|
      @features += city.features.limit(4) unless city.features.blank?
    end
    respond_to do |format|
      format.json do
        render :json => @features
      end
    end
  end

  def newsitems
    @newsitems = []
    City.all.each do |city|
      @newsitems += city.newsitems.limit(10) unless city.newsitems.blank?
    end
    respond_to do |format|
      format.json do
        newsitems = []
        @newsitems.each_with_index do |item, idx|
          unless item.report.blank?
            report = Report.find item.report_id
            n = item
            n[:link_path] = report_path(report.name_seo)
            n[:title] = report.name
            newsitems << n
          end
          unless item.gallery.blank?
            item[:link_path] = gallery_path( item.gallery.galleryname, 0 )
            item[:title] = item.gallery.name
            newsitems << item
          end
        end
        render :json => newsitems
      end
    end
  end

end


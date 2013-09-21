
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
      @city = City.find params[:cityname]
      if @city.blank?
        render :action => :not_found
      else
        redirect_to city_path(@city.cityname)
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
          @city[:n_galleries] = @city.galleries.length
          @city[:n_reports] = @city.reports.length
          render :json => @city
        end
      end
    end
  end
  
  def index
    respond_to do |format|
      format.html do
        # @feature_cities = City.where( :is_feature => true ).order_by( :name => :asc)
        # feature_city_ids = @feature_cities.map { |c| c._id }
        # @cities = City.not_in( :_id => feature_city_ids ).order_by( :name => :asc)
        # @cities = @cities.reject do |city|
        #   0 == city.reports.length && 0 == city.galleries.length
        # end
        #
        # @feature_reports = Report.all.where( :lang => @locale, :is_feature => true ).page( params[:reports_page] )
        # @features = []
        # @feature_venues = []
        # @today = {}
        # @greeter = User.new
        # @galleries = []
        # @report = []
        
        render :action => 'empty'
      end
      format.json do
        @cities = City.all.order_by( :name => :asc )
        render :json => @cities
      end
      format.tablet do
        render :action => 'empty'
      end
      format.mobile do
        render :action => 'empty'
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


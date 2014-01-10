class Utils::SitemapsController < ApplicationController
  skip_authorization_check

  def sitemap
    travel_site = Site.mobi
    travel_tag = Tag.mobi

    @reports = Report.any_of( :site => travel_site, :tag => travel_tag )

    # @galleries = Gallery.any_of( :site => travel_site, :tag => travel_tag )
    @galleries = []

    # @videos = Video.any_of( :site => travel_site, :tag => travel_tag )
    @videos = []

    # @tags = Tag.where( :site => travel_site )
    @tags = []

    @cities = City.all

    @venues = Venue.all

    # @users = User.all
    @users = []

    # @meta = [ { :url => cities_path } ]
    @meta = []
    @host = request.host

    respond_to do |format|
      format.xml do
        headers['Content-Type'] = 'application/xml'
        render 'utils/sitemap', :layout => false
      end
      format.json do
        json = {
          :cities => @cities,
          :reports => @reports.to_a,
          :galleries => @galleries.to_a,
          :users => @users,
          :venues => @venues,
          :videos => @videos,
          :tags => @tags
        }
        render :json => json
      end
    end
  end

end


class Utils::SitemapsController < ApplicationController
  skip_authorization_check

  def sitemap
    @reports = Report.all
    @galleries = Gallery.all
    @videos = []
    @tags = []
    @cities = City.all
    @venues = Venue.all
    @users = User.all

    case @domain
    when 'travel-guide.mobi', 'staging.travel-guidel.mobi', 'mobi.local'
      travel_guide_sitemap
    else
      default_sitemap
    end

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

  private

  def travel_guide_sitemap
    @cities = City.all
    @venues = Venue.all
    @meta = [
      { :url => cities_path }
    ]
  end

  def default_sitemap
    @meta = []
  end

end


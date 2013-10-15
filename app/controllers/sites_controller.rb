
class SitesController < ApplicationController

  def show
    authorize! :show, @site
    @j_site = {}
    @j_site[:reports] = []
    @site.reports.where( :city => nil ).order_by( :created_at => :desc ).each do |r| # .page( params[:reports_page] )
      rr = r.clone
      rr[:photo_url] = r.photo.photo.url( :thumb ) unless r.photo.blank?
      rr[:photo_url] ||= '/assets/missing.png'
      rr[:username] = r.user.username
      rr.created_at = pretty_date( r.created_at )
      rr[:tag_name] = r.tag.name unless r.tag.blank?
      rr[:tag_name] ||= ''
      @j_site[:reports] << rr
    end
    @j_site[:newsitems] = @site.newsitems.to_a

    respond_to do |format|
      format.json do
        render :json => @j_site
      end
    end  
  end

  def galleries
    authorize! :galleries, @site
    respond_to do |format|
      format.json do
        render :json => @site.galleries.to_a
      end
    end
  end

  def newsitems
    @site = Site.where( :domain => 'travel-guide.mobi', :lang => 'en' ).first
    authorize! :newsitems, @site
    respond_to do |format|
      format.json do
        newsitems = []
        @site.newsitems.map do |n|
          if !n.gallery.blank?
            newsitems << { :link_path => gallery_path( n.gallery.galleryname, 0 ), :title => n.gallery.name }
          end
        end
        render :json => newsitems
      end
    end
  end
  
end



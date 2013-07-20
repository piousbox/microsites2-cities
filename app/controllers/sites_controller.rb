
class SitesController < ApplicationController

  skip_authorization_check

  def features
  end

  def newsitems
    site = Site.where( :domain => @domain, :lang => @locale ).first
    @newsitems = site.newsitems
    respond_to do |format|
      format.json do
        render :json => @newsitems
      end
    end
  end

end


class SitesController < ApplicationController

  def show
    @site = Site.where( :domain => @domain, :lang => 'en' ).first
    authorize! :show, @site
    
    respond_to do |format|
      format.json do
        render :json => @site
      end
    end

  end

end



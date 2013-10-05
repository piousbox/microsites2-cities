
class SitesController < ApplicationController

  def show
    respond_to do |format|
      format.json do
        render :json => @site
      end
    end
    
  end
  
end



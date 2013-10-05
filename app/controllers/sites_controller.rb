
class SitesController < ApplicationController

  def show
    authorize! :show, @site
    @j_site = {}
    @j_site[:reports] = @site.reports.to_a
    respond_to do |format|
      format.json do
        render :json => @j_site
      end
    end
    
  end
  
end



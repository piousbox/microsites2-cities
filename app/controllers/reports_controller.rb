
class ReportsController < ApplicationController

  def index
    authorize! :index, Report.new
    @reports = Report.where( :is_trash => false, :is_public => true )
    if params[:cityname]
      @city = City.where( :cityname => params[:cityname] ).first
      @reports = @reports.where( :city => @city )
    end
    @reports = @reports.page( params[:reports_page] )
    respond_to do |format|
      format.html do
        if params[:cityname]
          @features = []
          render :action => :list
        else
          render
        end
      end
      format.json do
        @r = []
        @reports.each do |r|
          unless r.photo.blank?
            r[:photo_url] = r.photo.photo.url(:thumb)
          end
          r.username ||= r.user.username
          r.username ||= ''
          r[:photo_url] ||= ''
          @r.push r
        end
        render :json => @r
      end
    end
  end

  def not_found
    authorize! :not_found, Report.new
  end
  
  def show
    unless params[:name_seo].blank?
      @report = Report.where( :name_seo => params[:name_seo] ).first
    else
      @report = Report.find params[:id]
    end
    
    if @report.blank?
      render :not_found
      authorize! :not_found, Report.new

    else
      authorize! :show, @report
      respond_to do |format|
        format.html do
          if @report.tag && @report.user.username == @report.tag.name_seo
            # if a characteristic tag
            redirect_to user_report_path(@report.name_seo)
          else
            if @report.tag.blank?
              @recommended = Report.all.where( :is_feature => true ).limit( Feature.n_features )
            else
              @recommended = Report.all.where( :tag => @report.tag, :lang => @locale ).limit( 7 )
              @recommended = @recommended.reject { |r| r.name_seo == @report.name_seo }
            end
            @city = @report.city
            @report_name_seo ||= @report.name_seo
            render
          end
        end
        format.json do
          if @report.photo
            @report[:photo_url] = @report.photo.photo.url(:small)
          else
            @report[:photo_url] = '/assets/missing.png'
          end
          @report.username = @report.user.username
          @report.username ||= ''
          render :json => @report
        end
      end
    end
  end

end


class ReportsController < ApplicationController

  layout 'application'

  def index
    authorize! :index, Report.new
    @reports = Report.all
    @reports = @reports.where( :city => City.where( :cityname => params[:cityname] ).first ) unless params[:cityname].blank?
    @reports = @reports.page( params[:reports_page] )
    respond_to do |format|
      format.html
      format.json do
        @reports.each_with_index do |r, idx|
          unless r.photo.blank?
            @reports[idx][:photo_url] = r.photo.photo.url(:mini)
          end
          @reports[idx].username ||= r.user.username || ''
          @reports[idx][:photo_url] ||= ''
        end
        render :json => @reports
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
      authorize! :not_found, Report.new
      respond_to do |format|
        format.html do
          render :empty
        end
        format.json do
          render :json => {}
        end
        format.tablet do
          render :empty
        end
        format.mobile do
          render :empty
        end
      end

    else
      authorize! :show, @report
      respond_to do |format|
        format.html do
          @report_name_seo = @report.name_seo
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

  def new
    @report = Report.new
    authorize! :new, @report
    @tags_list = Tag.all.where( :is_public => true ).list
    @sites_list = Site.all.list
    @cities_list = City.all.list
    respond_to do |format|
      format.html do
        render :layout => false
      end
    end
  end

end

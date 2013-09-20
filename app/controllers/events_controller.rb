
class EventsController < ApplicationController

  def index
    authorize! :index, Event.new

    respond_to do |format|
      format.json do
        render :json => Event.all
      end
    end
  end
  
  def show
    @event = Event.where( :name_seo => params[:eventname] ).first
    puts! params[:eventname] 
    puts! @event
    authorize! :show, @event

    respond_to do |format|
      format.json do
        render :json => @event
      end
    end
  end

end


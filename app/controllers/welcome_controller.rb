class WelcomeController < ApplicationController
  skip_authorization_check
  before_filter :load_features
  before_filter :redirect_mobile_user, :only => [ :home ]
  before_filter :set_default_layout

  # caches_page :help, :about, :privacy, :contact
  
  def help
    render :layout => @layout
  end

  def about
    render :layout => @layout
  end

  def privacy
    render :layout => @layout
  end

  def contact
    render :layout => @layout
  end

  def home
    redirect_to cities_path
  end

  #
  # link to sitemap
  #
  def meta
    render :layout => 'cities2'
  end
 
  private

  def set_default_layout
    @layout = 'cities'
  end

end

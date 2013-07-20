class WelcomeController < ApplicationController
  skip_authorization_check
  before_filter :load_features
  before_filter :redirect_mobile_user, :only => [ :home ]

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

end

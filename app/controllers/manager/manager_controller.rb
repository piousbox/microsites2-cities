class Manager::ManagerController < ApplicationController
  
  # before_filter :require_manager
  before_filter :sett_lists

  layout 'manager'

  protected
  
  def require_manager
    if Rails.env.test?
      return
    else
      authenticate_or_request_with_http_basic do |username, password|
        username == 'piousbox' && password == 'sho3b0x3'
      end       
    end
    redirect_to sign_in_path if @current_user.blank?
  end

  def sett_lists
    @cities = City.list
    @tags = Tag.list
    @tags_list = Tag.list
    @users_list = User.list
    @list_venues = Venue.list
    @reports_list = Report.all.list
    @galleries_list = Gallery.all.list
  end

  def setup_defaults
    return if Rails.env.production?
    @user = 'ubuntu'
    @chef_workdir = "/home/piousbox/projects/rails-quick-start"
    @keys = [ "/home/piousbox/projects/rails-quick-start/rails-quick-start.pem" ]
    
    @nodes = JSON.parse(File.read( "#{@chef_workdir}/data_bags/utils/port_forward.json" ))
    @nodes = @nodes['port_forwards']
    @nodes.map! do |item|
      item = item.merge( { :host => 'staging.piousbox.com' } )
      item.symbolize_keys
    end

    @nodes = @nodes + [{ :host => 'staging.piousbox.com', :port => '22', :node_name => 'load_balancer_staging' },
                       { :host => 'piousbox.com', :port => '22', :node_name => 'load_balancer_micro' }]

    # @domains = JSON.parse(File.read("#{@chef_workdir}/data_bags/utils/sites.json"))
    # @domains = @domains['domains']
    
  end

  
end

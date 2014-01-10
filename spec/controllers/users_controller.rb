
require 'spec_helper'

describe UsersController do

  before :each do
    User.unscoped.each { |u| u.remove }
    @user = FactoryGirl.create :user
  end
  
  it 'organizer' do
    sign_in :user, @user
    get :organizer
    response.should be_success
    response.should render_template( 'users/organizer' )
  end

end


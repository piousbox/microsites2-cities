
require 'spec_helper'

describe UsersController do

  render_views

  before :each do
    User.all.each { |d| d.remove }
    @user = FactoryGirl.create :user

    Tag.all.each { |d| d.remove }
    @tag = FactoryGirl.create :user_tag

    Report.clear
    @r1 = FactoryGirl.create :r1
    @r2 = FactoryGirl.create :r2
    @r3 = FactoryGirl.create :r3
    @r1.tag = @tag && @r1.save
    @r1.user = @user
    @r1.save
    @r3.tag = @tag && @r3.save
    @r3.user = @user
    @r3.save

  end
  
  describe 'index' do
    it 'only shows users with a gallery or report' do
      get :index
      response.should render_template('users/index')
      us = assigns(:users)
      us.each do |u|
        if u.reports.length > 0
          ;
        elsif u.galleries.length > 0
          ;
        else
          false.should eql true
        end
      end
    end
  end

  describe 'settings' do
    it 'gets settings' do
      get :edit
      response.should be_success
      response.should render_template('users/edit')
    end

    it 'POSTs to settings' do
      post :update, :user => { }
      response.should be_redirect
      response.should redirect_to( :action => :organizer )
    end
  end

end

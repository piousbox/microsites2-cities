require 'spec_helper'
describe "cities", :type => :feature do
  before :each do
    User.all.each { |f| f.remove }
    @user = FactoryGirl.create :user
  end

#  it 'renders sign-in page' do
#    visit '/users/sign_in'
#    page.should have_selector('.main-header')
#
#    visit '/users/sign_in?layout=cities&lang=pt'
#    page.should have_selector('.main-header')
#
#    visit '/en/users/sign_in'
#    page.should have_selector('.main-header')
#
#    visit '/en/users/sign_in?layout=organizer'
#    page.should have_selector('.main-header')
#  end

end

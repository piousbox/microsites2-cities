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
  
end

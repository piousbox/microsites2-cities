require "spec_helper"

describe "tags external redirect" do

  before :each do
    setup_users

    City.all.each { |c| c.remove }
    @city = FactoryGirl.create :city

    Report.all.each { |r| r.remove }
    @city_report = FactoryGirl.create :r1, :city => @city
    @nocity_report = FactoryGirl.create :r2
    @nocity_report.city.should eql nil
  end

  it "redirects reports/view from no city to city" do
    get "en/reports/view/#{@city_report.name_seo}"
    response.should redirect_to("/en/cities/travel-to/#{@city_report.city.cityname}/reports/view/#{@city_report.name_seo}")
    get "en/reports/view/#{@nocity_report.name_seo}"
    response.should redirect_to("/en/cities/travel-to/undefined/reports/view/#{@nocity_report.name_seo}")
  end

end

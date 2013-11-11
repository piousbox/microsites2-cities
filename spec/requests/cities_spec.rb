require "spec_helper"

describe "cities external redirect" do

  it "redirects non-json reports index inside city" do
    get "en/cities/travel-to/cityname/reports"
    response.should redirect_to("en/cities/travel-to/cityname")
  end

end

require "spec_helper"

describe "cities external redirect" do

  it "redirects non-json reports index inside city" do
    get "en/cities/travel-to/cityname/reports"
    response.should redirect_to("http://www.example.com/en/cities/travel-to/cityname")
  end
  it "redirects non-json galleries index inside city" do
    get "en/cities/travel-to/cityname/galleries"
    response.should redirect_to("http://www.example.com/en/cities/travel-to/cityname")
  end

end

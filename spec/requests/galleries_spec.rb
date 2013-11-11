require "spec_helper"

describe "galleries external redirect" do

  it "redirects to piousbox.com" do
    get "en/galleries/show/glah-blah/0"
    response.should redirect_to("http://piousbox.com/en/galleries/show/glah-blah/0")
    get "galleries/show/glah-blah/0"
    response.should redirect_to("http://piousbox.com/en/galleries/show/glah-blah/0")
  end

end

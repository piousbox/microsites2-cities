require "spec_helper"

describe "tags external redirect" do

  it "redirects to piousbox.com" do
    get "en/tags/view/some-tag"
    response.should redirect_to("http://piousbox.com/en/tags/view/some-tag")
    get "en/tags"
    response.should redirect_to("http://piousbox.com/en/tags")
  end

end

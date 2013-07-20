require 'spec_helper'

describe SitesController do

  before :each do
  end

  describe 'features' do
  end

  describe 'newsitems' do
    it 'GETs newsitmes' do
      get :newsitems, :format => :json
      response.should be_success
      result = JSON.parse( response.body )
      result.length.should >= 1
    end
  end
end

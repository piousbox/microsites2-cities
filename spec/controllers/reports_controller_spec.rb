
require 'spec_helper'

describe ReportsController do

  render_views

  before :each do
    Report.all.each { |r| r.destroy }
    @report = FactoryGirl.create :report
  end

  it 'shows proper attributes' do
    get :show, :name_seo => @report.name_seo
    response.should be_success
    assert_select( '.report-name-seo', 1 )
    assert_delect( '.report-show-hidden .descr', 1 )
  end

end


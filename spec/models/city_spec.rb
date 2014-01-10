require 'spec_helper'
describe City do

  before :each do
    ;
  end
  
  describe 'cities' do

    it 'should have unique cityname' do
      City.clear
      ['a', 'aa', 'aaa'].each do |name|
        ccc = City.new :name => name, :cityname => 'a', :name_en => name, :name_pt => name, :name_ru => name
        ccc.save
      end
      City.all.length.should eql 1
    end

    it '#for_homepage' do
      result = City.for_homepage
      result.each do |r|
        ( r.reports.length > 0 || r.galleries.length > 0 || r.is_feature ).should eql true
      end
    end

  end

end

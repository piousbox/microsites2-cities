'use strict';

describe('Resources', function(){

  beforeEach(module('myApp'));

  it( 'tests PathHelper', inject(function(PathHelper) {
    expect( PathHelper.city.newsitems_path('ch') ).toEqual( 'travel-to/ch/newsitems' );
    expect( PathHelper.city.reports_path('ciity') ).toEqual( 'travel-to/ciity/reports' );
    expect( PathHelper.city_path('which city') ).toEqual( 'travel-to/which city' );
    expect( PathHelper.event_path('cityname', 'eventname') ).toEqual( 'cityname/events/show/eventname' );
    expect( PathHelper.gallery_path('g') ).toEqual( 'http://piousbox.com/en/galleries/show/g/0' );
    expect( PathHelper.partial('da') ).toEqual( '/partials/da.html' );
    expect( PathHelper.partial_compiled('daa') ).toEqual( '/en/daa' );
    expect( PathHelper.report_path( 'reportname', 'cityname' ) ).toEqual( 'cityname/reports/view/reportname' );
  }));

});

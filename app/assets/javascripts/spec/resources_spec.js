'use strict';

describe('Resources', function(){

  beforeEach(function() {
    // angular.module('myApp');
    var myApp = angular.module('myApp.controllers');
  });

  beforeEach(module('myApp'));

  it( 'tests PathHelper', inject(function(PathHelper) {
    expect( PathHelper.city.newsitems_path('ch') ).toEqual( 'travel-to/ch/newsitems' );
    expect( PathHelper.city_path('which city') ).toEqual( 'travel-to/which city' );
    expect( PathHelper.event_path('cityname', 'eventname') ).toEqual( 'travel-to/cityname/events/show/eventname' );
    expect( PathHelper.gallery_path('g') ).toEqual( 'http://piousbox.com/en/galleries/show/g/0' );
    expect( PathHelper.partial('da') ).toEqual( 'partials/da.html' );
    expect( PathHelper.partial_compiled('daa') ).toEqual( '/en/daa' );
    expect( PathHelper.report_path( 'reportname', 'cityname' ) ).toEqual( 'travel-to/cityname/reports/view/reportname' );
  }));

  it( 'sanity 2', inject( function( $rootScope, $controller) {
    var scope = $rootScope.new();
    var ctrl = $controller('MetaCtrl', {$scope: scope});
    expect( scope.Meta ).toBeTruthy();
  }));

  /*
  // Store references to $rootScope and $compile
  // so they are available to all tests in this describe block
  beforeEach(inject(function(_$compile_, _$rootScope_){
    // The injector unwraps the underscores (_) from around the parameter names when matching
    $compile = _$compile_;
    $rootScope = _$rootScope_;
  }));
   */

  /*
  it('should ....', inject(function() {
    var $scope = {};
    var pc = $controller('PasswordCtrl', { $scope: $scope });
    $scope.password = 'abc';
    $scope.grade();
    expect($scope.strength).toEqual('weak');
  }));

  it('should ....', inject(function() {
    //spec body
  }));
   */

  it('Replaces the element with the appropriate content', function() {
    // Compile a piece of HTML containing the directive
    var element = $compile("<a-great-eye></a-great-eye>")($rootScope);
    // fire all the watches, so the scope expression {{1 + 1}} will be evaluated
    $rootScope.$digest();
    // Check that the compiled element contains the templated content
    expect(element.html()).toContain("lidless, wreathed in flame, 2 times");
  });

});

'use strict';

describe('controllers', function(){

  // beforeEach(angular.mock.module('myApp'))
  beforeEach(module('myApp'));

  it('should be sane', function() {
    excect( 1 ).toEqual( 1 );
  });

  // Store references to $rootScope and $compile
  // so they are available to all tests in this describe block
  beforeEach(inject(function(_$compile_, _$rootScope_){
    // The injector unwraps the underscores (_) from around the parameter names when matching
    $compile = _$compile_;
    $rootScope = _$rootScope_;
  }));

  /*
  beforeEach(module('myApp.controllers'));

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

'use strict';

/* jasmine specs for controllers go here */

describe('controllers', function(){
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
});

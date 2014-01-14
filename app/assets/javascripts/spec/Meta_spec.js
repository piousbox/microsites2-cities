'use strict';

describe('Meta', function(){

  beforeEach(module('myApp'));

  it( 'tests Meta', inject(function(Meta) {
    expect( Meta.pretty_date('2012-01-01blahblahblah') ).toEqual( '2012-01-01' );
  }));

});

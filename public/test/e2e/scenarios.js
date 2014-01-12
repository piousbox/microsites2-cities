'use strict';

/* http://docs.angularjs.org/guide/dev_guide.e2e-testing */

describe('my app', function() {

  /**
  describe('default redirect of the app', function() {
    beforeEach(function() {
      browser().navigateTo('/');
    });
    it('should automatically redirect to /en/cities when location hash/fragment is empty', function() {
      expect(browser().location().url()).toBe("/en/cities");
    });
  });
  */

  describe('default view of the app', function() {
    beforeEach(function() {
      browser().navigateTo('/en/cities/');
    });
    it('should render partials/meta/home.html when user navigates to /', function() {
      expect(element('.partial-name').text()).
        toMatch("meta/home.html");
    });
  });


  describe('view `cities/profile`', function() {
    beforeEach(function() {
      browser().navigateTo('/en/cities/travel-to/San_Diego');
    });
    it('should render partials/cities/profile.html when user navigates to a city profile', function() {
      expect(element('.partial-name').text()).
        toMatch("cities/show.html");
    });
  });

});

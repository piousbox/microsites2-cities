'use strict';

/* http://docs.angularjs.org/guide/dev_guide.e2e-testing */

describe('my app', function() {

  describe('default view', function() {
    beforeEach(function() {
      browser().navigateTo('/en/cities/');
    });
    it('should render partials/meta/home.html when user navigates to /', function() {
      expect(element('.partial-name').text()).
        toMatch("meta/home.html");
    });
  });


  describe('view cities/profile', function() {
    beforeEach(function() {
      browser().navigateTo('/en/cities/travel-to/San_Diego');
    });
    it('should render partials/cities/profile.html when user navigates to a city profile', function() {
      expect(element('.partial-name').text()).
        toMatch("cities/show.html");
    });
  });

  describe('view cities/index', function() {
    beforeEach(function() {
      browser().navigateTo('/en/cities/travel-to');
    });
    it('should render partials/cities/index.html when user navigates to a city profile', function() {
      expect(element('.partial-name').text()).
        toMatch("cities/index.html");
    });
  });

  describe('reports/view inside cities', function() {
    beforeEach(function() {
      browser().navigateTo('/en/cities/travel-to/San_Diego/reports/view/engineer');
    });
    it('should render partials/reports/view.html', function() {
      expect(element('.partial-name').text()).
        toMatch("reports/show.html");
    });
  });

});

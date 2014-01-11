
CanvasOps.events_show_initialize = function(x, y) {
  var latlng, map, marker, myOptions;
  latlng = new google.maps.LatLng(x, y);
  myOptions = {
    zoom: 14,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map_canvas_2"), myOptions);
  return marker = new google.maps.Marker({
    position: latlng,
    map: map
  });
};

CanvasOps.users_show_initialize = function(user_id) {
  return $.get("/api/users/" + user_id + ".json", function(data) {
    var large_map, large_options, small_map, small_marker, small_options;
    small_options = {
      zoom: 14,
      center: new google.maps.LatLng(data['x'], data['y']),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    small_map = new google.maps.Map(document.getElementById("user_small_map_canvas"), small_options);
    small_marker = new google.maps.Marker({
      position: new google.maps.LatLng(data['x'], data['y']),
      title: data['email']
    });
    small_marker.setMap(small_map);
    large_options = {
      zoom: 3,
      center: new google.maps.LatLng(data['x'], data['y']),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    large_map = new google.maps.Map(document.getElementById("user_large_map_canvas"), large_options);
    return $.each(data['cities'], function(idx, val) {
      var infowindow, marker;
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(val['x'], val['y']),
        title: val['name']
      });
      marker.setMap(large_map);
      infowindow = new google.maps.InfoWindow({
        content: '<a href="cities/travel-to/' + val['cityname'] + '">' + val['name'] + '</a>'
      });
      return google.maps.event.addListener(marker, 'click', function() {
        return infowindow.open(large_map, marker);
      });
    });
  });
};

CanvasOps.homepage_all_cities = function() {
  var map, myOptions;
  myOptions = {
    center: new google.maps.LatLng(21.453069, -60.571291),
    zoom: 2,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("homepage_canvas"), myOptions);
  return $.get("/api/cities/map_all.json", function(data) {
    return $.each(data, function(idx, val) {
      var infowindow, marker;
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(val['x'], val['y']),
        title: val['name']
      });
      marker.setMap(map);
      infowindow = new google.maps.InfoWindow({
        content: '<a href="/en/cities/travel-to/' + val['cityname'] + '">' + val['name'] + '</a>'
      });
      return google.maps.event.addListener(marker, 'click', function() {
        return infowindow.open(map, marker);
      });
    });
  });
};

CanvasOps.homepage_feature_cities = function() {
  var map, myOptions;
  myOptions = {
    center: new google.maps.LatLng(21.453069, -60.571291),
    zoom: 2,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("homepage_canvas"), myOptions);
  return $.get("/api/cities/map.json", function(data) {
    return $.each(data, function(idx, val) {
      var infowindow, marker;
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(val['x'], val['y']),
        title: val['name']
      });
      marker.setMap(map);
      infowindow = new google.maps.InfoWindow({
        content: '<a href="cities/travel-to/' + val['name_seo'] + '">' + val['name'] + '</a>'
      });
      return google.maps.event.addListener(marker, 'click', function() {
        return infowindow.open(map, marker);
      });
    });
  });
};

CanvasOps.reports_show = function() {
  var canvas, map, myOptions, name_seo, x, y;
  canvas = $("#reports_show_canvas");
  x = canvas.attr('x');
  y = canvas.attr('y');
  name_seo = canvas.attr('name_seo');
  myOptions = {
    center: new google.maps.LatLng(x, y),
    zoom: 11,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('reports_show_canvas'), myOptions);
  return $.get("/api/reports/" + name_seo + "/venues.json", function(data) {
    return $.each(data, function(idx, val) {
      var infowindow, marker;
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(val['x'], val['y']),
        title: val['name']
      });
      marker.setMap(map);
      infowindow = new google.maps.InfoWindow({
        content: '<a href="/venues/show/' + val['name_seo'] + '">' + val['name'] + '</a>'
      });
      return google.maps.event.addListener(marker, 'click', function() {
        return infowindow.open(map, marker);
      });
    });
  });
};

$(document).ready(function() {
  var feature_cities_selected, latlng, map, marker, myOptions, x, y;
  $('.all_cities').on('click', function() {
    $('.all_cities').addClass('selected');
    $('.feature_cities').removeClass('selected');
    return CanvasOps.homepage_all_cities();
  });
  $('.feature_cities').on('click', function() {
    $('.all_cities').removeClass('selected');
    $('.feature_cities').addClass('selected');
    return CanvasOps.homepage_feature_cities();
  });
  if ($("#homepage_canvas").length > 0) {
    feature_cities_selected = false;
    if (feature_cities_selected) {
      CanvasOps.homepage_feature_cities();
    } else {
      CanvasOps.homepage_all_cities();
    }
  }
  if ($("#venues_show_canvas").length > 0) {
    x = $("#venues_show_canvas").attr('x');
    y = $("#venues_show_canvas").attr('y');
    latlng = new google.maps.LatLng(x, y);
    myOptions = {
      zoom: 14,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("venues_show_canvas"), myOptions);
    marker = new google.maps.Marker({
      position: latlng,
      map: map
    });
  }
  if ($("#reports_show_canvas").length > 0) {
    return CanvasOps.reports_show();
  }
});
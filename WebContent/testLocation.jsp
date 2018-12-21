<%@page import="General.QueryLayer , java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <%
	String lat = request.getParameter("lat");
	String lang = request.getParameter("lang");
	int locationid = Integer.parseInt(session.getAttribute("locationid").toString());
	QueryLayer q = new QueryLayer();
	ResultSet res = q.getAddress(locationid);
	Double lat1=Double.parseDouble(lat);
	Double lang1=Double.parseDouble(lang);
	if(res.next())
	{
		System.out.println("city :- "+res.getString("city"));
		lat1=Double.parseDouble(res.getString("lat"));
		lang1=Double.parseDouble(res.getString("long"));
	}
	else
	{
		System.out.println("OOps error");
	}
%>
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
    	  var pointA = new google.maps.LatLng(51.7519, -1.2578),
    	    pointB = new google.maps.LatLng(50.8429, -0.1313),
    	    myOptions = {
    	      zoom: 7,
    	      center: pointA
    	    },
    	    map = new google.maps.Map(document.getElementById('map'), myOptions),
    	    // Instantiate a directions service.
    	    directionsService = new google.maps.DirectionsService,
    	    directionsDisplay = new google.maps.DirectionsRenderer({
    	      map: map
    	    }),
    	    markerA = new google.maps.Marker({
    	      position: pointA,
    	      title: "point A",
    	      label: "A",
    	      map: map
    	    }),
    	    markerB = new google.maps.Marker({
    	      position: pointB,
    	      title: "point B",
    	      label: "B",
    	      map: map
    	    });

    	  // get route from A to B
    	  calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB);
      }
      function calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB) {
    	  directionsService.route({
    	    origin: pointA,
    	    destination: pointB,
    	    travelMode: google.maps.TravelMode.DRIVING
    	  }, function(response, status) {
    	    if (status == google.maps.DirectionsStatus.OK) {
    	      directionsDisplay.setDirections(response);
    	    } else {
    	      window.alert('Directions request failed due to ' + status);
    	    }
    	  });
    	}
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_BdCZfc348Jyo-jtpa3oSb3qy63ASbNc&callback=initMap"
    async defer></script>
  </body>
</html>
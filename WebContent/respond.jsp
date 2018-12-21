<%@ page import="java.sql.*" %>
<%@ page import="General.QueryLayer" %>
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
      }    </style>
  </head>
  <body>
    <%
	String lat = request.getParameter("lat");
	String lang = request.getParameter("lang");
	String id = request.getParameter("id");
	QueryLayer q = new QueryLayer();
	System.out.println(id);
	int id1 = Integer.parseInt(id);
	ResultSet res = q.getEmergencyAddress(id1);
	Double lat1=null;
	Double lang1=null;
	if(res.next())
	{
		lat1 = Double.parseDouble(res.getString("lat"));
		lang1 = Double.parseDouble(res.getString("lang"));
	}
	else
	{
		System.out.println("Oops error");
	}
	q.emergencyAttended(id1);
	%>

    <div id="map"></div>
    <script>
      var map;
      function initMap() {
    	  var pointA = new google.maps.LatLng(<%=lat%>,<%=lang%>),
    	    pointB = new google.maps.LatLng(<%=lat1%>,<%=lang1%>),
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
      <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPek9FKLxZHoJM9PwsVdD5uZGJoP6m74g&callback=initMap"></script>
  
    
</body>
</html>
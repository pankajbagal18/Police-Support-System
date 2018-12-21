<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<style>
    #out {
  position: absolute;
  width: 300px;
  height: auto;
  z-index: 15;
  top: 40%;
  left: 50%;
  margin: -100px 0 0 -150px;
  
}
    input[type=password], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>

<body onload="func()">
<div id="out">
<%
	String lat = request.getParameter("lat");
	String lang	= request.getParameter("lang");
	System.out.println("lat :- "+lat);
	session.setAttribute("lat", lat);
	session.setAttribute("lang",lang);
%>
  <form action="getPhoneNo" method="post">
	    <img src="images/icon/mahapolice.png" height="50px;" width="50px;" style="margin-left: 40%;"><p style="margin-left: 35%;"><b><font face="verdana">EMERGENCY	</font></b> </p>
	    <label for="fname">Phone No</label>
	    <input type="text" id="fname" name="phone" placeholder="Enter Your Phone No..">
	    <label for="fname">Your address</label>
	    <input type="text" id="address" name="address" value="none" style="display:block;"> 
	    <br>
	    <input type="submit" value="Submit">
   	</form>
    </div>
    
    <script type="text/javascript">
    function func(){
    	var latlng={lat:<%=lat%>,lng:<%=lang%>};
    	var geocoder=new google.maps.Geocoder;
    	geocoder.geocode({'location':latlng},function(results,status){
    		if(status==='OK'){
    			if(results[0]){
    				var address = results[0].formatted_address;
    				console.log(address);
    				document.getElementById('address').value = address;
    				window.alert(address);
    			}
    			else{
    				window.alert('No result found');
    			}
    		}
    		else {
    			window.alert("geocoder failed due to" + status);
    		}
    	});
    }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPek9FKLxZHoJM9PwsVdD5uZGJoP6m74g"></script>
</body>
</html>

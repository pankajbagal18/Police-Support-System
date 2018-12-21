<%@ page import="signup.Signupdata" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>SIGNUP</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images2/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts2/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor2/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css2/util.css">
	<link rel="stylesheet" type="text/css" href="css2/main.css">
<!--====================================================0===========================================-->

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
</head>
<body>

	<div id="out">
	<form action="Signup" method="post">
	    <img src="images/icon/mahapolice.png" height="50px;" width="50px;" style="margin-left: 40%;"><p style="margin-left: 35%;"><b><font face="verdana"> SIGNUP</font></b> </p>
	    <label for="fname">Aadhar Number</label>
	    <input type="text" name="aadhar" placeholder="Enter Your 12 digit Aadhar No..">
	    <br>
	     <label for="psw">Contact Number</label>
	    <input type="text" name="con_no" placeholder="Enter 10 digit phone number">
	    <br>
	    <input type="submit" value="Submit">
    </form>
    <a href="forgotPass.jsp">Forgot Password</a>
    <a href="login.jsp" style="float:right;">Login</a>
    </div>
<!--===============================================================================================-->	
	<script src="vendor2/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendo2r/bootstrap/js/popper.js"></script>
	<script src="vendor2/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js2/main.js"></script>
</body>
</html>
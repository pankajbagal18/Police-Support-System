<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OTP verification</title>
<style>
    #out {
  position: absolute;
  width: 300px;
  height: 200px;
  z-index: 15;
  top: 50%;
  left: 50%;
  margin: -100px 0 0 -150px;
  
}
input[type=number], select {
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
	<%String otp=session.getAttribute("otp").toString(); %>
	<div id="out">
	<form action="checkOTP" method="post">
   <img src="images/icon/mahapolice.png" height="50px;" width="50px;" style="margin-left: 40%;"><p style="margin-left: 30%;">OTP Verification</p>
    <input type="number" id="otp" name="otp" placeholder="Enter OTP send to your mobile no..">
    <br>
    <input type="submit" value="Submit">
    </form>
    </div>
    <script>
    	function func(otp){
    		var tempotp = document.getElementById('otp').value;
    		if(tempotp==otp)
    		{
    			window.location="changePassword.jsp"
    		}
    		else{
    			alert('You have entered wrong otp!');
    			window.location="changePassword.jsp"
    		}
    	}
    </script>
</body>
</html>
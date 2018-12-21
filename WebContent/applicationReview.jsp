<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="General.QueryLayer" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Application Review</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Application Acknowledgement</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="nav.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* The container */
.container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
    background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width: 80%;
  height: 50%;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border-radius: 10px;
  margin-left: 25%;
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #00BFFF;
  text-align: center;
  cursor: pointer;
  width: 50%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}

<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width: 80%;
  height: 50%;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border-radius: 10px;
  margin-left: 25%;
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #00BFFF;
  text-align: center;
  cursor: pointer;
  width: 50%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
</style>

</head>
<body>

</head>
<body>
<%
	QueryLayer q = new QueryLayer();
	String appId = request.getParameter("appId");
	String  aadhar = request.getParameter("aadhar");
	ResultSet res = q.getApplicationAck(appId,aadhar);
	res.next();
	String type = res.getString("type");
%>


<div id="mySidenav" class="sidenav" style="background-color: #00BFFF;position:fixed;">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#review">Review</a>
  <a href="#dialogue">Send Msg</a>
  <a href="#appoint">Appointment</a>
</div>

<div id="main">
  <span style="font-size:20px;cursor:pointer;position:fixed;" onclick="openNav()">&#9776; open</span>
</div>


<div id="content">
<div class="card" style="height: 15%;width: 85%;margin-top:-5%;">
<img src="images/icon/mahapolice.png" style="width: 7%;margin-top: 1%">
<h4 style="margin-top: -6%;margin-left: ;">Maharashtra police Support System</h4>
    <p class="title">Dhanakawadi Police Station<br>Pune-411043</p>
</div>
<div class="card" style="margin-top: 3%;height: 80%;width: 85%;" >
    <h3 style="margin-top: 3%;">Personal Details</h3>
  <img src="ImageServlet?aadhar=<%=aadhar %>" alt="John" style="width:15%;float:right;height: 50%;margin-left: 75%;margin-top: 5%;">
  <div>
  <table style="width: 50%;margin-top: -18%;">
  <tr>
  <td style="padding: 10px;" align="right">
      <h5>Aadhaar Card No :</h5></td>
<td style="padding: 5px;" align="left">
      <p class="title">1235 3434 2353</p></td>
 </tr>
 <tr>
  <td style="padding: 10px;" align="right">
      <h5>Name :</h5></td>
  <td style="padding: 10px;" align="left">
      <p class="title"><%=res.getString("name") %></p></td>
 </tr>
      <tr>
  <td style="padding: 10px;" align="right">
      <h5 >Gender :</h5></td>
  <td style="padding: 10px;" align="left">
      <p class="title"><%=res.getString("gender") %></p></td>
 </tr>
      <tr>
  <td style="padding: 10px;" align="right">
      <h5 >Email :</h5></td>
  <td style="padding: 10px;" align="left">
      <p class="title"><%=res.getString("email") %></p></td>
 </tr>
  <tr>
  <td style="padding: 10px;" align="right">
      <h5 >Address :</h5></td>
  <td style="padding: 10px;" align="left">
      <p class="title"><%=res.getString("address") %></p></td>
 </tr>
       <tr>
  <td style="padding: 10px;" align="right">
      <h5 >Dob :</h5></td>
  <td style="padding: 10px;" align="left">
      <p class="title">26/04/1999</p></td>
 </tr>
 
  </table>
  </div>
</div>

<div class="card" style="margin-top: 5%;height: 45%;width: 85%;" >
    <h3 style="margin-top: 3%;">Form Details</h3>
  <div>
  <table style="width: 50%;margin-top: %;">
  <tr>
  <td style="padding: 10px;" align="right">
      <h5>Form Id :</h5></td>
<td style="padding: 5px;" align="left">
      <p class="title"><%=res.getString("appId") %></p></td>
 </tr>
 <tr>
  <td style="padding: 10px;" align="right">
      <h5>Date of submission:</h5></td>
  <td style="padding: 10px;" align="left">
      <p class="title"><%=res.getString("Date") %></p></td>
 </tr>
      <tr>
  <td style="padding: 10px;" align="right">
      <h5 >Discriptiom :</h5></td>
  <td style="padding: 10px;" align="left">
      <p class="title"><%=res.getString("description") %></p></td>
 </tr>
      <tr>
  <td style="padding: 10px;" align="right">
      <h5 >Type :</h5></td>
  <td style="padding: 10px;" align="left">
      <p class="title"><%= type %></p></td>
 </tr>
 
  </table>
  </div>
</div>

<div class="card" style="margin-top: 5%;height:auto;width: 85%;" id="review">
    <h3 style="margin-top: 3%;">Document Details</h3>
  <div style="margin-left: 20%;margin-top: 5%;">
  <table style="width: 70%;margin-left:10 %;">
  <tr>
      <th align="right">
          Sr.no
      </th>
      <th align="left">
          Document Name
      </th>
      <th>
          Status
      </th>
       <th>
        Show
      </th>
      <th>
		Confirm
      </th>
  </tr>
  
  
  <%
  	int maxdoc=0;
  	int length=0;
  	String[] pgstrings={"Agreement Certificate","Aadhar Card","SSC Certificate","HSC certificate","Light Bill"};
  	String[] clearstrings={"Living Certificate","Aadhar Card","SSC Certificate","HSC certificate"};
  	String[] empstrings={"Salary Certificate","ID Card","Birth Certificate"};
  	String[] passstrings={"Birth Certificate","Aadhar Card","Living Certificate","Aggreement certificate","Clearance Certificate"};
  	String[] permission={"Aadhar Card","Address Proof","Recommandation Letter"};
  	int i=1;
  	switch(type){
  	case "PG":
  		i=1;
  		maxdoc = pgstrings.length;
  		length = maxdoc;
  		for(String s:pgstrings){
  		  %>
			<tr> 
			 <td>
			  <%=i%>.
			 </td>
			 <td style="padding: 10px;" align="left">
			      <h5><%=s%></h5></td>
			<td style="padding: 5px;" align="left">
			<p class="title">Submitted</p></td>
			<td><a href="ShowDoc?doc=<%=i %>&appId=<%=appId%>" target="_blank">Click Here to See</a></td>
			<td>
     			<label class="container">Check If Right
      				<INPUT TYPE="checkbox" NAME="dog" id=<%=i %> value="<%=s%>">
      				<span class="checkmark"></span>
      			</label>
			</td>
			</tr>
  		 <% 			
  		i++;
  		}  		
  		break;
  		
  	case "Clearance":
  		i=1;
  		maxdoc = clearstrings.length;
  		length = maxdoc;
  		for(String s:clearstrings){
  		  %>
			<tr> 
			 <td>
			  <%=i %>.
			 </td>
			 <td style="padding: 10px;" align="left">
			      <h5><%=s%></h5></td>
			<td style="padding: 5px;" align="left">
			<p class="title">Submitted</p></td>
			<td><a href="ShowDoc?doc=<%=i %>&appId=<%=appId%>" target="_blank">Click Here to See</a></td>
			<td>
     			<label class="container">Check If Right
      				<INPUT TYPE="checkbox" NAME="dog" id=<%=i %> value="<%=s%>">
      				<span class="checkmark"></span>
      			</label>
			</td>
			
			</tr>
  		 <% 			
  		i++;
  		}  	
  		break;
  		
  	case "Employement":
  		i=1;
  		maxdoc = empstrings.length;
  		length = maxdoc;
  		for(String s:empstrings){
  		  %>
			<tr> 
			 <td>
			  <%=i %>.
			 </td>
			 <td style="padding: 10px;" align="left">
			      <h5><%=s%></h5></td>
			<td style="padding: 5px;" align="left">
			<p class="title">Submitted</p></td>
			<td><a href="ShowDoc?doc=<%=i %>&appId=<%=appId%>" target="_blank">Click Here to See</a></td>
			<td>
     			<label class="container">Check If Right
      				<INPUT TYPE="checkbox" NAME="dog" id=<%=i %> value="<%=s%>">
      				<span class="checkmark"></span>
      			</label>
			</td>
			
			</tr>
  		 <% 			
  		i++;
  		}
  		
  		break;
  		
  	case "Passport":
  		i=1;
  		maxdoc = passstrings.length;
  		length = maxdoc;
  		for(String s:passstrings){
  		  %>
			<tr> 
			 <td>
			  <%=i %>.
			 </td>
			 <td style="padding: 10px;" align="left">
			      <h5><%=s%></h5></td>
			<td style="padding: 5px;" align="left">
			<p class="title">Submitted</p></td>
			<td><a href="ShowDoc?doc=<%=i %>&appId=<%=appId%>" target="_blank">Click Here to See</a></td>
			<td>
     			<label class="container">Check If Right	
      				<INPUT TYPE="checkbox" NAME="dog" id=<%=i %> value="<%=s%>">
      				<span class="checkmark"></span>
      			</label>
			</td>
			</tr>
  		 <% 			
  		i++;
  		}
  		break;
  	case "Ganesh Chaturti":
  		i=1;
  		maxdoc = passstrings.length;
  		length = maxdoc;
  		for(String s:permission){
  		  %>
			<tr> 
			 <td>
			  <%=i %>.
			 </td>
			 <td style="padding: 10px;" align="left">
			      <h5><%=s%></h5></td>
			<td style="padding: 5px;" align="left">
			<p class="title">Submitted</p></td>
			<td><a href="ShowDoc?doc=<%=i %>&appId=<%=appId%>" target="_blank">Click Here to See</a></td>
			<td>
     			<label class="container">Check If Right	
      				<INPUT TYPE="checkbox" NAME="dog" id=<%=i %> value="<%=s%>">
      				<span class="checkmark"></span>
      			</label>
			</td>
			</tr>
  		 <% 			
  		i++;
  		}
  		break;
  	case "Navratri":
  		i=1;
  		maxdoc = passstrings.length;
  		length = maxdoc;
  		for(String s:permission){
  		  %>
			<tr> 
			 <td>
			  <%=i %>.
			 </td>
			 <td style="padding: 10px;" align="left">
			      <h5><%=s%></h5></td>
			<td style="padding: 5px;" align="left">
			<p class="title">Submitted</p></td>
			<td><a href="ShowDoc?doc=<%=i %>&appId=<%=appId%>" target="_blank">Click Here to See</a></td>
			<td>
     			<label class="container">Check If Right	
      				<INPUT TYPE="checkbox" NAME="dog" id=<%=i %> value="<%=s%>">
      				<span class="checkmark"></span>
      			</label>
			</td>
			</tr>
  		 <% 			
  		i++;
  		}
  		break;
	default:
  		out.println("No documents provide");	
  	}
  %>
 
  </table>
  </div>
</div>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	
	 <div class="card" style="margin-top: 5%;height:auto;width: 85%;" >
	 <input type="submit" onclick="func(<%=length %>)" value="Generate Dialogue Box" style="background-color: #00BFFF;margin-left:40%;width:220px;"/>
	 </div>
	 
    
    <div class="card" style="margin-top: 5%;height:auto;width: 85%;" >
    <p>status of form is</p>
    <p id="demo"></p>
       
        <label for="de"> msg for user :-</label> 
        <input type="text" name="ack" value="Nothing is acknowledged" id="de" style="margin-left: 24%;background-color:#EFE9E9;width: 50%;padding: 12px 20px;border-radius: 10px;"/>
</div>

   <div class="card" style="margin-top: 5%;height:auto;width: 85%;" >
    <p>status of form is</p>
    <p id="demo"></p>
       
        <label for="unc"> msg for user :-</label> 
        <input type="text" name="unc" id="unc" value="nitin sa" style="margin-left: 24%;background-color:#EFE9E9;width: 50%;padding: 12px 20px;border-radius: 10px;"/>
</div>



<br>
<br>
<% 
	session.setAttribute("towhom", aadhar);
	session.setAttribute("fromwhom", "123456789123");
	session.setAttribute("appId", appId);
%>
<button onclick="javascript:sendStatus()">Submit</button>
<br>
<br>	
<br>
<br>

<div class="card" style="margin-top: 5%;height:auto;width: 85%;" id="Dialogue">
   <p>Message for user</p>
  <textarea rows="10" cols="30" placeholder="Write your message here ......"></textarea>
  <br>	
<br>
<br>
  <button style="width:200px;margin-left:40%;">Submit</button>
</div>

<div class="card" style="margin-top: 5%;height:auto;width: 85%;" id="appoint">
    <p>Appointment to give</p>
     <br>
     <br>
     <textarea rows="10" cols="20" id="appmsg" placeholder="Write your message here ......"></textarea>
     <%	
    Date date = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
    String strDate= formatter.format(date);  
    System.out.println(strDate);  %>
   <input id="dateele" type="date"  min="<%=strDate%>" style="width:40%;margin-left:29%;background-color:#EFE9E9;border-radius:10px;height:40px;"><br>
<br>
<br>
   <button style="width:200px;margin-left:40%;" onclick="arrangeAppointment()">Submit</button>
</div>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
	
	
	function arrangeAppointment(){
	
		var dateEle = document.getElementById("dateele");
		var date = dateEle.value;
		var msg = document.getElementById("appmsg").value;
		window.location="SendStatus?query=appointment&date="+date+"&msg="+msg;
	}
	
	
	
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
var status=0;
$(function() {
	var j=0,i=0;
    $(":checkbox").on("change", function() {
        
        if ( this["name"] == "dog" && this.checked) {
        	if(j==0)
            {
	        	document.getElementById("de").value="This field are ack :-    " + this.value;
	        	document.getElementById("de").value+="  ,   ";
	        	j=1;
            }
        	else{
                document.getElementById("de").value+=this.value;
               	document.getElementById("de").value+="  ,   ";
        	}
			
        }
    });
});

function sendStatus(){	
	var msg = document.getElementById('de').value+document.getElementById('unc').value;
	window.location='SendStatus?query=msg&msg='+msg+'&status='+status+'&maxdoc='+<%=maxdoc%>;
	status=0;
}
function func(length)
{
	status=0;
	var j=0;
	for(i=1;i<length+1;i++)
	{
		if (!($('#'+i).prop('checked')))
		{
			if(j==0)
			{
				document.getElementById("unc").value="Unacknowledge fields are	"+$('#'+i).val();
				document.getElementById("unc").value+="	,	";
				j=1;
			}
			else {
				document.getElementById("unc").value+=$('#'+i).val();
				document.getElementById("unc").value+="	,";
			}
			
		}
		else
			status++;
	}
	var message = document.getElementById("ack")+document.getElementById("unack");
}
</script>
<script src="nav.js"></script>
</body>
</html>
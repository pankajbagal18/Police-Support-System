<%@page import="General.QueryLayer"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Application Acknowledgement</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
<%
	QueryLayer q = new QueryLayer();
	String appId = request.getParameter("appId");
	String  aadhar = request.getParameter("aadhar");
	ResultSet res = q.getApplicationAck(appId,aadhar);
	res.next();
	String type = res.getString("type");
%>
<div id="content" style="margin-right:0;">
<div class="card" style="height: 15%;width: 85%;">
<img src="images/icon/mahapolice.png" style="width: 7%;margin-top: 1%">
<h4 style="margin-top: -6%;margin-left: ;">Maharashtra police Support System</h4>
    <p class="title">Dhanakawadi Police Station<br>Pune-411043</p>
</div>
<div class="card" style="margin-top: 3%;height: 80%;width: 85%;" >;
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

<div class="card" style="margin-top: 5%;height:auto;width: 85%;" >
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
  </tr>
  
  
  <%
  
  	String[] pgstrings={"Agreement Certificate","Aadhar Card","SSC Certificate","HSC certificate","Light Bill"};
  	String[] clearstrings={"Living Certificate","Aadhar Card","SSC Certificate","HSC certificate"};
  	String[] empstrings={"Salary Certificate","ID Card","Birth Certificate"};
  	String[] passstrings={"Birth Certificate","Aadhar Card","Living Certificate","Aggreement certificate","Clearance Certificate"};
  	String[] permission={"Aadhar Card","Address proof","Recommandation letter"};

  	int i=1;
  	switch(type){
  	case "PG":
  		i=1;
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
			</tr>
  		 <% 			
  		i++;
  		}  		
  		break;
  		
  	case "Clearance":
  		i=1;
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
			</tr>
  		 <% 			
  		i++;
  		}  	
  		break;
  		
  	case "Employement":
  		i=1;
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
			</tr>
  		 <% 			
  		i++;
  		}
  		
  		break;
  		
  	case "Passport":
  		i=1;
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
			</tr>
  		 <% 			
  		i++;
  		}
  		break;
  	case "Ganesh Chaturti":
  		i=1;
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
			</tr>
  		 <% 			
  		i++;
  		}
  		break;
  			
  	case "Navratri":
  		i=1;
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
</div>
<br>
<br>
<button onclick="window.location='ShowPdf.jsp'">print</button>
<br>
<br>	
<br>
<br>


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

</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jspdf.min.js"></script>
<script type="text/javascript">
function genPdf(){
	var doc = new jsPDF();
	doc.fromHTML($('#content').get(0),0,0,{
		'width':1024},
		function(){
	        doc.save('applicationAck.pdf');
	    });
}
</script>
</html>
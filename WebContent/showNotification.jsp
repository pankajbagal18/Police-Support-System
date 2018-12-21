<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="General.QueryLayer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	QueryLayer q = new QueryLayer();
	String aadhar = request.getParameter("aadhar");
	String appId = request.getParameter("appId");
	ResultSet res =  q.getAppointment(aadhar,appId);
	res.next();
	%>
	<h2>Application Datails : </h2>
	<h3>Application Id : </h3><p><%=res.getString("appId") %></p> <br>
	<h3>Application Type : </h3><p><%=res.getString("type") %></p> <br>
	<h3>Application Date : </h3><p><%=res.getString("date") %></p> <br>
	<h3>Application Progress : </h3><p><%=res.getString("progress") %></p> <br>
	<h3>Application Description : </h3><p><%=res.getString("description") %></p> <br>
	<br>
	<h2>Appointment Details : </h2>
	<h3>Appointment Date : </h3><p><%=res.getString("dateOfApp") %></p> <br>
	<h3>Attended : </h3><p><%if(res.getInt("attended")==0) out.print("No"); else out.print("Yes"); %></p><br>
	<a href="dashboard.jsp">
		<input type="button" value="GoToDashboard">
	</a>
	<%
		q.updateNotiReadBit(appId);
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="General.QueryLayer , java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	QueryLayer q = new QueryLayer();
	ResultSet res = q.getFIR(id);
	if(res.next())
	{
%>
	<h3>FIR ID :</h3><p><%=res.getInt("id") %></p>
	<h3>Act :</h3><p><%=res.getString("act") %></p>
	<h3>Section :</h3><p><%=res.getString("section") %></p>
	<h3>Name of Complainant :</h3><p><%=res.getString("name") %></p>
	<h3>Address :</h3><p><%=res.getString("c_address") %></p>
	<h3>Aadhaar No :</h3><p><%=res.getString("aadhar") %></p>
	<h3>Name of Accussed :</h3><p><%=res.getString("accused_name") %></p>
	<h3>Alias :</h3><p><%=res.getString("alias") %></p>
	<h3>Relative Name :</h3><p><%=res.getString("relative_name") %></p>
	<h3>Address of accussed :</h3><p><%=res.getString("c_address_accused") %></p>
	<h3>FIR :</h3><p><%=res.getString("description") %></p>
	<input type="submit" value="print" />
<%} %>

</body>
</html>
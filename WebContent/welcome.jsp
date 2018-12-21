<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="signup.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
</head>
<body>
	<%
		Signupdata data = (Signupdata)session.getAttribute("userData");
		if(data==null)
		{
			response.sendRedirect("error.jsp");
		}
	%>
	Welcome
	<a href="logout" >Logout</a>
</body>
</html>
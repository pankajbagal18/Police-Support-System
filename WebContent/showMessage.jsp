<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="General.QueryLayer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String msg = request.getParameter("message");
	QueryLayer q = new QueryLayer();
	q.updateReadCount(msg);
	%>
	<h3>Message</h3>
	<p><%=msg %></p>
	<a href="dashboard.jsp">
		<input type="button" value="GoToDashboard">
	</a>
</body>
</html>
<%@page import="General.QueryLayer"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DOCUMENT</title>
</head>
<body>
	<%
	String appId = request.getParameter("appId");
	int docNo = Integer.parseInt(request.getParameter("doc"));
	String filename = appId+"_"+docNo+".pdf";
	QueryLayer q = new QueryLayer();
	Blob pdfBlob = q.getBlob(appId,docNo);
	byte data[] = null;
	data = pdfBlob.getBytes(1,(int)pdfBlob.length());
	response.setContentType("application/pdf");
	response.setHeader("cache-control", "no-cache");
    //response.setHeader("Content-disposition", "attachment; filename=" + filename);
    OutputStream output = response.getOutputStream();
    output.write(data);
    output.flush();
    output.close();
	%>
</body>
</html>
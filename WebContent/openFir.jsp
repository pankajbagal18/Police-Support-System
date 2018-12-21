<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="General.QueryLayer , java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Open FIRs</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
</head>
<body>
<%		QueryLayer q = new QueryLayer();
ResultSet res = q.getPublicFirs(); 
boolean state =false;
if(res.next())
	state =true;
else
	state = false;
%>
<div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                    <div style="margin-left:80%;">
                  	 </div>
                        <div class="row">
                            <div id="div1" class="col-lg-9" style="display: block;margin-top:-15%;">
                                <h2 class="title-1 m-b-25">First Information Reports	(FIR) </h2>
                                <div class="table-responsive table--no-card m-b-40" style="width: 140%;">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                <th>FIR ID</th>
                                                <th>Name of Complainant</th>
                                                <th>Aadhar No</th>
                                                <th>Description</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        if(state==true){
                                        res.first();
                                        do{ %>
                                            <tr onclick='window.location="displayFir.jsp?id=<%=res.getString("id")%>"'>
                                                <td><%=res.getString("id") %></td>
                                                <td><%=res.getString("name") %></td>
                                                <td><%=res.getString("aadhar") %></td>
                                        		<td><%=res.getString("description") %></td>
                                        		<td><%=res.getString("dateOfIssue") %></td>
                                            </tr>
                                            <%}while(res.next());
                                        
                                        }
                                        
                                        else{
                                        	out.println("No Records");
                                        }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                     </div>
    </div>

</div>
</body>
</html>
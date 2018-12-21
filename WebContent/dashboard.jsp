<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="applications.ApplicationData"%>
<%@page import="General.QueryLayer"%>
<html lang="en">
<%@ page import="signup.Signupdata" %>
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

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
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
<link href="assets/css/flexslider.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body class="animsition">
	<%
		Signupdata userdata=null;
		userdata = (Signupdata)session.getAttribute("user");
		QueryLayer q = new QueryLayer();
		if(userdata==null)
			response.sendRedirect("error.jsp");
		else
		{
	%>
      <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="index.html">
                            <img src="images/icon/logo.png" alt="CoolAdmin" />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
       <!--   <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img src="images/icon/logo.png" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="active has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                        <li>
                            <a href="map.html">
                                <i class="fas fa-map-marker-alt"></i>Maps</a>
                        </li>
                       
                    </ul>
                </nav>
            </div>
        </aside>-->
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container" style="width:200%;">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop" style="margin-left:-23%;">
                <div class="section__content section__content--p30">
                    <div class="container-fluid" >
                        <div class="header-wrap" style="width:100%;">
                            <div class="header-button" style="margin-left:76%;">
                                <div class="noti-wrap">
                                    <div class="noti__item js-item-menu">
                                        <div class="mess-dropdown js-dropdown">
                                            <div class="mess__title">
                                                <p>You have 2 news message</p>
                                            </div>
                                            <div class="mess__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-06.jpg" alt="Michelle Moreno" />
                                                </div>
                                                <div class="content">
                                                    <h6>Michelle Moreno</h6>
                                                    <p>Have sent a photo</p>
                                                    <span class="time">3 min ago</span>
                                                </div>
                                            </div>
                                            <div class="mess__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-04.jpg" alt="Diane Myers" />
                                                </div>
                                                <div class="content">
                                                    <h6>Diane Myers</h6>
                                                    <p>You are now connected on message</p>
                                                    <span class="time">Yesterday</span>
                                                </div>
                                            </div>
                                            <div class="mess__footer">
                                                <a href="#">View all messages</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-email"></i>
                                        <%int count[] = q.getMessageCount(userdata.getAadhar()); %>
                                        <span class="quantity"><%=count[0] %></span>
                                        <div class="email-dropdown js-dropdown">
                                            <div class="email__title">
                                                <%
	                                                
                                                	ResultSet res = q.getMsgIfAny(userdata.getAadhar());
                                                	
                                                	if(res.next()){
                                                %>
                                                <p>You have <%=count[0] %> New messages</p>
                                        		<p>You have <%=count[1] %> total messages</p>
                                            </div>
                                           <%do
                                           { 
        
                                           %>
                                           <a href="showMessage.jsp?message=<%=res.getString("message") %>">
	                                            <div class="email__item">
	                                                <div class="image img-cir img-40">
	                                                    <img src="ImageServlet?aadhar=<%=res.getString("frm")%>" alt="Cynthia Harvey" />
	                                                </div>
	                                                <div class="content">
	                                                
	                                                    <p><%=res.getString("message") %></p>
	                                                    <span>Cynthia Harvey, 3 min ago</span>
	                                                </div>
	                                            </div>
                                            </a>
                                        <%}while(res.next()); %>
                                    	<%}
                                     	else
                                     	{
                                     	%>
                                   			<div class="email__item">
                                          	<div class="image img-cir img-40">
                                          	<img src="imageavatar-01.jpg" alt="Cynthia Harvey" />
                                          	</div>
                                          	<div class="content">
                                            <p>No Message</p>
                                            <span>Cynthia Harvey, 3 min ago</span>
                                          	</div>
                                     	 	</div>
                                     	<% 
                                     	}
                                     	%>
                                     	</div>
                                     </div>
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-notifications"></i>
                                        <% int appointmentCount = q.getAppointmnetCount(userdata.getAddress()); %>
                                        <span class="quantity"><%= appointmentCount%></span>
                                        <div class="notifi-dropdown js-dropdown">
                                            <div class="notifi__title">
                                            
                                                <p>You have <%=appointmentCount %> Notifications</p>
                                            </div>
                                            
                                            
                                            <% res=q.getAppointments(userdata.getAadhar()); %>
                                            <%if(res.next()){ 
                                            
                                            do{
                                            %>
                                            <a href="showNotification.jsp?aadhar=<%=res.getString("aadhar") %>&appId=<%=res.getString("appId") %>">
                                            <div class="notifi__item">
                                                <div class="bg-c1 img-cir img-40">
                                                    <i class="zmdi zmdi-email-open"></i>
                                                </div>
                                                <div class="content">
                                                    <p>You got an appointment for your Application of <%=res.getString("type")%> Certificate</p>
                                                    <p>Application Id : <%=res.getString("appId")%></p>
                                                    <p>Appointment Date : <%=res.getString("dateOfApp")%></p>
                                                    <span class="date">April 12, 2018 06:50</span>
                                                </div>
                                            </div>
                                            </a>
                                            <% 
                                            }while(res.next());
                                            }
                                            else{
                                    		%>
                                    		
                                    		<div class="notifi__item">
                                                <div class="bg-c1 img-cir img-40">
                                                    <i class="zmdi zmdi-email-open"></i>
                                                </div>
                                                <div class="content">
                                                     <p>No Notification</p>
                                                     <span class="date">April 12, 2018 06:50</span>
                                                </div>
                                            </div>
                                            <%
                                            }
                                            %>
                                    		
                                    <div class="notifi__footer">
                                        <a href="#">All notifications</a>
                                    </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                        
                                            <img src="ImageServlet?aadhar=<%=userdata.getAadhar()%>" alt="<%=userdata.getName() %>" />
                                        </div>
                                        <div class="content">
                                        <%
                                        String name = userdata.getName().substring(userdata.getName().lastIndexOf(" "));
                                        %>  <a class="js-acc-btn" href="#"><%=name %></a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="ImageServlet?aadhar=<%=userdata.getAadhar()%>" alt="<%=userdata.getName() %>" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#"><%=userdata.getName() %></a>
                                                    </h5>
                                                    <span class="email"><%=userdata.getEmail() %></span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="account.jsp?aadhar=<%=userdata.getAadhar()%>">
                                                        <i class="zmdi zmdi-account"></i>Account</a>
                                                </div>
                                                <div class="account-dropdown__item">
                                                    <a href="#">
                                                        <i class="zmdi zmdi-settings"></i>Setting</a>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="logout">
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content" style="margin-left:-10%;width:50%;">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Your Applied Forms Are Here</h2>
     			                </div>
     			                <br>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-lg-9" >
							<!-- Display Any Application Person Has submitted or not -->
							<%
							
														
							ApplicationData[] appData = q.getApplication(userdata.getAadhar());
							if(appData!=null){
								%>
                                <div class="table-responsive table--no-card m-b-40" style="width: 140%;">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                <th>Application ID</th>
                                                <th>Date</th>
                                                <th>Description</th>
                                                <th>Type</th>
                                                <th>Progress</th>
                                                <th>Appointment</th>
                                            </tr>
                                        </thead>
                             	<%
								for(ApplicationData app:appData){
									app.setProgress(q.getStatus(app.getAppId()));
									System.out.println("Progress :- "+app.getProgress());
									%>									
                           	          <tbody>
                                            <tr onclick="window.location='applicationAck.jsp?aadhar=<%=app.getAadhar() %>&appId=<%=app.getAppId()%>';">
                                                <td><%=app.getAppId() %></td>
                                                <td><%=app.getDate() %></td>
                                                <td><%=app.getDesc() %></td>
                                                <td><%=app.getType() %></td>
                                                <td><div class="progress mb-2" style="width: 120%;position:relative;margin-left:-40%;">
											<div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%=app.getProgress()%>%;position:absolute;z-index:10;" aria-valuenow="<%=app.getProgress()%>"
											 aria-valuemin="0" aria-valuemax="100"></div>
										</div><p style="color:black;margin-left:90%;margin-top:-37%;font-size:15px;"><%=app.getProgress()%>%</p></td>
                                                <%ResultSet rs = q.getAppointment(app.getAppId());
                                                if(rs.next()){%>
                                                <td><%=rs.getDate("dateOfApp") %></td>
                                                <% } 
                                                else { %>
                                                <td>pending</td>
                                                <%} %>
                                            </tr>
                                            
									<%
									
								}
               					%>
               					</tbody>
                                </table>
               					</div>
               					<%
							}
							%>                            
                              
                            </div>
                        </div>
                      
                    </div>
                </div>
                <div class="row" >
           
               
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.4s">
                     <div class="about-div">
                    <a href="javascript:getLocation()"> <i class="fa fa-bell-o fa-4x icon-round-border" style="color: red;"></i></a>
                   <h3 ></h3>
                 <hr />
                       <hr />
                   <p >
                       	 Emergency Complaint Click Here. 
                       
                   </p>
               <a href="javascript:getLocation()" class="btn btn-info btn-set"  >Emergency Complaint</a>
                </div>
                   </div>
                   <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.5s">
                     <div class="about-div">
                     <a href="applicationDoc.jsp"><i class="fa fa-file-text fa-4x icon-round-border" ></i></a>
                 <hr />
                       <hr />
                   <p >
                       Apply for Documents. 
                       
                   </p>
               <a href="applicationDoc.jsp" class="btn btn-info btn-set"  >Document Application</a>
                </div>
                   </div>
                   
                 <div  class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.6s">
                     <div class="about-div">
                    <a href="applicationPer.jsp"> <i class="fa fa-check-square-o fa-4x icon-round-border" ></i>
                 </a>
                 <hr />
                       <hr />
                   <p >
                      Ask for permission
                       
                   </p>
               <a href="applicationPer.jsp" class="btn btn-info btn-set"  >PERMISSION</a>
                </div>
                   </div>
                   
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.6s">
                     <div class="about-div">
                     <i class="fa fa-eye fa-4x icon-round-border" ></i>
                   <h3 >Be an Police friend</h3>
                 <hr />
                       <hr />
                   <p >
						Be an Police Mitra.
                       
                   </p>
               <a href="policeFriend.jsp" class="btn btn-info btn-set"  >BE AN POLICE FRIEND</a>
                </div>
                   </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>
	<%
	} 
	%>
	<script>
	function gotoApplicationDoc(){
		window.location="applicationDoc.jsp";	
	}
	
	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(showPosition);
	    } else { 
	        x.innerHTML = "Geolocation is not supported by this browser.";
	    }
	}

	function showPosition(position) {
	   var x=position.coords.latitude;
	   var y=position.coords.longitude;
	   //window.location="showLocation.jsp?lat="+x+"&lang="+y;
	   window.location="getPhoneNumber.jsp?lat="+x+"&lang="+y;
	}
	   

	</script>
</body>

</html>
<!-- end document-->
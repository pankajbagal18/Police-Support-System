<%@page import="General.QueryLayer"%>
<%@page import="java.sql.* , signup.Signupdata" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Required meta tags-->
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
<title>Admin Dashboard</title>
</head>
<body class="animsition">
	<%
		QueryLayer q = new QueryLayer();
		ResultSet res = q.getPublicFirs();
		Signupdata adminData = (Signupdata)session.getAttribute("admin");
		System.out.println("Aadhar : "+adminData.getAadhar());
		
		int[] arr = q.getFirCount();
		int[] arr1=q.areaCount();
		boolean state = false;
		if(res.next())
		{
			state = true;
		}
		else{
			state = false;
		}

	%>
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="index.html">
                            <img src="images/icon/mahapolice.png" alt="CoolAdmin" />
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
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img src="images/icon/mahapolice.png" alt="Cool Admin" style="height:80px;width:100px;"/>
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li >
                            <a class="js-arrow" href="adminDashboard.jsp">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                        <li class="active has-sub">
                            <a href="#">
                                <i class="fa fa-align-center"></i>FIR</a>
                        </li>
                        <li>
                            <a href="adminMap.jsp">
                                <i class="fas fa-map-marker-alt"></i>Maps</a>
                        </li>

                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                                <input class="au-input au-input--xl" type="text" name="search" style="display:none;" placeholder="Search for datas &amp; reports..." />
                                <button class="au-btn--submit" type="submit" style="display:none;">
                                    <i class="zmdi zmdi-search" style="display:none;"></i>
                                </button>
                            </form>
                            <div class="header-button">
                                <div class="noti-wrap">
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-comment-more" style="display:none;"></i>
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
                                        <i class="zmdi zmdi-email" style="display:none;"></i>
                                        <div class="email-dropdown js-dropdown">
                                            <div class="email__title">
                                                <p>You have 3 New Emails</p>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, 3 min ago</span>
                                                </div>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, Yesterday</span>
                                                </div>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, April 12,,2018</span>
                                                </div>
                                            </div>
                                            <div class="email__footer">
                                                <a href="#">See all emails</a>
                                            </div>
                                        </div>
                                    </div>
                                                                        <%
                                            	int count[] = q.getEmergencyCount();
                                            %>
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-notifications"></i>
                                        <span class="quantity"><%=count[0] %></span>
                                        <div class="notifi-dropdown js-dropdown">
                                            <div class="notifi__title">
                                            
                                                <p>You have <%=count[0] %> un-responded Notifications</p>
                                                <p>You have <%=count[1] %> responded Notifications</p>
                                                <p>You have <%=count[2] %> total Notifications</p>
                                            </div>
                                            
                                            <%
                                            QueryLayer q1 = new QueryLayer();
                                            ResultSet res12 = q1.getEmeregencyIfAny();
                                			if(res12.next()){
                                            do{

                                            %>
                                            <div class="notifi__item">
                                                <div class="bg-c1 img-cir img-40">
                                                    <i class="zmdi zmdi-email-open"></i>
                                                </div>
                                                <div class="content">
                                                    <h4>EMERGENCY</h4>
                                                    <p>There is an emergency in <%=res12.getString("address") %></p>
                                                    <p>Phone Number : <%=res12.getString("phone_no") %></p>
                                          	<%if(res12.getInt("attended")==0){
                                          		 %>
                                          		<a href="javascript:getLocation(<%=res12.getInt("id")%>)">Respond</a>
                                          		<%
                                          		} 
                                          		%>
                                                    <!-- <span class="date">April 12, 2018 06:50</span>-->
                                                </div>
                                            </div>
                                            <%
                                            
                                            }while(res12.next());
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
                                            <img src="ImageServlet?aadhar=<%=adminData.getAadhar()%>" alt="John Doe" />
                                        </div>
                                        <div class="content">
                                        <%
                                        	String name = adminData.getName().substring(adminData.getName().lastIndexOf(" "));
                                        			
                                        %>
                                            <a class="js-acc-btn" href="#"><%=name%></a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                    
                                                        <img src="ImageServlet?aadhar=<%=adminData.getAadhar()%>" alt="John Doe" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#"><%=adminData.getName() %></a>
                                                    </h5>
                                                    <span class="email"><%=adminData.getEmail() %></span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="#">
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
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                    <div class="col-lg-6">
                                <div class="au-card m-b-30" style="width:100%;">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Month Wise FIR</h3>
                                        <canvas id="barChart1"></canvas>
                                    </div>
                                </div>
                                
                                <div class="au-card m-b-30" style="width:100%;margin-left:450px;margin-top:-400px;">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">Area Wise FIR</h3>
                                        <canvas id="barChart2"></canvas>
                                    </div>
                                   
                                </div>
                            </div>
                             <br>
                                    <br>
                                     <br>
                                    <br>
                    <div style="margin-left:80%;">
                    <a href="addFir.jsp">
                     <button class="au-btn au-btn-icon au-btn--blue" >
                                        <i class="zmdi zmdi-plus"></i>add fir</button></a>
                     </div>
                        <div class="row">
                            <div id="div1" class="col-lg-9" style="display: block;margin-top:3%;">
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
                                        		<td><%=res.getDate("dateOfIssue") %></td>
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
    
    <script>
function func(x) {
  
    
}
var id=0;
function getLocation(id1) {
   	id = id1;
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
   var lat=position.coords.latitude;
   var lang=position.coords.longitude;
   //window.location="showLocation.jsp?lat="+x+"&lang="+y;
   window.location="respond.jsp?lat="+lat+"&lang="+lang+"&id="+id;
}
   
</script>
    
<script>
    var ctx = document.getElementById("barChart1");
    if (ctx) {
      ctx.height = 200;
      var myChart = new Chart(ctx, {
        type: 'bar',
        defaultFontFamily: 'Poppins',
        data: {
          labels: ["January", "February", "March", "April", "May", "June", "July","August","Sept","Oct","Nov","Dec"],
          datasets: [
            {
              label: "FIR Registered",
              data: [<%=arr[0]%>, <%=arr[1]%>, <%=arr[2]%>,<%=arr[3]%>,<%=arr[4]%>,<%=arr[5]%>,<%=arr[6]%>,<%=arr[7]%>,<%=arr[8]%>,<%=arr[9]%>,<%=arr[10]%>,<%=arr[11]%>],
              borderColor: "rgba(0, 123, 255, 0.9)",
              borderWidth: "0",
              backgroundColor: "rgba(0, 123, 255, 0.5)",
              fontFamily: "Poppins"
            },
           /* {
              label: "My Second dataset",
              //data: [28, 48, 40, 19, 86, 27, 90,6,6,6,6,6],
              borderColor: "rgba(0,0,0,0.09)",
              borderWidth: "0",
              backgroundColor: "rgba(0,0,0,0.07)",
              fontFamily: "Poppins"
            }*/
          ]
        },
        options: {
          legend: {
            position: 'top',
            labels: {
              fontFamily: 'Poppins'
            }

          },
          scales: {
            xAxes: [{
              ticks: {
                fontFamily: "Poppins"

              }
            }],
            yAxes: [{
              ticks: {
                beginAtZero: true,
                fontFamily: "Poppins"
              }
            }]
          }
        }
      });
    }
</script>
<script>
    var ctx = document.getElementById("barChart2");
    if (ctx) {
      ctx.height = 200;
      var myChart = new Chart(ctx, {
        type: 'bar',
        defaultFontFamily: 'Poppins',
        data: {
         // labels: ["PCMC","Dhanakawadi","Swargate","Katraj","Kothrud","Pune_Station","Shivajinagar"],
          labels: ["PCMC","Dhanakawadi","Swargate","Katraj","Kothrud","Pune_Station","Shivajinagar"],
          datasets: [
            {label: "FIR Registered",
                data: [<%=arr1[0]%>, <%=arr1[1]%>, <%=arr1[2]%>,<%=arr1[3]%>,<%=arr1[4]%>,<%=arr1[5]%>,<%=arr1[6]%>],
                borderColor: "rgba(0, 123, 255, 0.9)",
                borderWidth: "0",
                backgroundColor: "rgba(0, 123, 255, 0.5)",
                fontFamily: "Poppins"
            },
            /*{
            /*  label: "My Second dataset",
              //data: [28, 48, 40, 19, 86, 27, 90,6,6,6,6,6],
              borderColor: "rgba(0,0,0,0.09)",
              borderWidth: "0",
              backgroundColor: "rgba(0,0,0,0.07)",
              fontFamily: "Poppins"
            }*/
          ]
        },
        options: {
          legend: {
            position: 'top',
            labels: {
              fontFamily: 'Poppins'
            }

          },
          scales: {
            xAxes: [{
              ticks: {
                fontFamily: "Poppins"

              }
            }],
            yAxes: [{
              ticks: {
                beginAtZero: true,
                fontFamily: "Poppins"
              }
            }]
          }
        }
      });
    }
</script>

</body>

</html>
<%@page import="General.QueryLayer , java.sql.*" %>
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

	<%
		QueryLayer q = new QueryLayer();
		ResultSet res = q.getLaws();
	%>
	<%
								if(res.next()){
								%>
			<div class="row">
                            <div class="col-lg-9" >
							<!-- Display Any Application Person Has submitted or not -->
								
                                <div class="table-responsive table--no-card m-b-40" style="width: 140%;">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                <th>Section</th>
                                                <th>Act</th>
                                                <th>Punishment(in years)</th>
                                            </tr>
                                        </thead>
                             	<%
								do{								
                             	%>									
                           	          <tbody>
                                            <tr onclick="window.location='';">
                                                <td><%=res.getInt("section")%></td>
                                                <td><%=res.getString("act") %></td>
                                                <td><%=res.getInt("punishment") %></td>
                                                
                                            </tr>
                                          
               						</tbody>
               						            
                              <%}while(res.next()); %>
                                </table>
               					</div>                
                            </div>
                            <%} %>
                        </div>

           
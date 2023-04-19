<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Users / Profile -  </title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">
    <div class="d-flex align-items-center justify-content-between">
      <a href="#" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Booking System</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->
    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->      
        <li class="nav-item dropdown pe-3">
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
         <%             
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
                Statement st = con.createStatement();
                String sql = "SELECT filename FROM image_table ";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    String filename = rs.getString("filename");
        %>                  
            <img src="<%=filename%>" alt="Profile" class="rounded-circle">                     
             <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>  
             <%
						String id = request.getParameter("id");
					Connection connection = null;
						Statement statement = null;
						ResultSet resultSet = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>            
            <span class="d-none d-md-block dropdown-toggle ps-2"><%=resultSet.getString("FirstName") %> </span>                                   
             <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>  
          </a><!-- End Profile Iamge Icon -->
            <%
						String id2 = request.getParameter("id");
					Connection connectionn = null;
						Statement statementt = null;
						ResultSet resultSett = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id2;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>           
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">                  
              <h6><%=resultSet.getString("FirstName") %> <%=resultSet.getString("LastName") %></h6>
           <span>Software Developer</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.jsp?id=<%=resultSet.getString("id") %>">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="?id=<%=resultSet.getString("id") %>">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
   <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-help.jsp?id=<%=resultSet.getString("id") %>">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-login.jsp">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
              </ul><!-- End Profile Dropdown Items -->                   
           <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>             
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

 <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">   
   <%
						String id6 = request.getParameter("id");
					Connection connectionnnnn = null;
						Statement statementtttttt = null;
						ResultSet resultSetttttttt = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id6;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="index.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="index.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-menu-button-wide"></i><span>Settings</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="generalsetting.jsp?id=<%=resultSet.getString("id") %>">
              <i class="bi bi-circle"></i><span>General Setting</span>
            </a>
          </li>
          <li>
            <a href="paymentsetting.jsp?id=<%=resultSet.getString("id") %>">
              <i class="bi bi-circle"></i><span>Payment Setting</span>
            </a>
          </li>
          <li>
            <a href="PaypalSetting.jsp?id=<%=resultSet.getString("id") %>">
              <i class="bi bi-circle"></i><span>Paypal Setting</span>
            </a>
          </li>
          <li>
            <a href="Changepassword.jsp?id=<%=resultSet.getString("id") %>">
              <i class="bi bi-circle"></i><span>Change Password</span>
            </a>
          </li>
 
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Currency Management</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="AddCurrency.jsp?id=<%=resultSet.getString("id") %>">
              <i class="bi bi-circle"></i><span>Add Currency</span>
            </a>
          </li>
          <li>
            <a href="Currencylist.jsp?id=<%=resultSet.getString("id") %>">
              <i class="bi bi-circle"></i><span>Currency list</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>Services Management</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="AddService.jsp?id=<%=resultSet.getString("id") %>">
              <i class="bi bi-circle"></i><span>Add Service</span>
            </a>
          </li>
          <li>
            <a href="ServiceList.jsp?id=<%=resultSet.getString("id") %>">
              <i class="bi bi-circle"></i><span>Service List</span>
            </a>
          </li>
        </ul>
      </li>
       <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="pages-contact.html">
          <i class="bi bi-layout-text-window-reverse"></i><span>Enquiry management</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
         <li class="nav-item">
        <a class="nav-link collapsed" href="pages-error-404.html?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-dash-circle"></i>
          <span>Enquiry List</span>
        </a>
      </li>
           
        </ul>
      </li>
      
      <!-- End Tables Nav -->
 <!-- End Charts Nav -->

      <!-- End Icons Nav -->
<li class="nav-item">
        <a class="nav-link collapsed" href="userlist.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-person"></i>
          <span>User List</span>
        </a>
        <li class="nav-item">
        <a class="nav-link collapsed" href="Bookinglist.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-person"></i>
          <span>Booking list</span>
        </a>
       

      <li class="nav-item">
        <a class="nav-link collapsed" href="Transactionlist.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-person"></i>
          <span>Transaction List</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-help.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-question-circle"></i>
          <span>Chat Dashboard</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->
       <!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-register.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-card-list"></i>
          <span>Register</span>
        </a>
      </li><!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Login</span>
        </a>
      </li><!-- End Login Page Nav -->

      <!-- End Error 404 Page Nav -->
     <!-- End Blank Page Nav -->
    </ul>          
  </aside>
  <!-- End Sidebar-->

  <!-- End Sidebar-->
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp?id=<%=resultSet.getString("id") %>">Home</a></li>
          <li class="breadcrumb-item">Users</li>
          <li class="breadcrumb-item active">Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->	
		<%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>             
    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
  <%
             
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
                Statement st = con.createStatement();
                String sql = "SELECT filename FROM image_table ";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    String filename = rs.getString("filename");
        %>
              <img src="<%=filename%>" alt="Profile" class="rounded-circle">            
                     <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>              
        <%
						String id3 = request.getParameter("id");
					Connection connectionnn = null;
						Statement statementtt = null;
						ResultSet resultSettt = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id3;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
                   
              <h2><%=resultSet.getString("FirstName") %>  <%=resultSet.getString("LastName") %></h2>                                     
              <%
						}
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
                <h3>Software Developer</h3>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">


                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>
 </ul>
              <div class="tab-content pt-2">

                               <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  
                  <%
             
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
                Statement st = con.createStatement();
                String sql = "SELECT filename FROM image_table ";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    String filename = rs.getString("filename");
        %>
         
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                       
                      <div class="col-md-8 col-lg-9">
                        <img src="<%=filename%>" alt="Profile">
                        <div class="pt-2"> 
                        </div>
                      </div>
                    </div>
                    
                     <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>  
                    <%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
statement=connection.createStatement();
String sql ="SELECT * FROM image_table";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
 <form action="Try?id=<%=resultSet.getString("id") %>" method="post" enctype = "multipart/form-data">  
             
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<button type="submit" style="background-color: red;color: white;border: 1px solid #e4e4e4;padding: 4px;border-radius: 1px;"> Upload Pic</button>
                          <input type = "file" name = "file" size = "10">
                  </form >
                   
 <% 
}

} catch (Exception e)
{
e.printStackTrace();
}
%>
      			<%
						String id1 = request.getParameter("id");
					Connection connectionnnn = null;
						Statement statementttt = null;
						ResultSet resultSetttt = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id1;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
                    <form action="editprofile.jsp" >
              <input type="hidden" placeholder="Enter FirstName" name="id" class="form-control" id="fullName" required  value="<%=resultSet.getString("id") %>">
            <br>
						<div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                      <div class="col-md-8 col-lg-9">                        
    					 <input type="text" placeholder="Enter FirstName" name="FirstName" class="form-control" id="fullName" required  value="<%=resultSet.getString("FirstName") %>">                   
                      </div>
                    </div>
                     <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Last Name</label>
                      <div class="col-md-8 col-lg-9">
                         
                         <input type="text" placeholder="Enter LastName" name="LastName" class="form-control" id="LastName" required  value="<%=resultSet.getString("LastName") %>">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="company" class="col-md-4 col-lg-3 col-form-label" >Email</label>
                      <div class="col-md-8 col-lg-9">
                         
       <input type="text" placeholder="Enter Email I'd" name="email" class="form-control" id="password" required  value="<%=resultSet.getString("email") %>">                       
                      </div>
                    </div> 
                                <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">  Password</label>
                      <div class="col-md-8 col-lg-9">
                         <input name="password" type="password"  size="20" class="form-control" placeholder="Enter Current Password">
                       </div>
                    </div>
                                         <div class="text-center">
                      <button type="submit"  name="Submit" class="btn btn-primary">Submit</button>
                          </div>
             </form><!-- End Profile Edit Form -->
						<%
						}
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
  </div>
                <div class="tab-pane fade pt-3" id="profile-settings">                  
                </div>                        
                </div>
              </div><!-- End Bordered Tabs -->
            </div>
          </div>
        </div>     
    </section>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>VNS</span></strong>. All Rights Reserved
    </div>
    <div class="credits">Designed by <a href="#">Shubham</a>
    </div>
  </footer><!-- End Footer -->
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.min.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
</body>
</html>
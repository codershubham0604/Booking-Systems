<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*,java.util.*"%>
    <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard - Booking System</title>
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
<%
String id3 = request.getParameter("id");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connvv = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Connection connectionm= null;
Statement statementz = null;
ResultSet resultSetz = null;
%>
<%
try{
connectionm = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
statementz=connectionm.createStatement();
String sql ="select * from book where id="+id3;
resultSetz = statementz.executeQuery(sql);
while(resultSetz.next()){
%>
  
  
  
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.jsp?id=<%=resultSetz.getString("id") %>" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Booking System</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

  <%
}
connectionm.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
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

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="index.jsp" data-bs-toggle="dropdown">
           
           
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
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Statement sst=conn.createStatement();
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
            <span class="d-none d-md-block dropdown-toggle ps-2"><%=resultSet.getString("FirstName") %></span>
          </a><!-- End Profile Iamge Icon -->

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
              <a class="dropdown-item d-flex align-items-center" href="users-profile.jsp?id=<%=resultSet.getString("id") %>">
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
              <a class="dropdown-item d-flex align-items-center" href="Logout.jsp">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
            <%
					}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
						%>

      </ul>
    </nav><!-- End Icons Navigation -->

  </header>
   
  <!-- End Header -->

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
              <i class="bi bi-circle"></i><span>PayPal Setting</span>
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
            <a href="view.jsp?id=<%=resultSet.getString("id") %>&page=1">
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
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>Enquiry management</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
         <li class="nav-item">
        <a class="nav-link collapsed" href="enquriylist.jsp?id=<%=resultSet.getString("id") %>">
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
  </aside><!-- End Sidebar-->
  
  
    <%
  }
  } catch (Exception e) {
    out.println(e);
    }
        %> 
        
         
    
</body>

</html>
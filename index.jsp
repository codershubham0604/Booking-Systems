 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
 <main id="main" class="main">
    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Home</li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
      <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-4">
              <div class="card info-card sales-card">
                <div class="card-body">
                 
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
                 <a href="userlist.jsp?id=<%=resultSetz.getString("id") %>" > <h5 class="card-title">Total User</h5></a>
                 
                 <%
}
connectionm.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6><% 
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/booking","root","root");     
    Statement st=con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM userlist";
    ResultSet rs = st.executeQuery(strQuery);

    String Countrow="";
      while(rs.next()){
      Countrow = rs.getString(1);
      out.println("" +Countrow);
       } 
    }
catch (Exception e){
    e.printStackTrace();
  }
  %></h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->
            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-4">
              <div class="card info-card revenue-card">
                <div class="card-body">
                 
                
                  <h5 class="card-title">Online User </h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-person-check"></i>
                    </div>
                    <div class="ps-3">
                      <h6>6</h6>
                       
                    </div>
                  </div>
                </div>

              </div>
            </div>
            <div class="col-xxl-4 col-md-4">
              <div class="card info-card customers-card">
   <div class="card-body">
    
    <%
String id = request.getParameter("id");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connv = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
Connection connection= null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connectionm = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
statementz=connectionm.createStatement();
String sql ="select * from book where id="+id3;
resultSetz = statementz.executeQuery(sql);
while(resultSetz.next()){
%>    
                  <a href="ServiceList.jsp?id=<%=resultSetz.getString("id") %>" ><h5 class="card-title">Total Services</h5></a>
                     
                 <%
}
connectionm.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-activity"></i>
                    </div>
                    <div class="ps-3">
                      <h6>
                      <% try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/booking","root","root");     
    Statement st=con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM addservice";
    ResultSet rs = st.executeQuery(strQuery);

    String Countrow="";
      while(rs.next()){
      Countrow = rs.getString(1);
      out.println("" +Countrow);
       } 
    }
catch (Exception e){
    e.printStackTrace();
  }
  %></h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->
            
              <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-4">
              <div class="card info-card Total-Enquries">
                <div class="card-body">
                 <%
try{
connectionm = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
statementz=connectionm.createStatement();
String sql ="select * from book where id="+id3;
resultSetz = statementz.executeQuery(sql);
while(resultSetz.next()){
%> 
                <a href="enquriylist.jsp?id=<%=resultSetz.getString("id") %>" >  <h5 class="card-title">Total Enquries  </h5></a>
 <%
}
connectionm.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-telephone-inbound-fill"></i>
                    </div>
                    <div class="ps-3">
                      <h6><% try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/booking","root","root");     
    Statement st=con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM enquriylist";
    ResultSet rs = st.executeQuery(strQuery);

    String Countrow="";
      while(rs.next()){
      Countrow = rs.getString(1);
      out.println("" +Countrow);
       } 
    }
catch (Exception e){
    e.printStackTrace();
  }
  %></h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->
              <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-4">
              <div class="card info-card Total-Booking">
                <div class="card-body">
 
                <%
try{
connectionm = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
statementz=connectionm.createStatement();
String sql ="select * from book where id="+id3;
resultSetz = statementz.executeQuery(sql);
while(resultSetz.next()){
%> 
               
              <a href="Bookinglist.jsp?id=<%=resultSetz.getString("id") %>" >      <h5 class="card-title">Total Booking </h5></a>
  <%
}
connectionm.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-calendar-check-fill"></i>
                    </div> 
                    <div class="ps-3">
                      <h6><% try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/booking","root","root");     
    Statement st=con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM bookinglistlist";
    ResultSet rs = st.executeQuery(strQuery);

    String Countrow="";
      while(rs.next()){
      Countrow = rs.getString(1);
      out.println("" +Countrow);
       } 
    }
catch (Exception e){
    e.printStackTrace();
  }
  %></h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->
 <!-- Revenue Card -->      
             <div class="col-xxl-4 col-md-4">
              <div class="card info-card Total-Transaction">
                <div class="card-body">
                <%
try{
connectionm = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
statementz=connectionm.createStatement();
String sql ="select * from book where id="+id3;
resultSetz = statementz.executeQuery(sql);
while(resultSetz.next()){
%> 
                
                
                
                
                
                
                
                
            <a href="Transactionlist.jsp?id=<%=resultSetz.getString("id") %>" >      <h5 class="card-title">Total Transaction </h5></a>
                 
                 
                 
                  <%
}
connectionm.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <h6><% 
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/booking","root","root");     
    Statement st=con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM transactionlist";
    ResultSet rs = st.executeQuery(strQuery);

    String Countrow="";
      while(rs.next()){
      Countrow = rs.getString(1);
      out.println("" +Countrow);
       } 
    }
catch (Exception e){
    e.printStackTrace();
  }
  %></h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->
            
   
        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

   <jsp:include page="Footer.jsp"></jsp:include>

</body>

</html>
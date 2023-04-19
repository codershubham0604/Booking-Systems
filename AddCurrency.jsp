 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <title>Add Currency</title>
</head>

<body>  
 	 <jsp:include page="Header.jsp"></jsp:include>
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
						String id6 = request.getParameter("id");
					Connection connectionn = null;
						Statement statementt = null;
						ResultSet resultSett = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id6;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
   <main id="main" class="main">

    <div class="pagetitle">
      <h1>Currency Management</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp?id=<%=resultSet.getString("id") %>">Home</a></li>
          <li class="breadcrumb-item">Currency Management</li>
          <li class="breadcrumb-item active">Currency</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <form action="addcurrencydb.jsp?id=<%=resultSet.getString("id") %>" method="post">
<div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Currency Name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="CurrencyName" type="text" class="form-control" id="renewPassword">
                      </div>
                    </div>
						<div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Currency Code</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="CurrencyCode" type="text" class="form-control" id="renewPassword">
                      </div>
                    </div>
						<br>
						<div class="text-center">
                      <button type="submit" class="btn btn-primary"  >Submit</button>
                    </div>
                    </form>
						<br> <br>
    <%
  }
  } catch (Exception e) {
    out.println(e);
    }
        %> 
        
        
      
        
        
        
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
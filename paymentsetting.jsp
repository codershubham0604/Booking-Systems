   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Payment Setting</title>
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
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

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="index.jsp?id=<%=resultSet.getString("id") %>">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav --> 
    
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Payment Setting</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp?id=<%=resultSet.getString("id")%>">Home</a></li>
          <li class="breadcrumb-item">Setting</li>
          <li class="breadcrumb-item active">Payment Setting</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->                
    
     <form action=" paymentsettingdb.jsp?id=<%=resultSet.getString("id") %>" method="post">    
  <%
Connection con = null;
PreparedStatement ps = null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
String sqll = "SELECT * FROM AddCurrency";
ps = con.prepareStatement(sqll);
ResultSet rs = ps.executeQuery(); 
%>
     
       <div class="col-12">
                      <label for="yourPassword" class="form-label">Currency Code</label>
                    
     <select class="form-control" name="CurrencyCode" id="yourPassword" required>
  
		<option>Select Currency Code </option>			    
 
<%
while(rs.next())
{
String CurrencyCode = rs.getString("CurrencyCode"); 
%>



<option value="<%=CurrencyCode %>"><%=CurrencyCode %></option>
 
 
 
 <%
}
%>
 
   </select>
               <br>      
 
               
                <div class="invalid-feedback">Please enter your Currency Code</div>
                    </div>
                  <div class="col-12">
                      <label for="yourPassword" class="form-label"> Price Per credit</label>
                      <input type="text" name="PricePercredit" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your Credit</div>
                    </div><br>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Submit</button>
                    </div><br>

                </form>
                    
                     <button type="reset" onclick="javascript:window.location='paymentsetting.jsp?id=<%=resultSet.getString("id")%>';" class="btn btn-primary">Cancle</button>
 					<br><br>
                    
                    
                    
                    <br><br><br><br><br><br><br><br><br><br><br>
                    
                    <%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
    
  
  
   
   <%
  }
  } catch (Exception e) {
    out.println(e);
    }
        %> 
  
  
  
  
   <jsp:include page="Footer.jsp"></jsp:include>
  
</body>

</html>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>  Paypal Setting</title>
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
      <h1>Paypal Setting</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp?id=<%=resultSet.getString("id")%>">Home</a></li>
          <li class="breadcrumb-item">Setting</li>
          <li class="breadcrumb-item active">Paypal Setting</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
     <form action="PaypalSettingdb.jsp?id=<%=resultSet.getString("id") %>" method="post">
    <div class="col-12">
                      <label for="yourPassword" class="form-label">Payment Mode &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; </label>                                                       
                       Debit Card
                      <input type="radio" name="PaymentMode" value="Debit Card">&nbsp;&nbsp;&nbsp;
                       Cradit Card
                      <input type="radio" name="PaymentMode" value="Cradit Card">&nbsp;&nbsp;&nbsp;
                       UPI
                      <input type="radio" name="PaymentMode" value="UPI">
                       
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Send Box</label>
                      <input type="text" name="SendBox" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Client</label>
                      <input type="text" name="Client" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Send Box Secret</label>
                      <input type="text" name="SendBoxSecret" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Line Client</label>
                      <input type="text" name="LineClient" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Live Secret</label>
                      <input type="text" name="LiveSecret" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                      <br>
                    <div class="col-12"> 
                     <button class="btn btn-primary w-100" type="submit">Submit</button>
                    </form>
                    </div><br>           
					  <button type="reset" onclick="javascript:window.location='PaypalSetting.jsp?id=<%=resultSet.getString("id")%>';" class="btn btn-primary">Cancle</button>
 					<br><br>
 					 
 					<%
  }
  } catch (Exception e) {
    out.println(e);
    }
        %>  								
   <jsp:include page="Footer.jsp"></jsp:include>

</body>

</html>
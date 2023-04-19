<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%> 
 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Change Password</title>
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
 
 <script language="javascript">
function fncSubmit()
{

if(document.ChangePasswordForm.password.value == "")
{
alert('Please input Old password');
document.ChangePasswordForm.password.focus();
return false;
} 

if(document.ChangePasswordForm.newpassword.value == "")
{
alert('Please input Password');
document.ChangePasswordForm.newpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.conpassword.value == "")
{
alert('Please input Confirm Password');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)
{
alert('Confirm Password Not Match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();
}
</script>
  
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
      <h1>Change Password</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp?id=<%=resultSet.getString("id")%>">Home</a></li>
          <li class="breadcrumb-item">Setting</li>
          <li class="breadcrumb-item active">Change PSassword</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
    <%
  }
  } catch (Exception e) {
    out.println(e);
    }
        %>  
        	<%
						String id1 = request.getParameter("id");
					Connection connectionnn = null;
						Statement statementttt = null;
						ResultSet resultSettt = null;
						%>
						<%
						try{
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/booking", "root", "root");
						statement=connection.createStatement();
						String sql ="select * from book where id="+id1;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
						%>
    <form name="ChangePasswordForm" method="post"  action="changepwd.jsp?id=<%=resultSet.getString("id") %>" OnSubmit="return fncSubmit();" >
    
     <input type="hidden" placeholder="Enter FirstName" name="id" class="form-control" id="fullName" required  value="<%=resultSet.getString("id") %>">
            <br>                     
                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                      <div class="col-md-8 col-lg-9">
                         <input name="password" type="password" id="OLDpwd" size="20" class="form-control" placeholder="Enter Current Password">                                       
                      </div>
                    </div> 						 						
 						<div class="row mb-3">
                      <label for="newpassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                      <div class="col-md-8 col-lg-9">							
 							<input name="newpassword" type="password" id="newpassword" class="form-control"> 				
 						</div>
                    </div>						
 						<div class="row mb-3">
                      <label for="conpassword" class="col-md-4 col-lg-3 col-form-label">Conform Password</label>
                      <div class="col-md-8 col-lg-9">
                      
                      <input name="conpassword" type="password" id="conpassword" class="form-control">
 						
 						</div>
                    </div>                    
                                         <div class="text-center">
                      <button type="submit"  name="Submit" class="btn btn-primary">Change Password</button>
                    <button type = "reset" value = "Reset"  class="btn btn-primary">Reset</button>                    
                    </div>
                  </form> 
                  	<%
						}
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
           <!-- End Change Password Form -->
                  <br><br>                            
<br>
<br>
<br>
 <jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>
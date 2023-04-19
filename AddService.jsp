 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Add Services</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
 
<style>
.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
</style>
  
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
      <h1>General Tables</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.jsp?id=<%=resultSet.getString("id")%>">Home</a></li>
          <li class="breadcrumb-item">Service Management</li>
          <li class="breadcrumb-item">Add Service</li>
        </ol>
      </nav>
				    </div><!-- End Page Title -->
				 

     					 <form action="AddServicedb.jsp?id=<%=resultSet.getString("id") %>" method="post">
                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Title </label>
                      <div class="col-md-8 col-lg-9">
                        <input name="Title" type="text" class="form-control" id="currentPassword">
                      </div>
                    </div>
							
							  <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label"> Description </label>
                      <div class="col-md-8 col-lg-9">
                        <input name="Descp" type="text" class="form-control" id="currentPassword">
                      </div>
                    </div>
				   <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">Price (Credit) </label>
                       
                      <div class="col-md-8 col-lg-9">
                      
                        
                       <div class="input-group mb-3">
						  <div class="input-group-prepend">
						    <span class="input-group-text" id="basic-addon1">Cr</span>
						  </div>
						  <div class="col-md-8 col-lg-9">
						  <input name="PriceCredit" type="text" class="form-control" placeholder="$$" aria-label="Username" aria-describedby="basic-addon1" id="newPassword">
						</div>
						</div>
                      </div>
                      
                    </div>
                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Duration</label>
                      <div class="col-md-8 col-lg-9">
                        
                     
                      <select name="Duration" id="renewPassword" class="form-control">
                      					<option>Select Your Duration</option>
									    <option value="30Min">30 Minutes</option>
									    <option value="1Hr">1 hour</option>
									    <option value="1.5Hr">1.5 Hours</option>
									    <option value="2Hr">2 Hours</option>
									  </select>
                     
                      </div>

                    </div>

                      <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Max spot Limit</label>
                      <div class="col-md-8 col-lg-9">
                          
			                    <select name="MaxSpotLimit" id="currentPassword" class="form-control">
                      					<option>Select Your Limit</option>
									    <option value="1">1</option>
									    <option value="2">2</option>
									    <option value="3">3</option>
									    <option value="4">4</option>
									  </select>    
                        </div>
                    </div>
 						 <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">Close Booking before Time </label>
                      
                      <div class="col-md-8 col-lg-9">
                        
                      
						   <select name="CloseBooking" id="newPassword" class="form-control">
                      					<option>Select Your Time</option>
									    <option value="30Min">30 Minutes</option>
									    <option value="1Hr">1 hour</option>
									    <option value="1.5Hr">1.5 Hours</option>
									    <option value="2Hr">2 Hours</option>
									    <option value="2Hr">3 Hours</option>
									    <option value="2Hr">4 Hours</option>
									  </select>
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Service Type </label>
                      <div class="col-md-8 col-lg-9">
                      Daily
                        <input name="ServiceType" type="radio" value="Daily" id="collapsible" >
                        <div class="content" >f</div>
                        Weekly
                         <input name="ServiceType" type="radio" value="Weekly" id="collapsible">
                         Monthly
                         <input name="ServiceType" type="radio" value="Monthly" id="collapsible">
                          Yearly
                         <input name="ServiceType" type="radio" value="Yearly" id="collapsible">
                      </div>
                      <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Start Date</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="StartDate" type="date" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">End Date</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="EndDate" type="date" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Start Time </label>
                      <div class="col-md-8 col-lg-9">
                        <input name="StartTime" type="time" class="form-control" id="renewPassword">
                      </div>
                    </div>
               
                    
                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">End Time</label>
                    <div class="col-md-8 col-lg-9">
                        <input name="EndTime" type="time" class="form-control" id="renewPassword">
                      </div>                   
                    </div>
   </div>
  
                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Submit</button><br><br>
                      <button type="reset" onclick="javascript:window.location='AddService.jsp?id=<%=resultSet.getString("id")%>';" class="btn btn-primary">Cancle</button>
                    </div>
                  </form><!-- End Change Password Form -->

                  <br>
                  <%
				  }
				  } catch (Exception e) {
				    out.println(e);
				    }
				  %> 
                <!-- ======= Footer ======= -->
  <jsp:include page="Footer.jsp"></jsp:include><!-- End Footer -->

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
<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>
</body>

</html>
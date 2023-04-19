<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>  

<form action="" method="post">
Enter email
<input type="email" name="email" id="email">
 <button type="submit" class="btn btn-primary" onclick="loadDoc()">Submit</button>  
</form>
 <div id="data">
 
 
  
 
 </div>





<script>

function loadDoc() {
	  const xhttp = new XMLHttpRequest();
	  var ss=document.getElementById("email").value;
	  //alert(ss);
	  xhttp.onload = function() {
		    document.getElementById("data").innerHTML = this.responseText;
		    }
	  xhttp.open("GET", "UserVerify?email="+ss+"", true);
	  xhttp.send();
	}

</script>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html>
<head>

<style type="text/css">


body{
  margin: 25px;
  font-family: verdana;
}

h1{
  color: darkslategray;
}

p {
  font-size: 12pt;
  color: black;
}
canvas {
  height: 175px;
  border-style: solid;
  border-width: 1px;
  border-color: black;
}

input {
  font-family: verdana;
  font-size: 12pt;
}

 

</style>

<script type="text/javascript">


function upload(){
	  var imgcanvas = document.getElementById("canv1");
	  var fileinput = document.getElementById("finput");
	  var image = new SimpleImage(fileinput);
	  image.drawTo(imgcanvas);
	}
</script>



</head>
<body>
<script src="https://www.dukelearntoprogram.com/course1/common/js/image/SimpleImage.js">
</script>



<h1>Upload and Display Image</h1>
<canvas id= "canv1" ></canvas>

<p>
Filename:
<input type="file" multiple="false" accept="image/*" id=finput >
<button onclick="upload()">Upload</button>
</p>
</body>
</html>
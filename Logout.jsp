<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*,java.util.*"%>
 <html>
	<body>
		<% session.invalidate(); %> 
		<jsp:forward page="pages-login.jsp"/>
	</body>
<html>
 
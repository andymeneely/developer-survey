<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="edu.ncsu.csc.realsearch.devsurvey.InitialPasswordValidator"%><html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css" />
</head>
<body>
<div id=wrap>
<div id=container><%@include file="/header.jsp"%>
<div id=content>
<div class=login>

Please enter the username and password you were given in the email.<br>
Your username is most likely your email address.<br><br><br>

<%
if("true".equals(request.getParameter("loginError"))){
	%>
	<div class=errorList>Login failed - make sure you have the right username and password</div>
	<%
}
String userValue = ""; 
String passValue = "";
if(new InitialPasswordValidator().isValidUserPass(session.getAttribute("user"),session.getAttribute("password"))){
	userValue = session.getAttribute("user").toString();
	passValue= session.getAttribute("password").toString();
}
%>

<form method=post action="j_security_check">
<table>
	<tr>
		<td>Username:</td>
		<td><input name="j_username" value="<%=userValue%>"></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type=password name="j_password" value="<%=passValue%>"></td>
	</tr>
</table>
<input type=submit value="Start the survey" />

</form>
</div></div></div></div>
</body>
</html>
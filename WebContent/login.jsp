<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="edu.ncsu.csc.realsearch.devsurvey.InitialPasswordValidator"%><html>
<head>
<title>Developer Survey</title>
</head>
<body>

Please enter the username and password you were given in the email.

<%
if("true".equals(request.getParameter("loginError"))){
	%>
	<div class=fail>Login failed - make sure you have the right username and password</div>
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
	<tr>
		<td colspan=100%><input type=submit value="Login" /></td>
</table>

</form>

</body>
</html>
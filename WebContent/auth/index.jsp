<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="edu.ncsu.csc.realsearch.devsurvey.IdentifyDeveloper"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%><html>
<head>
<title>Developer Survey</title>
</head>
<body>

<h1>Welcome!</h1>
Thank you for taking this survey! Before we get started, please confirm
that this is you.

<%
	IdentifyDeveloper id = new IdentifyDeveloper();
	Developer dev = id.getDeveloper(request.getUserPrincipal().getName());
%>

<div>Name: <%=dev.getName()%><br />
Project: <%=dev.getProject()%><br />
</div>

<form method=post action="page1.jsp"><input type=submit
	value="Yes, that's me."></form>
If this is not you, please contact Andy Meneely (apmeneel@ncsu.edu) to participate in this survey. 
</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperDAO"%><html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css" />
</head>
<body>
<div id=wrap>
<div id=container><%@include file="/header.jsp"%>
<div id=content>
<h2>Welcome!</h2>

Thank you for taking this survey! 
<br><br>
Something about us not 
<br><br>
Also, please note that this survey is <b>not</b> an evaluation of your performance. Our research is directed at examining the structure of the entire team, not on any single developer. 
<br><br>
 Before we get started, please confirm your identity. <%
	DeveloperDAO id = new DeveloperDAO();
	Developer dev = id.getDeveloper(request.getUserPrincipal().getName());
%>

<div class=question>
<table>
	<tr>
		<td>Name:</td>
		<td><%=dev.getName()%></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><%=dev.getUsername()%></td>
	</tr>
	<tr>
		<td>Project:</td>
		<td><%=dev.getProject()%></td>
	</tr>
</table>

<form method=post action="page1.jsp"><input type=submit
	value="Yes, that's me."></form>
</div>
<br><br>
If this is not you, please contact <a href="mailto:apmeneel@ncsu.edu">Andy Meneely</a> to get the
correct username to participate in this survey.
</div>
<%@include file="/footer.jsp" %>
</div>
</div>
</body>

</html>
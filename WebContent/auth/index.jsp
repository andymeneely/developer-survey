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
<%
	DeveloperDAO id = new DeveloperDAO();
	Developer dev = id.getDeveloper(request.getUserPrincipal().getName());
%>

<h2>Welcome!</h2>

Thank you for taking this survey! 
<br><br>
The following survey should take about 10 minutes. It will ask some questions about 
the software development team you are a member of. The questions are customized 
to your software project. Please answer the questions as best you can. 

<br><br>
 Before we get started, please confirm your identity and your project. 

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
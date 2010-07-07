<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperDAO"%><html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" />
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

Thank you for taking this survey! <br>
<br>
The following survey should take about 10 minutes. It will ask some
questions about the software development team you are a member of. The
questions are <b>customized</b> to you and to this software project. <br>
<br>
Please answer the questions as best you can. You can leave a comment or
question with any of your answers. <br>
<br>
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
<br>
If this is not you, please contact <a href="mailto:apmeneel@ncsu.edu">Andy
Meneely</a> to get the correct username to participate in this survey. <br>
<br>
<div class=disclaimer>
<b>About this study</b><br>
Your participation is completely voluntary and your responses will be
kept in strict confidence. Your personal information will not appear in
public data sets or in academic publications. This survey is deployed on
servers owned by North Carolina State University, not a third-party
website. During our analysis, we use random identifiers assigned to each
person to preserve anonymity. If you are not at least 18 years of age,
please do not participate in this survey. <br>
<br>
If you have concerns about the privacy or legitimacy of this study, you
may contact Deb Paxton (919/515-4514), Regulatory Compliance
Administrator, Box 7514, North Carolina State University, Raleigh, NC,
27695. <br>
<br>
</div>

</div>
<%@include file="/footer.jsp"%></div>
</div>
</body>

</html>
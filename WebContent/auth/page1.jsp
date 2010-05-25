<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%><html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css" />
</head>
<body>
<div id=wrap>
<div id=container><%@include file="/header.jsp"%>
<div id=content>
<h1>About your project</h1>

<form method=post action="page2.jsp">
<input type=hidden name="posted" value="true"/>
<div class=question>On this team, I perform the following tasks
(check all that apply).
<table>
	<%
		for (ProjectTasks role : ProjectTasks.values()) {
	%>
	<tr>
		<td><input type=checkbox name=roles value=<%=role.name()%>></td>
		<td><%=role.getDescription()%></td>
	</tr>
	<%
		}
	%>
</table>
</div>

<div class=question>In your estimation, how many different members
of this team have you worked with in the last month? Include in your
count both in-person and online interactions. Do not include yourself in this count.<br>
<input name="numteammates" value="" size=3></div>

<div class=pageNum>Page 1 of 4</div>
<div class=clear></div>

<input type=submit value="Next >>" id=next>
<input type=button onclick="javascript:history.go(-1)" value="<< Back" id=back>
<div class=clear></div>

</form>
</div></div></div>
</body>

</html>
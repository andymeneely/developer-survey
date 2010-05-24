<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.IdentifyDeveloper"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%><html>
<head>
<title>Developer Survey</title>
</head>
<body>

<h1>About your project</h1>

<form method=post action="page2.jsp">
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
count both in-person and online interactions. <br>
<input name="numteammates" value=""></div>
<input type=submit value="Next"></form>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%>
<%@page import="java.util.List"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperGenerator"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.SaveAnswers"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.InputValidationException"%>
<%@page import="java.util.ArrayList"%><html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css" />
</head>
<body>
<div id=wrap>
<div id=container><%@include file="/header.jsp"%>
<div id=content>
<%
List<Developer> devs = new DeveloperGenerator().getDevelopers(request.getUserPrincipal().getName());
%>

<h1>About your team</h1>

<form method=post action="page3.jsp">
<input type=hidden name=posted value=true/>

<br>
<div class=question>
3. Next, <em>in the context of this project</em>, what is your connection to the following people?
<br><br>
<table>
	<%
		for (Developer dev : devs) {
	%>
	<tr>
		<td align=center><%=dev.getName()%> <br>
		(<%=dev.getUsername()%>) <!-- <%=dev.getDistanceTo()%> --></td>
		<td><select name="distanceTo<%=dev.getUsername()%>">
			<option value=4>I have never heard of this person before.</option>
			<option value=3>I recognize this person's name, but I don't know much about them.</option>
			<option value=2>I know who this person is, but I have not worked with them directly.</option>
			<option value=1>I have worked with this person on this project.</option>

		</select></td>
	</tr>
	<%
		}
	%>
</table>
</div>

<div class=pageNum>Page 2 of 4</div>
<div class=clear></div>

<input type=submit value="Next >>" id=next>
<input type=button onclick="javascript:history.go(-1)" value="<< Back" id=back>
<div class=clear></div>


</form>
</div></div></div></body>

</html>
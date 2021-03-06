<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.SaveAnswers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.InputValidationException"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperDAO"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.GetProjectName"%><html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css" />
</head>
<body>
<div id=wrap>
<div id=container><%@include file="/header.jsp"%>
<div id=content>

<%
String thisProject = GetProjectName.fromSession(request);

String posted = request.getParameter("posted");
if("true".equals(request.getParameter("posted"))){
	SaveAnswers save = new SaveAnswers(request.getUserPrincipal().getName());
	List<String> errors = new ArrayList<String>();
	errors.addAll(save.saveTasks(request));
	errors.addAll(save.saveComment(request.getParameter("comment"), 1));
	if(errors.size() > 0){
%>
<div class=errorList>
Oops! There was an error with what you entered.
<ul>
<% for(String error : errors) { %>
	<li><%=error %></li>
<%} %>
</ul>
</div>

<%
	} else{
		response.sendRedirect("page1.5.jsp");
	}
	
}
%>

<h1>About your project</h1>

<form method=post action="page1.jsp">
<input type=hidden name="posted" value="true"/>
<div class=question>1. On <%=thisProject%>, I perform the following tasks
(check all that apply).
<table>
	<%
		for (ProjectTasks role : ProjectTasks.values()) {
	%>
	<tr>
		<td><input type=checkbox name=roles value="<%=role.name()%>" id="<%=role.name()%>"></td>
		<td><label for="<%=role.name()%>"><%=role.getDescription()%></label></td>
	</tr>
	<%
		}
	%>
</table>
</div>

<%@include file="/commentSection.jsp" %>

<div class=pageNum>Page 1 of 6</div>
<div class=clear></div>

<input type=submit value="Next >>" id=next>
<input type=button onclick="javascript:history.go(-1)" value="<< Back" id=back>
<div class=clear></div>

</form>
</div>
<%@include file="/footer.jsp" %>
</div></div>
</body>

</html>
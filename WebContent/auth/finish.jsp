<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%>
<%@page import="java.util.List"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperGenerator"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.AutoSuggestList"%><html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" />
<style>
</style>

</head>
<body>
<div id=wrap>
<div id=container><%@include file="/header.jsp"%>
<div id=content>

<h1>Thank you!</h1>
<div class=question>You're done! Thank you very much for taking
this survey. You are now entered into the drawing for the prize mentioned in your email.<br>
<br>
In case you were wondering, this study is part of ongoing research on
the socio-technical connections found in software development teams.
Large software development teams are often organized in a network
structure similar to many social networks found in our society today. In
this study, we are attempting to gauge how developers perceive their own
location in that network (i.e. socio-technical awareness).<br>
<br>
Given that information, feel free provide any comments below. You are not obli</div>

<input type=button onclick="javascript:history.go(-1)" value="<< Back"
	id=back>
<div class=clear></div>

</div>
</div>
</div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%>
<%@page import="java.util.List"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperGenerator"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.AutoSuggestList"%><html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css" href="./wick.css" />
<style>
</style>

</head>
<body>

<script type="text/javascript">
collection = <%=new AutoSuggestList().getAllTeammatesArray(request
							.getUserPrincipal().getName())%>;
</script>

<h1>About experts</h1>

<form method=post action="finish.jsp" onsubmit="return checkForm();">
<div class=question>Next, who on this team would you consider be
an <b>expert</b> on this particular project?
<div class=instructions>Please enter up to 5 names or email addresses</div>

<table>
	<tr>
		<td><input class="wickEnabled" size=70 type=text
			name="person1" value=""></td>
	</tr>
	<tr>
		<td><input class="wickEnabled" size=70 type=text
			name="person2" value=""></td>
	</tr>
	<tr>
		<td><input class="wickEnabled" size=70 type=text
			name="person3" value=""></td>
	</tr>
	<tr>
		<td><input class="wickEnabled" size=70 type=text
			name="person4" value=""></td>
	</tr>
	<tr>
		<td><input class="wickEnabled" size=70 type=text
			name="person5" value=""></td>
	</tr>
</table>

</div>

<input type=submit value="Next">
</form>


<script type="text/javascript" language="JavaScript" src="./wick.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.IdentifyDeveloper"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%>
<%@page import="java.util.List"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperGenerator"%><html>
<head>
<title>Developer Survey</title>
</head>
<body>

<%
	String[] choice = {
			"I work with this person frequently.",
			"This person is physically located near me.",
			"This person knows a lot about software security in general.",
			"This person has worked on similar features to this one before.",
			"In the past, this person has worked on parts of this project with high security risk.",
			"This person is highly experienced in software engineering.",
			"Someone I respect recommended this person.",
			"This person is my superior."};
%>

<script type="text/javascript">
	function updateTotal(theForm) {
		var total = 0;
		for ( var i = 0; i < <%=choice.length%>; i++) {
			var totalName = "total" + i;
			var value = parseInt(theForm.elements[totalName].value);
			if (isNaN(value))
				value = 0;
			total = total + value;
		}
		theForm.elements["total"].value = 24 - total;
		//alert(total);
	}

	function checkSum(theForm) {
		var value = parseInt(theForm.elements["total"].value);
		if (value == 0) {
			theForm.submit();
		} else {
			alert("Please assign all 24 points to the factors before submitting");
		}
	}
</script>

<h1>About decision-making</h1>

<form method=post action="page3.jsp">
<div class=question>Next, consider the following scenario. <br>
Suppose you are developing a new feature for this project, and you
realized that your changes could make the system insecure if your
implementation is not correct. You decide to contact some of your
colleagues to inspect your feature to ensure that no security
vulnerabilities are being introduced. What <b>factors</b> are most
important to you in deciding who to work with in this situation?
<div class=instructions>Please assign 24 points to each of the
following factors.</div>

<table>
	<%
		for (int i = 0; i < choice.length; i++) {
	%>
	<tr>
		<td><input maxlength="2" size=2 type=text name="total<%=i%>"
		onkeyup="updateTotal(this.form)" value="0"></td>
		<td><%=choice[i]%></td>
	</tr>
	<%
		}
	%>
</table>
Points left: <input maxlength="2" size=2 type=text name="total"
	value="24" /></div>

<input type=button value="Next" onclick="checkSum(this.form)">
</form>
</body>

</html>
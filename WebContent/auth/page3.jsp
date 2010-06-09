<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%>
<%@page import="java.util.List"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperGenerator"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.SaveAnswers"%>
<%@page import="java.util.ArrayList"%>
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
	errors.addAll(save.saveWeights(request, "total", 8, 24));
	errors.addAll(save.saveComment(request.getParameter("comment"), 3));
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
		response.sendRedirect("page4.jsp");
	}
}
%>

<%
	String[] choice = {
			"I work with this person frequently.",
			"This person is conveniently located near me.",
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
<input type=hidden name="posted" value="true"/>
<div class=question>4. Next, consider the following scenario.<br>
<br>
Suppose you are developing a new feature for <%=thisProject%>, and you
realized that your changes could make the system <b>insecure</b> if your
implementation is not correct. You decide to contact some of your
colleagues to inspect your feature to ensure that no security
vulnerabilities are being introduced. <br>
<br>
What factors are most important to you in deciding <b>who to work with</b> in this situation?

<div class=instructions>Please assign 24 points to each of the
following <%=choice.length%> factors, giving a higher weight for a higher importance.</div>

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
Points left: <input maxlength="2" size=2 type=text disabled="disabled" name="total"
	value="24" /></div>

<%@include file="/commentSection.jsp" %>

<div class=pageNum>Page 3 of 5</div>
<div class=clear></div>

<input type=button value="Next >>" id=next onclick="checkSum(this.form)">
<input type=button onclick="javascript:history.go(-1)" value="<< Back" id=back>
<div class=clear></div>
</form>
</div>
<%@include file="/footer.jsp" %>
</div></div></body>

</html>
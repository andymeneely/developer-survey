<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>


<html>
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
	if (exception != null) {
		log("Exception caught by DeveloperSurvey application", exception);
	}
%>

<h2>Oops!</h2>

It appears that something went wrong in the survey application. The
problem has been logged and the administrator has been notified. <br>
<br>
If this is the first time this has happened, try <a href="<%=request.getContextPath()%>/auth/index.jsp">starting
the survey over</a>. <br>
<br>
If this is <em>not</em> the first time this has happened, contact <a
	href="mailto:apmeneel@ncsu.edu">Andy Meneely</a> to look into it.</div>
<%@include file="/footer.jsp"%></div>
</div>
</body>

</html>
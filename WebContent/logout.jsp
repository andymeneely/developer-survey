<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Developer Survey</title>
</head>
<body>
<%session.invalidate(); %>

You are now logged out. <a href="<%=request.getContextPath()%>">Log back in.</a>
</body>
</html>
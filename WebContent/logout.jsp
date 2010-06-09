<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Developer Survey</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css" />
</head>
<body>
<%session.invalidate(); %>
<div id=wrap>
<div id=container><%@include file="/header.jsp"%>
<div id=content>

You are now logged out. <a href="<%=request.getContextPath()%>">Log back in.</a>

</div></div></div>
</body>
</html>
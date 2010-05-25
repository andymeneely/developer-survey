<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
session.setAttribute("user", request.getParameter("user"));
session.setAttribute("password", request.getParameter("password"));
response.sendRedirect("auth/index.jsp");
%>

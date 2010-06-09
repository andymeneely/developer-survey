<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
session.setAttribute("user", request.getParameter("user"));
session.setAttribute("password", request.getParameter("password"));
response.sendRedirect("auth/index.jsp");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="edu.ncsu.csc.realsearch.devsurvey.Developer"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.ProjectTasks"%>
<%@page import="java.util.List"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.DeveloperGenerator"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.AutoSuggestList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@page import="edu.ncsu.csc.realsearch.devsurvey.SaveAnswers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.ncsu.csc.realsearch.devsurvey.GetProjectName"%><html>

<head>
<title>Developer Survey</title>
<link href="jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="jquery.min.js"></script>
<script src="jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css" />

<%
String thisProject = GetProjectName.fromSession(request);

String posted = request.getParameter("posted");
if("true".equals(request.getParameter("posted"))){
	SaveAnswers save = new SaveAnswers(request.getUserPrincipal().getName());
	List<String> errors = new ArrayList<String>();
	errors.addAll(save.savePeople(request,"person",5,6));
	errors.addAll(save.saveComment(request.getParameter("comment"), 5));
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
		response.sendRedirect("finish.jsp");
	}
}
%>

<script type="text/javascript">
teammates = <%=new AutoSuggestList().getAllTeammatesArray(request.getUserPrincipal().getName())%>;
$(document).ready(function(){
	$("input#id_person1").autocomplete({ 
		source: teammates,
		delay: 0,
		minLength: 0
	});
	$("input#id_person2").autocomplete({
	    source: teammates,
	    delay: 0,
		minLength: 0
	});
	$("input#id_person3").autocomplete({
	    source: teammates,
	    delay: 0,
		minLength: 0
	});
	$("input#id_person4").autocomplete({
	    source: teammates,
	    delay: 0,
		minLength: 0
	});
	$("input#id_person5").autocomplete({
	    source: teammates,
	    delay: 0,
		minLength: 0
	});
  });
</script>

</head>
<body>
<div id=wrap>
<div id=container><%@include file="/header.jsp"%>
<div id=content>
<script>

</script>
<h1>About experts</h1>

<form method=post action="page5.jsp">
<input type=hidden name="posted" value="true"/>
<div class=question>6. Next, who on this team do you consider be
an <b>expert</b> on <%=thisProject%>? Your answers can include anybody involved with <%=thisProject%> (i.e. you don't need to have worked with them, or even know them). 
<div class=instructions>Please enter up to 5 names or email addresses in the following fields. 
To use the auto-suggest, start typing a name or email address in any field.</div>

<input size=70 type=text name="person1" id="id_person1" value=""><br>
<input size=70 type=text name="person2" id="id_person2" value=""><br>
<input size=70 type=text name="person3" id="id_person3" value=""><br>
<input size=70 type=text name="person4" id="id_person4" value=""><br>
<input size=70 type=text name="person5" id="id_person5" value=""><br>
</div>

<%@include file="/commentSection.jsp" %>

<div class=pageNum>Page 5 of 5</div>
<div class=clear></div>

<input type=submit value="Next >>" id=next>
<input type=button onclick="javascript:history.go(-1)" value="<< Back" id=back>
<div class=clear></div>

</form>



</div>
<%@include file="/footer.jsp" %>
</div></div></body>

</html>
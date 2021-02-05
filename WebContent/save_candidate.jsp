<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="voter" class="bean.VoterBean" scope="session" />
<jsp:setProperty property="*" name="voter" />
<jsp:useBean id="candidate" class="bean.CandidateBean" scope="session" />
<jsp:setProperty property="*" name="candidate" />
<body>
<%
	if(request.getParameter("name")==""&&request.getParameter("party")==""){	
		out.print("<script>alert(\"Please Fill the Form Completly\"); window.location.href=\"candidate_register.jsp\" ;</script>");
	}else{ 
		if(candidate.registercandidate()){%>
		<script>
		alert("registration successfully"); 
		window.location.href="admin_status.jsp";</script>
		<% 
	}else{%>
	<script>
		alert("Already Registerd "); 
		window.location.href="candidate_register.jsp";</script>
	<% 	
	}
	}
%>
</body>
</html>
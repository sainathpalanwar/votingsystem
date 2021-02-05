<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="voter" class="bean.VoterBean" scope="session"/>
<jsp:setProperty property="*" name="voter"/>

<body>
<%
	if(request.getParameter("name")==""&&request.getParameter("email")==""&&request.getParameter("password")==""&&request.getParameter("cpassword")==""){	
		out.print("<script>alert(\"Please Fill the Form Completly\"); window.location.href=\"register.jsp\" ;</script>");
	}else{ 
		if(voter.registerVoter()){%>
		<script>
		alert("registration successfully"); 
		window.location.href="admin_status.jsp";</script>
		<% 
	}else{%>
	<script>
		alert("Already Registerd "); 
		window.location.href="register.jsp";</script>
	<% 	
	}
	}
%>
</body>
</html>
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
<% session.invalidate();
response.sendRedirect("login.jsp");%>
</body>
</html>
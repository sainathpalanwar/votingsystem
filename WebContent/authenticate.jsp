<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Authentication Page</title>
</head>
<jsp:useBean id="voter" class="bean.VoterBean" scope="session" />
<jsp:setProperty property="*" name="voter" />
<jsp:forward page="${sessionScope.voter.validateUser()}.jsp"/>
<body>
	<%-- <h2>Authentication status: ${sessionScope.voter.validateUser()}</h2>  --%>
</body>
</html>
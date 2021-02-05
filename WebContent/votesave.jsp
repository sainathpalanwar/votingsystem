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
if(request.getParameter("id")==null){
	%>
	<script>
	alert("please Select Candidate to Save Vote");
	window.location.href="candidate_list.jsp";</script>
	<%}
else{
	if(voter.changeVoterStatus()){
		if(candidate.addVote()){%>
		<script>
	alert("Thank you !! your Vote Submit Successfully");
	window.location.href="voter_status.jsp";</script>
	<% }
		/* response.sendRedirect("candidate_list.jsp"); */
		}
	else{
		response.sendRedirect("candidate_list.jsp");
	 }
}
%>

</body>
</html>
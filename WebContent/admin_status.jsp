
<%@page import="java.util.LinkedHashMap"%>
<%@page import="pojos.Candidate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body {
	background: #1f253d;
}
.left {
	margin-left: 10px;
	margin-right: 100px;
	margin-bottom: 10px;
}

.right {
	font-size: 26px;
	float: right
}

.white {
	color: white;
}
</style>
</head>
<jsp:useBean id="voter" class="bean.VoterBean" scope="session" />
<jsp:setProperty property="*" name="voter" />
<jsp:useBean id="candidate" class="bean.CandidateBean" scope="session" />
<jsp:setProperty property="*" name="candidate" />
<body>
	<div class="alert alert-success ">
		<h1 class="left">
			Hello , ${sessionScope.voter.userDetails.name} <a class="right"
				href="logout.jsp">Logout</a> 	<a class="right" style="margin-right:40px;margin-top:10px;border:1px;style:none;color:black;font-size: 20px; " href="register.jsp">Add New Voter</a>
		<a class="right" style="margin-right:40px;margin-top:10px;border:1px;style:none;color:black;font-size: 20px; " href="candidate_register.jsp">Add New Candidate</a>
			<a class="right" style="margin-right:40px;margin-top:10px;border:1px;style:none;color:black;font-size: 20px; " href="admin_status.jsp">Home</a>
		
		</h1>
	</div>
	<h3 class="white" align='center'>Candidate Result Top Two</h3>
	<br>
	<table
		class='table table-striped table-bordered table-condensed table-primary'>
		<tr>
			<th>SR NO</th>
			<th>CANDIADTAE NAME</th>
			<th>PARTY</th>
			<th>RESULT</th>
			<% int sr_no=1;
				List<Candidate> candidates = candidate.resultCandidateList();
			for (Candidate c : candidates) {
				out.print("<tr><td>" + sr_no+ "</td><td>" + c.getName() + "</td><td>" + c.getParty()
				+ "</td><td>"+c.getVotes()+"</td></tr>");
		sr_no++;	}
			%>
		
	</table>
	<h3 class="white" align='center'>Party Wise Result</h3>
	<br>
	<table
		class='table table-striped table-bordered table-condensed table-primary'>
		<tr>
			<th>SR NO</th>
			<th>PARTY</th>
			<th>TOTAL VOTES</th>
			<% int srno=1;
				LinkedHashMap<String,Integer> hmap=candidate.resultPartyWise();
			for (Candidate c : candidates) {
				out.print("<tr><td>" + srno+ "</td><td>" + c.getParty() + "</td><td>"+c.getVotes()+"</td></tr>");
		srno++;	}
			%>
		
	</table>

</body>
</html>
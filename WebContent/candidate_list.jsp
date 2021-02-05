<%@page import="pojos.Candidate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voting Home</title>
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
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

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

.button {
	display: block;
	width: 175px;
	line-height: 50px;
	font-size: 16px;
	font-weight: 700;
	text-align: center;
	margin: 0 auto;
	border-radius: 5px;
	-webkit-transition: background .3s;
	transition: background .3s;
}

.button:hover {
	text-decoration: none;
}

.main-container {
	font-family: 'Ubuntu', sans-serif;
	width: 950px;
	height: 1725px;
	margin: 6em auto;
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
				href="logout.jsp">Logout</a>
		</h1>
	</div>
	<form action='votesave.jsp' method='post'>
		<h3 class="white" align='center'>YOUR VOTE IS VALUABLE SO PLESE
			TAKE A RIGHT DECISION</h3>
		<br> 
		<table
			class='table table-striped table-bordered table-condensed table-primary'>
			<tr>
				<th>SR NO</th>
				<th>CANDIADTAE NAME</th>
				<th>PARTY</th>
				<th>Action</th>
				<%
					List<Candidate> candidates = candidate.candidateList();
					for(Candidate c:candidates){
						out.print("<tr><td>"+c.getId()+"</td><td>"+c.getName()+"</td><td>"+c.getParty()+"</td><td><input type=\"radio\" name=\"id\" value='"+c.getId()+"'/></td></tr>");
					}
					%>
		</table>
		<input class="button button:hover" type="submit" value="submit"/>
	</form>


</body>

</body>
</html>
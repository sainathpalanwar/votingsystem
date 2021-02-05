<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voter Dashboard</title>
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
}</style>
</head>
<jsp:useBean id="voter" class="bean.VoterBean" scope="session" />
<jsp:setProperty property="*" name="voter" />
<body>
	<div class="alert alert-success ">
		<h1 class="left">
			Hello , ${sessionScope.voter.userDetails.name} 
			<a class="right"
				href="logout.jsp">Logout</a>
		</h1>
	</div>
	
	<div class="alert alert-info ">
		<h1 class="left">
			Your Vote is Submited Successfully!!
		</h1>
	</div>
</body>
</html>
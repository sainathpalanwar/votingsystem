<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voter Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
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
}
</style>
</head>
<body>
	<div class="alert alert-primary ">
		<h1 class="left">
			Hello , ${sessionScope.voter.userDetails.name} 
			<a class="right" href="logout.jsp">Logout</a> 	
		<a class="right" style="margin-right:40px;margin-top:10px;border:1px;style:none;color:black;font-size: 20px; " href="register.jsp">Add New Voter</a>
		<a class="right" style="margin-right:40px;margin-top:10px;border:1px;style:none;color:black;font-size: 20px; " href="candidate_register.jsp">Add New Candidate</a>
		<a class="right" style="margin-right:40px;margin-top:10px;border:1px;style:none;color:black;font-size: 20px; " href="admin_status.jsp">Home</a>
		
		</h1>
	</div>
	<div class="main-w3layouts wrapper">
		<h1>Voter Registration Form</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="save_voter.jsp" method="post">
					<input class="text" type="text" name="name" placeholder="Full Name" required />
					<input class="text email" type="email" name="email" placeholder="Email" required/>
					<input class="text" type="password" name="password" placeholder="Password" required/>
					<input class="text w3lpass" type="password" name="cpassword" placeholder="Confirm Password" required/>
					<div class="wthree-text">
						<label class="anim">
							<input type="checkbox" class="checkbox" required>
							<span>I Agree To The Terms & Conditions</span>
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="SIGNUP">
				</form>
				<p>Don't have an Account? <a href="login.jsp"> Login Now!</a></p>
			</div>
		</div>
		
		<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		
		</ul>
	</div>
	<!-- //main -->
</body>
</html>
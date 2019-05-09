<%@ page language="java" errorPage="/jsp/internalerror.jsp"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<style>
hr {
	height: 1px;
	background-color: grey;
	border: none;
}


</style>

</head>
<body>


	<div class="container h-80">
		<div class=" row align-items-center h-100 ">

		
			<form name="login_form" action="/olx/app/LoginController" id="login_form" method="post">

				<br>
				<div class="row">
					<div class="col-md-4"></div>

					<div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 ">
						<input type="text" class="form-control" id="email" placeholder="Enter email-id" name="email">
					</div>
					<br>
				</div>
				<br>
				<div class="row">
					<div class="col-md-4"></div>

					<div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 ">
						<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
						<br>
							<button
						class="btn btn-primary center-block " type="submit" id="submit" name="submit" value="LOGIN">LOGIN</button>
					</div>
				</div>
			

			</form>
		</div>
	</div>
	
	<!--sign up strts  -->
		<div class="container h-80">
		<div class=" row align-items-center h-100 ">

		
			<form name="Signup_form" action="/olx/app/SignupController" id="Signup_form" method="post">

				<br>
				<div class="row">
					<div class="col-md-4"></div>

					<div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 ">
						<input type="text" class="form-control" id="first_name" placeholder="Enter first name" name="first_name">
					
					<br>
					
						<input type="text" class="form-control" id="last_name" placeholder="Enter last name" name="last_name">
					
					<br>
					
						<input type="text" class="form-control" id="age" placeholder="Enter age" name="age">
					
					<br>
				
						<select class="form-control  border-0"
										name="gender" id="gender">
											<option value="">Gender
											<option value="Male">Male
											<option value="Female">Female
									</select>
					
					<br>
					
						<input type="text" class="form-control" id="contact_number" placeholder="Enter contact number" name="contact_number">
					
					<br>
				
						<input type="text" class="form-control" id="password" placeholder="Enter password" name="password">
					
					<br>
					
						<input type="text" class="form-control" id="email" placeholder="Enter email id" name="email">
					
					<br>
				</div>
				<br>
				<div class="row">
					<div class="col-md-4"></div>

					<div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 ">
						<input type="text" class="form-control" id=" addressDetails.city" placeholder="Enter city" name="addressDetails.city">
						<br>
						<input type="text" class="form-control" id="sublocation" placeholder="Enter sublocation" name="addressDetails.sublocation">
						<br>
						<input type="text" class="form-control" id="state" placeholder="Enter state" name="addressDetails.state">
						<br>
						<input type="text" class="form-control" id="pincode" placeholder="Enter pincode" name="addressDetails.pincode">
						<br>
						<input type="text" class="form-control" id="street" placeholder="Enter street" name="addressDetails.street">
						<br>
						<input type="text" class="form-control" id="country" placeholder="Enter country" name="addressDetails.country">
						<br>
							<button
						class="btn btn-primary center-block " type="submit" id="submit" name="submit" value="SIGNUP">SIGNUP</button>
					</div>
				</div>
			

			</form>
		</div>
	</div>


</body>
</html>
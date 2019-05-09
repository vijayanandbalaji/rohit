<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('.dropdown-toggle').dropdown();
	});

	var myInput = document.getElementById("password");
	var letter = document.getElementById("letter");
	var capital = document.getElementById("capital");
	var number = document.getElementById("number");
	var length = document.getElementById("length");

	// When the user clicks on the password field, show the message box
	myInput.onfocus = function() {
		document.getElementById("message").style.display = "block";
	}

	// When the user clicks outside of the password field, hide the message box
	myInput.onblur = function() {
		document.getElementById("message").style.display = "none";
	}

	// When the user starts to type something inside the password field
	myInput.onkeyup = function() {
		// Validate lowercase letters
		var lowerCaseLetters = /[a-z]/g;
		if (myInput.value.match(lowerCaseLetters)) {
			letter.classList.remove("invalid");
			letter.classList.add("valid");
		} else {
			letter.classList.remove("valid");
			letter.classList.add("invalid");
		}

		// Validate capital letters
		var upperCaseLetters = /[A-Z]/g;
		if (myInput.value.match(upperCaseLetters)) {
			capital.classList.remove("invalid");
			capital.classList.add("valid");
		} else {
			capital.classList.remove("valid");
			capital.classList.add("invalid");
		}

		// Validate numbers
		var numbers = /[0-9]/g;
		if (myInput.value.match(numbers)) {
			number.classList.remove("invalid");
			number.classList.add("valid");
		} else {
			number.classList.remove("valid");
			number.classList.add("invalid");
		}

		// Validate length
		if (myInput.value.length >= 8) {
			length.classList.remove("invalid");
			length.classList.add("valid");
		} else {
			length.classList.remove("valid");
			length.classList.add("invalid");
		}
	} 
</script>
<style>
.navbar {
	background-color: black;
	/*  #122B41  */
	font-weight: bold;
}

.searchBtn {
	padding: 9px 10px;
	border-radius: 0px;
}

.btn:focus, .btn:active {
	outline: none !important;
	box-shadow: none;
}

.modal-header {
	border-bottom: 0 none;
}

.modal-footer {
	border-top: 0 none;
}
</style>

<nav class="navbar navbar-inverse navbar-static-top">
	<div class="container">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#headerCollapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand active" href="/olx/app/home">Olx</a>

		</div>

		<div class="collapse navbar-collapse" id="headerCollapse">
			<ul class="nav navbar-nav">

				<form class="navbar-form navbar-left" action="">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							style="border-radius: 0px; width: 450px" name="search">
						<div class="input-group-btn">
							<button class="btn btn-default searchBtn" type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</div>
					</div>
				</form>
			</ul>

			<ul class="nav navbar-nav navbar-right ">
				<c:choose>
					<c:when test="${sessionScope.user == null}">



						<li><a href="#" data-toggle="modal" data-target="#myModal"
							style="color: rgb(255, 255, 255)"> <span
								class="glyphicon glyphicon-user"></span> Login/Signup
						</a></li>
					</c:when>
					<c:otherwise>

						<li><a href="/olx/app/LogoutController"
							style="color: rgb(255, 255, 255)">Logout</a></li>
						<li><a href="/olx/app/SellPage" name="sell" value="sell"
							style="color: rgb(255, 255, 255)">Sell</a></li>

						<li><a href="/olx/app/CartPage" style="color: rgb(255, 255, 255)"
							name="myCart" value="myCart"><span
								class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">&nbsp;<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/olx/app/OrderPage" name="ContinueShopping"
									value="continueShopping">My Orders</a></li>
								<li><a href="/olx/app/MyAdsPage" name="MyAds" value="MyAds">My
										Ads</a></li>
							</ul></li>
					</c:otherwise>
				</c:choose>


			</ul>
		</div>
	</div>
</nav>


<!-- 
modal for signup and login starts here -->

<div class="container-fluid">

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg ">
			<!-- Modal content-->
			<div class="modal-content" style="background-color: black">
				<div class="modal-header "></div>
				<div class="modal-body ">
					<ul class="nav nav-pills nav-justified">
						<li class="active"><a data-toggle="pill" href="#loginPill"
							style="background-color: #E0E7EA; color: black; border-radius: 0">LOGIN</a></li>
						<li><a data-toggle="pill" href="#signupPill"
							style="background-color: #E0E7EA; color: black; border-radius: 0">SIGNUP</a></li>

					</ul>

					<div class="tab-content">
						<div id="loginPill" class="tab-pane fade in active">
							<div class="row ">
								<div class="col-lg-5 ">
									<br>
									<div class="jumbotron">
										<h1>
											<small>Access to your cart</small>
										</h1>
										<h2>Buy,Sell anything and everything</h2>
										<h3>Your privacy is important for us.</h3>
									</div>

								</div>

								<div class="col-lg-6">
									<div class="row">
										<div class="col-lg-12">
											<h1 class="display-1" style="color: white">Login...</h1>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">&nbsp;</div>
									</div>
									<br>
									<form name="login_form" action="/olx/app/LoginController"
										id="login_form" method="post">
										<div class="row">
											<div class="col-lg-12">
												<input type="email" id="email" placeholder="Email-id"
													name="email" class="form-control" required><br>
												<input type="password" id="password" placeholder="Password"
													name="password" class="form-control" required><br>
												<button class="btn btn-primary  " type="submit" id="submit"
													name="submit" value="LOGIN" class="form-control"
													style="width: 420px">LOGIN</button>
											</div>
										</div>
									</form>

								</div>

							</div>
						</div>
						<div id="signupPill" class="tab-pane fade">
							<form name="Signup_form" action="/olx/app/SignupController"
								id="Signup_form" method="post">
								<div class="row " style="background-color: black">
									<div class="col-lg-4">
										<br>
										<div class="row">
											<div class="col-lg-6">
												<input type="text" id="first_name" class="form-control"
													placeholder="First name" name="first_name" required>
											</div>
											<div class="col-lg-6">
												<input type="text" id="last_name" class="form-control"
													placeholder="Last name" name="last_name" required>
											</div>
										</div>
										<br>

										<div class="row">
											<div class="col-lg-6">
												<input type="text" id="age" class="form-control"
													placeholder="Age" name="age" required>
											</div>
											<div class="col-lg-6">
												<select class="border-0 form-control" name="gender"
													id="gender" required>
													<option value="">Gender
													<option value="Male">Male
													<option value="Female">Female
												</select>
											</div>
										</div>
										<br> <input type="tel" id="contact_number"
											class="form-control" placeholder="Contact number"
											name="contact_number" pattern="^\d{10}$" required><br>

									</div>


									<div class="col-lg-4">
										<br> <input type="text" class="form-control" id="street"
											placeholder="Street" name="addressDetails.street" required><br>

										<div class="row">
											<div class="col-lg-6">
												<input type="text" class="form-control" id="sublocation"
													placeholder="Sublocation" name="addressDetails.sublocation"
													required>
											</div>

											<div class="col-lg-6">
												<input type="text" class="form-control" id="pincode"
													placeholder="Pincode" name="addressDetails.pincode"
													required>
											</div>
										</div>
										<br>

										<div class="row">
											<div class="col-lg-6">
												<input type="text" class="form-control"
													id=" addressDetails.city" placeholder="City"
													name="addressDetails.city" required>
											</div>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="state"
													placeholder="State" name="addressDetails.state" required>
											</div>
										</div>
										<br> <input type="text" class="form-control" id="country"
											placeholder="Country" name="addressDetails.country" required><br>

									</div>



									<div class="col-lg-4">
										<br> <input type="email" class="form-control" id="email"
											placeholder="Email id" name="email" required><br>
										<input type="password" class="form-control" id="password"
											placeholder="Password" name="password"
											pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
											title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
											required><br>
										<button class="btn btn-primary " type="submit" id="submit"
											name="submit" value="SIGNUP" style="width: 265px">SIGNUP</button>
										<br> <br>
										<button type="reset" class="btn btn-danger"
											style="width: 265px">RESET</button>
									</div>
								</div>
							</form>
						</div>

					</div>
				</div>

			</div>
		</div>

	</div>
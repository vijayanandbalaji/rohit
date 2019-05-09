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
</script>
<style>
/* .btn-header {
        padding: 10px 20px;
        font-size: 15px;
        border-radius: 0px;
        width: 100%;
    } */
.navbar {
	background-color: rgb(8, 26, 83);
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
			<a class="navbar-brand active" href="#">Olx</a>

		</div>

		<div class="collapse navbar-collapse" id="headerCollapse">
			<ul class="nav navbar-nav">
				<!-- <form class="navbar-form navbar-left" action="">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="search">
                           
                            <button class="btn btn-danger" class="form-control" type="submit">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                        </form> -->
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


				
				<li><a href="#" data-toggle="modal" data-target="#myModal"
					style="color: rgb(255, 255, 255)"> <span
						class="glyphicon glyphicon-user"></span> Login/Signup
				</a></li>
				
				<li><a href="LogoutController"
					style="color: rgb(255, 255, 255)">Logout</a></li>
				<li><a href="SellPage" name="sell" value="sell"
					style="color: rgb(255, 255, 255)">Sell</a></li>

				<li><a href="CartPage" style="color: rgb(255, 255, 255)"
					name="myCart" value="myCart"><span
						class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">&nbsp;<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="OrderPage" name="ContinueShopping"
							value="continueShopping">My Orders</a></li>
						<li><a href="MyAdsPage" name="MyAds" value="MyAds">My Ads</a></li>
					</ul></li>
					
			
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
			<div class="modal-content" style="background-color: rgb(6, 30, 49)">
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
												<input type="text" id="email" placeholder="Email-id"
													name="email" class="form-control"><br> <input
													type="password" id="password" placeholder="Password"
													name="password" class="form-control"><br>
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
								<div class="row " style="background-color: rgb(6, 30, 49)">
									<div class="col-lg-4">
										<br>
										<div class="row">
											<div class="col-lg-6">
												<input type="text" id="first_name" class="form-control"
													placeholder="First name" name="first_name">
											</div>
											<div class="col-lg-6">
												<input type="text" id="last_name" class="form-control"
													placeholder="Last name" name="last_name">
											</div>
										</div>
										<br>

										<div class="row">
											<div class="col-lg-6">
												<input type="text" id="age" class="form-control"
													placeholder="Age" name="age">
											</div>
											<div class="col-lg-6">
												<select class="border-0 form-control" name="gender"
													id="gender">
													<option value="">Gender
													<option value="Male">Male
													<option value="Female">Female
												</select>
											</div>
										</div>
										<br> <input type="text" id="contact_number"
											class="form-control" placeholder="Contact number"
											name="contact_number"><br>

									</div>


									<div class="col-lg-4">
										<br> <input type="text" class="form-control" id="street"
											placeholder="Street" name="addressDetails.street"><br>

										<div class="row">
											<div class="col-lg-6">
												<input type="text" class="form-control" id="sublocation"
													placeholder="Sublocation" name="addressDetails.sublocation">
											</div>

											<div class="col-lg-6">
												<input type="text" class="form-control" id="pincode"
													placeholder="Pincode" name="addressDetails.pincode">
											</div>
										</div>
										<br>

										<div class="row">
											<div class="col-lg-6">
												<input type="text" class="form-control"
													id=" addressDetails.city" placeholder="City"
													name="addressDetails.city">
											</div>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="state"
													placeholder="State" name="addressDetails.state">
											</div>
										</div>
										<br> <input type="text" class="form-control" id="country"
											placeholder="Country" name="addressDetails.country"><br>

									</div>



									<div class="col-lg-4">
										<br> <input type="text" class="form-control" id="email"
											placeholder="Email id" name="email"><br> <input
											type="text" class="form-control" id="password"
											placeholder="Password" name="password"><br>
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










	<%-- <nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand active" href="#">Olx</a>
		</div>

		<ul class="nav navbar-nav">
			<form class="navbar-form navbar-left" action="">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="search">
					<div class="input-group-btn">
						<button class="btn btn-danger" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>


		</ul>

		<ul class="nav navbar-nav ">
			<li><c:if user="${sessionScope.user ==null }">
					<button class="btn btn-danger">Login/Signup</button>
				</c:if></li>

			<li><c:if user="${sessionScope.user !=null }">
					<form action="" method=""><button class="btn btn-danger">Logout</button></form>
				</c:if></li>

		</ul>
	</div>
</nav> --%>
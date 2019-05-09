<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
</style>

</head>


<body>
	${message}

	<div class="container">
		<form action="/olx/app/BuyProductController" method="post">
			<div class="row jumbotron">
				<div class="col-lg-6">
					<img src="${itemDisplay.item_image}" style="max-width: 500px">
				</div>


				<div class="col-lg-6">
					<div class="row">
						<div class="col-lg-12">

							<h1>${itemDisplay.item_name}</h1>
							<input type="hidden" name="item_id"
								value="${itemDisplay.item_id }">
							<h3>${itemDisplay.itemCategory.category_name }</h3>
							<h3>
								<small><b>${itemDisplay.price} /-</b></small>
							</h3>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-lg-12">
							<h2>Delivery Address</h2>
							<input type="hidden" name="user_id"
								value="${userDisplay.user_id }">
							<h3>
								<small><b>${userDisplay.first_name }</b></small>
							</h3>
							<h4>${userDisplay.addressDetails.street },${userDisplay.addressDetails.sublocation },</h4>
							<h4>${userDisplay.addressDetails.city },
								${userDisplay.addressDetails.pincode },${userDisplay.addressDetails.state },${userDisplay.addressDetails.country }
							</h4>


						</div>
					</div>

					<hr>

					<div class="changePos">
						<input type="text" name="contact_number" class="form-control"
							placeholder="Mobile Number" style="width: 300px"> <input
							type="password" name="password" class="form-control"
							placeholder="Password" style="width: 300px"><br>
						<button class="btn btn-primary form-control" type="submit"
						value="Pay" name="buyAction" style="width: 300px">Buy
							Now</button>
						<br>
						<button class="btn btn-danger form-control" type="submit"
						value="ContinueShopping" name="buyAction" style="width: 300px">Continue
							Shopping</button>
					</div>

					<br>
				</div>
			</div>


		</form>
	</div>







	<%-- 

	<table>
		<tr>
			<th>Item Id</th>
			<th>Name</th>
			<th>Category</th>
			<th>Years of Usage</th>
			<th>Image</th>
			<th>Price</th>



		</tr>


		<tr>
			<h1>
				Hello
				<%=session.getAttribute("user")%></h1>
			<form action="/olx/app/BuyProductController" method="post">
				<td>${itemDisplay.item_id }</td> <input type="hidden" name="item_id"
					value="${itemDisplay.item_id }">
				<td>${itemDisplay.item_name}</td>
				<td>${itemDisplay.itemCategory.category_name }</td>
				<td>${itemDisplay.item_image}</td>
				<td>${itemDisplay.years_of_usage}</td>
				<td>${itemDisplay.price}</td>


				<td>${userDisplay.user_id }</td> <input type="hidden" name="user_id"
					value="${userDisplay.user_id }">
				<td>${userDisplay.first_name }</td>
				<td>${userDisplay.addressDetails.sublocation }</td>
				<td>Enter Phone No:</td>
				<td><input type="text" name="contact_number">
				<td>Password:</td>
				<td><input type="password" name="password">
				<td><button class="btn btn-primary form-control" type="submit"
						value="Pay" name="buyAction">Buy Now</button></td>
				<td><button class="btn btn-danger form-control" type="submit"
						value="ContinueShopping" name="buyAction">Continue
						Shopping</button></td>








			</form>
		</tr>


	</table>
 --%>


</body>
</html>
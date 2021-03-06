<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<style>
body {
	background-color: rgb(240, 240, 240);
}

.container {
	background-color: white;
}

.orders {
	border-style: solid;
	border-width: 2px;
	border-spacing: 2px;
	width: 1100px;
	border-color: lightgray;
	margin: 15px;
}

.btn {
	margin: 15px;
	width: 100px;
	background-color: DodgerBlue;
	color: white;
}

#column {
	
}

#textstyle {
	font-size: 18px;
	padding-top: 30px;
}

#textheader {
	font-size: 18px;
	font-weight: bold;
	padding-top: 20px;
}

img {
	margin: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<h2  >
			<b>YOUR ORDERS</b>
		</h2>
		<br> <br> <br>
		<c:forEach items="${order}" var="item">
			<div class="panel panel-default">
				<div class="panel-heading">
					<button type="button" class="btn ">${item.itemDetails.item_id
						}</button>
				</div>
				<div class="panel-body">

					<div class="row">
						<div class="col-sm-2 col-md-2 col-lg-2">
							<img src="${item.itemDetails.item_image}" style="width: 100px" />
						</div>

						<div class="col-sm-2 col-md-2 col-lg-2" id="column">
							<p id="textheader">PRODUCT</p>
							<p id="textstyle">${item.itemDetails.item_name}</p>
						</div>

						<div class="col-sm-2 col-md-2 col-lg-2" id="column">
							<p id="textheader">CATEGORY</p>
							<p id="textstyle">${item.itemDetails.itemCategory.category_name
								}</p>
						</div>

						<div class="col-sm-2 col-md-2 col-lg-3" id="column">
							<p id="textheader">YEARS OF USAGE</p>
							<p id="textstyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.itemDetails.years_of_usage}</p>
						</div>

						<div class="col-sm-2 col-md-2 col-lg-2" id="column">
							<p id="textheader">AMOUNT</p>
							<p id="textstyle">Rs ${item.itemDetails.price}</p>
						</div>

					</div>



				</div>
				<div class="panel-footer">
					Order Total:Rs ${item.itemDetails.price}
				</div>

			</div>

		</c:forEach>
		<form action="/olx/app/ContinueShopping" method="post">
			<button type="submit" class="btn  btn-secondary "
				name="ContinueShopping" value="continueShopping" style="width:150px">Continue
				Shopping</button>
		</form>
		<br>
		
		<div class="panel panel-default">
				<div class="panel-footer">
					<center><p>Thats all Folks</p></center>
				</div>
				

			</div>
</body>
</html>
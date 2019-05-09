<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

.buyPadding {
	padding: 10px 75px
}

.container {
	background-color: white;
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
		<h4>
			<b>YOUR CART</b>
		</h4>
		<br> <br> <br>
	 <c:if test="${cart !=null}">
		<form action="/olx/app/BuyProductController" method="post">

			<div class="row">
				<div class="col-lg-8">
					<c:forEach items="${cart }" var="item">
						<div class="panel panel-default">
							<div class="panel-heading">
								<button type="button" class="btn btn-danger">${item.itemDetails.item_id}
						</button>

							</div>
							<div class="panel-body">

								<div class="row">
									<div class="col-sm-4 col-md-4 col-lg-4">
										<img src="${item.itemDetails.item_image}" style="width: 200px" />
									</div>

									<div class="col-sm-7 col-md-7 col-lg-7" id="column">

										<h1>

											<b>${item.itemDetails.item_name}-${item.itemDetails.itemCategory.category_name
								}</b>

										</h1>
										<h3>${item.itemDetails.years_of_usage}</h3>


										<h4>Rs.${item.itemDetails.price}</h4>

									</div>

								</div>



							</div>
						</div>
						<input type="hidden"
						name="user_id" value="${item.userDetails.user_id }">
						<input type="hidden"
						name="item_id" value="${item.itemDetails.item_id }">
					</c:forEach>
				</div>
				<div class="col-lg-4 ">

					<div class="panel panel-default">
						<div class="panel-heading">
							<h2>Buy Now</h2>
						</div>

						<br> <br>
						<div class="row">
							<div class="col-lg-3"></div>
							<div class="col-lg-6">
								<input type="text" name="contact_number" class="form-control"
									placeholder="Mobile Number" style="width: 170px"> 
									
									<input type="password" name="password" class="form-control"
									placeholder="password" style="width: 170px">
									<br>
									
								<button type="submit" class="btn  btn-danger center-block" name="buyAction"
									value="buyCartItem" style="width: 150px">Place Order</button>

								<!-- <button type="submit" class="btn  btn-primary center-block"
									name="ContinueShopping" value="continueShopping"
									style="width: 150px">Continue Shopping</button> -->
							</div>
							<div class="col-lg-3"></div>
						</div>

						<br> <br>



					</div>

				</div>
			</div>



		</form> </c:if>
</body>  
 
</html>
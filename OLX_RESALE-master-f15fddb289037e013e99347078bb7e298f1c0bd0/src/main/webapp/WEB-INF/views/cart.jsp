<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<style>
#cartBody {
	background-color: rgb(240, 240, 240);
}

.buyPadding {
	padding: 10px 75px
}

#cartContainer {
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
<body id="cartBody">

	<jsp:include page="../header.jsp"></jsp:include>
	<br>
	<div class="container" id="cartContainer">
		<h4>
			<b>YOUR CART</b>
		</h4>
		<br> <br> <br>
		<c:choose>
			<c:when test="${cart.isEmpty()==false}">
				<form action="/olx/app/BuyProductController" method="post">

					<div class="row">
						<div class="col-lg-8">
							<c:forEach items="${cart}" var="item">
								<div class="panel panel-default">
									<div class="panel-heading">
										<button type="button" class="btn btn-danger" style="width:150px">CT${item.itemDetails.item_id}1123${item.itemDetails.item_id}${item.itemDetails.item_id}09${item.itemDetails.item_id}
										</button>

									</div>
									<div class="panel-body">

										<div class="row">
											<div class="col-sm-4 col-md-4 col-lg-4">
												<img src="${item.itemDetails.item_image}"
													style="width: 200px" />

											</div>

											<div class="col-sm-7 col-md-7 col-lg-7" id="column">

												<h1>

													<b>${item.itemDetails.item_name}-${item.itemDetails.itemCategory.category_name}
													</b>

												</h1>
												<h3>${item.itemDetails.years_of_usage}</h3>


												<h4>Rs.${item.itemDetails.price}</h4>

											</div>

										</div>



									</div>
								</div>

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
										<input type="hidden" name="user_id"
											value="${cart[0].userDetails.user_id }"> <input
											type="hidden" name="item_id"
											value="${cart[0].itemDetails.item_id }"> <input
											type="number" name="contact_number" class="form-control"
											placeholder="Mobile Number" style="width: 170px"  required> <input
											type="password" name="password" class="form-control"
											placeholder="password" style="width: 170px"  required> <br>

										<button type="submit" class="btn  btn-danger center-block"
											name="buyAction" value="buyCartItem" style="width: 150px">Place
											Order</button>

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



				</form>
			</c:when>
			<c:otherwise>
				<center>
					<img
						src="D:\765075\olx\src\main\webapp\WEB-INF\images\empty-cart.png"
						alt="cartEmptyImg" style="max-width: 500px">
				</center>
			</c:otherwise>
		</c:choose>

	</div>
	
 
</body>

</html>
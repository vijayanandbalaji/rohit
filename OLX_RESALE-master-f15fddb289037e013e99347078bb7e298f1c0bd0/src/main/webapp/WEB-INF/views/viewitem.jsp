<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
		 
	<br>
	<div class="container jumbotron">
		<form action="/olx/app/UserActionController" method="post">
			<div class="row">
				<div class="col-lg-7 ">
					<img src="${itemDisplay.item_image}" style="max-width: 600px">
				</div>
				<div class="col-lg-5 ">
					<input type="hidden" name="item_id" value="${itemDisplay.item_id }">
					<h1>${itemDisplay.item_name}</h1>
					<h3>
						<b>${itemDisplay.itemCategory.category_name }</b>
					</h3>
					<h3>
						<b> Years of Usage- ${itemDisplay.years_of_usage} </b>
					</h3>
					<h3>
						<b> <small>${itemDisplay.price}</small> /- 
					</h3>
					<br>

					<button class="btn form-control " type="submit" value="Buy Now"
						name="userAction" Style="width: 100px; background-color: #FF8300">Buy
						Now</button>
					<button class="btn btn-danger form-control" type="submit"
						value="Add To Cart" name="userAction" Style="width: 100px;">Add
						To Cart</button>

				</div>

			</div>
		</form>
	</div>




	<%-- 
	in display item
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
			<form action="/olx/app/UserActionController" method="post">
				<td>${itemDisplay.item_id }</td> <input type="hidden" name="item_id"
					value="${itemDisplay.item_id }">
				<td>${itemDisplay.item_name}</td>
				<td>${itemDisplay.itemCategory.category_name }</td>
				<td><img src="${itemDisplay.item_image}"
					style="max-height: 500px"></td>
				<td>${itemDisplay.years_of_usage}</td>
				<td>${itemDisplay.price}</td>


				<td><button class="btn btn-primary form-control" type="submit"
						value="Buy Now" name="userAction">Buy Now</button></td>
				<td><button class="btn btn-danger form-control" type="submit"
						value="Add To Cart" name="userAction">Add To Cart</button></td>








			</form>
		</tr>


	</table> --%>
</body>
</html>
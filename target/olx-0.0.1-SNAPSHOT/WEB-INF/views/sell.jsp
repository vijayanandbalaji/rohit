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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><title>Insert title here</title>

<style>
.jumbotron {
	background-color: black;
	color: white;
}

#sellproduct_textbox {
	width: 75%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	 
	background: #f1f1f1;
}

#select_category {
	width: 75%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

select option[data-default] {
	color: #888;
}

#sellproduct_textbox:focus {
	background-color: #ddd;
	outline: none;
}

.sell_btn {
	position: fixed;
	background-color: #3B3C42  ;
	width: 220px;
	padding: 20px 40px;
	border: none;
	color: white;
	left:490px;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
}

.btn {
	position: fixed;
	top: 810px;
	left: 550px;
	background-color: SlateBlue;
	width: 220px;
	padding: 20px 40px;
	border: none;
	color: white;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
}

img {
	max-width: 350px;
}

input[type=file] {
	padding: 10px;
	width: 400px;
	height: 400px;
	background: #2d2d2d;
	opacity: 0;
}

.imagediv, input[type=file] {
	position: fixed;
	top: 55%;
	left: 60%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	color: white;
	font-size: 16px;
	padding: 12px 24px;
	border: none;
	cursor: pointer;
	text-align: center;
}
</style>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>

<body>
${message}

<div class="container-fluid">
		<div class="jumbotron">
			<center>
				<h1>
					<b>Post Your Ad</b>
				</h1>
			</center>
			 
			<center>
				<p style="font-size: 18px">
					<i>Add your product information for the quickest sale</i>
				</p>
			</center>
		</div>
	</div>

	<div class="container">
		
		<br>
		<form action="/olx/app/SellItem" method="post" >
			<div class="row">
				<div class="col-sm-6 col-md-6 col-lg-6">
					<div class="form-group">
						<label for="pname"><b>PRODUCT NAME</b></label><br> <input
							type="text" name="item_name" id="sellproduct_textbox">
					</div>
					<div class="form-group">
						<label for="category"><b>CATEGORY</b></label><br> <select
							name="itemCategory.category_id" id="select_category">
							<option value="" selected data-default>Category
							<option value="1">Mobile
							<option value="2">Laptop
							<option value="3">TV
							<option value="4">Car
						</select>
					</div>

					<div class="form-group">
						<label for="addimages"><b>YEARS OF USAGE</b></label><br> <input
							type="number" name="years_of_usage" id="sellproduct_textbox">
					</div>
					<div class="form-group">
						<label for="addimages"><b>PRICE</b></label><br> <input
							type="text" name="price" id="sellproduct_textbox">
					</div>
					<br> 
					<div class="form-group">
						<button class="sell_btn" type="submit" value="Sell"
							name="sellItem">ADD PRODUCT</button>

					</div>


				</div>

				<div class="col-sm-6 col-md-6 col-lg-6 ">
					<div class="imagediv">
						<input type='file' name="item_image" onchange="readURL(this);" /> <img id="blah"
							src="http://placehold.it/200" alt="your image" />
					</div>

				</div>



			</div>



		</form>
	</div>





	<!-- <table>
		<tr>
			
			<th>Name</th>
			<th>Category</th>
			<th>Image</th>
			<th>Years of Usage</th>
			
			<th>Price</th>



		</tr>


		<tr>
			<form action="/olx/app/SellItem" method="post" >
				
				<td><input type="text" name="item_name"></td>
				
					<td><select class="form-control  border-0"
										name="itemCategory.category_id" >
											<option value="">Category
											<option value="1">Mobile
											<option value="2">Laptop
											<option value="3">TV
											<option value="4">Car
									</select></td>
				<td>  <input type="file" name="item_image" accept="image/*"  ></td>
				<td><input type="number" name="years_of_usage"></td>
				<td><input type="text" name="price"></td>
				
			
    			
				<td><button class="btn btn-primary form-control" type="submit" value="Sell" name="sellItem">Sell</button></td>








			</form>
		</tr>


	</table>
 -->
</body>
</html>
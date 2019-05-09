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

<title>Insert title here</title>
<style>
.carousel-inner {
	width: 100%;
	max-height: 290px !important;
}

.carousel .item {
	min-height: 400px;
	/* Prevent carousel from being distorted if for some reason image doesn't load */
}

#thumbnailImg {
	width: 300px; /* You can set the dimensions to whatever you want */
	height: 250px;
	object-fit: cover;
}

.VL {
	border-left: 1px solid grey;
}
</style>
<script>
	function bigImg(x) {
		x.style.height = "250px";
		x.style.width = "310px";
	}

	function normalImg(x) {
		x.style.height = "250px";
		x.style.width = "300px";
	}
</script>



</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<c:if test="{{message !=null}}">
		<div class="alert alert-danger">
			<strong>Sorry</strong> {{message}}
		</div>
	</c:if>

	<div class="container-fluid" style="background-color: black">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<br>
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<center>
						<img class="img-responsive"
							src="D:\765075\olx\src\main\webapp\WEB-INF\images\olxx.png"
							alt="Mobile Phone" style="width: 70%; height: 300px">
					</center>
				</div>
				<div class="item ">
					<center>
						<img class="img-responsive"
							src="D:\765075\olx\src\main\webapp\WEB-INF\images\jeepCarousel.jpg"
							alt="jeep" style="width: 50%">
					</center>
				</div>
				<div class="item ">
					<center>
						<img class="img-responsive"
							src="D:\765075\olx\src\main\webapp\WEB-INF\images\apple logo.jpg"
							alt="apple logo">
					</center>
				</div>
				<div class="item ">
					<center>
						<img class="img-responsive"
							src="D:\765075\olx\src\main\webapp\WEB-INF\images\apple.jpg"
							alt="apple products">
					</center>
				</div>
				<div class="item ">
					<center>
						<img class="img-responsive"
							src="D:\765075\olx\src\main\webapp\WEB-INF\images\s8.jpg"
							alt="s8">
					</center>
				</div>



			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a><br>
		</div>
	</div>



	<br>
	<br>
	<c:if test="${message !=null}">
		<div class="alert alert-success">
			<strong>${message}</strong>
		</div>
	</c:if>
	<div class="container">
		<div class="row">
			<c:forEach items="${itemList}" var="item">
				<div class="col-lg-4">

					<div class="thumbnail">
						<a
							href="<c:url value='/app/ItemClickController/${item.item_id}' />">
							<img src="${item.item_image}" alt="homepageImage"
							id="thumbnailImg" onmouseover="bigImg(this)"
							onmouseout="normalImg(this)">
							<div class="caption">
								<center>
									<p>
										<b>${item.item_name}</b>-Rs.${item.price}
									</p>
								</center>
								<br>
							</div>
						</a>
					</div>
					<hr>
				</div>
			</c:forEach>
		</div>

	</div>

	<div class="jumbotron" style="background-color: black; color: grey">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 VL">
					<p>
						POPULAR SEARCHES<small><br> Mobile<br> Cars<br>
							Bikes</small>
					</p>
				</div>
				<div class="col-lg-3 VL">
					<p>
						TRENDING<small><br> Mobile<br> Cars<br>
							Bikes</small>
					</p>
				</div>
				<div class="col-lg-3 VL">
					<p>
						ABOUT US<small><br> About OLX Group<br> Careers<br>
							Contact Us</small>
					</p>
				</div>
				<div class="col-lg-3 VL">
					<p>
						OLX<small><br> Legal and Privacy information<br>
							Site Map<br>Help</small>
					</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
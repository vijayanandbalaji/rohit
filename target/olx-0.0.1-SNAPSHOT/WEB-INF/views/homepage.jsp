<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>



<!-- <form action="/olx/app/OrderPage" method="post">
	<button class="btn btn-primary" name="ContinueShopping" value="continueShopping" >My Orders</button></form>
	
	<form action="/olx/app/CartPage" method="post">
	<button class="btn btn-danger" name="myCart" value="myCart" >Cart</button></form>
	
	<form action="/olx/app/SellPage" method="post">
	<button class="btn btn-danger" name="sell" value="sell" >Sell</button></form>
	
	<form action="/olx/app/MyAdsPage" method="post">
	<button class="btn btn-danger" name="MyAds" value="MyAds" >My Ads</button></form> -->
	
	<c:if test="${message !=null}">
	 <div class="alert alert-success">
    <strong>${message}</strong>
  </div>
  </c:if>
  <div class="row"><c:forEach items="${itemList}" var="item"><div class="col-lg-3">
  
   <div class="thumbnail" style="width:200px">
   <a href="<c:url value='/app/ItemClickController/${item.item_id}' />">
     <img src="${item.item_image}" alt="homepageImage" style="width:100%">
          <div class="caption">
            <p><b>${item.item_name}</b></p>-${item.price}-${item.years_of_usage}<br>
          </div>
    </a>
      </div> </div>
  </c:forEach></div>
  
  
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
		<c:forEach items="${itemList }" var="item"><!-- //include taglib for this to work -->

			<tr>
				<form action="/olx/app/ItemCLickController" method="post">
					<td>${item.item_id }</td> <input type="hidden" name="itemID"
						value="${item.item_id }">
					<td>${item.item_name}</td>
					<td>${item.itemCategory.category_name }</td>
					<td><img src="${item.item_image}" style="max-height:500px"></td>
					<td>${item.years_of_usage}</td>
					<td>${item.price}</td>

					<td><button type="submit" class="btn  btn-secondary"
							name="itemClick" value="displayItem">Display Item</button></td>




				</form>
			</tr>
		</c:forEach>


	</table> --%>

</body>
</html>
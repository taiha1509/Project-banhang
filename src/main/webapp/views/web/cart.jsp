
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<title>Cart</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap -->
<!---->
<link href="Web/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<link href="source/css/modern-business.css" rel="stylesheet"
	type="text/css" />
<link href="source/css/header.css" rel="stylesheet" type="text/css" />
<link href="source/css/footer.css" rel="stylesheet" type="text/css" />

<link href="source/css/cart_css/mycart.css" rel="stylesheet"
	type="text/css" />

<!-- Font Awesome -->
<link href="source/css/cart_css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />

<!-- Custom CSS -->
<link href="source/css/cart_css/owl.carousel.css" rel="stylesheet"
	type="text/css" />
<link href="source/css/cart_css/style.css" rel="stylesheet"
	type="text/css" />
<link href="source/css/cart_css/responsive.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@include file="/common/web/navigation.jsp"%>
	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="single-sidebar">
						<h2 class="sidebar-title">Search Products</h2>
						<form action="#">
							<input type="text" placeholder="Search products..."> <input
								type="submit" value="Search">
						</form>
					</div>

					<div class="single-sidebar">
						<h2 class="sidebar-title">Products</h2>
						<div class="thubmnail-recent">
							<img src="Image/Product/${pr1.get(0).get(0).image }"
								class="recent-thumb" alt="">
							<h2>
								<a href="/single_product/${pr1.get(0).get(1).productId}">${pr1.get(0).get(1).productName }</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>${pr1.get(0).get(1).price }
									${pr1.get(0).get(1).currency }</ins>
							</div>
						</div>
						<div class="thubmnail-recent">
							<img src="Image/Product/${pr2.get(0).get(0).image }"
								class="recent-thumb" alt="">
							<h2>
								<a href="single-product.html">${pr2.get(0).get(1).productName }</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>${pr2.get(0).get(1).price }
									${pr2.get(0).get(1).currency }</ins>
							</div>
						</div>
						<div class="thubmnail-recent">
							<img src="Image/Product/${pr3.get(0).get(0).image }"
								class="recent-thumb" alt="">
							<h2>
								<a href="single-product.html">${pr1.get(0).get(1).productName }</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>${pr3.get(0).get(1).price }
									${pr3.get(0).get(1).currency }</ins>
							</div>
						</div>
						<div class="thubmnail-recent">
							<img src="Image/Product/${pr4.get(0).get(0).image }"
								class="recent-thumb" alt="">
							<h2>
								<a href="single-product.html">${pr4.get(0).get(1).productName }</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>${pr4.get(0).get(1).price }
									${pr4.get(0).get(1).currency }</ins>
							</div>
						</div>

					</div>


				</div>

				<div class="col-md-8">
					<c:if test="${nameCart.product.size()==0}">
						<div>there is no thing in your cart</div>
					</c:if>
					<div class="product-content-right">
						<div class="woocommerce">

							<form method="post" action="#">
								<table cellspacing="0" class="shop_table cart">
									<thead>
										<tr>
											<th class="product-remove">Option</th>
											<th class="product-thumbnail">Image</th>
											<th class="product-name">Product</th>
											<th class="product-price">Price</th>
											<th class="product-quantity">Quantity</th>
											<th class="product-subtotal">Total</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${nameCart.product.size() > 0}">
											<c:forEach var="i" begin="0"
												end="${nameCart.product.size()-1}">
												<tr class="cart_item">
													<td class="product-remove"><a title="Remove this item"
														class="remove" href="/cart/${nameCart.product.get(i).id }">remove</a></td>
													
													
													<td class="product-thumbnail"><a
														href="/single_product/${nameCart.product.get(i).id }"><img
															width="145" height="145" alt="poster_1_up"
															class="shop_thumbnail"
															src="${nameCart.product.get(i).image }"></a></td>

													<td class="product-name"><a
														href="/single_product/${nameCart.product.get(i).id }">${nameCart.product.get(i).name }</a>
													</td>

													<td class="product-price"><span class="amount">${nameCart.product.get(i).price}
															$</span></td>

													<td class="product-quantity"><span>${nameCart.product.get(i).number }</span>
													</td>

													<td class="product-subtotal"><span class="amount">${nameCart.product.get(i).number*nameCart.product.get(i).price }
															$</span></td>
												</tr>
											</c:forEach>
										</c:if>
										<tr>
											<td class="actions" colspan="6"><a class="btn btn-info"
												href="/checkout">CheckOut</a></td>
										</tr>
									</tbody>
								</table>
							</form>

							<div class="cart-collaterals">


								<div class="cross-sells">
									<h2>You may be interested in...</h2>
									<ul class="products">
										<li class="product"><a href="single-product.html"> <img
												width="325" height="325" alt="T_4_front"
												class="attachment-shop_catalog wp-post-image"
												src="Image/Product/${pr4.get(0).get(0).image }">
												<h3>Ship Your Idea</h3> <span class="price"><span
													class="amount">10.6$</span></span>
										</a> <a class="add_to_cart_button" data-quantity="1"
											data-product_sku="" data-product_id="22" rel="nofollow"
											href="single-product.html">Select options</a></li>

										<li class="product"><a href="single-product.html"> <img
												width="325" height="325" alt="T_4_front"
												class="attachment-shop_catalog wp-post-image"
												src="Image/Product/${pr5.get(0).get(0).image }">
												<h3>Ship Your Idea</h3> <span class="price"><span
													class="amount">15.6$</span></span>
										</a> <a class="add_to_cart_button" data-quantity="1"
											data-product_sku="" data-product_id="22" rel="nofollow"
											href="single-product.html">Select options</a></li>
									</ul>
								</div>


								<div class="cart_totals ">
									<h2>Cart Totals</h2>

									<table cellspacing="0">
										<tbody>
											<tr class="cart-subtotal">
												<th>Cart Subtotal</th>
												<td><span class="amount">${totalPrice } $</span></td>
											</tr>

											<tr class="shipping">
												<th>Shipping and Handling</th>
												<td>Free Shipping</td>
											</tr>

											<tr class="order-total">
												<th>Order Total</th>
												<td><strong><span class="amount">${totalPrice }
															$</span></strong></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/web/footer.jsp"%>
	
	<!-- Latest jQuery form server -->
	<script src="https://code.jquery.com/jquery.min.js"></script>

	<!-- Bootstrap JS form CDN -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- jQuery sticky menu -->
	<script src="source/js/cart_js/owl.carousel.min.js"
		type="text/javascript"></script>
	<script src="source/js/cart_js/jquery.sticky.js" type="text/javascript"></script>

	<!-- jQuery easing -->
	<script src="source/js/cart_js/jquery.easing.1.3.min.js"
		type="text/javascript"></script>

	<!-- Main Script -->
	<script src="source/js/cart_js/main.js" type="text/javascript"></script>
	<script src="Web/vendor/jquery/jquery.min.js"></script>
	<script src="Web/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Latest jQuery form server -->
</body>
</html>

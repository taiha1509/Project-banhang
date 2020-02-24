
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Checkout</title>
<!-- Google Fonts -->


<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap -->
<link href="Web/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />


<link href="source/css/modern-business.css" rel="stylesheet"
	type="text/css" />
<link href="source/css/header.css" rel="stylesheet" type="text/css" />
<link href="source/css/footer.css" rel="stylesheet" type="text/css" />
<link href="source/css/checkout.css" rel="stylesheet" type="text/css" />

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
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
						<form action="">
							<input type="text" placeholder="Search products..."> <input
								type="submit" value="Search">
						</form>
					</div>

					<div class="single-sidebar">
						<h2 class="sidebar-title">Products</h2>
						<div class="thubmnail-recent">
							<img
								src="https://c.static-nike.com/a/images/f_auto/q_auto/t_PDP_864_v1/v3p5ojqwpbttr5xvbrpy/free-metcon-2-ut-training-shoe-pwVsFv.jpg"
								class="recent-thumb" alt="">
							<h2>
								<a href="">Nikey - 2015</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>$700.00</ins>
							</div>
						</div>
						<div class="thubmnail-recent">
							<img
								src="https://c.static-nike.com/a/images/f_auto/q_auto/t_PDP_864_v1/v3p5ojqwpbttr5xvbrpy/free-metcon-2-ut-training-shoe-pwVsFv.jpg"
								class="recent-thumb" alt="">
							<h2>
								<a href="">Nikey - 2015</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>$700.00</ins>
							</div>
						</div>
						<div class="thubmnail-recent">
							<img
								src="https://c.static-nike.com/a/images/f_auto/q_auto/t_PDP_864_v1/v3p5ojqwpbttr5xvbrpy/free-metcon-2-ut-training-shoe-pwVsFv.jpg"
								class="recent-thumb" alt="">
							<h2>
								<a href="">Nikey - 2015</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>$700.00</ins>
								<del>$100.00</del>
							</div>
						</div>
						<div class="thubmnail-recent">
							<img
								src="https://c.static-nike.com/a/images/f_auto/q_auto/t_PDP_864_v1/v3p5ojqwpbttr5xvbrpy/free-metcon-2-ut-training-shoe-pwVsFv.jpg"
								class="recent-thumb" alt="">
							<h2>
								<a href="">Nikey - 2015</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>$700.00</ins>
							</div>
						</div>
					</div>


				</div>

				<div class="col-md-8">
					<div class="product-content-right">
						<div class="woocommerce">


							<form:form modelAttribute="bill" enctype="multipart/form-data"
								action="/order" class="checkout" method="post" name="checkout">

								<div id="customer_details" class="col2-set">
									<div class="col-1">
										<div class="woocommerce-billing-fields">
											<h3>Billing Details</h3>


											<c:if test="${not empty user }">
												<p id="billing_first_name_field"
													class="form-row form-row-first validate-required">
													<label class="" for="billing_first_name">Full Name
														<abbr title="required" class="required">*</abbr>
													</label>
													<form:input path="username" type="text" value="${user.username }"
														placeholder="" id="billing_first_name"
														name="billing_first_name" class="input-text " style=""/>
												</p>


												<div class="clear"></div>



												<p id="billing_address_1_field"
													class="form-row form-row-wide address-field validate-required">
													<label class="" for="billing_address_1">Address <abbr
														title="required" class="required">*</abbr>
													</label>
													<form:input path="adress" type="text" value="${user.adress }"
														id="billing_address_1" name="billing_address_1"
														class="input-text " readonly = "readonly" />
												</p>


												<div class="clear"></div>

												<p id="billing_email_field"
													class="form-row form-row-first validate-required validate-email">
													<label class="" for="billing_email">Email Address <abbr
														title="required" class="required">*</abbr>
													</label>
													<form:input path="email" type="text" value="${user.email }"
														placeholder="" id="billing_email" name="billing_email"
														class="input-text " readonly = "readonly"/>
												</p>

												<p id="billing_phone_field"
													class="form-row form-row-last validate-required validate-phone">
													<label class="" for="billing_phone">Phone <abbr
														title="required" class="required">*</abbr>
													</label>
													<form:input path="phone" type="text" value="${user.phone }"
														placeholder="" id="billing_phone" name="billing_phone"
														class="input-text " readonly = "readonly"/>
												</p>
											</c:if>
											
											<c:if test="${ empty user }">
												<p id="billing_first_name_field"
													class="form-row form-row-first validate-required">
													<label class="" for="billing_first_name">Full Name
														<abbr title="required" class="required">*</abbr>
													</label>
													<form:input path="username" type="text" value=""
														placeholder="" id="billing_first_name"
														name="billing_first_name" class="input-text "   />
												</p>


												<div class="clear"></div>



												<p id="billing_address_1_field"
													class="form-row form-row-wide address-field validate-required">
													<label class="" for="billing_address_1">Address <abbr
														title="required" class="required">*</abbr>
													</label>
													<form:input path="adress" type="text" value=""
														id="billing_address_1" name="billing_address_1"
														class="input-text " />
												</p>


												<div class="clear"></div>

												<p id="billing_email_field"
													class="form-row form-row-first validate-required validate-email">
													<label class="" for="billing_email">Email Address <abbr
														title="required" class="required">*</abbr>
													</label>
													<form:input path="email" type="text" value=""
														placeholder="" id="billing_email" name="billing_email"
														class="input-text "/>
												</p>

												<p id="billing_phone_field"
													class="form-row form-row-last validate-required validate-phone">
													<label class="" for="billing_phone">Phone <abbr
														title="required" class="required">*</abbr>
													</label>
													<form:input path="phone" type="text" value=""
														placeholder="" id="billing_phone" name="billing_phone"
														class="input-text "  />
												</p>
											</c:if>

											<form:input path="totalMoney" type="hidden"
												value="${totalPrice }" />

											<div class="clear"></div>
										</div>
									</div>



								</div>

								<h3 id="order_review_heading">Your order</h3>

								<div id="order_review" style="position: relative;">
									<table class="shop_table">
										<thead>
											<tr>
												<th class="product-name">Product</th>
												<th class="product-total">Total</th>
											</tr>
										</thead>

										<tfoot>

											<tr class="cart-subtotal">
												<th>Cart Subtotal</th>
												<td><span class="amount">${totalPrice } $</span></td>
											</tr>

											<tr class="shipping">
												<th>Shipping and Handling</th>
												<td>Free Shipping <input type="hidden"
													class="shipping_method" value="free_shipping"
													id="shipping_method_0" data-index="0"
													name="shipping_method[0]">
												</td>
											</tr>


											<tr class="order-total">
												<th>Order Total</th>
												<td><strong><span class="amount">${totalPrice }
															$</span></strong></td>
											</tr>

										</tfoot>
									</table>


									<div id="payment">
										<ul class="payment_methods methods">
											<li class="payment_method_bacs"><input type="radio"
												data-order_button_text="" checked="checked" value="bacs"
												name="payment_method" class="input-radio"
												id="payment_method_bacs"> <label
												for="payment_method_bacs">Direct Bank Transfer </label>
												<div class="payment_box payment_method_bacs">
													<p>Make your payment directly into our bank account.
														Please use your Order ID as the payment reference. Your
														order won?t be shipped until the funds have cleared in our
														account.</p>
												</div></li>
											<li class="payment_method_cheque"><input type="radio"
												data-order_button_text="" value="cheque"
												name="payment_method" class="input-radio"
												id="payment_method_cheque"> <label
												for="payment_method_cheque">Direct Payment </label>
												<div class="payment_box payment_method_cheque">
													<p>Please pay your money when you receive product. When
														something wrong happen, contact to us by email or phone.</p>
												</div></li>
											<li class="payment_method_paypal"><input type="radio"
												data-order_button_text="Proceed to PayPal" value="paypal"
												name="payment_method" class="input-radio"
												id="payment_method_paypal"> <label
												for="payment_method_paypal">PayPal <img
													alt="PayPal Acceptance Mark"
													src="https://www.paypalobjects.com/webstatic/mktg/Logo/AM_mc_vs_ms_ae_UK.png"><a
													title="What is PayPal?"
													onclick="javascript:window.open('https://www.paypal.com/gb/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;"
													class="about_paypal"
													href="https://www.paypal.com/gb/webapps/mpp/paypal-popup">What
														is PayPal?</a>
											</label>
												<div style="display: none;"
													class="payment_box payment_method_paypal">
													<p>Pay via PayPal; you can pay with your credit card if
														you don?t have a PayPal account.</p>
												</div></li>
										</ul>

										<div class="form-row place-order">

											<input type="submit" data-value="Place order"
												value="Place order" id="place_order"
												name="woocommerce_checkout_place_order" class="button alt">


										</div>

										<div class="clear"></div>

									</div>
								</div>
							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/web/footer.jsp"%>
	<script src="Web/vendor/jquery/jquery.min.js"></script>
	<script src="Web/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
</body>
</html>

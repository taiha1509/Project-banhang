
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Single_product</title>
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
							<img src="Image/Product/${pr1.get(0).get(0).image }"
								class="recent-thumb" alt="">
							<h2>
								<a href="">${pr1.get(0).get(1).productName }</a>
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
								<a href="">${pr2.get(0).get(1).productName }</a>
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
								<a href="">${pr3.get(0).get(1).productName }</a>
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
								<a href="">${pr4.get(0).get(1).productName }</a>
							</h2>
							<div class="product-sidebar-price">
								<ins>${pr4.get(0).get(1).price }
									${pr4.get(0).get(1).currency }</ins>
							</div>
						</div>
					</div>


				</div>

				<div class="col-md-8">
					<div class="product-content-right">
						<div class="row">
							<div class="col-sm-6">
								<div class="product-images">
									<div class="product-main-img">
										<img src="Image/Product/${product.get(0).get(0).image }"
											id="image" alt="">
									</div>

									<div class="product-gallery">
										<img src="Image/Product/${pr5.get(0).get(0).image }" alt="">
										<img src="Image/Product/${pr6.get(0).get(0).image }" alt="">
										<img src="Image/Product/${pr7.get(0).get(0).image }" alt="">
									</div>
								</div>

							</div>

							<div class="col-sm-6">
								<div class="product-inner">
									<h2 class="product-name name" id="name">${product.get(0).get(1).productName }</h2>
									<div class="product-inner-price">
										<span class="price" id="price">${product.get(0).get(1).price}</span>
										<span>${product.get(0).get(1).currency}</span>
									</div>


									<p>Amount</p>
									<div id="sp">
										<input type="hidden" id="soluong" value="${product.get(0).get(1).amount }">
										<button type="button" id="sub" onclick="sub()">-</button>
										<p id="number" class="number">1</p>
										<button type="button" id="add" onclick="add()">+</button>
									</div>
									<button class="add_to_cart_button" 
										onclick="Shop.add()">Add to cart</button>

									<div class="product-inner-category">
										<p>
											Category: <a href="">Summer</a>. Tags: <a href="">awesome</a>,
											<a href="">best</a>, <a href="">sale</a>, <a href="">shoes</a>.
										</p>
									</div>

									<div role="tabpanel">
										<ul class="product-tab" role="tablist">
											<li role="presentation" class="active"><a href="#home"
												aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
											<li role="presentation"><a href="#profile"
												aria-controls="profile" role="tab" data-toggle="tab">Reviews</a></li>
										</ul>
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane in active" id="home">
												<h2>Product Description</h2>
												<p>${product.get(0).get(1).description }</p>
											</div>
											<div role="tabpanel" class="tab-pane fade" id="profile">
												<h2>Reviews</h2>
												<div class="submit-review">
													<p>
														<label for="name">Name</label> <input name="name"
															type="text">
													</p>
													<p>
														<label for="email">Email</label> <input name="email"
															type="email">
													</p>
													<p>
														<label for="review">Your review</label>
														<textarea name="review" id="" cols="30" rows="10"></textarea>
													</p>
													<p>
														<input type="submit" value="Submit">
													</p>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<p id="proId" style="visibility: hidden;" class="proId">${product.get(0).get(1).productId }</p>
	</div>
	
	

	<!-- Latest jQuery form server -->
	
	<script src="Web/vendor/jquery/jquery.min.js"></script>
	<script src="Web/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
	<script src="source/js/cart_js/main.js" type="text/javascript"></script>'
	
	<script type="text/javascript" src="source/js/detailPro.js"></script>

	<script type="text/javascript" src="source/js/Shop.js"></script>
	
</body>
</html>

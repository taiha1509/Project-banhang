<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Home Shop</title>

<!-- Bootstrap core CSS -->
<link href="Web/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="Web/css/modern-business.css" rel="stylesheet">

<link href="source/css/header.css" rel="stylesheet" type="text/css"/>
<link href="source/css/footer.css" rel="stylesheet" type="text/css"/>
    
<link href="source/css/web.css" rel="stylesheet" type="text/css"/>
    
<!-- Font Awesome -->
<link href="source/css/cart_css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    
<!-- Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="source/css/cart_css/owl.carousel.css" rel="stylesheet" type="text/css"/>
<link href="source/css/cart_css/style.css" rel="stylesheet" type="text/css"/>
<link href="source/css/cart_css/responsive.css" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<base href="/">
</head>
<body>

	<%@include file="/common/web/navigation.jsp" %>

	<div class="row">

		<!-- Blog Entries Column -->
		<div class="col-md-12">

			<sitemesh:write property='body' />

		</div>

	</div>
	<!-- /.row -->

	<%@include file="/common/web/footer.jsp" %>
	
	<script type="text/javascript" src="source/js/detailPro.js"></script>

	<script type="text/javascript" src="source/js/Shop.js"></script>

	<script src="Web/vendor/jquery/jquery.min.js"></script>
	<script src="Web/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <!-- Latest jQuery form server -->
    
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="source/js/cart_js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="source/js/cart_js/jquery.sticky.js" type="text/javascript"></script>
    
    <!-- jQuery easing -->
    <script src="source/js/cart_js/jquery.easing.1.3.min.js" type="text/javascript"></script>
    
    <!-- Main Script -->
    <script src="source/js/cart_js/main.js" type="text/javascript"></script>
</body>
</html>
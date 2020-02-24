<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JSP Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<link href="Web/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<link href="source/css/modern-business.css" rel="stylesheet"
	type="text/css" />
<link href="source/css/footer.css" rel="stylesheet" type="text/css" />
<link href="source/css/header.css" rel="stylesheet" type="text/css" />
<link href="source/css/web.css" rel="stylesheet" type="text/css" />

<link href="source/css/cart_css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />

<!-- Custom CSS -->
<link href="source/css/cart_css/owl.carousel.css" rel="stylesheet"
	type="text/css" />
<link href="source/css/cart_css/style.css" rel="stylesheet"
	type="text/css" />
<link href="source/css/cart_css/responsive.css" rel="stylesheet"
	type="text/css" />
<link href="source/css/contact_style.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@include file="/common/web/navigation.jsp"%>
	<div class="content">
		<div class="container">
			<div class="contact">
				<div class="contact-in">
					<h3>contact</h3>
					<c:if test="${message  eq 'Success. You have send contact'}">
						<div class="alert alert-success" id="message">${ message }</div>
					</c:if>
					<c:if
						test="${message eq 'Oh no!. Your contact can not send. Please check'}">
						<div class="alert alert-danger" id="message">${ message }</div>
					</c:if>
					<div class=" col-md-9 contact-left contact-content">

						<form:form action="/contact" method="POST"
							modelAttribute="contact" enctype="multipart/form-data">
							<div>
								<span>Name</span>
								<form:input path="name" name="name" type="text" class="textbox" />
							</div>
							<div>
								<span>E-Mail</span>
								<form:input path="email" name="email" type="email"
									class="textbox" />
							</div>
							<div>
								<span>Adress</span>
								<form:input path="adress" name="adress" type="text"
									class="textbox" />
							</div>
							<div>
								<span>Massage</span>
								<form:textarea path="message" type="text" name="userMsg" />
							</div>
							<div>
								<span><input type="submit" value="Submit"></span>
							</div>
						</form:form>
					</div>


					<div class=" col-md-3 contact-right contact-content">
						<h5>Company Information</h5>
						<p>01 Dai Co Viet,</p>
						<p>Hai Ba Trung, Ha Noi,</p>
						<p>Viet Nam</p>
						<p>Phone:038 488 6117</p>
						<p>
							Email: <a href="mailto:tunga99937@gmail.com">nguyentaihabk@gmail.com</a>
						</p>
						<p>
							Follow on: <span>Facebook</span>, <span>Twitter</span>
						</p>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="map">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.630998917393!2d105.84039951493229!3d21.007423686009997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab8a922653a9%3A0x6c2ec19683313eab!2zMSDEkOG6oWkgQ-G7kyBWaeG7h3QsIEPhuqd1IEThu4FuLCBIYWkgQsOgIFRyxrBuZywgSMOgIE7hu5lp!5e0!3m2!1sen!2s!4v1575313633572!5m2!1sen!2s"
						width="600" height="450" frameborder="0" style="border: 0;"
						allowfullscreen=""></iframe>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/common/web/footer.jsp"%>
	<script src="Web/vendor/jquery/jquery.min.js" type="text/javascript"></script>
	<script src="Web/vendor/bootstrap/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
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

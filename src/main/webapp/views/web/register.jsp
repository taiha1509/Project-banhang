<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/Login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/Login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/Login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/Login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/Login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/Login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/Login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/Login/css/util.css">
<link rel="stylesheet" type="text/css" href="/Login/css/main.css">
<link rel="stylesheet" type="text/css" href="/Login/css/signup.css">
<!--===============================================================================================-->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<div class="limiter">
		
		<div class="container-login100"
			style="background-image: url('Login/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<a href="/home">
					<strong>HOME</strong>
				</a>
				<span class="login100-form-title p-b-41"> Register </span>
				<c:if test="${not empty success }">
					<div class="alert-success alert">${success}</div>
				</c:if>
				<c:if test="${not empty fail }">
					<div class="alert-success alert">${fail}</div>
				</c:if>
				<c:if test="${not empty exit }">
					<div class="alert-success alert">account is exist</div>
				</c:if>

				<form:form class="login100-form validate-form p-b-33 p-t-5"
					modelAttribute="users" action="/register" method="POST"
					enctype="multipart/form-data">

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<form:input class="input100" type="text" path="username"
							name="username" placeholder="Username" />
						<span class="focus-input100" data-placeholder=""> <i
							class="fa fa-user signup-icon "></i>
						</span>
					</div>


					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<form:input class="input100" path="password" type="password"
							name="pass" placeholder="Password" />
						<span class="focus-input100" data-placeholder=""> <i
							class="fa fa-unlock signup-icon "></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter address">
						<form:input class="input100" path="adress" type="text"
							name="address" placeholder="Address" />
						<span class="focus-input100" data-placeholder=""> <i
							class="fa fa-address-card signup-icon "></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter phone">
						<form:input class="input100" path="phone" type="text" name="phone"
							placeholder="Phone" />
						<span class="focus-input100" data-placeholder=""> <i
							class="fa fa-phone signup-icon "></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter email">
						<form:input class="input100" path="email" type="text" name="email"
							placeholder="Email" />
						<span class="focus-input100" data-placeholder=""> <i
							class="fa fa-envelope signup-icon "></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter birth-date">
						<form:input class="input100" path="year" type="text"
							name="birth-date" placeholder="year of birth" />
						<span class="focus-input100" data-placeholder=""> <i
							class="fa fa-birthday-cake signup-icon "></i>
						</span>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn" type="submit">Register
						</button>
					</div>
				</form:form>
			</div>

		</div>
	</div>

	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="/Login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/Login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/Login/vendor/bootstrap/js/popper.js"></script>
	<script src="/Login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/Login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/Login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/Login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/Login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/Login/js/main.js"></script>

</body>
</html>
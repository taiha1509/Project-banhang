<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="source/css/cart_css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />

<nav
	class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="header-logo" href="/home"> </a>

		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<form class="form-inline" action="/search-product" method="POST">
			<input class="form-control mr-sm-2" type="text"
				placeholder="Search Product" name="name">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="/about">About</a>
				<li class="nav-item"><a class="nav-link" href="/contact">Contact</a>

				</li>
				<li class="nav-item"><a class="nav-link cart_link" href="/cart">
						<span id="so_luong_header">Cart <c:if
								test="${! empty count }">
								<c:out value="${count }"></c:out>
							</c:if> <c:if test="${ empty count }">
								<c:out value="0"></c:out>
							</c:if> <span> </span>
					</span> <i class="fa fa-shopping-cart"> </i>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/admin">Admin</a>
				</li>

			</ul>
		</div>
		<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbar-list-4" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbar-list-4">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="fa fa-user "></i>

					</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<c:if test="${empty users}">
								<a class="dropdown-item" href="/login">Login</a>
							</c:if>
							<c:if test="${not empty users}">
								<a class="dropdown-item" href="/logout">Logout</a>
							</c:if>
							<a class="dropdown-item" href="/register">Register</a>
						</div></li>
				</ul>
			</div>
		</nav>
		<c:if test="${not empty users }">
			<div class="text-info">${users.username }</div>
		</c:if>
		<c:if test="${not empty forbid }">
			<div class="alert alert-warning">
				<strong>Warning! ${forbid }</strong> 
			</div>
		</c:if>
	</div>
</nav>
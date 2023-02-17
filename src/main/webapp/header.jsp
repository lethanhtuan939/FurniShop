<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

		<!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

			<div class="container">
				<a class="navbar-brand" href="home">Furni<span>.</span></a>

				<button onclick="show()" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						<li class="nav-item active">
							<a class="nav-link" href="home">Home</a>
						</li>
						<li><a onclick="activeClass()" class="nav-link" href="allProduct">Shop</a></li>
						<li><a class="nav-link" href="about.jsp">About us</a></li>
						<li><a class="nav-link" href="services.jsp">Services</a></li>
						<li><a class="nav-link" href="blog.jsp">Blog</a></li>
						<li><a class="nav-link" href="contact.jsp">Contact us</a></li>
					</ul>

					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a onclick="show()" style="cursor: pointer; color: #fff; font-size: 16px;" class="nav-link"><i class="fa fa-search"></i></a></li>
						<li><a style="margin-right: 20px;" class="nav-link" href="cart.jsp"><img src="/Furni/images/cart.svg"></a></li>
						<c:if test="${sessionScope.acc != null}">
							<li class="dropdown-mycustom">
								<div onclick="showMenuuser()" class="nav-link">
									<img src="/Furni/images/user.svg">
									<i class="fa fa-caret-down" aria-hidden="true"></i>
								</div>
		
								<ul id="show-menuuser" class="dropdown-mylist">
									<li style="margin-right: 0;">
										<a href="#">
											<i class="fa fa-user" aria-hidden="true"></i>
											Profile (${sessionScope.acc.username})
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-cog" aria-hidden="true"></i>
											Setting
										</a>
									</li>
									<li>
										<a href="logout">
											<i class="fa fa-sign-out" aria-hidden="true"></i>
											Logout
										</a>
									</li>
								</ul>
							</li>
						</c:if>
						<c:if test="${sessionScope.acc == null}">
							<li><a style="cursor: pointer; color: #fff; font-size: 16px;" class="nav-link" href="login"><i class="fa fa-sign-in" aria-hidden="true"></i></a></li>
						</c:if>
					</ul>
				</div>
				
				<form class="container form-inline input-search-absolute hide" action="search" method="post">
					<input oninput="searchByName(this)" value="${txtSearch}" type="search" placeholder="Search..." name="searchTxt">
					<button class="" type="submit"><i class="fa fa-search"></i></button>
				</form>
				
			</div>
			
		</nav>
		<!-- End Header/Navigation -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="/Furni/images/favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="/Furni/css/tiny-slider.css" rel="stylesheet">
		<link href="/Furni/css/style.css" rel="stylesheet">
		<link href="/Furni/css/mycustom.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js" integrity="sha512-pax4MlgXjHEPfCwcJLQhigY7+N8rt6bVvWLFyUMuxShv170X53TRzGPmPkZmGBhk+jikR8WBM4yl7A9WMHHqvg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<title>Furni Cart</title>
	</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

<!-- Start Hero Section -->
	<div class="hero">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1>Cart</h1>
						<p class="mb-4">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam
							vulputate velit imperdiet dolor tempor tristique.</p>
						<p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#"
								class="btn btn-white-outline">Explore</a></p>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="hero-img-wrap">
						<img src="images/couch.png" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Hero Section -->

	<div class="untree_co-section before-footer-section">
		<div class="container">
			<div class="row mb-5">
				<form class="col-md-12" method="post">
					<div class="site-blocks-table">
						<table class="table">
							<thead>
								<tr>
									<th class="product-thumbnail">Image</th>
									<th class="product-name">Product</th>
									<th class="product-price">Price</th>
									<th class="product-quantity">Quantity</th>
									<th class="product-total">Total</th>
									<th class="product-remove">Remove</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sessionScope.cart-list}" var="o">
									<tr>
										<td class="product-thumbnail">
											<img src="${o.product.image }" alt="Image" class="img-fluid">
										</td>
										<td class="product-name">
											<h2 class="h5 text-black">${o.product.name }</h2>
										</td>
										<td>$${o.product.price }</td>
										<td>
											<div class="input-group mb-3 d-flex align-items-center quantity-container"
												style="max-width: 120px;">
												<div class="input-group-prepend">
													<button class="btn btn-outline-black decrease"
														type="button">&minus;</button>
												</div>
												<input type="text" class="mx-2 form-control text-center quantity-amount"
													value="1" placeholder="" aria-label="Example text with button addon"
													aria-describedby="button-addon1">
												<div class="input-group-append">
													<button class="btn btn-outline-black increase"
														type="button">&plus;</button>
												</div>
											</div>
	
										</td>
										<td>$49.00</td>
										<td><a href="#" class="btn btn-black btn-sm">X</a></td>
								</tr>
								</c:forEach>

								<!-- <tr>
									<td class="product-thumbnail">
										<img src="images/product-2.png" alt="Image" class="img-fluid">
									</td>
									<td class="product-name">
										<h2 class="h5 text-black">Product 2</h2>
									</td>
									<td>$49.00</td>
									<td>
										<div class="input-group mb-3 d-flex align-items-center quantity-container"
											style="max-width: 120px;">
											<div class="input-group-prepend">
												<button class="btn btn-outline-black decrease"
													type="button">&minus;</button>
											</div>
											<input type="text" class="form-control text-center quantity-amount"
												value="1" placeholder="" aria-label="Example text with button addon"
												aria-describedby="button-addon1">
											<div class="input-group-append">
												<button class="btn btn-outline-black increase"
													type="button">&plus;</button>
											</div>
										</div>

									</td>
									<td>$49.00</td>
									<td><a href="#" class="btn btn-black btn-sm">X</a></td>
								</tr> -->
							</tbody>
						</table>
					</div>
				</form>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="row mb-5">
						<div class="col-md-6 mb-3 mb-md-0">
							<button class="btn btn-black btn-sm btn-block">Update Cart</button>
						</div>
						<div class="col-md-6">
							<button class="btn btn-outline-black btn-sm btn-block">Continue Shopping</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label class="text-black h4" for="coupon">Coupon</label>
							<p>Enter your coupon code if you have one.</p>
						</div>
						<div class="col-md-8 mb-3 mb-md-0">
							<input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
						</div>
						<div class="col-md-4">
							<button class="btn btn-black">Apply Coupon</button>
						</div>
					</div>
				</div>
				<div class="col-md-6 pl-5">
					<div class="row justify-content-end">
						<div class="col-md-7">
							<div class="row">
								<div class="col-md-12 text-right border-bottom mb-5">
									<h3 class="text-black h4 text-uppercase">Cart Totals</h3>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<span class="text-black">Subtotal</span>
								</div>
								<div class="col-md-6 text-right">
									<strong class="text-black">$230.00</strong>
								</div>
							</div>
							<div class="row mb-5">
								<div class="col-md-6">
									<span class="text-black">Total</span>
								</div>
								<div class="col-md-6 text-right">
									<strong class="text-black">$230.00</strong>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-black btn-lg py-3 btn-block"
										onclick="window.location='checkout.jsp'">Proceed To Checkout</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
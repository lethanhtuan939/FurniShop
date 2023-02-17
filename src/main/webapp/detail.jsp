<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="shortcut icon" href="/Furni/images/favicon.png">
    <link rel="stylesheet" href="/Furni/css/detail.css">
    <title>Document</title>
</head>
<body>
	
    <div class="container mt-5 mb-5">
        <div class="card">
            <div class="row g-0">
                <div class="col-md-6 border-end">
                    <div class="d-flex flex-column justify-content-center">
                        <div class="main_image"> <img src="${product.image}" id="main_product_image"
                                width="350"> </div>
                        <div class="thumbnail_images">
                            <ul id="thumbnail">
                                <li><img onclick="changeImage(this)" src="${product.image}" width="70"></li>
                                <li><img onclick="changeImage(this)" src="${product.image}" width="70"></li>
                                <li><img onclick="changeImage(this)" src="${product.image}" width="70"></li>
                                <li><img onclick="changeImage(this)" src="${product.image}" width="70"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="p-3 right-side">
                        <div class="d-flex justify-content-between align-items-center">
                            <h3>${product.name}</h3> <span style="cursor: pointer;" onclick="changColorHeart()" class="heart"><i class="fa-solid fa-heart"></i></span>
                        </div>
                        <div class="mt-2 pr-3 content">
                            <p>${product.description}</p>
                        </div>
                        <h3>${product.price}</h3>
                        <div class="ratings d-flex flex-row align-items-center">
                            <div class="d-flex flex-row"> <i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> 
                                <i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i class="fa-regular fa-star"></i> </div>
                            <span>441 reviews</span>
                        </div>
                        <div class="mt-5"> <span class="fw-bold">Color</span>
                            <div class="colors">
                                <ul id="marker">
                                    <li id="marker-1"></li>
                                    <li id="marker-2"></li>
                                    <li id="marker-3"></li>
                                    <li id="marker-4"></li>
                                    <li id="marker-5"></li>
                                </ul>
                            </div>
                        </div>
                        <div class="buttons d-flex flex-row mt-5 gap-3">
	                        <a class="btn btn-outline-dark">Buy Now</a> 
	                        <a href="cart?id=${product.id}" class="btn btn-dark">Add to Cart</a> 
                        </div>
                        <form class="search-option" action="search" method="post"> 
                            <div class="inputs"> 
                            	<input name="searchTxt" type="text" name=""> 
                            </div>
                        	<i class='bx bx-search-alt-2 first-search'></i>
                        	<button style="opacity: 0" type="submit"><i class="fa fa-search"></i></button>
                            <i class='bx bx-share-alt share'></i>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <a href="allProduct" class="btn btn-primary my-2">Back</a>
    </div>

    <script src="/Furni/js/detail.js"></script>
    
    <script type="text/javascript">
    	function changColorHeart() {
    		var heart = document.querySelector('.heart i');
			heart.classList.toggle("heartRed");
		}
    </script>
</body>
</html>
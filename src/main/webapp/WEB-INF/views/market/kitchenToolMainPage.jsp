<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	 <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<title>kitchenToolMainPage</title>
</head>
<style>

body{
	text-align: center;
}

ul li {
	list-style: none;
}

  .list{
  	height: 500px;
  	background: yellow
  }
         
  .slick-arrow{
	  position: absolute;top: 50%;
	  transform: translateY(-50%);
	  z-index: 5
	  
	  }
	 
	 
	   .slick-prev:before, .slick-next:before {
        font-size: 45px;
      	color:#4485d7;
      }
	 
	 
  .slick-prev{
	  left: -150px;
  }
   .slick-next{
   right: -150px;
  
   }
   
   .slick{
   margin:auto;
   	width: 1200px;
   }

   

.categoryTitle{
	font-weight: bold;
	font-size: 22px;
}

.commProduct  {
	width:auto;
	padding: 25px;
	background-color: #edf8ff;
	text-align: center;
	display: inline-block;
	border-radius: 10px;
}

.commProduct li {
	white-space:nowrap;
	text-align: center;
	display: inline-block;
}



.commProduct li a img{
	width:250px;
	height:300px;
}
.originPrice{
	font-size: 15px;
	color:black;
	text-decoration: line-through;
}

.discount{
	font-size:18px;
	color:red;
}

.nomalProduct {
	width:1100px;
	padding: 25px;
	text-align: center;
	display: inline-block;
}

.nomalProduct li{
	margin-bottom: 10px;
	margin:5px;
	text-align: center;
	display: inline-block;
}
.nomalProduct li a img{
	width:250px;
	height:300px;
}



.product-slider .product-wrapper{
  width:1150px;
  height:369px;
  margin:0px auto;
}
.product-slider .product-wrapper .productList{
  width:400px;
  height:370px;
  display:inline-block;
  background: #edf8ff;
  padding:15px;
  
}

.productList img{
	padding: 5px;
	width:250px;
	height:300px;
}

.post-slider{
  width:70%;
  margin:0px auto;
 
}


.post-slider .next{
  position:absolute;
  top:50%;
  right:30px;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider .prev{
  position:absolute;
  top:50%;
  left:30px;
  font-size:2em;
  color:gray;
    cursor: pointer;
}

.product-slider2 .product-wrapper{
  width:1150px;
  height:369px;
  margin:0px auto;
}
.product-slider2 .product-wrapper .productList{
  width:400px;
  height:370px;
  display:inline-block;
  background: #edf8ff;
  padding:15px;
  
}

.productList img{
	padding: 5px;
	width:250px;
	height:300px;
}

.post-slider2{
  width:70%;
  margin:0px auto;
 
}


.post-slider2 .next{
  position:absolute;
  top:50%;
  right:30px;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider2 .prev{
  position:absolute;
  top:50%;
  left:30px;
  font-size:2em;
  color:gray;
    cursor: pointer;
}


</style>


<body>


 <div class="slick">
        <div class="list"><img src="resources/images/listProduct.jpg"></div>
        <div class="list"><img src="resources/images/listProduct.jpg"></div>
        <div class="list"><img src="resources/images/listProduct.jpg"></div>
 </div>
<br>
<br>

 <h1 class="sider-title">인기상품</h1>
<div class="product-slider">
        <div class="product-wrapper">
        
          <div class="productList">
			<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
        </div>
</div>
<br>
<br>


 <h1 class="sider-title">추천상품</h1>
<div class="product-slider2">
       
        <div class="product-wrapper">
          <div class="productList">
			<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
          
          <div class="productList">
          	<a><img src="resources/images/product1.png"></a>
			<div>전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
          </div>
        
        </div>
</div>



<ul class="nomalProduct">
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
		<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	<li>
		<a><img src="resources/images/product1.png"></a>
		<div>전기 믹서기</div>
		<div class="originPrice">38,000</div>
		<div class="discount">32,000</div>
	</li>
	
	
</ul>
<script>
$('.slick').slick({
	
	prevArrow : "<button type='button' class='slick-prev'></button>",
		nextArrow : "<button type='button' class='slick-next'></button>"
	
});


$('.product-wrapper').slick({
	  slidesToShow: 4,
	  slidesToScroll: 2,
	  autoplay: true,
	  autoplaySpeed: 2000,
	  nextArrow:$('.next'),
	  prevArrow:$('.prev'),
	  infinite : true
	});




</script>

</body>
</html>

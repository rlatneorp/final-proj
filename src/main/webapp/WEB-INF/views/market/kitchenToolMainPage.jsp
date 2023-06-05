<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
   	 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
     <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
	 
  .slick-prev{
	  left: -150px;
	background:url(resources/images/rightArrow.png);
  }
   .slick-next{
   right: -150px;
  
   }
         
   .slick{
   margin:auto;
   	width: 1100px;
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
</style>


<body>


 <div class="slick">
        <div class="list"><img src="resources/images/listProduct.jpg"></div>
        <div class="list"><img src="resources/images/listProduct.jpg"></div>
        <div class="list"><img src="resources/images/listProduct.jpg"></div>
 </div>





<div class="categoryTitle">인기상품</div>
<ul class="commProduct">
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

<div class="categoryTitle">추천상품</div>
<ul class="commProduct">
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
<br>
<br>
<br>
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
$('.slick').slick();
</script>

</body>
</html>

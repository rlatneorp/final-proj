<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	 <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<title>ToolMainPage</title>
</head>
<style>

* {
	outline: none;
	margin: 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

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
	padding-top:10px;
	font-size: 25px;
	color:black;
	text-decoration: line-through;
	letter-spacing: 2px; 
}

.discount{
	font-size:25px;
	padding-left:10px;
	font-weight:bold;
	color:red;
	letter-spacing: 2px; 
}

.nomalProduct {
	width: 1200px;
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
	width:370px;
	height:370px;
}

.product-slider .product-wrapper{
  width:1150px;
  height:369px;
  margin:0px auto;
}
.product-slider .product-wrapper .productList{
  text-align:center;
  width:400px;
  height: 410px;
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
  text-align:center;
  width:400px;
  height: 410px;
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

.sider-title{
	text-align: center;
	font-weight: 500;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 32px;
	color: #243ad5;
}

.bannerTitle{
	position:absolute;
	left:350px ;
}

.productName{
	font-weight:bold;
	padding-top:15px;
	font-size: 22px;
	letter-spacing: 2px; 
}

.cateBtn{
	border-spacing: 18px;
	border-collapse: separate;
}


.cateBtn td{
	text-align: center;
	width: 120px;
	height: 40px;
	color: #4485d7;
	border: 1px solid #4485d7;
	border-radius: 20px;
	font-weight: bold;
	cursor:pointer;
}

.cateBtn td:active{
	background-color: #4485d7;
	color: white;
}

.cateBtn td:hover{
	background-color: #4485d7;
	color: white;
}

.clickView {
	color:inherit;
	text-decoration: none;
}

.normal{
	 padding-bottom:60px;
}
</style>


<body>
<%@include file="../common/storeTop.jsp"%>

<table class="cateBtn" style="margin:auto;">
<tr>
	<td><a class="clickView" href="${contextPath }/viewWhole.ma">전체보기</a></td>
	<td><a class="clickView" href="${contextPath }/viewFood.ma">식품</a></td>
<%-- 	<td><a class="clickView" href="${contextPath }/viewMenu.ma">식단</a></td> --%>
	<td><a class="clickView" href="${contextPath }/viewIngredient.ma">식재료</a></td>
	<td><a class="clickView" href="${contextPath }/viewTool.ma">주방용품</a></td>
</tr>
</table> 
	<div style="position:relative;">
		<div class="bannerTitle"><span style="font-size: 24px;">이주의</span> <span style="color: red; font-weight: bold; font-size: 24px;">HOT ITEM</span></div>
		<br>
		<br>
	 	<div class="slick">
	        <div class="list"><img src="resources/images/listProduct.jpg"></div>
	        <div class="list"><img src="https://recipe1.ezmember.co.kr/cache/shop/2023/05/31/d0d636ce22f5c934e5f16c90bbade797.jpg"></div>
	        <div class="list"><img src="https://recipe1.ezmember.co.kr/cache/shop/2023/06/02/c2136bce9904c2d3bf3b3795b69b8c7c.jpg"></div>
	        <div class="list"><img src="https://recipe1.ezmember.co.kr/cache/shop/2023/05/31/75bcd3ca5e31e19105d9a4a8b16ba1a3.jpg"></div>
	 </div>
<br>
</div>
 <h1 class="sider-title">New 핫딜존</h1>
<div class="product-slider">
        <div class="product-wrapper">
        <c:forEach items="${list }" var="li">
          <div class="productList">
          	<input type="hidden" value="${li.productNo }">
			<a href="market_detail.ma?productNo=1000"><img src="resources/images/product1.png"></a>
			<div class="productName">${li.productName }</div>
			<div class="originPrice">${li.productPrice }</div>
			<div class="discount" id="productNoSale-${li.productNo }"></div>
          </div>
        </c:forEach>
  </div>
</div>
<br>
<br>
 <h1 class="sider-title">추천상품</h1>
<div class="product-slider2">
       
        <div class="product-wrapper">
        
          <div class="productList">
			<a href="market_detail.ma"><img src="resources/images/product1.png"></a>
			<div class="productName">전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
         </div>
          <div class="productList">
			<a href="market_detail.ma"><img src="resources/images/product1.png"></a>
			<div class="productName">전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
         </div>
          <div class="productList">
			<a href="market_detail.ma"><img src="resources/images/product1.png"></a>
			<div class="productName">전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
         </div>
          <div class="productList">
			<a href="market_detail.ma"><img src="resources/images/product1.png"></a>
			<div class="productName">전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
         </div>
          <div class="productList">
			<a href="market_detail.ma"><img src="resources/images/product1.png"></a>
			<div class="productName">전기 믹서기</div>
			<div class="originPrice">38,000</div>
			<div class="discount">32,000</div>
         </div>
          
        </div>
</div>

<br>
<br>
<br>


<div style="text-align: center;">
<ul class="nomalProduct">
	<c:forEach items="${list }" var="li">
		<li class="normal">
			<input type="hidden" value="${li.productNo }">
			<a href="market_detail.ma"><img src="${contextPath }/resources/uploadFiles/${li.productImg}"></a>
			<div class="productName">${li.productName }</div>
			<c:if test="${li.productSale ne 0 }">
				<span class="originPrice">
					${li.productPrice }
				</span>
			</c:if>
			<c:if test="${li.productSale eq 0 }">
				<span style="font-size:25px;">
					<fmt:formatNumber value="${li.productPrice }" pattern="###,###,###"/>
				</span>
			</c:if>
			<span class="discount" id="discount-${li.productNo }"></span>
			<input type="hidden" value="${li.productSale }">
		</li>
	</c:forEach>
</ul>
</div>

<script>
	window.onload = () => {
		const normal = document.getElementsByClassName('normal');
		console.log(normal)
		for(np of normal) {
			const productNo = np.children[0].value;
			console.log(productNo);
			//할인 계산 
			if(np.children[5].value != '0') {
				const originPrice = parseInt(np.children[3].innerText);
				console.log(originPrice);
				const sale = parseInt(np.children[5].value);
				console.log(sale);
				const discount = (originPrice * (1- sale/100)).toLocaleString();
				console.log(discount);
				document.getElementById('discount-'+productNo).innerText = discount
			} else { //0일 경우 
// 				document.getElementById('discount-'+productNo).innerHTML = '<br>'
			}
			
		}
	}
	
	
	
	$('.slick').slick({
		autoplay: true,
		autoplaySpeed: 2000,
		prevArrow : "<button type='button' class='slick-prev'></button>",
		nextArrow : "<button type='button' class='slick-next'></button>"
		
	});
	
	
	$('.product-wrapper').slick({
		  slidesToShow: 4,
		  slidesToScroll: 2,
		  nextArrow:$('.nextBtn'),
		  prevArrow:$('.prevBtn'),
		  prevArrow : "<button type='button' class='slick-prev'></button>",
		  nextArrow : "<button type='button' class='slick-next'></button>",
		  infinite : true,
		});
	
</script>
</body>
</html>

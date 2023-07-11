<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	 <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<title>홀로세끼</title>
	<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<style>

#shop{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

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
	padding-left:1px;
	font-weight:bold;
	color:red;
	letter-spacing: 2px; 
}

.nomalProduct {
/* 	position:relative; */
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
  width:1200px;
  height:370px;
  margin:0px auto;
}
.product-slider .product-wrapper .productList{
  text-align:center;
  width:450px;
  height: 450px;
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
  width:1200px;
  height:369px;
  margin:0px auto;
}
.product-slider2 .product-wrapper .productList{
  text-align:center;
  width:450px;
  height: 450px;
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
	padding-bottom:7px;
	font-weight: 500;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 32px;
	color: #243ad5;
}

.select-option{
	padding-top:30px;
/* 	border:1px solid black; */
	margin:0 auto;
	width:1135px;
	text-align:right;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	color: #243ad5;
}
.bannerTitle{
	position:absolute;
	left:300px ;
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
/* 	페이지 */
	.page_wrap {
		text-align:center;
		font-size:0;
	}
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		margin-top: 8px;
	}
	.page_nation .prev {
		background:white;
	}
	.page_nation .next {
		background:white;
	}
	.page_nation a.active {
		background-color:#B0DAFF;
		color:white;
		border:1px solid #B0DAFF;
		border-radius: 100%;
	}
	

.page-link.disabled{color: lightgray;}
.page-link.disabled:hover{background: white; color: lightgray;}
</style>


<body>
<%@include file="../common/storeTop.jsp"%>
	<br><br>
	<table class="cateBtn" style="margin:auto;">
		<tr>
			<!-- 전체 보기 시 색상 변경 -->
			<c:if test="${whole ne null }">
				<td onclick="window.location.href='${contextPath}/viewWhole.ma'" style="color:white; background-color:#4485d7;">전체보기</td>
			</c:if>
			<c:if test="${whole eq null }">
				<td class="clickView" onclick="window.location.href='${contextPath}/viewWhole.ma'">전체보기
			</c:if>
			<!-- 식품 카테고리 선택 시 색상 변경 -->
			<c:if test="${ foodView ne null }">
				<td onclick="window.location.href='${contextPath}/viewFood.ma'" style="color:white; background-color:#4485d7;">식품</td>
			</c:if>
			<c:if test="${ foodView eq null }">
				<td onclick="window.location.href='${contextPath}/viewFood.ma'" class="clickView">식품</td>
			</c:if>
			
			<!-- 식재료 카테고리 선택 시 색상 변경 -->
			<c:if test="${IngreView ne null }">
				<td onclick="window.location.href='${contextPath}/viewIngredient.ma'" style="color:white; background-color:#4485d7;">식재료</td>
			</c:if>
				<c:if test="${IngreView eq null }">
				<td onclick="window.location.href='${contextPath}/viewIngredient.ma'"  class="clickView">식재료</td>
			</c:if>
			
			<!-- 주방용품 카테고리 선택 시 색상 변경 -->
			<c:if test="${ToolView ne null }">
				<td onclick="window.location.href='${contextPath}/viewTool.ma'" style="color:white; background-color:#4485d7;">주방용품</td>
			</c:if>
			<c:if test="${ToolView eq null }">
				<td onclick="window.location.href='${contextPath}/viewTool.ma'" class="clickView">주방용품</td>
			</c:if>
			
		</tr>
	</table><br><br>
	
	<form id="searchForm" action="viewSearch.ma">
		<input type="hidden" name="searchStart" value="Y"> 
		<div class="text-center searchBox">
			<select name="searchType" class="border searchSelect" style="padding: 6px 7px;">
				<option value="food" <c:if test="${searchType eq 'food'}">selected</c:if>>식품</option>
				<option value="ingredient" <c:if test="${searchType eq 'ingredient'}">selected</c:if>>식재료</option>
				<option value="tool" <c:if test="${searchType eq 'tool'}">selected</c:if>>도구</option>
			</select>
			<div style="width:200px" class="d-inline-block mb-4">
				<input name="searchText" type="search" class="form-control" value="${searchText}">
			</div>
			<button style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 38px; font-size: 14px; font-weight: bold;">검색</button>
		</div>
	</form>
	
	
	<h1 class="sider-title">
		<i class="bi bi-egg-fried"></i>&nbsp;&nbsp;판매 중인 상품&nbsp;&nbsp;<i class="bi bi-egg-fried"></i>
	</h1>
	
	<c:if test="${empty list}">
		<div style="text-align: center;">
			<br><br>
			<h2>검색된 상품이 없습니다.</h2>
		</div>
	</c:if>
	<div class="select-option" id="dropDown">
		<c:if test="${foodView ne null }">
			<select>
				<option>전체보기</option>
				<option>밀키트</option>
				<option>식재료</option>
			</select>
			<select>
				<option>전체보기</option>
				<option>메인</option>
				<option>서브</option>
			</select>
			<button id="search">검색</button>
		</c:if>	
	</div>
	<div style="text-align: center;">
		<ul class="nomalProduct" id="tbody">
			<c:forEach items="${list }" var="li">
				<li class="normal">
					<input type="hidden" value="${li.productNo }">
					<a href="market_detail.ma?productNo=${li.productNo }">
						<c:if test="${li.productImg ne null }">
							<img src="${contextPath }/resources/uploadFiles/${li.productImg}">
						</c:if>
						<c:if test="${li.productImg eq null }">
							<img style="opacity: 0.5;" src="${contextPath }/resources/images/noImg.png">
						</c:if>
					</a>
					<div class="productName">${li.productName }</div>
					<c:if test="${li.productSale ne 0 }">
						<span class="originPrice">
							${li.productPrice }원
						</span>
					</c:if>
					<c:if test="${li.productSale eq 0 }">
						<span style="font-size:25px;">
							<fmt:formatNumber value="${li.productPrice }" pattern="###,###,###"/>원
						</span>
					</c:if>
					<span class="discount" id="discount-${li.productNo }"></span>
					<input type="hidden" value="${li.productSale }">
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="page_wrap">
		<div class="page_nation">
		
	<!-- 		이전 페이지로	 -->
			<c:url var="goBack" value="${loc }">
				<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
				<c:param name="searchType" value="${searchType}"></c:param>
				<c:param name="searchText" value="${searchText}"></c:param>
			</c:url>
			<c:if test="${pi.currentPage > 1 }">
				<a class="arrow prev" href="${goBack }"><i class="bi bi-chevron-left"></i></a>
			</c:if>
			
	<!-- 		페이지 -->
			<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				<c:url var="goNum" value="${loc }">
					<c:param name="page" value="${p }"></c:param>
					<c:param name="searchType" value="${searchType}"></c:param>
					<c:param name="searchText" value="${searchText}"></c:param>
				</c:url>
				<c:if test="${ pi.currentPage eq p }">
					<a class="active">${p }</a>
				</c:if>
				<c:if test="${ !(pi.currentPage eq p) }">
					<a href="${goNum }">${p }</a>
				</c:if>
			</c:forEach>
			
			<c:url var="goNext" value="${loc }">
				<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
				<c:param name="searchType" value="${searchType}"></c:param>
				<c:param name="searchText" value="${searchText}"></c:param>
			</c:url>
			<c:if test="${pi.currentPage < pi.endPage }">
				<a class="arrow next" href="${goNext }"><i class="bi bi-chevron-right"></i></a>
			</c:if>
		</div>
	</div>
	<br><br><br><br><br>




<script>
	window.onload = () => {
		
		//글자 수 9개 이상 ... 표시 
		const productNames = document.getElementsByClassName("productName");

		for (let i = 0; i < productNames.length; i++) {
		  const productName = productNames[i].textContent;
		  if (productName.length > 9) {
		    productNames[i].textContent = productName.substring(0, 9) + "...";
		  }
		}

		
		//normal
		const normal = document.getElementsByClassName('normal');
		for(np of normal) {
			const productNo = np.children[0].value;
			//할인 계산 
			if(np.children[5].value != '0') {
				const originPrice = parseInt(np.children[3].innerText);
				const sale = parseInt(np.children[5].value);
				const discount = (originPrice * (1- sale/100)).toLocaleString();
				document.getElementById('discount-'+productNo).innerText = discount + '원'
			} 
		}
		
		//핫딜존 
		const hotDealList = document.getElementsByClassName('hotDeal');
		for(pl of hotDealList) {
// 			const productNo = pl.parentElement.children[0].value;
			//할인 계산 
			if(pl.value != '0') {
				console.log(pl.previousElementSibling)
				const originPrice = parseInt(pl.previousElementSibling.previousElementSibling.innerText.replace(/원/g, ''));
				const sale = parseInt(pl.value);
				const discount = (originPrice * (1- sale/100)).toLocaleString();
				pl.previousElementSibling.innerText = discount + '원'
			} 
		}
		
		//추천 상품
		const likeOrders = document.getElementsByClassName('likeOrders');
		for(lo of likeOrders) {
			if(lo.value != '0') {
				const originPrice = parseInt(lo.previousElementSibling.previousElementSibling.innerText.replace(/원/g, ''));
				const sale = parseInt(lo.value);
				const discount = (originPrice * (1- sale/100)).toLocaleString();
				lo.previousElementSibling.innerText = discount + '원'
			}	
		}
		
	} //window.onload 
	
	if(document.getElementById('search') != null) {
		document.getElementById('search').addEventListener('click', function() {
			console.log(document.getElementById('dropDown'));
			
			 const select1 = document.querySelector('#dropDown select:nth-of-type(1)');
			 const select2 = document.querySelector('#dropDown select:nth-of-type(2)');
			 const selectedOption1 = select1.options[select1.selectedIndex].text;
			 const selectedOption2 = select2.options[select2.selectedIndex].text;
			 let foodType = '';
			 let foodKind = '';
			 if(selectedOption1 == '밀키트') {
				 foodType = '1'
			 } else if (selectedOption1 == '식재료') {
				 foodType = '2'
			 } else if (selectedOption1 == '전체보기') {
				 foodType = '0'
			 }
			 if(selectedOption2 == '메인') {
				 foodKind = '1';
			 } else if (selectedOption2 == '서브') {
				 foodKind = '2';
			 } else if (selectedOption2 == '전체보기') {
				 foodKind = '0';
			 }
			 
			 $.ajax({
				 url:'${contextPath}/foodDropDownSelect.ma',
				 data:{
					 foodType:foodType,
					 foodKind:foodKind
				 },
				 success: data => {
					 document.getElementById('tbody').innerHTML = '';
					 
					 data.forEach(function(li) {
				            var liElement = document.createElement('li');
				            liElement.classList.add('normal');

				            var hiddenInput = document.createElement('input');
				            hiddenInput.type = 'hidden';
				            hiddenInput.value = li.productNo;
				            liElement.appendChild(hiddenInput);

				            var anchor = document.createElement('a');
				            anchor.href = 'market_detail.ma?productNo=' + li.productNo;
				            liElement.appendChild(anchor);
				            console.log('li : ' + li.productImg)
				            if (li.productImg != null) {
				                var img = document.createElement('img');
				                img.src = '${contextPath}/resources/uploadFiles/' + li.productImg;
				                anchor.appendChild(img);
				            } else {
				                var img = document.createElement('img');
				                img.style.opacity = '0.5';
				                img.src = '${contextPath}/resources/images/noImg.png';
				                anchor.appendChild(img);
				            }

				            var productNameDiv = document.createElement('div');
				            productNameDiv.classList.add('productName');
				            productNameDiv.innerText = li.ProductName;
				            liElement.appendChild(productNameDiv);
				            
				            if (li.productSale != 0) { 
				                var originPriceSpan = document.createElement('span');
				                originPriceSpan.classList.add('originPrice'); // 밑줄 긋는 css 
				                originPriceSpan.innerText = li.productPrice + '원';
				                liElement.appendChild(originPriceSpan);
				            } else {
				                var priceSpan = document.createElement('span');
				                priceSpan.style.fontSize = '25px';
				                priceSpan.innerText = new Intl.NumberFormat().format(li.productPrice) + '원';
				                liElement.appendChild(priceSpan);
				            }

				            var discountSpan = document.createElement('span');
				            discountSpan.classList.add('discount');
				            discountSpan.id = 'discount-' + li.productNo;
				            liElement.appendChild(discountSpan);

				            var saleInput = document.createElement('input');
				            saleInput.type = 'hidden';
				            saleInput.value = li.productSale;
				            liElement.appendChild(saleInput);

				            tbody.appendChild(liElement);
				        });
					 
					 //할인 계산
					 const normal = document.getElementsByClassName('normal');
				        for (let np of normal) {
				            const productNo = np.children[0].value;
				            // 할인 계산
				            if (np.children[5].value != '0') {
				                const originPrice = parseInt(np.children[3].innerText);
				                const sale = parseInt(np.children[5].value);
				                const discount = (originPrice * (1 - sale / 100)).toLocaleString();
				                document.getElementById('discount-' + productNo).innerText = discount + '원';
				            }
				        }
					 
				 },
				 error : data => {
					 console.log(data);
				 }
			 })
			
		})
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>passion for Fashion</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
</head>
<style>
* {
	outline: none;
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

html{
	scroll-behavior: smooth;
}

ul{
	text-align: center;
}

 li{
 	display: inline-block;
 	list-style: none;
 	margin:auto;
 	margin-right: 10px;
 }
 
 li img{
  	width: 200px;
  	height: 230px;
 }
 
 li p {
 	font-weight: 200;
 }

 .aStyle {
 	color: black;
 	text-decoration: none;
 }
 
 .aStyle:hover {
 	color: black;
 	text-decoration: none;
 }
 
 .aStyle:active {
	color: black;
	text-decoration: none;
 }

#order-wrap {
	width: 1200px;
	background: white;
	height: 610px;
	display: flex;
	flex-flow: nowrap;
	justify-content: space-around;
	margin: auto;
}

.top {
	margin-bottom: 10px;
}

.productNo {
	display: inline-block;
	margin-right: 50px;
	font-size: 20px;
}



#movebtn {
	font-size: 25px;
	font-weight: 200;
}

#discount {
	display: inline-block;
	border-radius: 10px;
	font-size: 32px;
	font-weight: 300;
	width: 60px;
	height: 45px;
	text-align: center;
	color: black;
}

#discount span {
	display: inline-block;
	font-size: 15px;;
}

#productResult {
	position: relative;
	background: white;
	padding: 10px;
	margin-top: 10px;
	height: 120px;
	padding-bottom: 5px;
	display: none;
	border: 1px solid #dfdfdf;
}

.right {
	width: 40%;
}

.left {
	width: 50%;
}

.left img {
	width: 90%;
	height: 100%;
}

h2 {
	margin-right: 30px;
}

#originalPrice {
	font-size: 25px;
	text-decoration: line-through;
}

#totalPrice {
	font-size: 24px;
}

b {
	font-size: 20px;
}

.btnbox>button:nth-child(-n+3) {
	display: inline-block;
	width: 30px;
	height: 100%;
	font-size: 18px;
	background: white;
	border-style: none;
	font-weight: 200;
	margin: 0px;
	border: 1px solid #dfdfdf;
	padding: 0px;
	box-shadow: 2px 2px 2px #666;
}

.btnbox>button:nth-child(-n+3):active {
	box-shadow: 2px 2px 2px white;
}

.btnbox>button:nth-child(-n+3):hover {
	border-color: 2px sold #dfdfdf;
	color: black;
}

.btnbox {
	position: relative;
	height: 30px;
	margin-top: 15px;
	margin-bottom: 5px;
}

#buybtn {
	width: 100%;
	height: 40px;
	margin-top: 10px;
	border-radius: 5px;
	background-color: black;
	color: white;
	font-weight: 200;
}

#cartbtn {
	width: 100%;
	height: 38px;
	margin-top: 10px;
	border-radius: 5px;
	background-color: white;
	border: 1px solid #dfdfdf;
	color: dimgray;
	font-weight: 400;
}

.productCount {
	display: inline-block;
}

select {
	width: 150px;
	text-align: center;
	height: 40px;
	width: 100%;
	border: 1px solid #dfdfdf;
	color: rgb;
}

h4 {
	font-weight: 200;
}

h3 {
	font-weight: 200;
}


.productNO {
	margin: 0px;
}

p b {
	font-weight: 200;
}

.movebtn {
	float: right;
	font-weight: 200;
	font-size: 20px;
}

.reviewbox {
	width: 1100px;
	margin: auto;
	height: 50px;
	background-color: white;
	height: 50px;
	margin-top: 30px;
}

.reviewbox>h3:hover {
	color: black;
}

.reviewbox>h3 {
	text-align: center;
	background-color: white;
	width: 270px;
	display: inline-block;
	margin: 0px;
	height: 100%;
	line-height: 50px;
	border: 1px solid #dfdfdf;
	color: black;
}

.reviewbox>h3:after {
	display: block;
	content: '';
	border-bottom: solid 3px dimgray;
	transform: scaleX(0);
	transition: transform 250ms ease-in-out;
}

.reviewbox>h3:hover:after {
	transform: scaleX(1);
}

.Infobox {
	text-align: center;
	width: 1200px;
	margin: auto;;
}

.imgbox>img {
	width: 700px;;
	height: 850px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	display: block;
}

.imgbox>img:nth-child(2) {
	width: 700px;
	height: 850px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	display: block;
}

.imgbox {
	margin: auto;
	width: 1200px;
	text-align: center;
}

.textReview h2 {
	float: left;
}

.reviewNum {
	display: inline-block;
}

.productInfo {
	margin: auto;
	padding: 10px;
	width: 80%;
}

.productInfo:first-child {
	width: 60%;
	border: 1px solid #dfdfdf;
	border-top: 3px solid black;
	border-collapse: collapse;
}

.productInfo:first-child td {
	border: 1px solid #dfdfdf;
	height: 45px;
	font-weight: 200;
}

.productInfo tr td b {
	float: left;
	font-size: 12px;
	font-weight: 200;
	margin-left: 10px;
}

.productInfo tr td+td {
	margin-left: 10px;
	text-align: left;
}

.removeProudct {
	font-weight: bold;
	font-size: 20px;
	right: 10px;
	width: 30px;
	height: 30px;
	background: none;
	border-style: none;
	display: inline-block;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.buyCount {
	padding: 0px;
	margin: 0px;
	border: 1px solid #dfdfdf;
}

.buyCount:focus {
	outline: none;
}

.buyCount:hover {
	border: 1px solid #dfdfdf;
}

.size:focus {
	outline: none;
}

.reviewWrap {
	height: 450px;
	margin: auto;
}

.textbox {
	width: 100%;
}

.reviewComment {
	display: inline-block;
	background: rgb(218, 218, 218);
	border-radius: 8px;
	padding: 3px;
	color: black;
	margin-left: 5px;
}

.writeReview:hover span {
	transform: translateX(1ch);
	transition: 0.45s;
}

.product ul li:hover {
	transform: scale(1.1);
	transition: 0.45s;
}

.movebtn:hover{
	transform: translateX(1ch);
	transition: 0.45s;
}

.commProduct img:hover{
	transform: scale(1.1);
	trasition: 0.75s;
}

.recommProduct img:hover{
	transform: scale(1.1);
	trasition: 0.75s;
}

</style>
<body>
	
	<main id="order-wrap">
		<!-- 구매창 컨테이너 -->
		<div class="left">
			<!-- 구매창 왼쪽 사진 넣는 곳 -->
			<img src="${contextPath}/resources/product_img/${p.productMainPic}.jpg">
		</div>
		<div>
			<li></li>
		</div>
		<div class="right">
			<!-- 상품 정보 -->
			<div class="top">
				<div class="brandNameBox">
					<a href="${contextPath}" class="aStyle"> <h3>passion for Fashion</h3>
					<span class="movebtn">&rang;&rang;</span></a> <br> <br>
					<!-- 브랜드명 옆 > 모양 -->
				</div>
				<div style="font-size: 20px; font-weight: 200;">상품명 :   </div>
				<h2 class="productName" style="font-weight: 300; margin-bottom: 15px; font-size: 30px;">${p.productName}</h2>
				<hr style="color: #dfdfdf;">
				<div class="productNO">
					<span class="productNo" style="margin-top: 5px; margin-bottom: 5px; font-size: 20px; font-weight: 200;">No. ${p.productNo}</span>
				</div>

				<h2 id="discount" >
					${ p.discountRate }<span>%</span>
					<!-- 할인율 -->
				</h2>
				<div id="originalPrice"
					style="font-size: 25px; display: inline-block; font-weight: 200; margin-right: 180px;">
					 <fmt:formatNumber value="${p.productPrice}" pattern="#,###" /> </div>
				<span id="totalPrice" style="float: rightl; font-weight: 200;">
				<c:set var="totalPrice"  value="${ p.productPrice -(p.productPrice * p.discountRate*0.01)}" />
				<fmt:formatNumber value="${totalPrice}" pattern="###,###" />
				</span>
				<!-- 상품가격 -->
			</div>
			<div>
				배송정보
				<p>
					택배배송 | 무료
				</p>
				<h3 style="font-size: 20px;">사이즈</h3>
				<form action="${contextPath}" method="get">
					<select class='size' name='size' required>
						<!-- 사이즈 선택 창 -->
						<option value='' style="font-size: 15px;">[필수] 옵션을 선택해주세요</option>
						<option value='S'>S</option>
						<option value='M'>M</option>
						<option value='L'>L</option>
						<option value='XL'>XL</option>
					</select>


					<div id="productResult">
						<!-- 사이즈 선택시 내려오는 창 -->
						<h4 class="productName" style="font-size: 15px;">
							상품명 : ${p.productName} <span></span>
							<input type="hidden" name="productName" value="${p.productName}">
							<input type="hidden" name="productPrice" value="${p.productPrice}">
						</h4>
						<input type="hidden" name="productNo" value="${p.productNo}">
						<div class="btnbox">
							<button id="decrease" type="button">-</button>
							<input type="number" class="buyCount"
								style="height: 29px; width: 29px; text-align: center;" value="1"
								name="buyCount" max="90" min="1" readonly>
								
							<button id="increase" type="button">+</button>
							
						</div>
						<button class="removeProudct" type="button" style="float: right;">
							<img src="${contextPath}/resources/product_img/close.png" style="width: 10px;">
						</button>
						<div style="display: inline-block; margin-top: 12px; font-weight: 200;">총 상품 가격</div>
						<strong class="productPrice" style="display: inline-block; margin-top: 12px; position: right; font-weight: 200;">
						<input type="hidden" name="productPrice" value="${p.productPrice}">
						<input type="hidden" name="discountRate" value="${p.discountRate}">
						<input type="hidden" name="productMainPic" value="${p.productMainPic}">
						</strong> <br>
					</div>
						<button type="submit" id="buybtn" onclick="form.action='${contextPath}/buyProduct.pr'">구매하기</button>
						<c:if test="${ loginUser.memberPwd != null }">
							<button type="button" id="cartbtn" class="cartbtn"> 장바구니</button>
						</c:if>
<%-- 					<c:if test="${!empty loginUser}"> --%>
<!-- 						<script type="text/javascript"> -->
<!-- 		alert("로그인이 필요합니다."); -->
<!-- 						</script> -->
<%-- 					</c:if> --%>
				</form>

			</div>
		</div>
	</main>
	<div class="reviewbox">
		<!-- 상세정보 리뷰 연관 상품 반품 navbar -->
		<h3>
			<a href="javascript:window.scrollTo( 0, 2800 );" class="aStyle" style="font-size: 20px; vertical-align: bottom;"> 
				상세 정보
			</a>
		
		</h3>
		<h3>
			<a href="javascript:window.scrollTo( 0, 3500 );" class="aStyle" style="font-size: 20px; vertical-align: bottom;"> 
				리뷰
			</a>
		</h3>
		<h3>
			<a href="javascript:window.scrollTo( 0, 4250 );" class="aStyle" style="font-size: 20px; vertical-align: bottom;">
				연관 상품
			</a>
		</h3>
		<h3>
			<a href="javascript:window.scrollTo( 0, 5500 );" class="aStyle" style="font-size: 20px; vertical-align: bottom;">
			반품 및 교환
			</a>
		</h3>
	</div>
	<br>

	<div class="Infobox">
		<!-- 제품 사진 및 소개 칸 -->
		<div class="imgbox">
			<img src="${contextPath}/resources/product_img/${p.productDetailPic1}.jpg"> <img src="${contextPath}/resources/product_img/${p.productDetailPic2}.jpg"> <img
				src="${contextPath}/resources/product_img/${p.productDetailPic3}.jpg">
		</div>
		<br>
		<div class="productInfo">
			<!-- 제품소재 를 담은 박스 -->
			<table class="productInfo">
				<!-- 제품소재 및 정보 테이블 -->
				<tr>
					<td><b>제품 소재</b></td>
					<td>&nbsp;&nbsp;Rayon 70% Nylon 30%</td>
				</tr>

				<tr>
					<td><b>색상</b></td>
					<td>&nbsp;&nbsp;제품명 참조</td>
				</tr>

				<tr>
					<td><b>제조사</b></td>
					<td>&nbsp;&nbsp;passion for Fashion</td>
				</tr>

				<tr>
					<td><b>제조국</b></td>
					<td>&nbsp;&nbsp;korea</td>
				</tr>

				<tr>
					<td><b>세탁 방법 및 취급 시 주의사항</b></td>
					<td>&nbsp;&nbsp;라벨 및 고객센터 참조</td>
				</tr>

				<tr>
					<td><b>제조년원</b></td>
					<td>&nbsp;&nbsp;2023/04</td>
				</tr>

				<tr>
					<td><b>품질보증 기준</b></td>
					<td>&nbsp;&nbsp;관련 법 및 소비자 분쟁 해결기준에 따름</td>
				</tr>

				<tr>
					<td><b>A/S 책임자</b></td>
					<td>&nbsp;passion for Fashion 고객센터</td>
				</tr>
			</table>
			<br>
		</div>
	</div>
	<hr style="color: #dfdfdf; width: 90%; margin: auto;">
	<div class="reviewWrap"
		style="margin-left: 110px; margin-right: 110px; margin-top: 5px;">
		<h3 style="display: inline-block; font-size: 25px; font-weight: 200;">review</h3>
		 <span></span> 
<%-- 		<span style="font-weight: 200; margin-left: 20px;"><a  onclick="location.href='${ contextPath }/createReview/${p.productNo}.pr'" style="cursor: pointer;"> Write &rang;&rang;</a></span> --%>
		
		<div style="font-size: 20px; font-weight: 200;">★★★★☆</div>
		<div class="textbox">
			<div>
				<div class="nickName" style="font-size: 18px; margin-top: 10px; margin-bottom: 10px; display: inline-block; font-weight: 200;">user***</div>
				<span style="float: right; font-size: 20px; font-weight: 200;">2023-05-05</span>
			</div>
			<img src="${contextPath}/resources/product_img/review.jpg" alt=""
				style="width: 170px; height: 190px; display: inline-block; float: left; margin-bottom: 15px" />

			<div style="display: inline-block; width: 100%; margin-bottom: 30px;">
				<span class="reviewComment" style="font-weight: 200;">사이즈 좋아요</span> 
				<span class="reviewComment" style="font-weight: 200;">착용감 굿</span> 
				<span class="reviewComment" style="font-weight: 200;">실물이랑 같아요</span>

				<p style="margin-left: 5px; margin-top: 10px; font-weight: 200;">지난해 색상 별로 3가지 다
					구매해서 정말 활용도 있게 착용한 제품이라 두벌재 구매합니다. 색상 핏 머두 너무 맘에 듭니다. 지난해 색상 별로 3가지
					다 구매해서 정말 활용도 있게 착용한 제품이라 두벌재 구매합니다. 색상 핏 머두 너무 맘에 듭니다. 착용한 제품이라
					두벌재 구매합니다. 색상 핏 머두 너무 맘에 듭니다. 지난해 색상 별로 3가지 다 구매해서 정말 활용도 있게 착용한
					제품이라 두벌재 구매합니다. 색상 핏 머두 너무 맘에 듭니다 착용한 제품이라 두벌재 구매합니다. 색상 핏 머두 너무 맘에
					듭니다.</p>
			</div>
		</div>
<%-- 		<span style="font-weight: 200;"><a  onclick="location.href='${ contextPath }/reviewBoard/${p.productNo}.pr'" style="cursor: pointer;"> more &rang;&rang;</a></span> --%>
	</div>
	<br>
	
		<div class="commProduct" style="width:100%; height:500px;margin-top: 100px; text-align: center;">
				<h3 style="margin-bottom: 50px; display:inline-block; font-weight: 200;">commend item</h3>
				<ul>
					<li>
						<a href="${contextPath}/productDetail/detail/124.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/Half Zipup SweatShirt NavY.jpg">
							<p>Half Zipup Sweat Shirt_ Navy</p>
							<p>120,000</p>
						</a>
					</li>
					
					<li>
						<a href="${contextPath}/productDetail/detail/125.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/cloths2.jpg">
							<p>One Pocket Stand Collar Shirt_ Black</p>
							<p>148,000</p>
						</a>
					</li>
					
					<li>
						<a href="${contextPath}/productDetail/detail/126.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/cloths3.jpg">
							<p>Boucle Cable-knit Zip-up_ Down Pink</p>
							<p>145,000</p>
						</a>
					</li>
					
					<li>
						<a href="${contextPath}/productDetail/detail/127.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/cloths5.jpg">
							<p>One Tuck Curve Denim Pants_ Indigo Blue</p>
							<p>100,000</p>
						</a>
					</li>
					
					<li>
						<a href="${contextPath}/productDetail/detail/128.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/1281.jpg">
							<p>One Tuck Curve Denim Pants_ Light Blue</p>
							<p>150,000</p>
						</a>
					</li>
				</ul>
		
		</div>	
		
		<div class="recommProduct" style="width:100%; height:500px; margin-top: 15px; margin: auto; text-align: center;">
				<h3 style="margin-bottom: 50px; margin-top: 10px; font-weight: 200;">with item</h3>
				<ul>
					<li>
						<a href="${contextPath}/productDetail/detail/129.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/cloths6.jpg">
							<p>Fatigue Parachute Pants_ Light Grey</p>
							<p>145,000</p>
						</a>
					</li>
					
					<li>
						<a href="${contextPath}/productDetail/detail/130.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/shirts7.jpg">
							<p>Dewdrop Boucle Knit Cardigan_ Brown</p>
							<p>135,000</p>
						</a>
					</li>
					
					<li>
						<a href="${contextPath}/productDetail/detail/131.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/shirts5.jpg">
							<p>Stripe Shirt_ Indigo</p>
							<p>125,000</p>
						</a>
					</li>
					
					<li>
						<a href="${contextPath}/productDetail/detail/132.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/pants2.jpg">
							<p>Heavy Sweat Pants_ Navy</p>
							<p>110,000</p>
						</a>
					</li>
					
					<li>
						<a href="${contextPath}/productDetail/detail/133.pr" class="aStyle">
							<img alt="" src="${contextPath}/resources/product_img/pants1.jpg">
							<p>Wide Denim Pants_ Indigo</p>
							<p>155,000</p>
						</a>
					</li>
				</ul>
		
		</div>	
		
		<hr style="color: #dfdfdf; width: 2%; margin: auto; margin-bottom: 100px;">
		
		<div class="refundWrap" style="text-align: center;">
		<h3>배송 및 교환/환불 정보</h3>
		<br>
		<br>
			<img alt="" src="${contextPath}/resources/image/refund.jpg">
		</div>
		
<%-- 	<jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>
	<script>
	
	const productName = document.getElementsByClassName("productName")[1]; // 드롭박스에 적힐 상품명
	
	const size = document.getElementsByClassName("size"); //사이즈 선택 창
	
	let buyCount = document.getElementsByClassName("buyCount")[0]; // 상품 수량 
	const decrease = document.getElementById("decrease"); // 상품 수량 감소 버튼
	const increase = document.getElementById("increase"); // 상품 수량 증가 버튼
	let productPrice = document.getElementsByClassName("productPrice")[0];
	const buyBtn = document.getElementById("buyBtn");
	
	
	function priceToString(productPrice) {
	    return productPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	

	size[0].addEventListener("change", function(){	// select사이즈 의 value값이 바뀌면 실행
		
		for(const sizeSelect of size){
			if(sizeSelect.value != ''){	
					document.getElementById("productResult").style.display='block'; //사이즈 가 선택으로 되어있을시 display block;
					productPrice.innerText=priceToString(buyCount.value*${totalPrice});
					size[0].addEventListener("change", function(){	//사이즈를 선택 시 다시 다른 사이즈로 변경시 수량 1로 초기화
						buyCount.value = 1;

				})
				
				document.getElementsByClassName("removeProudct")[0].addEventListener("click", function(){ //x 버튼을 클릭시 수량구매창이 닫힌다.
					document.getElementById("productResult").style.display='none';
					sizeSelect.value = ''; // 사이즈를 선택으로 바뀐다.
				})
		
				
				} else if(sizeSelect.value == ''){
					document.getElementById("productResult").style.display='none';
					
				}
					productName.childNodes[1].innerText = sizeSelect.value;
					
			}
		})
		
	
	increase.addEventListener("click", function(){
		buyCount.value++;
		productPrice.innerText = priceToString(buyCount.value*${totalPrice});
		
	})
	
	decrease.addEventListener("click", function(){
		buyCount.value--;
		
		productPrice.innerText = priceToString(buyCount.value*${totalPrice});
		
		if(buyCount.value < 1){
			buyCount.value = 1
		productPrice.innerText = priceToString(buyCount.value*${totalPrice});
			
		}
	})
	
	$(document).ready(function() {
    $(".cartbtn").click(function() {
        var productNo = $("input[name='productNo']").val();
        var cartCount = $(".buyCount").val();
        var optionSize = $(".size").val();
        
        
        var data = {
            productNo: productNo,
            cartCount: cartCount,
            optionSize: optionSize
        };
        
        $.ajax({
            url: "${contextPath}/addCart.ca",
            type: "post",
            data: data,
            success: function(data) {
            	if(data > 0) {
                alert("카트 담기 성공");
            	}
            },
            error: function(data) {
                alert("카트 담기 실패");
            }
        });
    });
});
	
	
	
<!-- </script> -->

</body>
</html>
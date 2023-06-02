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


#movebtn {
	font-size: 25px;
	font-weight: 200;
}

#discount {
	display: inline-block;
	border-radius: 10px;
	font-size: 32px;
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
	border: 1px solid #4485d7;
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

.reviewbox ul {
	width:1200px;
	-webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: #4485d7;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    margin: auto;
    margin-top: 0;
    margin-bottom: 0;
    list-style: none;
    border-bottom: 1px solid #ebebeb;
    border-top: 2px solid #4485d7;
    display: table;
    padding: 0 2px;
    background: #fff;
    overflow: hidden;
	height: 66px;
}

.reviewbox ul li{
    -webkit-tap-highlight-color: #4485d7;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    list-style: none;
    display: table-cell;
    width: 1%;
    text-align: center;
    vertical-align: middle;
    font-size: 20px;
}

ul li:hover {
	border-bottom: 1px solid #4485d7;
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
	background-color: #4485d7;
	color: white;
	font-weight: 400;
	border-color: white;
}

#cartbtn {
	width: 100%;
	height: 38px;
	margin-top: 10px;
	border-radius: 5px;
	background-color: white;
	border: 1px solid #4485d7;
	color: #4485d7;
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
	border: 1px solid #4485d7;
	border-radius: 5px;
}


p b {
	font-weight: 200;
}

.movebtn {
	float: right;
	font-weight: 200;
	font-size: 20px;
}


.Infobox {
	text-align: center;
	width: 1200px;
	margin: auto;;
}

.imgbox>img {
	margin: auto;
	width: auto;
	height: auto;
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

.DetailMoreBtn{
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    font-family: 'Noto Sans KR', sans-serif;
    box-sizing: border-box;
    margin: 0;
    background: #fff;
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    padding: 30px 0 15px;
}

.review_btn{
	float:right;
	vertical-align: top;
	padding-right: 10px;
}

.review_btn a {
    font-family: 'Noto Sans KR', sans-serif;
    box-sizing: border-box;
    color: #333;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    background: #fff;
    border: 1px solid #2b2f3a;
    line-height: 1;
    padding: 10px 40px 12px;
    text-align: center;
    margin-top: -6px;
}

.review_btn img{
	width:18px;
	vertical-align: bottom;
	margin-right: 4px;
}



</style>
<body>
	
	<main id="order-wrap">
		<!-- 구매창 컨테이너 -->
		<div class="left">
			<!-- 구매창 왼쪽 사진 넣는 곳 -->
			<img src="https://recipe1.ezmember.co.kr/cache/data/goods/23/04/16/1000035599/1000035599_detail_046.jpg">
		</div>
		<div class="right">
			<!-- 상품 정보 -->
			<div class="top">
				<div class="productNameBox" style="text-align: center">
					 <h3 style="font-weight: 400; font-size: 42px;">캠핑용 후라이팬</h3>
				</div>
				<div style="margin: auto; text-align: center;">
				<br>
					<h2 id="discount" style="color: red; font-weight: 200; display: inline-block;" >
						${ p.discountRate }20<span>%</span>
						<!-- 할인율 -->
					</h2>
					<h2 style="font-weight: 200; display: inline-block; font-size: 50px;">
						450,000원
					</h2>
					&nbsp;&nbsp;
					<h4 style="display: inline-block; font-size: 40px; color: #4485d7;">♥</h4>
					<h2 style="font-weight: 100; font-size: 40px; text-decoration: line-through; text-decoration-thickness: 2px; margin-left: 30px;  color: gray;">
						540,000원
					</h2>
				</div>
			<div>
					<div class="info_delivery_area">
                        <dl class="info_delivery">
                            <dt style="font-size: 20px; padding: 5px;">
                            	<img src="resources/images/delivery.png" alt="배송아이콘" style="width: 28px; vertical-align: -8px; margin-bottom: 5px;">
                            	&nbsp;배송
                            </dt>
                            <hr>
                                </dl>
                                <dl class="info_point">
                            <dt style="font-size: 20px; padding: 5px;">
                            	<img src="resources/images/point.png" alt="포인트아이콘" style="width: 28px; vertical-align: -8px; margin-bottom: 5px;">
                            	&nbsp;적립<p style="font-size: 15px; display: inline-block;">(구매가격의 0.5% 적립)</p>
                            </dt>
                                </dl>
                                 <hr>
                                 <br>
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
						<button type="submit" id="buybtn" style="display: inline-block; width: 60%;">구매하기</button>
							<button type="button" id="cartbtn"  class="cartbtn" style="display: inline-block; width: 39%;" > 장바구니</button>
				</div>
				</form>

			</div>
		</div>
	</main>
	<div class="reviewbox">
		<ul>
			<li>상세정보</li>
			<li>후기</li>
			<li>배송환불</li>
			<li>문의</li>
		</ul>
	</div>
	<br>

	<div class="Infobox">
		<!-- 제품 사진 및 소개 칸 -->
		<div class="imgbox">
			<img src="https://recipe1.ezmember.co.kr/cache/shop/2023/04/24/5ba96dd7aef9a27712340b1795b190d3_m.jpg"> 
		</div>
		
<!-- 		<div class="DetailMoreBtn"> -->
<!-- 			<a>상세정보 더보기</a> -->
<!-- 		</div> -->
	</div>
		<br>
	
	
	<div class="reviewWrap" style=" width:1200px; margin-top: 5px; ">
	
		<div class="reviewWrap1" style="padding: 10px;">
				<h3 style="font-weight: 500; color:#4485d7; font-size: 28px; display: inline-block;">후기</h3>&nbsp;&nbsp;<span style="font-size: 24px;">1</span>

			<div class="review_btn">
				<a href="javascript:gd_open_write_popup('goodsreview', '1000030759')">
				<img src="//recipe1.ezmember.co.kr/img/mobile/icon_write2.png">후기작성</a>
			</div>
			
			<div class="photoList">
				<ul style="padding: 10px;">
					<li ><img src="img" alt=""style="width: 142px; height: 142px; display: inline-block; float: left; margin-right: 5px;" /></li>
					<li><img src="img" alt=""style="width: 142px; height: 142px; display: inline-block; float: left; margin-right: 5px;" /></li>
					<li ><img src="img"" alt=""style="width: 142px; height: 142px; display: inline-block; float: left; margin-right: 5px;" /></li>
				</ul>
			</div>
			
		</div>
		
		<div class="textbox">
			<div style="padding: 10px;">
				<div class="nickName" style="font-size: 18px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">Hype boy</div>
				
				<span style="font-size: 20px; font-weight: 200; color:#4485d7;">★★★★☆</span>
				&nbsp;
				<span style="font-size: 15px; font-weight: 200;">2023-05-05</span>
			</div>
			<img src="${contextPath}/resources/product_img/review.jpg" alt=""
				style="width: 100px; height: 100px; display: inline-block; float: left; margin-bottom: 15px; margin-right: 5px;" />
			<img src="${contextPath}/resources/product_img/review.jpg" alt=""
				style="width: 100px; height: 100px; display: inline-block; float: left; margin-bottom: 15px; margin-right: 5px;" />
			<img src="${contextPath}/resources/product_img/review.jpg" alt=""
				style="width: 100px; height: 100px; display: inline-block; float: left; margin-bottom: 15px; margin-right: 5px;" />

			<div style="display: inline-block; width: 100%; margin-bottom: 30px;">

				<p style="margin-left: 5px; margin-top: 10px; font-weight: 200;">지난해 색상 별로 3가지 다
					구매해서 정말 활용도 있게 착용한 제품이라 두벌재 구매합니다. 색상 핏 머두 너무 맘에 듭니다. 지난해 색상 별로 3가지
					다 구매해서 정말 활용도 있게 착용한 제품이라 두벌재 구매합니다. 색상 핏 머두 너무 맘에 듭니다. 착용한 제품이라
					두벌재 구매합니다. 색상 핏 머두 너무 맘에 듭니다. 지난해 색상 별로 3가지 다 구매해서 정말 활용도 있게 착용한
					제품이라 두벌재 구매합니다. 색상 핏 머두 너무 맘에 듭니다 착용한 제품이라 두벌재 구매합니다. 색상 핏 머두 너무 맘에
					듭니다.</p>
			</div>
		</div>
	</div>
	<br>
		
		<div class="refundWrap" style="text-align: center;">
		<h3>배송 및 교환/환불 정보</h3>
		<br>
		<br>
			<img alt="" src="${contextPath}/resources/image/refund.jpg">
		</div>
		

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
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
* {
	outline: none;
	margin: 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

html{
	scroll-behavior: smooth;
}

ul, li {
    list-style: none;
    padding:0px;
    margin-bottom: 0px;
}

.info_delivery{
	margin-bottom: 0px;
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
	height: auto;
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
	border: 1px solid #4485d7;
	display: none;
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

.reviewbox ul li:hover {
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

/* .cartCount { */
/* 	display: inline-block; */
/* } */

select {
	width: 150px;
	text-align: center;
	height: 40px;
	width: 100%;
	border: 1px solid #4485d7;
	border-radius: 5px;
}

select option {
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
	display: none;
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

.photoList{
	border-bottom: 1px solid #222;
}

.photoList ul {
    line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    margin-top: 0;
    margin-bottom: 0;
    list-style: none;
    display: table;
    padding: 0 2px;
    background: #fff;
    overflow: hidden;
}

.photoList ul li{
    line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    list-style: none;
    display: table-cell;
    vertical-align: middle;
    font-size: 20px;
}

.photoList ul li img {
	width: 142px; 
	height: 142px; 
	display: inline-block; 
	float: left; 
	margin-right: 5px;"
}

.reviewContent {
	padding-bottom: 10px;
	border-bottom: 1px solid #ebebeb;
}

.reviewPhoto ul {
    line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    margin-top: 0;
    margin-bottom: 0;
    list-style: none;
    display: table;
    padding: 0 2px;
    background: #fff;
    overflow: hidden;
}

.reviewPhoto ul li {
	line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    list-style: none;
    display: table-cell;
    vertical-align: middle;
    font-size: 20px;
    
}


.reviewPhoto ul li img {
	width: 100px; 
	height: 100px; 
	display: inline-block; 
	float: left; 
	margin-right: 5px;"
}

.productBox {
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    padding: 0;
    margin: 40px auto 0;
    padding-bottom: 60px;
}

.productBoxInfo{
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    margin: 0;
    margin-top: 0;
    margin-bottom: 0;
    list-style: none;
    padding: 0;
    border-top: 1px solid #ebebeb;
}

.productPageInfo{
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    list-style: none;
    border-bottom: 1px solid #ebebeb;
    position: relative;
}

[class*= "accordion_i_tit"]{
	font-family: 'Noto Sans KR', sans-serif;
    list-style: none;
    box-sizing: border-box;
    background-color: transparent;
    text-decoration: none;
    display: block;
    font-weight: 400;
    line-height: 1;
    font-size: 24px;
    color: #222;
    padding: 22px 18px 24px;
}

/* .productPageInfo .accordion_i_tit:after { */
/*     width: 12px; */
/*     height: 12px; */
/*     border-right: 1px solid #808080; */
/*     border-bottom: 1px solid #808080; */
/*     position: absolute; */
/*     right: 25px; */
/*     content: " "; */
/*     top: 30px; */
/*     transform: rotate(315deg); */
/*     -webkit-transition: all 0.1s ease-in-out; */
/*     -moz-transition: all 0.1s ease-in-out; */
/*     transition: all 0.1s ease-in-out; */
/* } */

.accodion_content dl dt {
	padding: 5px 10px 0;
    white-space: normal;
    font-weight: bold;
    color: #111111;
}

.accodion_content dl dd {
    color: #555555;
    vertical-align: top;
    padding: 20px 10px 40px;
}

.goods_accordion_qna li{
   border-bottom: 1px solid #e8e8e8;
    position: relative;
}

[class*="accordion_q_tit"]{
	display: block;
    line-height: 1;
    font-size: 15px;
    color: #222;
    padding: 14px 14px;
}
.js_detail accordion_q_cont{
	display: none;
    border-top: 1px solid #e8e8e8;
    background: #f6f6f6;
    padding: 40px 60px;
    color: #222;
    font-size: 14px;
    letter-spacing: -0.02em;
}
.pagination{
	display: inline-block;
    padding-left: 0;
    margin: 30px 0;
    border-radius: 0;
}

.qna
{
    padding: 1px 0 4px 0;
    font-size: 14px;
    width: 724px;
    display: inline-block;
    color: #888;
}

.qna_result{
    width: 70px;
    text-align: center;
    display: inline-block;
}

.qnaWrap{
    line-height: 1;
    font-size: 15px;
    color: #222;
    padding: 9px 9px;
}

.accordion_q_tit1{
	display: inline-block;
}

.accordion_i_cont3{
    display: none;
    color: #6b97a4;
    background: #fff;
    padding: 8px;
}

.review_btn_wr{
	float:right;
	vertical-align: top;
	padding-right: 10px;
}

.review_btn_wr a {
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

.review_btn_wr img{
	width:18px;
	vertical-align: bottom;
	margin-right: 4px;
}
.pagination li.on span {
    font-weight: bold;
    color: #ff5e5e;
}
.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 30px 0;
    border-radius: 0;
}

.pagination ul {
    padding: 20px 0 0;
    text-align: center;
}

#decrease{
	color:#4485d7;
	font-size:20px;
	size:32px;
	background:white;
	font-weight:bold;
	width:32px;
    background-size: 14px;
    display: inline-block;
    border: none;
    margin: -1px 0 0 6px;
}

#increase{
	color:#4485d7;
	font-size:20px;
	background:white;
	font-weight:bold;
	width:32px;
    background-size: 14px;
    display: inline-block;
    border: none;
    margin: -1px 6px 0 0;
}
.buyCount{
    padding: 0px 5px 2px;
    width: 54px;
    outline: none;
    height: 33px;
    color: #222;
    font-size: 16px;
    line-height: 31px;
    text-align: center;
    display: inline-block;
    float: none;
    border: none
}

#qnaModal{
	width: 1900px;
	height: 1900px;
	position:fixed;
	top:0px;
	left:0px;
	right: 0px;
	bottom:0px;
	background-color: white;
	justify-content: center;
	align-items: center;
}

.qnaModalContent{
	width:500px;
	height: 1800px;
}

.moreView{
	text-align: center;
    width: 350px;
    height: 90px;
    background: #4485d7;
    margin: auto;
    line-height: 90px;
    font-family: 'Noto Sans KR';
    font-size: xx-large;
    font-weight: bold;
    color: white;
}


</style>
<body>
<span>
<%@include file="../common/storeTop.jsp" %>
<br>
</span>

	<form action="${contextPath}/insertCart.ma" method="get">
	<main id="order-wrap">
		<!-- 구매창 컨테이너 -->
		<div class="left">
			<!-- 구매창 왼쪽 사진 넣는 곳 -->
			<img src="https://recipe1.ezmember.co.kr/cache/data/goods/23/04/16/1000035599/1000035599_detail_046.jpg" style="height: auto;">
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
					<h4 class="like" style="display: inline-block; font-size: 40px; color: #4485d7; ">♡</h4>
					<h2 style="font-weight: 100; font-size: 40px; text-decoration: line-through; text-decoration-thickness: 2px; margin-left: 30px;  color: gray;">
						540,000원
					</h2>
				</div>
			<div>
					<div class="info_delivery_area">
                        <dl class="info_delivery">
                            <dt style="font-size: 20px; padding: 5px;">
                            	<img src="resources/images/delivery.png" alt="배송아이콘" style="width: 28px; vertical-align: -8px;">
                            	&nbsp;배송
                            </dt>
                                </dl>
                                <hr style="margin: 0px;">
                                <dl class="info_point">
                            <dt style="font-size: 20px; padding: 5px;">
                            	<img src="resources/images/point.png" alt="포인트아이콘" style="width: 28px; vertical-align: -8px;">
                            	&nbsp;<p style="font-size: 15px; display: inline-block;">적립(구매가격의 0.5% 적립)</p>
                            </dt>
                                </dl>
                                
						<hr style="margin: 0px;">
				
					<select class='productOption' name='productOption' required>
						<!-- 사이즈 선택 창 -->
						<option value='' style="font-size: 15px;">[필수] 옵션을 선택해주세요</option>
						<option value='옵션1'>옵션1</option>
						<option value='옵션2'>옵션2</option>
						<option value='옵션3'>옵션3</option>
						<option value='옵션4'>옵션4</option>
					</select>


					<div id="productResult">
						<!-- 사이즈 선택시 내려오는 창 -->
						<h4 class="productName" style="font-size: 15px; font-weight: 200; color:light gray;">
							캠핑용 후라이팬 <span>(-20,000)</span>
							<input type="hidden" name="productNo" value="134">
							<input type="hidden" name="productName" value="캠핑용 후라이팬">
							<input type="hidden" name="productPrice" value="${p.productPrice}">
						</h4>
						<div class="btnbox" style=" margin: 0 0 0 -1px;">
							<button id="decrease" type="button">-</button>
							<input type="number" class="cartCount"
								style="" value="1" name="cartCount" min="1" readonly>
								
							<button id="increase" type="button">+</button>
							
						</div>
						<button class="removeProudct" type="button" style="float: right;">
							<img src="resources/images/close.png" style="width: 10px;">
						</button>
						<div style="display: inline-block; margin-top: 12px; font-weight: 200;">총 상품 가격</div>
						<strong class="productPrice" style="display: inline-block; margin-top: 12px; position: right; font-weight: 200;">
						<input type="hidden" name="discountRate" value="${p.discountRate}">
						</strong> <br>
					</div>
					
				</div>
					
						<button type="submit" id="buybtn" style="display: inline-block; width: 60%;">구매하기</button>
							<button type="button" id="cartbtn"  class="cartbtn" style="display: inline-block; width: 39%;" > 장바구니</button>
				</div>
			</div>
		</div>
	</main>
</form>
<br>
		
	
<div class ="productInfoMain" st>
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
				<h3 style="font-weight: 500; color:#4485d7; font-size: 28px; display: inline-block;">후기</h3>&nbsp;&nbsp;<span style="font-size: 24px;">${textboxCount}</span>

			<div class="review_btn">
				<a href="createReview.ma">
				<img src="//recipe1.ezmember.co.kr/img/mobile/icon_write2.png">후기작성</a>
			</div>
			<div class="photoList">
				<ul style="padding: 10px;">
					<li ><img src="img" alt="" /></li>
					<li><img src="img" alt="" /></li>
					<li ><img src="img"" alt=""/></li>
				</ul>
			</div>
		</div>
		
		<div class="textbox">
			<div style="padding: 10px;">
				<div class="nickName" style="font-size: 18px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">Hype boy</div>
				
				<span style="font-size: 20px; font-weight: 200; color:#4485d7;">★★★★☆</span>
				&nbsp;
				<span style="font-size: 15px; font-weight: 200;">2023-05-05</span>
				
				<div class="reviewPhoto">
					<ul style="padding: 10px;">
						<li ><img src="img" alt="" /></li>
						<li><img src="img" alt="" /></li>
						<li ><img src="img"" alt=""/></li>
					</ul>
				</div>
			</div>
			
				
			<div style="display: inline-block; width: 100%; margin-bottom: 30px;">

				<div class="reviewContent" style="margin-left: 5px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">
					상품이 좋네요 실물과 비슷해요 배송도 빠르고 너무 좋네요 색깔별로 살려구요 \(*ㅠ*)b!!
					</div>
			</div>
			
		</div>
		
		
		
		<div class="textbox">
			<div style="padding: 10px;">
				<div class="nickName" style="font-size: 18px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">Hype boy</div>
				
				<span style="font-size: 20px; font-weight: 200; color:#4485d7;">★★★★☆</span>
				&nbsp;
				<span style="font-size: 15px; font-weight: 200;">2023-05-05</span>
				
				<div class="reviewPhoto">
					<ul style="padding: 10px;">
						<li ><img src="img" alt="" /></li>
						<li><img src="img" alt="" /></li>
						<li ><img src="img"" alt=""/></li>
					</ul>
				</div>
			</div>
			
				
			<div style="display: inline-block; width: 100%; margin-bottom: 30px;">

				<div class="reviewContent" style="margin-left: 5px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">
					상품이 좋네요 실물과 비슷해요 배송도 빠르고 너무 좋네요 색깔별로 살려구요 \(*ㅠ*)b!!
					</div>
			</div>
			
		</div>
		<div class="textbox">
			<div style="padding: 10px;">
				<div class="nickName" style="font-size: 18px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">Hype boy</div>
				
				<span style="font-size: 20px; font-weight: 200; color:#4485d7;">★★★★☆</span>
				&nbsp;
				<span style="font-size: 15px; font-weight: 200;">2023-05-05</span>
				
				<div class="reviewPhoto">
					<ul style="padding: 10px;">
						<li ><img src="img" alt="" /></li>
						<li><img src="img" alt="" /></li>
						<li ><img src="img"" alt=""/></li>
					</ul>
				</div>
			</div>
			
				
			<div style="display: inline-block; width: 100%; margin-bottom: 30px;">

				<div class="reviewContent" style="margin-left: 5px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">
					상품이 좋네요 실물과 비슷해요 배송도 빠르고 너무 좋네요 색깔별로 살려구요 \(*ㅠ*)b!!
					</div>
			</div>
			
		</div>
		<div class="textbox">
			<div style="padding: 10px;">
				<div class="nickName" style="font-size: 18px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">Hype boy</div>
				
				<span style="font-size: 20px; font-weight: 200; color:#4485d7;">★★★★☆</span>
				&nbsp;
				<span style="font-size: 15px; font-weight: 200;">2023-05-05</span>
				
				<div class="reviewPhoto">
					<ul style="padding: 10px;">
						<li ><img src="img" alt="" /></li>
						<li><img src="img" alt="" /></li>
						<li ><img src="img"" alt=""/></li>
					</ul>
				</div>
			</div>
			
				
			<div style="display: inline-block; width: 100%; margin-bottom: 30px;">

				<div class="reviewContent" style="margin-left: 5px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">
					상품이 좋네요 실물과 비슷해요 배송도 빠르고 너무 좋네요 색깔별로 살려구요 \(*ㅠ*)b!!
					</div>
			</div>
			
		</div>
	
				<div class="moreView">더보기</div>
				
				
				
				
	<div class="productBox">
		<ul	class="productBoxInfo">
			<li class="productPageInfo">
				<a class="accordion_i_tit" data-bdid="info">상품정보</a>			
				<div class="accordion_i_cont" style="display: none;">
					<div class="accodion_content">
                        <dl>
                            <dt>제품의 유형</dt>
                            <dd>상세 페이지 참고</dd>
                        </dl>
                        <dl>
                            <dt>생산자 및 소재지</dt>
                            <dd>상세 페이지 참고</dd>
                        </dl>
                        <dl>
                            <dt>제조연월일 및 유통기한</dt>
                            <dd>상세 페이지 참고</dd>
                        </dl>
                        <dl>
                            <dt>포장 단위별 용량(중량), 수량</dt>
                            <dd>상세 페이지 참고</dd>
                        </dl>
                        <dl>
                            <dt>원재료명 및 함량</dt>
                            <dd>상세 페이지 참고</dd>
                        </dl>
                        <dl>
                            <dt>소비자 상담 전화번호</dt>
                            <dd>1234-1033</dd>
                        </dl>
                    </div>
                </div>
			</li>
			<li class="productPageInfo">
				<a class="accordion_i_tit2" data-bdid="info">배송/환불/교환</a>
					<div class="accordion_i_cont2" style="display: none;">
						<dl>
                            <dt><h3 style="margin-left: 30px; margin-top: 20px;">배송안내</h3></dt>
                            <dd>
                                <div class="admin_msg"><div style="text-align: center;" align="center"><img src="https://ai.esmplus.com/nowhome22/%EC%83%81%ED%92%88%EB%B3%B4%EA%B8%B0/%EB%B0%B0%EC%86%A1%EC%95%88%EB%82%B4_5000.jpg"></div></div>
                            </dd>
        
                            <dt><h3>교환/반품시 주의사항</h3></dt>
                            <dd>
                                <div class="admin_msg">
                                    <p>
                                        <strong><span style="font-size: 10pt;">- 판매 업체마다 반품 회수지와 택배사가 다르므로 네이버페이로 결제하셨을 경우 반품접수가 불가합니다. (고객센터로 문의하시기 바랍니다.)</span></strong>
                                    </p>
                                </div>
                            </dd>

                            <dt><h3>판매자 정보</h3></dt>
                            <dd>
                                <table style="width:100%;">
                                    <tbody><tr>
                                        <th style="width:150px;">상호 / 대표</th>
                                        <td>주식회사 ㅎㄹㅅㄲ / 박신우</td>
                                        <th style="width:150px;">사업장 소재지</th>
                                        <td>서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</td>
                                    </tr>
                                    <tr>
                                        <th style="width:150px;">e-mail</th>
                                        <td>hollosekki@google.co.kr</td>
                                        <th style="width:150px;">연락처</th>
                                        <td>1133-1234</td>
                                    </tr>
                                    <tr>
                                        <th style="width:150px;">통신판매업 신고번호</th>
                                        <td>2023-서울중구-11133</td>
                                        <th style="width:150px;">사업자번호</th>
                                        <td>333-10-02541</td>
                                    </tr>
                                </tbody></table>
                            </dd>
        					<br>
                            <dt style="background:#E3F6FF; border:1px solid #ddd; padding:9px 12px 10px; border-radius:6px;">본 상품과 컨텐츠는 입점 판매자가 등록한 것으로 (주)홀로세끼는 통신판매중개자로서 거래 당사자가 아니기 때문에 그 내용과 거래에 대한 책임을 일체 지지 않습니다.<br>
                                <span style="color:#065E87;">홀로세끼 쇼핑몰 내 모든 사진 및 컨텐츠를 무단 사용 시 법적 조치를 받을 수 있습니다.</span></dt>
                            <dd></dd>
                        </dl>
                      </div> 
					</li>
				</ul>
				<li id="page-qna" class="accordion_i_li">
                <a class="accordion_i_tit3">문의<span>(2)</span></a>
                <div class="accordion_i_cont3" style="padding-top: 5px; display: block;">
                    <div id="ajax-goods-goodsqa-list">
                    
              	<ul class="goods_accordion_qna">
              	
        <!--  반복 될 부분 -->      	
             <li class="accordion_q_li js_data_row" >
                <div class="accordion_q_tit1">
                   
                    <div class="qna">
                        상품문의 입니다.
                    </div>
                        <span class="writer" style="margin-right: 60px">조단</span>
                        <span class="rv_cont_date" style="margin-right: 60px">2023.01.31</span>
                        <span class="qna_result" style="float: right;">답변완료</span>
                    
                
                </div>
                <div class="js_detail accordion_q_cont"></div>
            </li>
            <!-- 여기 까지 반복 -->
            
            <li class="accordion_q_li js_data_row" >
                <div class="accordion_q_tit1">
                   
                    <div class="qna">
                        상품문의 입니다.
                    </div>
                        <span class="writer" style="margin-right: 60px">조단</span>
                        <span class="rv_cont_date" style="margin-right: 60px">2023.01.31</span>
                        <span class="qna_result" style="float: right;">답변완료</span>
                    
                
                </div>
                <div class="js_detail accordion_q_cont"></div>
            </li>
            
            
			</ul>
				<div class="photoreview_tit3" style="padding: 20px 0 0 12px;">
				    <div class="review_btn_wr"><a href="createqna.ma">
				    	<img src="//recipe1.ezmember.co.kr/img/mobile/icon_write2.png">문의하기</a>
				    </div>
				</div>
								<div class="pagination" style="display: block">
							<ul>
								<li class="on">
								<span>1</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
          	</li>
	</div>
</div><!-- 전체를 감싸는 박스 -->



	<script>
	
	$('.accordion_i_tit').click(function(){
		$('.accordion_i_cont').toggle(400);
	})
	$('.accordion_i_tit2').click(function(){
		$('.accordion_i_cont2').toggle(400);
	})
	$('.accordion_i_tit3').click(function(){
		$('.accordion_i_cont3').toggle(400);
	})

   const productName = document.getElementsByClassName("productName")[0]; // 드롭박스에 적힐 상품명
   
   const productOption = document.getElementsByClassName("productOption"); //사이즈 선택 창
   
   let cartCount = document.getElementsByClassName("cartCount")[0]; // 상품 수량 
   const decrease = document.getElementById("decrease"); // 상품 수량 감소 버튼
   const increase = document.getElementById("increase"); // 상품 수량 증가 버튼
   let productPrice = document.getElementsByClassName("productPrice")[0];
   const buyBtn = document.getElementById("buyBtn");
   const removeProudct = document.getElementsByClassName("removeProudct")[0];
   const result = document.getElementById("productResult");
   const like = document.querySelector(".like");
   
      like.addEventListener("click", function() {
	    if(like.innerText === '♡') {
	        like.innerText = '♥';
	    } else like.innerText ='♡';
	});
   
      
      for(let op of productOption){
			if(op.value != ''){	
					document.getElementById("productResult").style.display='block'; //사이즈 가 선택으로 되어있을시 display block;
					productPrice.innerText=priceToString(cartCount.value*450000)
					productOption[0].addEventListener("change", function(){	//사이즈를 선택 시 다시 다른 사이즈로 변경시 수량 1로 초기화
						cartCount.value = 1;
				})
			
      document.getElementsByClassName("removeProudct")[0].addEventListener("click", function(){ //x 버튼을 클릭시 수량구매창이 닫힌다.
			document.getElementById("productResult").style.display='none';
			op.value = ''; // 사이즈를 선택으로 바뀐다.
		})
      
      
      
      
      
      
   
   
   function priceToString(productPrice) {
       return productPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
   }
   
   
   removeProudct.addEventListener("click",function(){
	   document.getElementById("productResult").style.display="none";
   })

   
   increase.addEventListener("click", function(){
      cartCount.value++;
      productPrice.innerText = priceToString(cartCount.value*450000);
      
   })
   
   decrease.addEventListener("click", function(){
      cartCount.value--;
      
      productPrice.innerText = priceToString(cartCount.value*450000);
      
      if(cartCount.value < 1){
         cartCount.value = 1
      productPrice.innerText = priceToString(cartCount.value*450000);
         
      }
   })
   
	
$(function(){
    $(".textbox").slice(0, 2).show(); // 초기갯수
    $(".moreView").click(function(e){ // 클릭시 more
        e.preventDefault();
        $(".textbox:hidden").wrapAll().show(); // 클릭시 more 갯수 지저정
        if($(".textbox:hidden").length == 0){ // 컨텐츠 남아있는지 확인
        	$(".moreView").hide(); // 컨텐츠 없을시 alert 창 띄우기 
        }
    });
});
	
 
  
	let textboxCount = document.getElementsByClassName("textbox").length;	   
  
	
	
	$(document).ready(function() {
    $(".cartbtn").click(function() {
        var productNo = $("input[name='productNo']").val();
        var cartCount = $(".cartCount").val();
        var productOption = $(".productOption").val();
        
        console.log(productNo);
        console.log(cartCount);
        console.log(productOption);
        
        
        var data = {
            productNo: productNo,
            cartCount: cartCount,
            productOption: productOption
        };
        
        $.ajax({
            url: "insertCart.ma",
            type: "post",
            data: data,
            success: function(data) {
            	if(data > 0) {
                alert("상품이 장바구니에 담겼습니다.");
            	}
            },
            error: function(data) {
                alert("상품이 장바구니에 담기지 못했습니다.");
            }
        });
    });
});
	
	
	 </script> 

</body>
</html>
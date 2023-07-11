><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>admin</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

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

h4{
	margin-bottom: 0px;
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

.productResultSet {
    position: relative;
    background: white;
    padding: 10px;
    margin-top: 10px;
    height: 71px;
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

/* select { */
/* 	width: 150px; */
/* 	text-align: center; */
/* 	height: 40px; */
/* 	width: 100%; */
/* 	border: 1px solid #4485d7; */
/* 	border-radius: 5px; */
/* } */

/* select option { */
/* 	width: 150px; */
/* 	text-align: center; */
/* 	height: 40px; */
/* 	width: 100%; */
/* 	border: 1px solid #4485d7; */
/* 	border-radius: 5px; */
/* } */


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


.cartCount {
	padding: 0px;
	margin: 0px;
	border: 1px solid #dfdfdf;
	width: 50px;
	text-align: center;
    padding-left: 7px;
}

.cartCount:focus {
	outline: none;
}

.cartCount:hover {
	border: 1px solid #dfdfdf;
}

.cartCount:focus {
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

.decrease{
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

.increase{
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
.optionBox{
	border: 2px solid rgba(0,0,0,0.2);
	padding: auto;
	text-align: right;
}
.optionName, .optionValue{
	width:200px;
	height:35px;
	text-align: center;
}

</style>
<body>
<span>
<%@include file="../common/storeTop.jsp" %>
<br>
</span>
	<form id="toolInsertForm" action="${contextPath}/adminToolInsert.ad" method="post" enctype="multipart/form-data">
		<input type="hidden" name="optionCount">
		<main id="order-wrap">
			<!-- 구매창 컨테이너 -->
			<div class="left">
				<!-- 구매창 왼쪽 사진 넣는 곳 -->
				<div style="width:540px; height:540px;">
					<img class="previewImage" src="${contextPath}/resources/images/logo.png" style="width:540px; height:540px;">
				</div>
				<label>대표이미지 - </label>
				<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">
				<p style="font-size: 12px; color: gray">최적 이미지 비율은 1:1입니다.</p>
				<label>상세이미지 - </label>
				<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">
				<p style="font-size: 12px; color: gray">가로는 최대 1200px입니다.</p>
			</div>
			<div class="right">
				<!-- 상품 정보 -->
				<div class="top">
					<div style="text-align: center; margin-bottom:0px;">
 						<input type="text" name="toolName" placeholder="상품 이름" style="font-weight: 400; font-size: 42px; width: 100%; margin-bottom:50px;">
						<textarea name="toolContent" placeholder="상품 소개" style="font-weight: 400; font-size: 20px; width: 100%; height:150px; margin-bottom:50px;"></textarea>
					</div>
					<div class="d-flex justify-content-end">
						<table class="d-flex text-center priceBox" style="margin-bottom: 30px;">
							<tr>
								<th>단가</th>
								<th></th>
								<th>할인율</th>
								<th></th>
								<th colspan="2">최종가격</th>
							</tr>
							<tr>
								<td>
									<input type="number" name="productPrice" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" min="0">
								</td>
								<td style="width: 50px; font-size: 16px; font-weight: bold; text-align: left;">원 - </td>
								<td>
									<input type="number" name="productSale" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" min="0" max="99.9">
								</td>
								<td style="width: 50px; font-size: 16px; font-weight: bold; text-align: left;">% =</td>
								<td>
									<input type="number" class="totalPrice" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" readonly>
								</td>
								<td style="width: 30px; font-size: 16px; font-weight: bold; text-align: left;">원</td>
							</tr>
							<tr style="height:20px;"></tr>
							<tr>
								<td colspan="2"></td>
								<td><b>재고</b></td>
								<td colspan="2" style="text-align: right;">
									<input type="number" name="productStock" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" min="0">
								</td>
								<td>개</td>
							</tr>
							<tr style="height:30px; "></tr>
							<tr>
								<td colspan="5" style="text-align:right;">
									<b style="margin-right: 20px;">분류</b>
									<select name="toolType" style="height:50px; width:163px;">
										<option value="0">- - 분류 - -</option>
										<option value="1">조리도구</option>
										<option value="2">보관용품</option>
										<option value="3">기타</option>
									</select>
								</td>
							</tr>
							<tr style="height:30px; "></tr>
							<tr>
								<td colspan="5">
									<div>
										<span style="width:50%; padding-right: 9px; text-align: right; display: inline-block;"><b>옵션여부</b></span>
										<input type="hidden" name="productOption" value="Y">
										<button type="button" class="pOption" style="width:15%; background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">Y</button>
										<button type="button" class="pOption" style="width:15%; background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; height: 30px; font-size: 14px;">N</button>
										<span class="col-5"></span>
									</div>
								</td>
							</tr>
						</table>
					</div>						
					
					<div class="optionBoxMain">
						<div class="optionBox row">
							<input type="hidden" name="optionTotal" class="optionTotal"> 
							<input type="text" class="optionName col-4" placeholder="옵션이름">
							<button type="button" class="col-1 addNameBtn">+</button>
							<button type="button" class="col-1 delNameBtn">-</button>
							<input type="text" class="optionValue col-4" placeholder="옵션내용">
							<button type="button" class="col-1 addValBtn">+</button>
							<button type="button" class="col-1 delValBtn">-</button>
						</div>
					</div>
				</div>
			</div>
		</main>
	</form>
	<hr>
<!-- 	<div style="width:540px; height:540px;"> -->
<%-- 		<img class="previewImage" src="${contextPath}/resources/images/Logo.png" style="width:540px; height:540px;"> --%>
<!-- 	</div> -->
	<div class="productInfoMain">
	<br>

		<div class="Infobox">
			<!-- 제품 사진 및 소개 칸 -->
			<div class="imgbox">
				<img class="previewImage" src="${contextPath}/resources/images/logo.png" >
			</div>
		</div>
		<br>
		
	</div><!-- class="productInfoMain -->
	<hr>
	<div class="d-flex justify-content-center mb-5">
		<div class="d-flex">
			<button onclick="checkSubmit()" type="button" class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">작성하기</button>
			<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
		</div>
	</div>
	<br><br><br><br><br><br><br><br>


	<script>
		window.onload = () => {
			
// 			이미지 미리보기 함수, 이벤트
			const imageFile = document.getElementsByName('imageFile');
			const previewImage = document.getElementsByClassName('previewImage');
			
			function readImage(imageFile, i) {
			    // 인풋 태그에 파일이 있는 경우
			    if(imageFile.files && imageFile.files[0]) {
			        // 이미지 파일인지 검사 (생략)
			        // FileReader 인스턴스 생성
			        const reader = new FileReader()
			        // 이미지가 로드가 된 경우
			        reader.onload = e => {
			            previewImage[i].src = e.target.result
			        }
			        // reader가 이미지 읽도록 하기
			        reader.readAsDataURL(imageFile.files[0])
			    }
			}
			
			// input file에 change 이벤트 부여
			for(let i = 0; i<imageFile.length; i++){
				imageFile[i].addEventListener("change", e => {
				    readImage(e.target, i);
				})
			}
			
// 			상품등록 버튼 이벤트
			const pPrice = document.getElementsByName('productPrice')[0];
			const pSale = document.getElementsByName('productSale')[0];
			const pStock = document.getElementsByName('productStock')[0];
			const tPrice = document.getElementsByClassName('totalPrice')[0];

// 			잘못된 값 거르기 / 가격*할인율 계산 이벤트 
			pPrice.addEventListener('change', ()=>{
				if(pPrice.value < 0){
					pPrice.value = 0;
				}else if(pPrice.value <= 0){
					pPrice.value = 0;
				}
				cal();
			});
			pSale.addEventListener('change', ()=>{
				if(pSale.value > 99.9){
					pSale.value = 99.9;
				}else if(pSale.value <= 0){
					pSale.value = 0;
				}
				cal();
			});
			pStock.addEventListener('change', ()=>{
				if(pStock.value <= 0){
					pStock.value = 0;
				}
			})
			
			cal();
			
			
			
// 			옵션여부 버튼 이벤트
			const opBtns = document.getElementsByClassName('pOption');
			const pOption = document.getElementsByName('productOption')[0];
			
			opBtns[0].addEventListener('click', () => {
				pOption.value = opBtns[0].innerText;
				opBtns[0].style.background = "#19A7CE";
				opBtns[1].style.background = "gray";
				document.getElementsByClassName('optionBoxMain')[0].style.opacity = "1";
			});
			opBtns[1].addEventListener('click', () => {
				pOption.value = opBtns[1].innerText;
				opBtns[1].style.background = "#19A7CE";
				opBtns[0].style.background = "gray";
				document.getElementsByClassName('optionBoxMain')[0].style.opacity = "0.3";
			});
			
			
//		 	옵션 기본 +/- 버튼 이벤트 추가
			const optionBoxMain = document.getElementsByClassName('optionBoxMain')[0];
			const optionBoxMainHTML = document.getElementsByClassName('optionBoxMain')[0].innerHTML;
			const addNameBtn = document.getElementsByClassName('addNameBtn')[0];
			const delNameBtn = document.getElementsByClassName('delNameBtn')[0];
			const addValBtn = document.getElementsByClassName('addValBtn')[0];
			const delValBtn = document.getElementsByClassName('delValBtn')[0];
			
			addName(optionBoxMainHTML);
			delName();
			addVal();
			delVal();
		}
		
//	 	옵션 +/- 버튼 이벤트 함수
		function addName(copyHtml){
			const optionBoxMain = document.getElementsByClassName('optionBoxMain')[0];
			const addNameBtns = document.getElementsByClassName('addNameBtn');
			lastAddNameBtn = addNameBtns[addNameBtns.length-1];
			lastAddNameBtn.addEventListener('click', ()=>{
				optionBoxMain.insertAdjacentHTML("beforeend", copyHtml);
				addName(copyHtml);
				delName();
				addVal();
				delVal();
			})
		}
		function delName(){
			const optionBoxMain = document.getElementsByClassName('optionBoxMain')[0];
			const delNameBtns = document.getElementsByClassName('delNameBtn');
			lastDelNameBtn = delNameBtns[delNameBtns.length-1];
			lastDelNameBtn.addEventListener('click', function(){
				const optionBoxs = optionBoxMain.querySelectorAll('.optionBox');
				if(optionBoxs.length > 1){
					this.parentElement.remove();
				}
			})
		}
		function addVal(){
			const addValBtns = document.getElementsByClassName('addValBtn');
			lastAddValBtn = addValBtns[addValBtns.length-1];
			lastAddValBtn.addEventListener('click', function(){
				const optionBox = this.parentElement;
				optionBox.insertAdjacentHTML("beforeend",
						'<p class="col-6"></p><input type="text" class="optionValue col-4" placeholder="옵션내용">');
			})
		}
		function delVal(){
			const delValBtns = document.getElementsByClassName('delValBtn');
			lastDelValBtn = delValBtns[delValBtns.length-1];
			lastDelValBtn.addEventListener('click', function(){
				const optionBox = this.parentElement;
				if(optionBox.querySelectorAll('.optionValue').length > 1){
					optionBox.lastChild.remove();
					optionBox.lastChild.remove();
				}
			})
		}
		
// 		가격 계산 함수
		function cal(){
			const pPrice = document.getElementsByName('productPrice')[0];
			const pSale = document.getElementsByName('productSale')[0];
			const tPrice = document.getElementsByClassName('totalPrice')[0];
			tPrice.value = Math.round(pPrice.value * (1 - pSale.value * 0.01));
		}
		
// 		option값 설정 함수
		function setOption(){
			const optionBoxMain = document.getElementsByClassName('optionBoxMain')[0];
			const optionBoxs = document.querySelectorAll('.optionBox');
			for(let j = 0; j<optionBoxs.length; j++){
				const opName = optionBoxs[j].querySelector('.optionName');
				const opVal = optionBoxs[j].querySelectorAll('.optionValue');
				const opHidden = optionBoxs[j].querySelector('.optionTotal');
				opHidden.value = opName.value;
				for(let i = 0; i<opVal.length; i++){
					opHidden.value += "@"+opVal[i].value;
				}
			}
			document.getElementsByName('optionCount')[0].value = optionBoxs.length;
		}
		
// 		submit 전 값 설정 및 검토
		function checkSubmit(){
			setOption();
			
			if(document.getElementsByName('toolName')[0].value.trim() == ''){
				alert("상품 이름을 입력해주세요.");
				document.getElementsByName('toolName')[0].focus();
			}else if(document.getElementsByName('toolType')[0].value == 0){
				alert("분류를 선택해주세요.");
				document.getElementsByName('toolType')[0].focus();
			}else if(document.getElementsByName('productStock')[0].value.trim() == ''){
				alert("재고를 입력해주세요.");
				document.getElementsByName('productStock')[0].focus();
			}else if(document.getElementsByName('toolContent')[0].value.trim() == ''){
				alert("상품 소개 내용을 입력해주세요.");
				document.getElementsByName('toolContent')[0].focus();
			}else if(document.getElementsByName('imageFile')[0].value == false){
				alert("상품 대표 이미지를 등록해주세요.");
				document.getElementsByName('imageFile')[0].focus();
			}else if(document.getElementsByName('imageFile')[1].value == false){
				alert("상품 상세 이미지를 등록해주세요.");
				document.getElementsByName('imageFile')[1].focus();
			}else{
				let pass = "Y";
// 				옵션버튼 선택에 따라 제외할지 여부 결정
				if(document.getElementsByName('productOption')[0].value == "Y"){
					const opName = document.getElementsByClassName('optionName');
					const opValue = document.getElementsByClassName('optionValue');
					for(let i = 0; i < opName.length; i++){
						if(opName[i].value.trim() == ''){
							pass = "N";
							opName[i].focus();
							alert("옵션이름을 모두 입력해주세요.");
							break;
						}
					}
					if(pass == "Y"){
						for(let i = 0; i < opValue.length; i++){
							if(opValue[i].value.trim() == ''){
								pass = "N";
								alert("옵션내용을 모두 입력해주세요.");
								opValue[i].focus();
								break;
							}
						}
					}
				}
				if(pass == "Y"){
					document.getElementById('toolInsertForm').submit();
				}
			}
		}
		
</script> 

</body>
</html>
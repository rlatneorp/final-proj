<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>Hollo Store</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>

#shop{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

* {
   outline: none;
   margin: 0px;
   font-family: 'Noto Sans KR', sans-serif;
}

/*    모달 */
   .modal-body{text-align: center;}
   .bi-check-circle-fill{font-size: 60px; color: #B0DAFF;}
   .bi-x-circle-fill{font-size: 60px; color: #d55b67;}
   .btn-n{background: #4485d7; color: white; border: 1px solid #4485d7; border-radius: 5px; height:40px;}
   .btn-n:hover{background: white; color: #4485d7;}
   .btn-y{background: white; color: #4485d7; border: 1px solid #4485d7; border-radius: 5px; height:40px;}
   .btn-y:hover{background: #4485d7; color: white;}

   #modalNick{display: inline-block;}
   #modalInfo{height: 100px;}

   .modalMid{display: flex; flex-basis: 100%; align-item: center; color: rgba(0,0,0,1); font-size: 15px; margin: 5px 0px; font-weight: bold;}
   .modalMid::before{content: ""; flex-grow: 1; margin: 10px 10px 10px 10px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0spx;}
   .modalMid::after{content: ""; flex-grow: 1; margin: 10px 10px 10px 10px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}
   
   .modalMenu{font-weight: bold; background-color: lightgray; width: 180px; height: 50px;}
   .moCon{height: 75px; border-radius: 10px;}


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
/*    display: inline-block; */
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
/*    margin: auto; */
   width: auto;
   height: auto;
   margin-top: 20px;
   margin-bottom: 20px;
/*    display: block; */
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

/* .textbox { */
/*    width: 100%; */
/* } */


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

.review_desc:active{
   font-weight: 600;
   color: #4485d7;
}
.review_desc:hover{
   font-weight: 600;
   color: #4485d7;
   cursor: pointer;
}
.review_stardesc:active{
   font-weight: 600;
   color: #4485d7;
}
.review_stardesc:hover{
   font-weight: 600;
   color: #4485d7;
   cursor: pointer;
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


</style>
<body>
   <span>
      <%@include file="../common/storeTop.jsp" %>
      <br>
   </span>
   <form action="${contextPath}/insertCart.ma" method="post">
      <main id="order-wrap">
         <!-- 구매창 컨테이너 -->
         <div class="left">
            <!-- 구매창 왼쪽 사진 넣는 곳 -->
            
            <c:if test="${ toolMainImage ne null}">
	            <c:forEach items="${toolMainImage}" var="main">
	               <img src="${ contextPath }/resources/uploadFiles/${main.imageRenameName}" style="height: auto;">
	            </c:forEach>
	        </c:if>
	        
            <c:if test="${ foodMainImage ne null}">
	            <c:forEach items="${foodMainImage}" var="main">
	               <img src="${ contextPath }/resources/uploadFiles/${main.imageRenameName}" style="height: auto;">
	            </c:forEach>
	        </c:if>
	        
            <c:if test="${ ingredientMainImage ne null}">
	            <c:forEach items="${ingredientMainImage}" var="main">
	               <img src="${ contextPath }/resources/uploadFiles/${main.imageRenameName}" style="height: auto;">
	            </c:forEach>
	        </c:if>
	        
         </div>
         <div class="right">
            <!-- like 유무 가리는 용도 -->
            <input type="hidden" id="likeYn" value="${like }">
            <!-- 상품 정보 -->
            <div class="top">
            	<c:if test="${ tool ne null }">
	               <div class="productNameBox" style="text-align: center; margin-bottom:0px;">
	                   <span style="font-weight: 400; font-size: 38px;">${ tool.toolName } </span>
	               </div>
	            </c:if>
	            
            	<c:if test="${ food ne null }" >
	               <div class="productNameBox" style="text-align: center; margin-bottom:0px;">
	                   <span style="font-weight: 400; font-size: 38px;">${ food.foodName } </span>
	               </div>
	            </c:if>
	            
            	<c:if test="${ ingredient ne null }">
	               <div class="productNameBox" style="text-align: center; margin-bottom:0px;">
	                   <span style="font-weight: 400; font-size: 42px;">${ ingredient.ingredientName } </span>
	               </div>
	            </c:if>
               <div style="margin: auto; text-align: center;">
                  <br>
                  <h2 id="discount" style="color: red; font-weight: 200; display: inline-block;" >
                     ${ p.productSale }<span>%</span>
                     <!-- 할인율 -->
                  </h2>
                  <h2 style="font-weight: 200; display: inline-block; font-size: 50px;">
                     <c:set var="total" value="${ p.productPrice - (p.productPrice * (p.productSale *0.01))}" />
                     <fmt:formatNumber value="${ total }" groupingUsed="true"/>원
                  </h2>
                  &nbsp;&nbsp;
                  <c:if test="${like ne null}">
                     <h4 id="like" class="like" style="display: inline-block; font-size: 40px; color: #4485d7; cursor: pointer;">♥</h4>
                  </c:if>
                  <c:if test="${like eq null}">
                     <h4 id="like" class="like" style="display: inline-block; font-size: 40px; color: #4485d7; cursor: pointer;">♡</h4>
                  </c:if>
                  <h2 style="font-weight: 100; font-size: 40px; text-decoration: line-through; text-decoration-thickness: 2px; margin-left: 30px;  color: gray;">
                     <fmt:formatNumber value="${ p.productPrice }" groupingUsed="true"/>원
                  </h2>
               </div>
               <div>
                  <div class="productSet">
                     <div style="text-align: center">
                        <span style="font-size: 40px; font-weight: 400; color:#4485d7; class="reviewStar">
                           <c:if test="${starAvg  eq  5 }" >★★★★★&nbsp&nbsp(5)</c:if>
                           <c:if test="${starAvg  eq  4 }" >★★★★☆&nbsp&nbsp(4)</c:if>
                           <c:if test="${starAvg  eq  3 }" >★★★☆☆&nbsp&nbsp(3)</c:if>
                           <c:if test="${starAvg  eq  2 }" >★★☆☆☆&nbsp&nbsp(2)</c:if>
                           <c:if test="${starAvg  eq  1 }" >★☆☆☆☆&nbsp&nbsp(1)</c:if>
                           <c:if test="${starAvg  eq  0 }" >☆☆☆☆☆&nbsp&nbsp(0)</c:if>
                        </span>
                     </div>
                     <dl class="info_delivery">
                               <dt style="font-size: 20px; padding:5px; height:45px">
                                  <img src="resources/images/delivery.png" alt="배송아이콘" style="width: 28px; vertical-align: -8px;">
                                  &nbsp;배송
                               </dt>
                     </dl>
                          <hr style="margin: 0px;">
                     <dl class="info_point" style="margin: 0px;">
                        <dt style="font-size: 20px; padding: 5px; height:45px"">
                           <img src="resources/images/point.png" alt="포인트아이콘" style="width: 28px; vertical-align: -8px;">
                                  &nbsp;<p style="font-size: 15px; display: inline-block;">적립(구매가격의 0.5% 적립)</p>
                        </dt>
                     </dl>
                     <hr style="margin: 0px;">

				<c:if test="${ options ne null }">
                     <c:forEach items="${options}" var="op" varStatus="vs">
	                        <c:if test="${vs.index == 0}">
	                           <label for="productOptionSet"> ${op.optionName}</label>
	                           <select class='productOptionSet'  required>
	                              <option value="">옵션을 선택해주세요</option>
	                              <option value="${op.optionNo}">${op.optionValue}</option>
	                        </c:if>
	                        <c:if test="${op.optionName eq options[vs.index-1].optionName}">
	                           <option value="${op.optionNo}">${op.optionValue}</option>
	                        </c:if>
	                        <c:if test="${vs.index != 0 && op.optionName ne options[vs.index-1].optionName}">
	                           </select>
	                           
	                           <label for="productOption2Set"> ${op.optionName}</label>
	                           <select class='productOption2Set'  required>
	                              <option class='productOption2Set' >옵션을 선택해주세요.</option>
	                              <option value="${op.optionNo}">${op.optionValue}</option>
	                        </c:if>
	                        <c:if test="${vs.last}">
	                           </select>
	                         </c:if>
                     </c:forEach>
                 </c:if>
                 	  		<c:if test="${food ne null }">
		                 	  	 <div class="productResultSet" style="display:block">
				                     <h4 class="productName" style="font-size: 15px; font-weight: 200; color:light gray; margin-bottom: 0px;">
				                        <span class="opSearch">${food.foodName}</span>
				                        <input type="hidden" name="productNo" value="${food.productNo}">
				                        <input type="hidden" name="productName" value="${food.foodName}">
				                        <input type="hidden" name="productPrice" value="${total}">
				                        <input type="hidden" name="usersNo" value=${loginUser.usersNo}>
				                     </h4>
		                         <div>
		                            <div  class="btnbox" style="margin: 0 0 0 -1px; float:right;">
			                            <button class="decrease" type="button">-</button>
			                            <input type="number" class="cartCount" value="1" name="cartCount" min="1" readonly>
			                            <button class="increase" type="button">+</button>

		                          </div>
		                            <strong class="productPrice" style="display: inline-block; position: right; font-weight: 200;"></strong>
		                            <input type="hidden" name="productPrice" value=${p.productPrice}>
		                         </div>
		                           <br>
		                   </div>
	                   </c:if>
	                   
	                     <c:if test="${ingredient ne null }">
		                 	  <div class="productResultSet" style="display:block">
				                     <h4 class="productName" style="font-size: 15px; font-weight: 200; color:light gray; margin-bottom: 0px;">
				                        <span class="opSearch">${ingredient.ingredientName}</span>
				                        <input type="hidden" name="productNo" value="${ingredient.productNo}">
				                        <input type="hidden" name="productName" value="${ingredient.ingredientName}">
				                        <input type="hidden" name="productPrice" value="${total}">
				                        <input type="hidden" name="usersNo" value=${loginUser.usersNo}>
				                     </h4>
		                         <div>
		                            <div  class="btnbox" style="margin: 0 0 0 -1px; float:right;">
			                            <button class="decrease" type="button">-</button>
			                            <input type="number" class="cartCount" value="1" name="cartCount" min="1" readonly>
			                            <button class="increase" type="button">+</button>

		                          </div>
		                            <strong class="productPrice" style="display: inline-block; position: right; font-weight: 200;"></strong>
		                            <input type="hidden" name="productPrice" value=${p.productPrice}>
		                         </div>
		                           <br>
		                   </div>
	                   </c:if>
                 
                 
                  
                  </div>
               </div>
            </div>
            <div class="totalPriceBox">
<!--             	<span class="totalPrice"></span> -->
			<c:if test="${ tool eq null }">
            	<input type="text" class="totalPrice" readonly value="0" style="display:none">
            </c:if>
            
			
            <c:if test="${ tool ne null }">
            	<input type="text" class="totalPrice" readonly value="0">
            </c:if>
            
            </div>
            <br>
            
<%--             <c:if test="${ loginUser eq null }"> --%>
<!--             	<button type="button" id="buybtn" class="buybtn" onclick="javascript:loginArlet()"; style="display: inline-block; width: 60%;">구매하기</button> -->
<%--             </c:if> --%>
            
<%--             <c:if test="${ loginUser ne null }"> --%>
            	<button type="button" id="buybtn"  class="buybtn" style="display: inline-block; width: 60%;">구매하기</button>
<%--             </c:if> --%>
<!--             <button type="button" id="cartbtn"  class="cartbtn" style="display: inline-block; width: 39%;"> 장바구니</button> -->
            <button type="button" id="cartbtn"  class="cartbtn" style="display: inline-block; width: 39%;">장바구니</button>
   
         </div>
      </main>
   </form>
   <br>
      
   
<div class ="productInfoMain">
   <div class="reviewbox">
      <ul>
         <li>상세정보</li>
         <li>후기 (${reviewCount})</li>
         <li>배송 및 환불</li>
         <li>문의(${qnaCount})</li>
      </ul>
   </div>
   <br>

   <div class="Infobox">
      <!-- 제품 사진 및 소개 칸 -->
      
      <c:if test="${ingredient ne null}">
	      <div class="imgbox">
<%-- 	               <img src="${ contextPath }/resources/images/홀로세끼 로고-001.png" style="height: 500px; width: auto;"> --%>
				<div style="margin: auto; height: 300px; line-height: center; line-height: 320px; font-size: 28px;">
					현재 상품 이미지를 준비 중 입니다!
				</div>
	         </div>
	   </c:if>
      
    <c:if test="${ toolsubImage ne null}">
      <c:forEach items="${toolsubImage}" var="subImg">
         <div class="imgbox">
            <c:if test="${ fn:containsIgnoreCase(subImg.imageRenameName, 'jpg') or fn:containsIgnoreCase(subImg.imageRenameName, 'png')}">
               <img src="${ contextPath }/resources/uploadFiles/${subImg.imageRenameName}" style="height: auto;">
            </c:if>
         </div>
      </c:forEach>
    </c:if>
    
    <c:if test="${ foodsubImage ne null}">
      <c:forEach items="${foodsubImage}" var="subImg" varStatus="vs">
         <div class="imgbox" style="margin-bottom: 150px;">
         	<c:set value="${fn:split(fn:split(food.foodContent,'@')[2], '#')[vs.index]}" var="foodContent"></c:set>
         	<c:if test="${fn:split(foodContent, '-')[1] eq 1}">
         		<div style="display: inline-block; vertical-align: middle; width: 520px; font-size: 25px; text-align: left; word-break: keep-all">${fn:split(fn:split(foodContent, '-')[2], ',')[0]}</div>
         	</c:if>
            <c:if test="${ fn:containsIgnoreCase(subImg.imageRenameName, 'jpg') or fn:containsIgnoreCase(subImg.imageRenameName, 'png')}">
               <img src="${ contextPath }/resources/uploadFiles/${subImg.imageRenameName}" style="height: auto; width: 520px;">
            </c:if>
         	<c:if test="${fn:split(foodContent, '-')[1] eq 2}">
         		<div style="display: inline-block; vertical-align: middle; width: 520px; font-size: 25px; text-align: right; word-break: keep-all">${fn:split(fn:split(foodContent, '-')[2], ',')[0]}</div>
         	</c:if>
         </div>
      </c:forEach>
    </c:if>
    
    <c:if test="${ ingredientsubImage ne null}">
      <c:forEach items="${ingredientsubImage}" var="subImg">
         <div class="imgbox">
            <c:if test="${ fn:containsIgnoreCase(subImg.imageRenameName, 'jpg') or fn:containsIgnoreCase(subImg.imageRenameName, 'png')}">
               <img src="${ contextPath }/resources/uploadFiles/${subImg.imageRenameName}" style="height: auto;">
            </c:if>
         </div>
      </c:forEach>
    </c:if>
    
    
<!--       <div class="DetailMoreBtn"> -->
<!--          <a>상세정보 더보기</a> -->
<!--       </div> -->
   </div>
      <br>
      
      <div class="reviewWrap" style=" width:1200px;">
   
         <div class="reviewWrap1" style="padding: 10px; border-bottom: 1px solid lightgray;">
            <h3 style="font-weight: 500; color:#4485d7; font-size: 28px; display: inline-block;">후기</h3>&nbsp;&nbsp;<span style="font-size: 24px;"></span>
            
<%--             <c:forEach	items="${ordList}" var="orders">ㅊ --%>
<%--                <c:if test="${ orders >=  1 }"> --%>
<%--                		<c:if test="${productNo eq p.productNo && r.reviewWriter eq loginUser.usersName}"> --%>
		               <div class="review_btn">
		                  <a href="createReview.ma?productNo=${p.productNo}">
		                  <img src="//recipe1.ezmember.co.kr/img/mobile/icon_write2.png">후기작성</a>
		               </div>
<%-- 		            </c:if> --%>
<%--             </c:if>  --%>
<%--             </c:forEach>    --%>

         <span class="review_desc" style="font-size: 500;" href="/?page=${param.page}&sort=id,DESC&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">최신순</span> |
         <span class="review_stardesc" style="font-size: 500;">별점순</span>
         </div>
      
         
         <c:set var="reviewCount" value="${reviewCount}" />
         <c:if test="${reviewCount eq 0}">
            <div style="text-align:center; margin: 10px;">
                 <img style="width:100px; height:100px;" src="resources/images/icon_none.png">
              </div>
            <p style="margin:auto; text-align:center; font-weight: 400; color: #999999; font-size: 15px">등록된 후기가 없습니다.</p>
         </c:if>
                 
          <div class="textbox" id="textbox"> 
            <c:forEach items="${ list }" var="r">
               <div class="reviews" style="display:none;">
                  <c:if test="${ r ne null}">
                     <div class="nickName" style="font-size:18px; font-weight:400; padding:10px;">${r.reviewWriter}
                        <span style="font-size: 20px; font-weight: 800; color:#4485d7;" class="reviewStar"><br>
                           <c:if test="${r.reviewScore  eq  5 }" >★★★★★</c:if>
                           <c:if test="${r.reviewScore  eq  4 }" >★★★★☆</c:if>
                           <c:if test="${r.reviewScore  eq  3 }" >★★★☆☆</c:if>
                           <c:if test="${r.reviewScore  eq  2 }" >★★☆☆☆</c:if>
                           <c:if test="${r.reviewScore  eq  1 }" >★☆☆☆☆</c:if>
                           <c:if test="${r.reviewScore  eq  0 }" >☆☆☆☆☆</c:if>
                        </span>
                        <span style="font-size: 15px; font-weight: 200;">${r.reviewDate}</span>
                     </div>
                     
   <%--                   <c:out value="${imgList.imgDivideNo}"></c:out>  --%>
         
               
                     <div class="reviewPhoto" style="padding-left:10px">
                        <ul>
                           <c:forEach items="${imglist}" var="img" >
                              <c:if test ="${img.imageDivideNo eq r.reviewNo}" >
                              <c:if test="${ fn:containsIgnoreCase(img.imageRenameName, 'jpg') or fn:containsIgnoreCase(img.imageRenameName, 'png')}">
                                 <li><img src="${ contextPath }/resources/uploadFiles/${img.imageRenameName}" onclick="window.open(this.src)"></li>
                              </c:if>
                              </c:if>
                           </c:forEach>
                        </ul>
                     </div>
                      <div style="display: inline-block; width: 100%;">
						<div class="reviewContent" style=" margin-top: 10px; margin-bottom: 10px; font-weight: 200;">
							${r.reviewContent}  
						</div>
					</div>
                  </c:if>
               </div>
            </c:forEach>
         </div>

         <div class="moreView" style="display:none;">더보기</div>
            
            <div class="productBox">
               <ul   class="productBoxInfo">
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
                      <a class="accordion_i_tit3">문의<span>( ${ qnaCount } )</span></a>
                      <div class="accordion_i_cont3" style="padding-top: 5px; display: block;">
                          <div id="ajax-goods-goodsqa-list">
                          
                       <ul class="goods_accordion_qna">
                                
                       <!--  반복 될 부분 -->  
                       <c:forEach items="${qna}" var="qna">
                            <li class="accordion_q_li js_data_row" style="cursor: pointer;"  onclick="location.href='QnAdetail.ma?usersNo=${qna.usersNo}&productNo=${p.productNo}&qnaNo=${qna.qnaNo}'">
                               <div class="accordion_q_tit1"> 
                                  
                                   <div class="qna">
                                      <span style="color:#4485d7;">${qna.qnaNo} </span>
                                      |&nbsp
                                      <span style="color: #216dcd; font-weight: 400;">
                                       <c:if test="${qna.qnaType eq 1 }">[배송]</c:if>
                                            <c:if test="${qna.qnaType eq 2 }">[결제]</c:if>
                                            <c:if test="${qna.qnaType eq 3 }">[회원]</c:if>
                                            <c:if test="${qna.qnaType eq 4 }">[상품]</c:if>
                                            <c:if test="${qna.qnaType eq 0 }">[기타]</c:if>
                                      </span>
                                       ${qna.qnaTitle}
                                   </div>
                              <div class="writer" style="display:inline-block; width:100px; margin-left:30px;">${qna.nickName}</div>
                              <div class="rv_cont_date" style="display:inline-block; width:100px; margin-left:30px; ">${qna.qnaDate}</div>
                              <span class="qna_result" style="float: right;">
                                 <c:if test="${qna.answerContent eq null}"><span style="color: red;">답변 대기</span></c:if>
                                 <c:if test="${qna.answerContent ne null}"><span style="color: green;">답변 완료</span></c:if>
                              </span>
                           </div>
                               <div class="js_detail accordion_q_cont"></div>
                           </li>        
                       </c:forEach>       
                        <!-- 여기 까지 반복 -->
                        
                  </ul>
                  <div class="photoreview_tit3" style="padding: 20px 0 0 12px;">
      <%--                <c:if test="${ loginUser != null}"> --%>
                     <c:if test="${ loginUser ne null }">
                         <div class="review_btn_wr">
                         <a href="createqna.ma?productNo=${p.productNo}">
                            <img src="//recipe1.ezmember.co.kr/img/mobile/icon_write2.png">문의하기</a>
                         </div>
                     </c:if>
   <%--                 </c:if> --%>
                  </div>
   				<c:set value="${p.productNo}" var="pNo"></c:set>
	                  <ul class="pageCustomer pagination justify-content-center">
	                      <c:if test="${ pi.currentPage > 1 }">
	                      <li class="page-item">
	                         <c:url var="goBack" value="${ loc }">
	                           <c:param name="page" value="${ pi.currentPage-1 }"></c:param>
	                           <c:param name="productNo" value="${pNo}"></c:param>
	                        </c:url>
	                        <a class="page-link" href="${ goBack }" aria-label="Previous">
	                           <span aria-hidden="true">&laquo;</span>
	                        </a>   
	                     </li>
	                     </c:if>
	                     <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	                           <c:url var="goNum" value="${ loc }">
	                           <c:param name="page" value="${ p }"></c:param>
	                           <c:param name="productNo" value="${pNo}"></c:param>
	                        </c:url>
	                          <li class="page-item pageCustomer"><a class="page-link" href="${ goNum }">${ p }</a></li>
	                     </c:forEach>
	                     <c:if test="${ pi.currentPage < pi.maxPage }">
	                     <li class="page-item">
	                        <c:url var="goNext" value="${ loc }">
	                           <c:param name="page" value="${ pi.currentPage+1 }"></c:param>
	                           <c:param name="productNo" value="${pNo}"></c:param>
	                        </c:url>
	                        <a class="page-link" href="${ goNext }" aria-label="Next">
	                           <span aria-hidden="true">&raquo;</span>
	                        </a>
	                     </li>
	                     </c:if>
	                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
             <div class="modal-content">
                <div class="modal-header">
                   <h1 class="modal-title fs-5" id="exampleModalLabel">장바구니 담기</h1>
                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                   <i class="bi bi-check-circle-fill"></i><br>
                   
                   <c:if test= "${ tool ne null }">
                  	 <h3>${ tool.toolName} </h3><br>
                  </c:if> 
                  
                   <c:if test="${ food ne null }">
                  	 <h3>${ food.foodName} </h3><br>
                  </c:if> 
                  
                   <c:if test= "${ ingredient ne null }">
                  	 <h3>${ ingredient.ingredientName} </h3><br>
                  </c:if> 
                  
                   상품이 장바구니에 담겼습니다.

                </div>
                <div class="footer" style="text-align:center; height: 50px;">
                  <button type="button" class="button-n btn-n" data-bs-dismiss="modal">계속 쇼핑하기</button>
                  <button type="button" class="button btn-y" id="moveCart" onclick="location.href='basket.ma'">장바구니로</button>
<!--                     <button type="button" class="button btn-y" id="moveCart">장바구니로</button> -->
<!--                     <button type="button" id="cartbtn"  class="cartbtn" style="display: inline-block; width: 39%;" data-bs-toggle="modal" data-bs-target="#cartModal">장바구니</button> -->
                </div>
             </div>
      </div>
   </div>
           
   <div class="modal fade" id="cartFailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
             <div class="modal-content">
                <div class="modal-header">
                   <h1 class="modal-title fs-5" id="exampleModalFail">장바구니 담기 오류</h1>
                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                   <i class="bi bi-x-circle-fill"></i><br><br>
                   <h3>장바구니에 담지 못했습니다. </h3>
                </div>
                <div class="footer" style="text-align:center; height: 50px;"></div>
             </div>
      </div>
   </div>

   <br><br><br>
   <script>
   
   window.onload = function(){
      
//       장바구니로 이동 버튼 이벤트
      document.getElementById('moveCart').addEventListener('click', function() {
         const usersNo = '${loginUser.usersNo}'
         location.href='${contextPath}/basket.ma?usersNo=' + usersNo;
      })
      
      const productName = document.getElementsByClassName("productName")[0]; // 드롭박스에 적힐 상품명
      const productOptionSet = document.querySelector(".productOptionSet"); //사이즈 선택 창
//       const productOption2 = document.querySelector(".productOption2"); //사이즈 선택 창
      const productOption2Set = document.querySelector(".productOption2Set"); //사이즈 선택 창
      const buyBtn = document.querySelector(".buybtn");
      const result = document.querySelectorAll(".productResult");
      const like = document.querySelector(".like");
      const productSet = document.querySelector(".productSet");
      const increase = document.querySelectorAll(".increase");   
      const reviewStar = document.querySelectorAll(".reviewStar");
      const total = document.querySelector('.totalPrice');
      let totalPriceSet = document.querySelectorAll(".totalPriceSet");
      let productPrice = document.querySelectorAll(".productPrice");
      const cartCount = document.querySelector(".cartCount");
      let totalPrice1 = ${total}.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
      let totalPrice = document.querySelector(".totalPrice");
      
      
      
      function loginArlet(){
		  swal("로그인 후 이용해주세요.", {
			  buttons: false,
			  timer: 1000,
			});
      }
      
      
      $('.accordion_i_tit').click(function(){
         $('.accordion_i_cont').toggle(400);
      })
      $('.accordion_i_tit2').click(function(){
         $('.accordion_i_cont2').toggle(400);
      })
      $('.accordion_i_tit3').click(function(){
         $('.accordion_i_cont3').toggle(400);
      })
   
      
      
      
    
      
      
	      $(document).on("click",".btnbox",function(e){
	    	 
	         const increBtn = this.childNodes[2]; //증가버튼
	         const decreBtn = this.childNodes[0]; //감소버튼
	         const cartNum = this.childNodes[1];  //카트수량 
	         const productPrice = this.childNodes[4];
	         
	         function cartNumber(a){
	        	 a.value*totalPrice1
	    		console.log(cartNum*totalPrice1);
	    	};
	          
	         
	         e.stopPropagation();    //이벤트 버블링 막기
	         
	         if(e.target === increBtn){
                  totalPrice1 = (this.childNodes[1].value*${total}+${total}).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                  productPrice.innerText=totalPrice1;
                  cartNum.value++;
                  cartNumber(cartNum.value);
	         } 
	         if(e.target === decreBtn){
                 totalPrice1 = (this.childNodes[1].value*${total}-${total}).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                 productPrice.innerText=totalPrice1;
                 cartNum.value--;
                 cartNumber(cartNum.value);
              
		            if(cartNum.value < 1 ){
		            	cartNum.value=1;
		            	totalPrice1 = (this.childNodes[1].value*${total}).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		            	productPrice.innerText=totalPrice1;
		            }
	            
	         }
	         if(productOptionSet != null){
		         if(e.target == this.childNodes[3] || e.target ==this.childNodes[3].childNodes[0]){ //x버튼을 클릭하거나 x이미지를 클릭하거나 상품옵션창을 삭제한다.
		        	 cartNum.value = 0;
		            this.parentNode.parentNode.remove();
		         }
	         }
	         
	         cal();
	      })
	      
	      
	      
	      if(productOptionSet == null){
  	  		let productPrice = document.querySelector(".productPrice");
  	  		productPrice.innerText=totalPrice1;
		          $(document).on("click",".btnbox",function(e){
		              const increBtn = this.childNodes[5]; //증가버튼
		              const decreBtn = this.childNodes[1]; //감소버튼
		              const cartNum = this.childNodes[3];  //카트수량 
//		              e.stopPropagation();    //이벤트 버블링 막기
		              if(e.target == increBtn){
		                 totalPrice1 = (this.childNodes[3].value*${total}+${total}).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		                 productPrice.innerText=totalPrice1;
		              this.childNodes[3].value++;
		              } 
		              if(e.target == decreBtn){
		                 totalPrice1 = (this.childNodes[3].value*${total}-${total}).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		                 productPrice.innerText=totalPrice1;
		                 this.childNodes[3].value--;
//		                  priceSet--;
		                 if(cartNum.value < 1){
		                    cartNum.value=1;
		                    productPrice.innerText = ${total}.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		                 }
		                 
		     	 }
					
		              
	      		})
    
    }
	      
      
      const usersNo = '${loginUser.usersNo}';
      const divisionNo = '${p.productNo}';
      
      if(usersNo != '') {
	      like.addEventListener("click", function() {
	         if(like.innerText === '♡') {
	           //찜이 안 되어 있으면 
	            $.ajax({
	                 url:'${contextPath}/insertLike.ma',
	                 data:{
	                    usersNo:usersNo,
	                    divisionNo:divisionNo
	                 },
	                 success: data=> {
	                    if(data == 'success') {
	                       like.innerText = '♥';
	                       swal({
	                         text: "해당 상품의 찜 등록이 완료되었습니다.",
	                         icon: "success",
	                         button: "확인",
	                        });
	                       setTimeout(function() {
	                          swal.close(); 
	                       }, 3000);
	                    } else { //실패 시 
	                       swal({
	                         text: "해당 상품의 찜 등록이 실패했습니다.",
	                         icon: "error",
	                        });
	                       setTimeout(function() {
	                          swal.close(); 
	                       }, 2000);
	                    }
	                 },
	                 error:data=>{
	                    swal({
	                      text: "해당 상품의 찜 등록이 실패했습니다.",
	                      icon: "error",
	                     });
	                    setTimeout(function() {
	                       swal.close(); 
	                    }, 2000);
	                 }
	              })
	          } else { //찜 등록이 되어 있으면 
	             $.ajax({
	                url:'${contextPath}/deleteLike.ma',
	                data:{
	                   usersNo:usersNo,
	                    divisionNo:divisionNo
	                },
	                success: data => {
	                   console.log(data);
	                   if(data == 'success') {
	                      like.innerText ='♡';
	                       swal({
	                         text: "해당 상품의 찜 해제가 완료되었습니다.",
	                         icon: "success",
	                        });
	                       setTimeout(function() {
	                          swal.close(); 
	                       }, 2000);
	                    } else { //실패 시 
	                       swal({
	                         text: "해당 상품의 찜 해제가 실패했습니다.",
	                         icon: "error",
	                        });
	                       setTimeout(function() {
	                          swal.close(); 
	                       }, 2000);
	                    }
	                },
	                error: data=>{
	                   
	                }
	             })
	          }
	      });
      } else if (usersNo == '') { //null이면 
    	  like.addEventListener("click", function() {
    		  swal("로그인 후 이용해주세요.", {
    			  buttons: false,
    			  timer: 1000,
    			});
    	  });
      }
      
      let productOp = []; 
      let opTextBox = []; 
      
      
      if(productOption2Set != null){
         for(prOp of productOption2Set){
            productOp.unshift(prOp.innerText);
             
            for( opText of productOption2Set){
                  opTextBox.unshift(opText.value);
            }
            if(prOp.value == "옵션을 선택해주세요."){
                  productOp.pop();
            }
         }
      }
      
         if(productOptionSet != null){
		       productOptionSet.addEventListener("change", function(){
		         let result = productOptionSet.value;              //상품 1의 옵션이 선택된 값
		         let o;                                 //색상을 변경 할 시 사이즈를 다시 리셋 시겨줄 공간
		         if(result != "") {
		            o = productOp;
		         }else if(result == ""){
		                   o = ["옵션을 선택해주세요."];
		         }
		         
		         if(productOption2Set != null){
		            if((productOption2Set.value =="") == false){ //상품 옵션이 "옵션을 선택해주세요"가 아닐 경우에 reset을 진행
		               productOption2Set.options.length=0;
		            }
		   
		            for(let i = 0; i < o.length; i++) {
		               productOption2Set.insertAdjacentHTML('afterbegin','<option class="productOption2Set" value="'+ opTextBox[ i ]+'">'+ o[ i ] + '</option>' ); // 다음은 사이즈가 나오게 한다.
		            }
		         }else{
		            const select =  $('.productOptionSet option:selected');
		            let optionName = "${tool.toolName}"+select.text();
		            const opSearch = document.getElementsByClassName('opSearch');
		            let YN = "Y";
		            for(let k=0; k<opSearch.length; k++){
		                  if(opSearch[k].innerText == optionName){
		                     alert("이미 선택한 옵션입니다.");
		                     YN = "N";
		                  }
		               }
		            
		            if(YN == "Y" && select.val()!="옵션을 선택해주세요."){
		               productSet.insertAdjacentHTML('afterend','<div  class="productResultSet" style="display:block">'
		                        +'<h4 class="productName" style="font-size: 15px; font-weight: 200; color:light gray; margin-bottom: 0px;">'
		                                           +'<span class="opSearch">${tool.toolName}'+select.text()+'</span>'
		                                           +'<input type="hidden" name="productNo" value="${tool.productNo}">'
		                                           +'<input type="hidden" name="productName" value="${tool.toolName}">'
		                                           +'<input type="hidden" name="productPrice" value="${total}">'
		                                           +'<input type="hidden" name="productOption" value='+select.val()+'>'
		                                           +'<input type="hidden" name="usersNo" value="${loginUser.usersNo}">'
		                                        +'</h4>'
		                                        +'<div>'
		                                           +'<span class="btnbox" style="margin: 0 0 0 -1px;">'
		                                              +'<button class="decrease" type="button">-</button>'
		                                              +'<input type="number" class="cartCount"'
		                                              +'   value="1" name="cartCount" min="1" readonly>'
		                                              +'<button class="increase" type="button">+</button>'
		                                              +'<button class="removeProudct" type="button" style="float: right;">'
		                                                 +'<img src="resources/images/close.png" style="width: 10px;">'
		                                           +'<span>'
		                                           +'</button>'
		                                           +'<strong class="productPrice" style="display: inline-block; position: right; font-weight: 200;">'+${total}.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</strong>'
		                                           +'<input type="hidden" name="productPrice" value="${p.productPrice}">'
		                                        +'</div>'
		                                         +'<br>'
		                                     +'</div>');

		               }
		            
		         }
		       })
		       
         }
       if(productOption2Set != null){
           productOption2Set.addEventListener("change", function(){
            const select =  $('.productOptionSet option:selected');
            const select2 = $('.productOption2Set option:selected');
               let optionName = "${tool.toolName}"+select.text()+" "+select2.text(); 
//                let optionName = "캠핑용 후라이팬"+select.text()+" "+select2.text(); 
               const opSearch = document.getElementsByClassName('opSearch');
               let YN = "Y";
               for(let k=0; k<opSearch.length; k++){
                  if(opSearch[k].innerText == optionName){
                     alert("이미 선택한 옵션입니다.");
                     YN = "N";
                  }
               }
   
            if(YN == "Y" && select2.val()!="옵션을 선택해주세요."){
            productSet.insertAdjacentHTML('afterend','<div  class="productResultSet" style="display:block">'
                     +'<h4 class="productName" style="font-size: 15px; font-weight: 200; color:light gray; margin-bottom: 0px;">'
                                        +'<span class="opSearch">${tool.toolName}'+select.text()+" "+select2.text()+'</span>'
                                        +'<input type="hidden" name="productNo" value="${tool.productNo}">'
                                        +'<input type="hidden" name="productName" value="${tool.toolName}">'
                                        +'<input type="hidden" name="productPrice" value="${total}">'
                                        +'<input type="hidden" name="productOption" value='+select.val()+'>'
                                        +'<input type="hidden" name="productOption2" value='+select2.val()+'>'
                                        +'<input type="hidden" name="usersNo" value="${loginUser.usersNo}">'
                                     +'</h4>'
                                     +'<div>'
                                        +'<span class="btnbox" style="margin: 0 0 0 -1px;">'
                                           +'<button class="decrease" type="button">-</button>'
                                           +'<input type="number" class="cartCount"'
                                           +'   value="1" name="cartCount" min="1" readonly>'
                                           +'<button class="increase" type="button">+</button>'
                                           +'<button class="removeProudct" type="button" style="float: right;">'
                                              +'<img src="resources/images/close.png" style="width: 10px;">'
                                        +'<span>'
                                        +'</button>'
                                        +'<strong class="productPrice" style="display: inline-block; position: right; font-weight: 200;">'+${total}.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'</strong>'
                                        +'<input type="hidden" name="productPrice" value="${p.productPrice}">'
                                     +'</div>'
                                      +'<br>'
                                  +'</div>');
            }
            cal()
         })
         
         
         
         
         
         
         
         
         
         
       }
            
      
      $(document).ready(function() {
         var productNo = null;
         
         $(function(){
        	 if($(".reviews").length >= 6){
        	   $(".moreView").show();
        	 }
	           $(".reviews").slice(0, 5).show(); // 초기갯수
	           $(".moreView").click(function(e){ // 클릭시 more
	               e.preventDefault();
	               $(".reviews").wrapAll().show(); // 클릭시 more 갯수 지저정
	               if($(".reviews:hidden").length == 0){ 
	                  $(".moreView").hide(); 
	               }
	           });
             
         });
         
         
         
         
         productNo = $("input[name='productNo']").val();
         var cartCount = $(".cartCount").val();
         var productOption = $(".productOption").val();
         var productOption2 = $(".productOption2").val();
         var preorderNo = 0;
         
         var productNoValues=[];
         var cartCountValues=[];
         var productOptionValues=[];
         var productOption2Values=[];
         var usersNoValues=[];
         
         
      if(usersNo != "" && productOption2Set != null){
         $("#buybtn").click(function() {
        	 if(document.getElementsByClassName("totalPrice")[0].value == 0 ){
           		  swal("상품을 선택해주세요.", {
           			  buttons: false,
           			  timer: 1000,
           			});
       		  }else{
                  $("input[name='productNo']").each(function(){
                      productNoValues.push($(this).val());
                   })
                   
                   $(".cartCount").each(function(){
                      cartCountValues.push($(this).val());
                   })
                   
                   $("input[name='productOption']").each(function(){
                      productOptionValues.push($(this).val());
                   })
                   
                   $("input[name='productOption2']").each(function(){
                      productOption2Values.push($(this).val());
                   })
                   
                   $("input[name='usersNo']").each(function(){
                      usersNoValues.push($(this).val());
                   })
                   
                   let count = 0;
                   let str = '';
                      for(i=0; i<productNoValues.length; i++){
                         $.ajax({
                             url: "goToPay.ma",
                             async: false,
                             data: {
                               "productNo":productNoValues[i], 
                               "cartCount":cartCountValues[i],
                               "productOption":productOptionValues[i], 
                               "productOption2":productOption2Values[i],
                               "usersNo":usersNoValues[i],
                            },
                             success: preNo =>{
                          	   if(i==0){
      	                    	   str += "preorderNos="+preNo;
                          	   }else{
      	                    	   str += "&preorderNos="+preNo;
                          	   }
                             },
                             error: allData => {
                                console.log("error");
                             }
                         })
                      }
                     	location.href='${contextPath}/payDetail.ma?'+str;
       			  
       			  
       		  }
        	 

             })
      }else if(usersNo == ""){
    	  $("#buybtn").click(function() {
    		  swal("로그인 후 이용해주세요.", {
    			  buttons: false,
    			  timer: 1000,
    			});
		  })
	  
	  }
         
         
      if(usersNo != "" && productOption2Set == null){
    	 console.log(document.getElementsByClassName("productResultSet")[0]);
         $("#buybtn").click(function() {
        	 if(document.getElementsByClassName("productResultSet")[0] == undefined ){
           		  swal("상품을 선택해주세요.", {
           			  buttons: false,
           			  timer: 1000,
           			});
       		  }else{
                  $("input[name='productNo']").each(function(){
                      productNoValues.push($(this).val());
                   })
                   
                   $(".cartCount").each(function(){
                      cartCountValues.push($(this).val());
                   })
                   
                   $("input[name='productOption']").each(function(){
                      productOptionValues.push($(this).val());
                   })
                   
                   $("input[name='productOption2']").each(function(){
                      productOption2Values.push($(this).val());
                   })
                   
                   $("input[name='usersNo']").each(function(){
                      usersNoValues.push($(this).val());
                   })
                   
                   let count = 0;
                   let str = '';
                      for(i=0; i<productNoValues.length; i++){
                         $.ajax({
                             url: "goToPay.ma",
                             async: false,
                             data: {
                               "productNo":productNoValues[i], 
                               "cartCount":cartCountValues[i],
                               "productOption":productOptionValues[i], 
                               "productOption2":productOption2Values[i],
                               "usersNo":usersNoValues[i],
                            },
                             success: preNo =>{
                          	   if(i==0){
      	                    	   str += "preorderNos="+preNo;
                          	   }else{
      	                    	   str += "&preorderNos="+preNo;
                          	   }
                             },
                             error: allData => {
                                console.log("error");
                             }
                         })
                      }
                     	location.href='${contextPath}/payDetail.ma?'+str;
       		  }

             })
      }else if(usersNo == ""){
    	  $("#buybtn").click(function() {
    		  swal("로그인 후 이용해주세요.", {
    			  buttons: false,
    			  timer: 1000,
    			});
		  })
	  
	  }
      
      
 
         
          $("#cartbtn").click(function() {
              productNo = $("input[name='productNo']").val();
              var cartCount = $(".cartCount").val();
              var productOption = $(".productOption").val();
              var productOption2 = $(".productOption2").val();
              var preorderNo = 0;
              
              var productNoValues=[];
              var cartCountValues=[];
              var productOptionValues=[];
              var productOption2Values=[];
              var usersNoValues=[];
              
              
              $("input[name='productNo']").each(function(){
                 productNoValues.push($(this).val());
              })
              
              $(".cartCount").each(function(){
                 cartCountValues.push($(this).val());
              })
              
              $("input[name='productOption']").each(function(){
                 productOptionValues.push($(this).val());
              })
              
              $("input[name='productOption2']").each(function(){
                 productOption2Values.push($(this).val());
              })
              
              $("input[name='usersNo']").each(function(){
                 usersNoValues.push($(this).val());
              })
              
              let count = 0;
                 for(i=0; i<productNoValues.length; i++){
                    $.ajax({
                        url: "insertCart.ma",
                        async: false,
                        data: {
                          "productNo":productNoValues[i], 
                          "cartCount":cartCountValues[i],
                          "productOption":productOptionValues[i], 
                          "productOption2":productOption2Values[i],
                          "usersNo":usersNoValues[i],
                       },
                        success: preNo =>{
                            count++;
                        },
                        error: allData => {
                           console.log("error");
                        }
                    })
                 }
              if(count == productNoValues.length &&  count != 0) {
                     $("#cartModal").modal("show");
   //               $("#cartFailModal").modal("show");
                 }else if(count != productNoValues.length){
                    $("#cartFailModal").modal("show");
                 }else if((count == 0)  || productNoValues.length == 0 ){
                    $("#cartFailModal").modal("show");
                 }
                 
          })
       
           $(".review_stardesc").click(function(){
              let star='';
              let result = '';
              let result2 = '';
             $.ajax({
                url:"reviewAvgDesc.ma",
                type:"post",
                data:{productNo:${p.productNo}},
                success: data =>{
                   $('.textbox').html('');
                      for(let rev  of data.result ){
                         switch(rev.reviewScore){
                         case 0 : star = '☆☆☆☆☆'; break;
                         case 1 : star = '★☆☆☆☆'; break;
                         case 2 : star = '★★☆☆☆'; break;
                         case 3 : star = '★★★☆☆'; break;
                         case 4 : star = '★★★★☆'; break;
                         case 5 : star = '★★★★★'; break;
                      }
                         
                        result = '<div class="nickName" style="font-size: 18px; font-weight: 400; padding:10px";>'+rev.reviewWriter
            +            '<span style="font-size: 20px; font-weight: 800; color:#4485d7;" class="reviewStar"><br>'
            +      star+'&nbsp'
            +   '</span>'
            +   '<span style="font-size: 15px; font-weight: 200;">'+rev.reviewDate+'</span>'
            
            +   '</div>'
            +   '<div class="reviewPhoto" style="padding-left:10px"">'
            +      '<ul>'
            +         '<input type="hidden" name="reviewNo" value="'+rev.reviewNo+'">'
            +      '</ul>'
            +   '</div>'
            +      '<div style="display: inline-block; width: 100%;">'
            +            '<div class="reviewContent" style="margin-left: 5px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">'
            +                     rev.reviewContent
            +               '</div>'
            +      '</div>';
            $('.textbox').append(result);
                         for(let img  of data.imgList){
                            if(rev.reviewNo == img.imageDivideNo){
                            	if(img.imageRenameName.indexOf('JPG') !== -1 || img.imageRenameName.indexOf('PNG') != -1 || img.imageRenameName.indexOf('jpg') !== -1 || img.imageRenameName.indexOf('png') != -1){
		                            let result2 = '<li><img src="/hollosekki/resources/uploadFiles/'+img.imageRenameName+'"+&nbsp onclick="window.open(this.src)"></li>'
		                            let reviewNos = document.getElementsByName("reviewNo");
		                               for(const revNo of reviewNos){
		                                  if(revNo.value == rev.reviewNo){
		                                     revNo.parentElement.innerHTML +=result2;
		                                  }
		                               }
		                            }
                           	   }
                         }
                      }
                   
                },
                error:function(){
                      alert("통신실패");
                  }
             })

            })
            
            
            $(".review_desc").click(function(){
              let star='';
              let result = '';
              let result2 = '';
             $.ajax({
                url:"reviewDesc.ma",
                type:"post",
                data:{productNo:${p.productNo}},
                success: data =>{
                   $('.textbox').html('');
                      for(let rev  of data.result ){
                         switch(rev.reviewScore){
                         case 0 : star = '☆☆☆☆☆'; break;
                         case 1 : star = '★☆☆☆☆'; break;
                         case 2 : star = '★★☆☆☆'; break;
                         case 3 : star = '★★★☆☆'; break;
                         case 4 : star = '★★★★☆'; break;
                         case 5 : star = '★★★★★'; break;
                      }
                        
                        result = '<div class="nickName" style="font-size: 18px; font-weight: 400; padding:10px";>'+rev.reviewWriter
            +            '<span style="font-size: 20px; font-weight: 800; color:#4485d7;" class="reviewStar"><br>'
            +      star+'&nbsp'
            +   '</span>'
            +   '<span style="font-size: 15px; font-weight: 200;">'+rev.reviewDate+'</span>'
            
            +   '</div>'
            +   '<div class="reviewPhoto" style="padding-left:10px"">'
            +      '<ul>'
            +         '<input type="hidden" name="reviewNo" value="'+rev.reviewNo+'">'
            +      '</ul>'
            +   '</div>'
            +      '<div style="display: inline-block; width: 100%;">'
            +            '<div class="reviewContent" style="margin-left: 5px; margin-top: 10px; margin-bottom: 10px; font-weight: 200;">'
            +                     rev.reviewContent
            +               '</div>'
            +      '</div>';
            
            $('.textbox').append(result);
                         for(let img  of data.imgList){
                            if(rev.reviewNo == img.imageDivideNo){
                            	if(img.imageRenameName.indexOf('JPG') !== -1 || img.imageRenameName.indexOf('PNG') != -1 || img.imageRenameName.indexOf('jpg') !== -1 || img.imageRenameName.indexOf('png') != -1){
		                            let result2 = '<li><img src="/hollosekki/resources/uploadFiles/'+img.imageRenameName+'"+&nbsp onclick="window.open(this.src)"></li>'
		                            let reviewNos = document.getElementsByName("reviewNo");
		                               for(const revNo of reviewNos){
		                                  if(revNo.value == rev.reviewNo){
		                                     revNo.parentElement.innerHTML +=result2;
		                                  }
		                               }
		                            }
                           	   }	
                         }
                      }
                },
                error:function(){
                      alert("통신실패");
                  }
             })
            })
      })
      
   }
   
   
   function cal(){
	   const productPrices = document.getElementsByClassName('productPrice');
	   const totalPrice = document.getElementsByClassName('totalPrice')[0];
	   totalCost = 0;
	   cost = 0;
	   for(let price of productPrices){
		   for(let i = 0; i < price.innerText.split(',').length; i++){
			   if(i == 0){
				   cost = 0;
			   }
			   cost += price.innerText.split(',')[i]; 
		   }
		   totalCost = totalCost*1 + cost*1;
	   }
	   totalPrice.value = totalCost*1;
   }
   
    </script> 
</body>
</html>
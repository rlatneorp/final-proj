<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>admin</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
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

#productResult {
	position: relative;
	background: white;
	padding: 10px;
	margin-top: 10px;
	height: 50px;
	padding-bottom: 5px;
	border: 1px solid #4485d7;
	display: block;
}

#productResult h4 span{
	display: block;
	margin: 5px 20px;
}

.right {
	width: 40%;
}

.left {
	width: 50%;
	height: 80%;
}

.left img {
	width: 90%;
	height: 70%;
}

#userInfo{
	width: 90%; 
	height: 20%; 
	text-align: center;
}

.inputBox{
	width: 150px;
	text-align: center;
	height: 40px;
	width: 100%;
	border: 1px solid #4485d7;
	border-radius: 5px;
}

#period label{
	margin: 5px;
}

.select1st, .select2nd, .select3rd, .select4th{
	display: none;
}

.menuBox{
	width: 150px;
	text-align: center;
	height: 165px;
	width: 100%;
	border: 1px solid #4485d7;
	border-radius: 5px;
}

.menuSelect{
	margin: 8px;
}

.menuName{
	margin: 8px 20px;
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

select {
	width: 50%;
	text-align: center;
	height: 30px;
	border: 1px solid #4485d7;
	border-radius: 5px;
	margin-top: 10px;
}

select option {
	width: 50%;
	text-align: center;
	height: 30px;
	border: 1px solid #4485d7;
	border-radius: 5px;
	margin-top: 10px;
}

p b {
	font-weight: 200;
}

.productInfo {
	margin: auto;
	padding: 10px;
	width: 80%;
}

.product ul li:hover {
	transform: scale(1.1);
	transition: 0.45s;
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

/* 추천대상 */
	#target{
		width: 500px;
		height: 200px;
		margin: auto;
		background-color: lightgray;
		border-radius: 10px;
		position: relative;
	}
	
	#pushPin{
		position: absolute;
		font-size: 30px;
		left: 235px;
		top: -20px;
	}
	
	#target ul{
		padding: 0 100px;
	}
	
	#detailInfo{
		width: 80%;
		height: 200px;
		margin: auto;
	}
	
	.detailInfoElem{
		width: 22.5%;
		height: 180px;
		margin: 0 1%;
		display: inline-block;
		text-align: center;
	}
	
	.detailIcon{
		font-size: 70px;
		color: #B0DAFF;
	}
	
/* 	식단 설명 */
	.menuABCD{
		width: 65%;
		height: 290px;
		background-color: lightgray;
		margin: 25px auto;
		border-radius: 10px;
		box-shadow: 5px 5px 7px 0px black;
	}
	
	.menuABCD h2{
		padding: 30px 60px; 
	}
	
	.menuMiniPic{
		width: 150px;
		height: 150px;
		display: inline-block;
		margin: 0px 5px;
	}

/* 	중간선 */
	.mid{display: flex; flex-basis: 100%; align-item: center; color: rgba(0,0,0,1); font-size: 30px; margin: 5px 0px; font-weight: bold;}
	.mid::before{content: ""; flex-grow: 1; margin: 23px 16px 15px 200px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0spx;}
	.mid::after{content: ""; flex-grow: 1; margin: 23px 200px 15px 16px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}

/* 	문의 */
	#qna{width: 1000px; margin: auto; text-align: center;}
	.boardNo{width: 100px;}
	.boardContent{width: 540px;}
	.boardWrite{width: 150px;}
	.boardDate{width: 210px;}
	.board{border-collapse: collapse; }
	.boardTop{background-color: #B0DAFF;}
	.line{border-bottom: 1px solid black; border-top: 1px solid black;}
	.lineAll:hover{background-color: #19A7CE; color: white;}
	
/* 	입력 박스 */
	.inputTextBox{width:730px; height: 50px; margin: auto; position: relative;}
	.profilePic{width: 35px; height: 35px; border: none; border-radius: 50%; position: absolute; top: 5px;}
	.profileImg{width:35px; height: 35px; border-radius: 50%;}
	.inputText{border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 600px; height: 40px; position: absolute; left: 40px;}
	.enter{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px; position: absolute; right: 0;}
	
/* 	후기 */
	.star{width: 110px;}
	.boardReviewWrite{width: 100px;}
	.boardReviewDate{width: 150px;}

/* 	모달 */
	.modal-body{text-align: center;}
	.bi-check-circle-fill{font-size: 60px; color: #B0DAFF;}
	.btn-n{background: lightgray; color: white;}
	.btn-n:hover{background: darkgray; color: black;}
	.btn-y{background: rgba(255, 170, 0, 0.5); color: white;}
	.btn-y:hover{background: rgba(255, 170, 0); color: black;}

	/*버튼*/
	.button {
	  width: 100px; height: 45px;
	  font-family: ;
	  font-size: 13px;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #B0DAFF;
	  border: 1px solid black;
	  border-radius: 10px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  margin: 5px;
	  }
	  
	  .button-n {
	  width: 100px; height: 45px;
	  font-family: ;
	  font-size: 13px;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #lightgray;
	  border: 1px solid black;
	  border-radius: 10px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  margin: 5px;
	  }
	.button:hover {
		background-color: #B0DAFF;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		color: #fff;
		transform: translateY(-7px);
		}
		
		
	.footer{
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-top: 10px; margin-bottom: 30px;
		padding-top: 20px;
		border-top: 1px solid lightgray;
		}
	.footer{text-align: center;}
	.footer> .button{font-weight: bold;}
	
	#modalNick{display: inline-block;}
	#modalInfo{height: 100px;}

.modalMid{display: flex; flex-basis: 100%; align-item: center; color: rgba(0,0,0,1); font-size: 15px; margin: 5px 0px; font-weight: bold;}
.modalMid::before{content: ""; flex-grow: 1; margin: 10px 10px 10px 10px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0spx;}
.modalMid::after{content: ""; flex-grow: 1; margin: 10px 10px 10px 10px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}

.modalMenu{font-weight: bold; background-color: lightgray; width: 180px; height: 50px;}
.moCon{height: 75px; border-radius: 10px;}

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
		margin-top: 0;
	}
	.page_nation .prev {
		background:white;
	}
	.page_nation .next {
		background:white;
	}
	.page_nation a.active {
		background-color:#19A7CE;
		color:white;
		border:1px solid #19A7CE;
		border-radius: 100%;
	}

	.adminInput{
		border: 2px solid gray;
		box-shadow: 1px 1px 1px 1px gray;
	}
	
	.infoContent td input{width:100px;}
	
  	.priceBox tr th{border: none;}
   	.priceBox tr td{border: none;}
   	tbody tr td{border: none;}
	.menuTable1 tr{border: 1px solid gray;}
	.menuTable2 tr{border: 1px solid gray;}
</style>
<body>
<span>
<%@ include file="../common/top.jsp" %>
<br>
</span>

	<form id="foodUpdateForm" action="${contextPath}/adminFoodUpdate.ad" method="post" enctype="multipart/form-data">
		<input type="hidden" name="productNo" value="${f.productNo}">
		<input type="hidden" name="productType" value="${f.productType}">
		<input type="hidden" name="productOption" value="${f.productOption}">
		<input type="hidden" name="productStatus" value="${f.productStatus}">
		<input type="hidden" name="page" value="${ab.page}">
		<main id="order-wrap">
			<!-- 구매창 컨테이너 -->
			<div class="left">
				<!-- 구매창 왼쪽 사진 넣는 곳 -->
				<input name="imageNo" type="hidden" value="${thumbnail.imageNo}">
				<img class="previewImage" src="${contextPath}/resources/uploadFiles/${thumbnail.imageRenameName}">
				<div style="text-align: center; padding-top:10px;">
					<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">
				</div>
			</div>
			<div class="right">
				<!-- 상품 정보 -->
				<div class="top">
					<div class="productNameBox" style="text-align: center; margin-bottom: 50px;">
						<input type="text" name="foodName" class="adminInput" value="${f.foodName}" placeholder="식품 이름" style="width:100%; margin-bottom:50px; font-weight: 400; font-size: 36px; text-align: center;">
						<textarea rows="8" name="foodContent" placeholder="식품 소개" style="width:100%">${fn:split(f.foodContent, '@')[0]}</textarea>
						
						
					</div>
					<div class="d-flex justify-content-center">
						<table class="d-flex text-center priceBox">
							<tr>
								<th>단가</th>
								<th></th>
								<th>할인율</th>
								<th></th>
								<th colspan="2">최종가격</th>
							</tr>
							<tr>
								<td>
									<input type="number" name="productPrice" class="cost" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="${f.productPrice}" min="0">
								</td>
								<td style="width: 50px; font-size: 16px; font-weight: bold; text-align: left;">원 - </td>
								<td>
									<input type="number" name="productSale" class="discount" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="${f.productSale }" min="0" max="99.9">
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
									<input type="number" name="productStock" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="${f.productStock}" min="0">
								</td>
								<td>개</td>
							</tr>
							<tr style="height:20px;"></tr>
							<tr>
								<td colspan="6">
									<div class="row pe-4">
										<div class="col-6">
											<input type="hidden" name="foodKind" value="${f.foodKind}">
										</div>
										<div class="col-6">
											<c:if test="${f.foodKind eq 1}">
												<button type="button" class="foodKindBtn d-inline-block" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 90px; height: 40px; font-size: 14px; font-weight: bold;">메인메뉴</button>
<!-- 												<button type="button" class="foodKindBtn d-inline-block" style="background-color: gray; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 90px; height: 40px; font-size: 14px; font-weight: bold;">서브메뉴</button> -->
											</c:if>
											<c:if test="${f.foodKind eq 2}">
												<button type="button" class="foodKindBtn d-inline-block" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 90px; height: 40px; font-size: 14px; font-weight: bold;">메인메뉴</button>
<!-- 												<button type="button" class="foodKindBtn d-inline-block" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 90px; height: 40px; font-size: 14px; font-weight: bold;">서브메뉴</button> -->
											</c:if>
										</div>
									</div>
								</td>
							</tr>
<!-- 						밀키트/식재료 여부 -->
							<tr style="height:10px;"></tr>
							<tr>
								<td colspan="6">
									<div class="row pe-4">
										<div class="col-6">
											<input type="hidden" name="foodType" value="${f.foodType}">
										</div>
										<div class="col-6">
											<c:if test="${f.foodType eq 1}">
												<button type="button" class="foodTypeBtn" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 90px; height: 40px; font-size: 14px; font-weight: bold;">식재료</button>
<!-- 												<button type="button" class="foodTypeBtn" style="background-color: gray; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 90px; height: 40px; font-size: 14px; font-weight: bold;">밀키트</button> -->
											</c:if>
											<c:if test="${f.foodType eq 2}">
												<button type="button" class="foodTypeBtn" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 90px; height: 40px; font-size: 14px; font-weight: bold;">밀키트</button>
<!-- 												<button type="button" class="foodTypeBtn" style="background-color: gray; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 90px; height: 40px; font-size: 14px; font-weight: bold;">식재료</button> -->
											</c:if>
										</div>
									</div>
								</td>
							</tr>
						</table>
						<input type="hidden" name="foodType" value="1">
					</div>
				</div>
			</div>
		</main>
		<br>
		<br>
		
	
		<div class ="productInfoMain">
		
			<div id="target">
				<i id="pushPin" class="bi bi-pin-fill"></i>
				<h2 style="padding: 30px 0 10px 100px;">추천대상</h2>
				<ul>
					<li><input type="text" name="foodTarget" class="adminInput" value="${fn:split(fn:split(f.foodContent,'@')[1], ',')[0]}" placeholder="식단 관리가 필요하신 분!" style="margin-bottom:3px; font-size: 16px; width: 100%;"></li>
					<li><input type="text" name="foodTarget" class="adminInput" value="${fn:split(fn:split(f.foodContent,'@')[1], ',')[1]}" placeholder="몸 관리가 필요하신 분!" style="margin-bottom:3px; font-size: 16px; width: 100%;"></li>
					<li><input type="text" name="foodTarget" class="adminInput" value="${fn:split(fn:split(f.foodContent,'@')[1], ',')[2]}" placeholder="마음 관리가 필요하신 분!" style="margin-bottom:3px; font-size: 16px; width: 100%;"></li>
				</ul>
			</div>
			
			<br>
			
			<p class="mid">상세 설명</p>
			
			<br>
			<div id="detailInfo">
				<div class="detailInfoElem">
					<i class="bi bi-calendar-check detailIcon"></i><br>
					<p>원하는 날짜에 배송 가능</p>
				</div>
				
				<div class="detailInfoElem">
					<i class="bi bi-hand-thumbs-up detailIcon"></i><br>
					<p>1일 1키트</p>
				</div>
				
				<div class="detailInfoElem">
					<i class="bi bi-check-lg detailIcon"></i><br>
					<p>다양하게 골라먹을 수 있다</p>
				</div>
				
				<div class="detailInfoElem">
					<i class="bi bi-journal-check detailIcon"></i><br>
					<p>전문 영양사가 직접 구성한 식단</p>
				</div>
			</div>
			
				
			<div class="mid">상세보기</div>
			<br>
					
			<div id="order">
				<div id="orderList" style="margin:auto; width:1200px;">
					<div id="detailBox" style="padding:30px 40px;">
						<c:forEach items="${fn:split(fn:split(f.foodContent,'@')[2], '#')}" var="table" varStatus="i">
							<c:if test="${fn:split(table,'-')[1] eq 1}">
								<div class="menuTable1">
									<table class="mb-3 w-100">
										<tr>
											<td class="num" style="width: 5%; text-align: center">${fn:split(table,'-')[0]}</td>
											<td style="width: 30%;">
												<input type="hidden" name="foodTable">
												<input type="hidden" name="tableType" value="1">
												<div style="width: 360px; height: 270px;" class="d-flex justify-content-center">
													<input name="imageNo" type="hidden" value="${imgList[i.index].imageNo}">
													<img class="previewImage" src="${contextPath}/resources/uploadFiles/${imgList[i.index].imageRenameName}" width="360" height="270" class="d-flex">
												</div>
												<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">
												<p style="font-size: 12px; color: gray; margin-bottom: 0px;">최적 이미지 비율은 4:3입니다.</p>
											</td>
											<td style="width: 58%;">
												<textarea name="foodTableText" rows="12" style="width: 100%" maxlength="300" placeholder="내용을 입력해주세요.">${fn:split(table,'-')[2]}</textarea>
											</td>
											<td style="width: 7%; text-align: center">
												<button onclick="del(this)" type="button" style="width: 50px; border: 2px solid rgba(0,0,0,0.3); border-radius: 5px;" class="deleteBtn">삭제</button>
											</td>
										</tr>
									</table>
								</div>
							</c:if>
							<c:if test="${fn:split(table,'-')[1] eq 2}">
								<div class="menuTable2">
									<table class="mb-3 w-100">
										<tr>
											<td style="width: 58%;">
												<textarea name="foodTableText" rows="12" style="width: 100%" maxlength="300" placeholder="내용을 입력해주세요.">${fn:split(table,'-')[2]}</textarea>
											</td>
											<td style="width: 30%;">
												<input type="hidden" name="foodTable">
												<input type="hidden" name="tableType" value="2">
												<div style="width: 360px; height: 270px;" class="d-flex justify-content-center">
													<input name="imageNo" type="hidden" value="${imgList[i.index].imageNo}">
													<img class="previewImage" src="${contextPath}/resources/uploadFiles/${imgList[i.index].imageRenameName}" width="360" height="270" class="d-flex">
												</div>
												<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">
												<p style="font-size: 12px; color: gray; margin-bottom: 0px;">최적 이미지 비율은 4:3입니다.</p>
											</td>
											<td class="num" style="width: 5%; text-align: center">${fn:split(table,'-')[0]}</td>
											<td style="width: 7%; text-align: center">
												<button onclick="del(this)" type="button" style="width: 50px; border: 2px solid rgba(0,0,0,0.3); border-radius: 5px;" class="deleteBtn">삭제</button>
											</td>
										</tr>
									</table>
								</div>
							</c:if>
								
						</c:forEach>
						
					</div>
					 
					<br>
					<div style="padding: 40px 30px;">
						<div class="text-end mb-5">
							<button id="addLeft" type="button" style="width: 100px; border: 2px solid rgba(0,0,0,0.3); border-radius: 10px;">왼쪽사진<br>내용추가</button>
							<button id="addRight" type="button" style="width: 100px; border: 2px solid rgba(0,0,0,0.3); border-radius: 10px;">오른쪽사진<br>내용추가</button>
						</div>
					</div>
				</div>
				
				
				<br><br><br>
				
				<div class="mid">
					영양 정보
				</div>
				
				<br><br>
				<table id="infoTable" style="width:1000px; margin:auto; margin-bottom: 100px; text-align: center;">	
					<tr id="infoTop">
						<th>칼로리</th>
						<th>탄수화물</th>
						<th>단백질</th>
						<th>지방</th>
						<th>트랜스지방</th>
						<th>포화지방</th>
						<th>나트륨</th>
						<th>당류</th>
						<th>콜레스테롤</th>
					</tr>
					<tr class="infoContent">
					<c:set value="${fn:split(fn:split(f.foodContent,'@')[3], ',')}" var="n"></c:set>
						<td><input type="number" name="nutrient" min="0" value="${n[0]}">kcal</td>
						<td><input type="number" name="nutrient" min="0" value="${n[1]}">g</td>
						<td><input type="number" name="nutrient" min="0" value="${n[2]}">g</td>
						<td><input type="number" name="nutrient" min="0" value="${n[3]}">g</td>
						<td><input type="number" name="nutrient" min="0" value="${n[4]}">g</td>
						<td><input type="number" name="nutrient" min="0" value="${n[5]}">mg</td>
						<td><input type="number" name="nutrient" min="0" value="${n[6]}">g</td>
						<td><input type="number" name="nutrient" min="0" value="${n[7]}">mg</td>
						<td><input type="number" name="nutrient" min="0" value="${n[8]}">mg</td>
					</tr>
				</table>
			
				<div class="d-flex justify-content-center mb-5">
					<div class="d-flex">
						<button onclick="submitFood()" type="button" class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
						<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
					</div>
				</div>
			</div>
			<br><br><br>
		</div>
	</form>

<input type="hidden" id="originCount">
<br><br>
<%@ include file="../common/footer.jsp" %>

	<script>
		window.onload =()=>{
// 			이미지 미리보기 함수, 이벤트 (기존값)
			const imageFiles = document.getElementsByName('imageFile');
			const previewImages = document.getElementsByClassName('previewImage');
			
			for(const i in imageFiles){
				if(i<imageFiles.length){
					imageFiles[i].addEventListener("change", e =>{
						if(imageFiles[i].files && imageFiles[i].files[0]){
							const reader = new FileReader();
							reader.onload = e =>{
								previewImages[i].src = e.target.result
								previewImages[i].parentElement.querySelector('input').value = 0;
							}
							reader.readAsDataURL(imageFiles[i].files[0])
						}
					})
				}
			}
			
// 			잘못된 값 거르기 / 가격*할인율 계산 이벤트 
			const pPrice = document.getElementsByName('productPrice')[0];
			const pSale = document.getElementsByName('productSale')[0];
			const pStock = document.getElementsByName('productStock')[0];
			const tPrice = document.getElementsByClassName('totalPrice')[0];
			cal();
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
			
// // 			메뉴 종류 버튼 이벤트
// 			const foodKind = document.getElementsByName('foodKind')[0];
// 			const foodKindBtns = document.getElementsByClassName('foodKindBtn');
			
// 			// 메인메뉴 버튼
// 			foodKindBtns[0].addEventListener('click', ()=>{
// 				foodKind.value="1";
// 				foodKindBtns[0].style.backgroundColor="#19A7CE";
// 				foodKindBtns[1].style.backgroundColor="gray";
// 			});
// 			// 서브메뉴 버튼
// 			foodKindBtns[1].addEventListener('click', ()=>{
// 				foodKind.value="2";
// 				foodKindBtns[1].style.backgroundColor="#19A7CE";
// 				foodKindBtns[0].style.backgroundColor="gray";
// 			});
			
			
// // 			밀키트/식재료 버튼 이벤트
// 			const foodType = document.getElementsByName('foodType')[0];
// 			const foodTypeBtns = document.getElementsByClassName('foodTypeBtn');
			
// 			// 메인메뉴 버튼
// 			foodTypeBtns[0].addEventListener('click', ()=>{
// 				foodType.value="1";
// 				foodTypeBtns[0].style.backgroundColor="#19A7CE";
// 				foodTypeBtns[1].style.backgroundColor="gray";
// 			});
// 			// 서브메뉴 버튼
// 			foodTypeBtns[1].addEventListener('click', ()=>{
// 				foodType.value="2";
// 				foodTypeBtns[1].style.backgroundColor="#19A7CE";
// 				foodTypeBtns[0].style.backgroundColor="gray";
// 			});
			
			const menuTable1 = 
				'<div class="menuTable1">'
			+		'<table class="mb-3 w-100">'
			+			'<tr>'
			+				'<td class="num" style="width: 5%; text-align: center"></td>'
			+				'<td style="width: 30%;">'
			+					'<input type="hidden" name="foodTable">'
			+					'<input type="hidden" name="tableType" value="1">'
			+					'<div style="width: 360px; height: 270px;" class="d-flex justify-content-center">'
			+						'<input name="imageNo" type="hidden" value="0">'
			+						'<img class="previewImage" src="${contextPath}/resources/images/logo_360x270.png" width="360" height="270" class="d-flex">'
			+					'</div>'
			+					'<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">'
			+					'<p style="font-size: 12px; color: gray; margin-bottom: 0px;">최적 이미지 비율은 4:3입니다.</p>'
			+				'</td>'
			+				'<td style="width: 58%;">'
			+					'<textarea name="foodTableText" rows="12" style="width: 100%" maxlength="300" placeholder="내용을 입력해주세요."></textarea>'
			+				'</td>'
			+				'<td style="width: 7%; text-align: center">'
			+					'<button onclick="del(this)" type="button" style="width: 50px; border: 2px solid rgba(0,0,0,0.3); border-radius: 5px;" class="deleteBtn">삭제</button>'
			+				'</td>'
			+			'</tr>'
			+		'</table>'
			+	'</div>'
			
			const menuTable2 = 
				'<div class="menuTable2">'
			+		'<table class="mb-3 w-100">'
			+			'<tr>'
			+				'<td style="width: 58%;">'
			+					'<textarea name="foodTableText" rows="12" style="width: 100%" maxlength="300" placeholder="내용을 입력해주세요."></textarea>'
			+				'</td>'
			+				'<td style="width: 30%;">'
			+					'<input type="hidden" name="foodTable">'
			+					'<input type="hidden" name="tableType" value="2">'
			+					'<div style="width: 360px; height: 270px;" class="d-flex justify-content-center">'
			+						'<input name="imageNo" type="hidden" value="0">'
			+						'<img class="previewImage" src="${contextPath}/resources/images/logo_360x270.png" width="360" height="270" class="d-flex">'
			+					'</div>'
			+					'<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">'
			+					'<p style="font-size: 12px; color: gray; margin-bottom: 0px;">최적 이미지 비율은 4:3입니다.</p>'
			+				'</td>'
			+				'<td class="num" style="width: 5%; text-align: center"></td>'
			+				'<td style="width: 7%; text-align: center">'
			+					'<button onclick="del(this)" type="button" style="width: 50px; border: 2px solid rgba(0,0,0,0.3); border-radius: 5px;" class="deleteBtn">삭제</button>'
			+				'</td>'
			+			'</tr>'
			+		'</table>'
			+	'</div>'
			
			const addLeft = document.getElementById('addLeft');
			const addRight = document.getElementById('addRight');
			
// 			왼쪽사진내용추가 버튼 이벤트
			addLeft.addEventListener('click', () => {
				detailBox.insertAdjacentHTML("beforeend", menuTable1);
				numbering();
				imageLoad();
			})
			
// 			오른쪽사진내용추가 버튼 이벤트
			addRight.addEventListener('click', () => {
				detailBox.insertAdjacentHTML("beforeend", menuTable2);
				numbering();
				imageLoad();
			})
		}
		
// 		가격 계산 함수
		function cal(){
			const pPrice = document.getElementsByName('productPrice')[0];
			const pSale = document.getElementsByName('productSale')[0];
			const tPrice = document.getElementsByClassName('totalPrice')[0];
			tPrice.value = Math.round(pPrice.value * (1 - pSale.value * 0.01));
		}
		
// 		삭제버튼 클릭 함수
		function del(obj){
			obj.parentElement.parentElement.parentElement.parentElement.remove();
			numbering();
		}
		
// 		순서 넘버링 함수
		function numbering(){
			const numbers = document.getElementsByClassName('num');
			for(const i in numbers){
				numbers[i].innerText = i*1+1; 
			}
		}
		
// 		이미지 로드 이벤트 추가 함수
		function imageLoad(){
			const imageFiles = document.getElementsByName('imageFile');
			const previewImages = document.getElementsByClassName('previewImage');
			const i = imageFiles.length-1;
			
			imageFiles[i].addEventListener("change", e =>{
				if(imageFiles[i].files && imageFiles[i].files[0]){
					const reader = new FileReader();
					reader.onload = e =>{
						previewImages[i].src = e.target.result;
					}
					reader.readAsDataURL(imageFiles[i].files[0]);
				}
			})
		}
		
// 		가격 계산 함수
		function calculate(){
			const cost = document.getElementsByClassName('cost')[0].value;
			const discount = document.getElementsByClassName('discount')[0].value;
			let resultCost = document.getElementsByClassName('resultCost')[0];
			
			resultCost.value = cost*(100-discount)*0.01;
		}
		
		
// 		submit 전 검토 / submit
		function submitFood(){
// 			상세보기 내용 foodTable에 담기
			const foodTables = document.getElementsByName('foodTable');
			const foodTableTexts = document.getElementsByName('foodTableText');
			for(const i in foodTables){
				if(i<foodTables.length){
					foodTables[i].value = "#"+foodTables[i].parentElement.parentElement.querySelector('.num').innerText+"-";
					foodTables[i].value += foodTables[i].nextElementSibling.value + "-";
					foodTables[i].value += foodTableTexts[i].value; 
				}
			}
			
			const foodName = document.getElementsByName('foodName')[0];
			const foodContent = document.getElementsByName('foodContent')[0];
			const foodTargets = document.getElementsByName('foodTarget');
			const productPrice = document.getElementsByName('productPrice')[0];
			const productSale = document.getElementsByName('productSale')[0];
			const imageFiles = document.getElementsByName('imageFile');
			const previewImages = document.getElementsByClassName('previewImage'); 
			
// 			개발용 임시 값 넣기
// 			foodName.value="식품이름";
// 			foodContent.value="식품소개";
// 			foodTargets[0].value="추천대상1";
// 			foodTargets[1].value="추천대상2";
// 			for(const i in foodTableTexts){
// 				if(i<foodTableTexts.length){
// 					foodTableTexts[i].value="식품 상세보기 내용-foodTableText"+i;
// 				}
// 			}
// 			////

			if(foodName.value.trim()==''){
				alert("식품 이름을 입력해주세요.");
				foodName.focus();
			}else if(foodName.value.split('@').length > 1){
				alert("식품 이름에는 아래 기호를 입력할 수 없습니다.\n"
					 +"( @ )");
				foodName.focus();
			}else if(foodContent.value.trim()==''){
				alert("식품 소개를 입력해주세요.");
				foodName.focus();
			}else if(foodTargets[0].value.trim()=='' && foodTargets[1].value.trim()=='' && foodTargets[2].value.trim()==''){
				alert("추천대상을 입력해주세요.");
				foodTargets[0].focus();
			}else if(foodTargets[0].value.split('@').length > 1){
				alert("추천대상에는 아래 기호를 입력할 수 없습니다.\n"
					 +"( @ )");
				foodTargets[0].focus();
			}else{
				let textYN = "Y";
				for(const i in foodTableTexts){
					if(i < foodTableTexts.length){
						const text = foodTableTexts[i].value;
						if(text.trim() == ''){
							alert("상세보기 내용을 입력해주세요.");
							foodTableTexts[i].focus();
							textYN = "N";
							break;
						}else if(text.split('@').length > 1 || text.split('#').length > 1 || text.split('-').length > 1){
							alert("상세보기에는 아래 기호를 입력할 수 없습니다.\n"
								 +"( @  #  - )");
							foodTableTexts[i].focus();
							textYN = "N";
							break;
						}
					}
				}
				let imageYN = "Y"
				if(textYN == "Y"){
					for(let i = 0; i < previewImages.length; i++){
						if(previewImages[i].src == 'http://localhost:8079/hollosekki/resources/images/logo_360x270.png'){
							alert("사진을 등록해주세요.");
							previewImages[i].focus();
							imageYN = "N";
							break;
						}
					}
// 					for(const i in imageFiles){
// 						if(i<imageFiles.length){
// 							if(imageFiles[i].value == false){
// 								alert("사진을 등록해주세요.");
// 								imageFiles[i].focus();
// 								imageYN = "N";
// 								break;
// 							}
// 						}
// 					}
				}
				if(textYN == "Y" && imageYN == "Y"){
					if(productPrice.value == 0){
						if(!confirm("가격을 0원으로 설정하시겠습니까?")){
							alert("가격을 입력해주세요.");
							productPrice.focus();
						}else{
							document.getElementById('foodUpdateForm').submit();
						}
					}else{
						document.getElementById('foodUpdateForm').submit();
					}
				}
			}
			
		}
	
	</script>
</body>
</html>
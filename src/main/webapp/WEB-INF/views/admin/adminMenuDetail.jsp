<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>admin</title>
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
/* 		border-radius: 10px; */
		box-shadow: 1px 1px 1px 1px gray;
	}
	
	.infoContent td input{width:100px;}
</style>
<body>
<span>
<%@include file="../common/top.jsp" %>
<jsp:include page="../common/adminSidebar.jsp"/>
<br>
</span>

	<form action="${contextPath}" method="get">
	<main id="order-wrap">
		<!-- 구매창 컨테이너 -->
		<div class="left">
			<!-- 구매창 왼쪽 사진 넣는 곳 -->
			<img src="https://recipe1.ezmember.co.kr/cache/data/goods/23/04/16/1000035599/1000035599_detail_046.jpg">
			<br>
			<br>
			<div id="userInfo">
				<img src="resources/image/mudo.png" style="width: 100px; height: 100px; border-radius: 50%" role="button" data-bs-toggle="modal" data-bs-target="#profileModal"><br>
				<p role="button" data-bs-toggle="modal" data-bs-target="#profileModal" id="nickBtn" class="d-inline-block">닉네임</p>
			</div>
		</div>
		<div class="right">
			<!-- 상품 정보 -->
			<div class="top">
				<div class="productNameBox" style="text-align: center">
					<input type="text" name="menuName" class="adminInput" placeholder="식단 이름" style="font-weight: 400; font-size: 36px; text-align: center;">
				</div>
				<div style="margin: auto; text-align: center;">
				<br>
					<input type="number" name="productPrice" class="adminInput" placeholder="식단 가격" style="font-weight: 400; font-size: 28px; text-align: center; width: 250px;">
					<h2 style="font-weight: 200; display: inline-block; font-size: 36px;">원</h2>
					&nbsp;&nbsp;
					<h4 class="like" style="display: inline-block; font-size: 40px; color: #4485d7;">♡</h4>
					<br><br>
				</div>
				<div>
					<div class="info_delivery_area">
                        <dl class="info_delivery">
                            <dt style="font-size: 20px; padding: 5px;">
                            	<img src="resources/image/delivery.png" alt="배송아이콘" style="width: 28px; vertical-align: -8px;">
                            	&nbsp;배송 | 3,000원 
                            </dt>
							<hr style="margin: 0px;">
						</dl>
						<dl class="info_point">
                            <dt style="font-size: 20px; padding: 5px;">
                            	<img src="resources/image/point.png" alt="포인트아이콘" style="width: 28px; vertical-align: -8px;">
                            	&nbsp;<p style="font-size: 15px; display: inline-block;">적립(구매가격의 0.5% 적립) | 0,000원</p>
                            </dt>
							<hr style="margin: 0px;">
						</dl>
						
						
						<label>희망 배송일</label>
						<input type="date" name="date" id="wantDate" class="inputBox">
						<br><br>
						<hr style="margin: 0px;">
						<br>	
						
						<label>[필수] 기간을 선택해주세요.</label><br>
						<div id="period" class="inputBox">
<!-- 							<label for="first">1주</label><input type="radio" name="period" value="1st" id="first" class="selectPeriod" onchange="show()">&nbsp;&nbsp;&nbsp; -->
<!-- 							<label for="second">2주</label><input type="radio" name="period" value="2nd" id="second" class="selectPeriod" onchange="show()">&nbsp;&nbsp;&nbsp; -->
<!-- 							<label for="third">3주</label><input type="radio" name="period" value="3rd" id="third" class="selectPeriod" onchange="show()">&nbsp;&nbsp;&nbsp; -->
<!-- 							<label for="fourth">4주</label><input type="radio" name="period" value="4th" id="fourth" class="selectPeriod" onchange="show()"> -->
						</div>
						
						<br>
						
						
						<div id="productResult">
							<!-- 사이즈 선택시 내려오는 창 -->
							<div>
								<h4 class="productName" style="color: #19A7CE; margin-left: 20px;">
									상품 가격 : 원
								</h4>
							</div>
							
<!-- 							<div style="display: inline-block; margin-top: 12px; font-weight: 200;"></div> -->
							<strong class="productPrice" style="display: inline-block; margin-top: 12px; position: right; font-weight: 200;">
								<input type="hidden" name="productPrice" value="${p.productPrice}">
								<input type="hidden" name="discountRate" value="${p.discountRate}">
								<input type="hidden" name="productMainPic" value="${p.productMainPic}">
							</strong>
							<br>
						</div>
					
					</div>
					
					<button type="button" id="buybtn" style="display: inline-block; width: 60%;" data-bs-toggle="modal" data-bs-target="#buyModal">구매하기</button> <!-- 결제 창으로 -->
					<button type="button" id="cartbtn"  class="cartbtn" style="display: inline-block; width: 39%;" data-bs-toggle="modal" data-bs-target="#cartModal">장바구니</button>
				</div>
			</div>
		</div>
	</main>
</form>
<br>
<br>
		
	
<div class ="productInfoMain">

	<div id="target">
		<i id="pushPin" class="bi bi-pin-fill"></i>
		<h2 style="padding: 30px 0 10px 100px;">추천대상</h2>
		<ul>
			<li><input type="text" name="menuContent" class="adminInput" value="식단 관리가 필요하신 분!" style="margin-bottom:3px; font-size: 16px; width: 100%;"></li>
			<li><input type="text" name="menuContent" class="adminInput" value="몸 관리가 필요하신 분!" style="margin-bottom:3px; font-size: 16px; width: 100%;"></li>
			<li><input type="text" name="menuContent" class="adminInput" value="마음 관리가 필요하신 분!" style="margin-bottom:3px; font-size: 16px; width: 100%;"></li>
		</ul>
	</div>
	
	<br>
	
	<p class="mid">상세 설명</p>
	
	<br>
	<div id="detailInfo">
		<div class="detailInfoElem">
			<i class="bi bi-calendar-check detailIcon"></i><br>
			<p>1주일 치 식단을 기간별로 선택 가능</p>
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
	
		
	<div class="mid">식단</div>
		<br>
			
		<div id="order">
			<div id="orderList" style="margin:auto;">
			
				<c:forEach begin="1" end="7" varStatus="vs">
					<table id="menuTable" style="width:1200px; margin:auto; margin-bottom: 20px;" >
						<tr>
							<td class="no" rowspan="4">${vs.index}일차</td>
							<td class="image">
								<img src="${contextPath}/resources/images/logo.png" width="150px" height="120px" alt="메인메뉴사진">
							</td>
							<td class="content align-top p-3">
								<p style="font-size: 18px;">양념불고기</p>
								<p>매콤한 빨간 양념에 재워진 불고기! 남녀노소 좋아하는 양념불고기! 맛있는 양념불고기! 먹고싶다 양고기..!</p>
							</td>
							<td>
								<input type="text" placeholder="메인메뉴 검색">
							</td>
							<td>
								<p>6,000원</p>
							</td>
						</tr>
						<tr>
							<td class="image">
								<img src="${contextPath}/resources/images/logo.png" width="150px" height="120px" alt="서브메뉴1사진">
							</td>
							<td class="content align-top p-3">
								<p style="font-size: 18px;">미역국</p>
								<p>러시아산 미역의 깊은맛으로 끓인 미역국! 누구나 반하는 맛!</p>
							</td>
							<td>
								<input type="text" placeholder="서브메뉴1 검색">
							</td>
							<td>
								<p>1,700원</p>
							</td>
						</tr>
						<tr>
							<td class="image">
								<img src="${contextPath}/resources/images/logo.png" width="150px" height="120px" alt="서브메뉴2사진">
							</td>
							<td class="content align-top p-3">
								<p style="font-size: 18px;">어묵볶음</p>
								<p>000영양사의 최애 반찬 어묵볶음! 매콤한 고추기름으로 볶은 맛있는 어묵볶음!</p>
							</td>
							<td>
								<input type="text" placeholder="서브메뉴2 검색">
							</td>
							<td>
								<p>1,200원</p>
							</td>
						</tr>
						<tr>
							<td class="image">
								<img src="${contextPath}/resources/images/logo.png" width="150px" height="120px" alt="서브메뉴3사진">
							</td>
							<td class="content align-top p-3">
								<p style="font-size: 18px;">연근조림</p>
								<p>간장의 달콤짭짤한 맛으로 졸여진 아삭한 연근조림!</p>
							</td>
							<td>
								<input type="text" placeholder="서브메뉴3 검색">
							</td>
							<td>
								<p>1,500원</p>
							</td>
						</tr>
						
						<tr>
							<td colspan="4">소계</td>
							<td>9,400원</td>
						</tr>
					</table>
				</c:forEach>			
				
				
				<div style="width:1200px; margin:auto;">
					<p style="font-size: 22px; font-weight: bold; text-align: right;">총계</p>
					<div class="d-flex justify-content-end">
						<table class="d-flex text-center border-none">
							<tr>
								<th>단가</th>
								<th></th>
								<th>할인율</th>
								<th></th>
								<th colspan="2">최종가격</th>
							</tr>
							<tr>
								<td>
									<input type="number" class="productPrice" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="63000" min="0" readonly>
								</td>
								<td style="width: 50px; font-size: 16px; font-weight: bold; text-align: left;">원 - </td>
								<td>
									<input type="number" class="productSale adminInput" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" min="0" max="99">
								</td>
								<td style="width: 50px; font-size: 16px; font-weight: bold; text-align: left;">% =</td>
								<td>
									<input type="number" class="totalPrice" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" readonly>
								</td>
								<td style="width: 30px; font-size: 16px; font-weight: bold; text-align: left;">원</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<br><br><br>
		
		<div class="mid">
			영양 정보
		</div>
		
		<br><br>
		
		<table id="infoTable" style="width:1200px; margin:auto;">
			<tr id="infoTop" style="text-align:center;">
				<th style="width:9%;">분류</th>
				<th style="width:13%;">1일차</th>
				<th style="width:13%;">2일차</th>
				<th style="width:13%;">3일차</th>
				<th style="width:13%;">4일차</th>
				<th style="width:13%;">5일차</th>
				<th style="width:13%;">6일차</th>
				<th style="width:13%;">7일차</th>
			</tr>
			<tr class="infoContent">
				<td class="text-center">칼로리</td>
				<td><input type="number" min="0" value="0" readonly>kcal</td>
				<td><input type="number" min="0" value="0" readonly>kcal</td>
				<td><input type="number" min="0" value="0" readonly>kcal</td>
				<td><input type="number" min="0" value="0" readonly>kcal</td>
				<td><input type="number" min="0" value="0" readonly>kcal</td>
				<td><input type="number" min="0" value="0" readonly>kcal</td>
				<td><input type="number" min="0" value="0" readonly>kcal</td>
			</tr>
			<tr class="infoContent">
				<td class="text-center">탄수화물</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
			</tr>
			<tr class="infoContent">
				<td class="text-center">트랜스지방</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
			</tr>
			<tr class="infoContent">
				<td class="text-center">포화지방</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
			</tr>
			<tr class="infoContent">
				<td class="text-center">나트륨</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
			</tr>
			<tr class="infoContent">
				<td class="text-center">당류</td>	
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
				<td><input type="number" min="0" value="0" readonly>g</td>
			</tr>
			<tr class="infoContent">
				<td class="text-center">콜레스테롤</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
				<td><input type="number" min="0" value="0" readonly>mg</td>
			</tr>
			
		</table>
		
		<br><br>	
		
		<div class="d-flex justify-content-center mb-5">
			<div class="d-flex">
				<button class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
				<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
			</div>
		</div>

	
	
	
	
	
	
	
	
</div>

<!-- 식단 작성자 프로필 -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">영양사 프로필</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="modalNick">
					<img src="resources/image/mudo.png" style="width: 100px; height: 100px; border-radius: 50%"><br>
					<p style="font-weight: bold;">닉네임</p>
				</div>
				<div id="modalInfo">
				영양사의 정보를 알려주는 창입니다.
				</div>
				
				<p class="modalMid">등록한 식단표</p>
				<div class="album p-3 bg-white">
					<div class="container px-3">
						<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 g-4">
							<c:forEach begin="1" end="4">
								<div class="col">
									<div class="shadow-sm">
										<div class="card-body moCon" style="background-color: lightgray">
											<h6 style="font-weight: bold;"><a href="menuDetail.mn" style="text-decoration: none; color: black;">식단 명 / 카테고리</a></h6>
											<p>별점</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<br><br>
<%@ include file="../common/footer.jsp" %>

<script>
	function show(){
		const check = document.querySelector('input[name="period"]:checked');
		const first = document.getElementById('first');
		const second = document.getElementById('second');
		const third = document.getElementById('third');
		const fourth = document.getElementById('fourth');
		const sel1sts = document.getElementsByClassName('select1st');
		const sel2nds = document.getElementsByClassName('select2nd');
		const sel3rds = document.getElementsByClassName('select3rd');
		const sel4ths = document.getElementsByClassName('select4th');
		
		const one = document.getElementsByClassName('oneWeek');
		const two = document.getElementsByClassName('twoWeek');
		const three = document.getElementsByClassName('threeWeek');
		const four = document.getElementsByClassName('fourWeek');
		
		for(const sel1st of sel1sts){
			if(check && check.id == "first"){
				sel1st.style.display = 'block';
			} else{
				sel1st.style.display = 'none';
				for(const o of one){
					o.value = 0;
				}
			}
		}
		for(const sel2nd of sel2nds){
			if(check && check.id == "second"){
				sel2nd.style.display = 'block';
			} else{
				sel2nd.style.display = 'none';
				for(const t of two){
					t.value = 0;
				}
			}
		}
		for(const sel3rd of sel3rds){
			if(check && check.id == "third"){
				sel3rd.style.display = 'block';
			} else{
				sel3rd.style.display = 'none';
				for(const th of three){
					th.value = 0;					
				}
			}
		}
		for(const sel4th of sel4ths){
			if(check && check.id == "fourth"){
				sel4th.style.display = 'block';
			} else{
				sel4th.style.display = 'none';
				for(const f of four){
					f.value = 0;
				}
			}
		}
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

   const productName = document.getElementsByClassName("productName")[1]; // 드롭박스에 적힐 상품명
   
   const option = document.getElementsByClassName("options"); //사이즈 선택 창
   
   let buyCount = document.getElementsByClassName("buyCount")[0]; // 상품 수량 
   const decrease = document.getElementById("decrease"); // 상품 수량 감소 버튼
   const increase = document.getElementById("increase"); // 상품 수량 증가 버튼
   let productPrice = document.getElementsByClassName("productPrice")[0];
   const buyBtn = document.getElementById("buyBtn");
   const result = document.getElementById("productResult");
   const like = document.querySelector(".like");
   
      like.addEventListener("click", function() {
	    if(like.innerText === '♡') {
	        like.innerText = '♥';
	    } else like.innerText ='♡';
	});
   
   
   function priceToString(productPrice) {
       return productPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
   }
   
//    console.log(option);
	

// 	$(document).ready(function() {
//     $(".cartbtn").click(function() {
//         var productNo = $("input[name='productNo']").val();
//         var cartCount = $(".buyCount").val();
//         var optionSize = $(".size").val();
        
        
//         var data = {
//             productNo: productNo,
//             cartCount: cartCount,
//             optionSize: optionSize
//         };
        
//         $.ajax({
//             url: "${contextPath}/addCart.ca",
//             type: "post",
//             data: data,
//             success: function(data) {
//             	if(data > 0) {
//                 alert("카트 담기 성공");
//             	}
//             },
//             error: function(data) {
//                 alert("카트 담기 실패");
//             }
//         });
//     });
// });
	
	
 </script> 

</body>
</html>
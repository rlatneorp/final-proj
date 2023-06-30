<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMenuDetail</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	span{height:30px;}
	
/* 	식단 소개 */
	#top{width: 1200px; height: 600px; position: relative; display: inline-block; margin-top: 100px;}
	#thumImg{width: 500px; height: 500px; display: inline-block; position: absolute; border-radius: 5px;}
	#imformation{width: 650px; height: 500px; display: inline-block; position: absolute; left: 550px;}
	#title{border-bottom: 1px solid black; width: 630px;}
	#category{width: 550px; height: 50px; margin-left: 50px; margin-right: 50px; margin-top: 50px; font-weight: bold; font-size: 18px; text-align: center;}
	#userInfo{text-align: center;}
	#updateBtn{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px;}
	#deleteBtn{background-color: lightgray; color: black; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px; margin-left: 10px;}
	
/* 	중간선 */
	.mid{display: flex; flex-basis: 100%; align-item: center; color: rgba(0,0,0,1); font-size: 30px; margin: 5px 0px; font-weight: bold;}
	.mid::before{content: ""; flex-grow: 1; margin: 23px 16px 15px 200px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0spx;}
	.mid::after{content: ""; flex-grow: 1; margin: 23px 200px 15px 16px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}
	
/* 	식단 종류 */
	#order{width: 900px; background: lightgray; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black;}
	#orderList{padding: 30px 40px;}
	#menuTable{
		border-collapse: collapse;
	}
	#menuTable tr td{text-align: center;}
	.no{width: 50px;}
	.content{width: 400px;}
	.content2{border-top: 1px solid black;}
	.image{width: 150px; height:120px}
	
/* 	영양 정보 */
	#infoTable{width: 1100px; margin: auto; border: 1px solid black; border-radius: 10px;}
	#infoTop{border-bottom: 1px solid black; background-color: lightgray; border-radius: 10px 10px 0 0;}
	#infoTop th{width: 157px; text-align: center; border-right: 1px solid black}
	.infoContent td{padding: 3px; border-right: 1px solid black}
	.infoContent td input{width: 80px; margin: 0px 3px; text-align: right;}
	
/* 	버튼 */
	.buy{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 130px; height: 40px;}
	
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
	.inputBox{width:730px; height: 50px; margin: auto; position: relative;}
	.profile{width: 35px; height: 35px; border: none; border-radius: 50%; position: absolute; top: 5px;}
	.profileImg{width:35px; height: 35px; border-radius: 50%;}
	.inputText{border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 600px; height: 40px; position: absolute; left: 40px;}
	.enter{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px; position: absolute; right: 0;}
	
/* 	후기 */
	.star{width: 110px;}
	.boardReviewWrite{width: 100px;}
	.boardReviewDate{width: 150px;}


/* 	기타 */
	.border-none tr th{border:none;}
	.border-none tr td{border:none;}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox">
		<form action="${contextPath}/adminMenuUpdate.ad" method="post">
			<div id="top">
				<div id="thumImg">
					<img src="${contextPath}/resources/images/logo.png" style="width: 100%; height: 100%; border-radius: 5px;">
					<input type="file" >
				</div>
				<div style="width: 50px; height: 500px; display: inline-block; position: absolute; left: 500px;"></div>
				<div id="imformation">
					<div id="title">
						<input type="text" name="title" style="font-size: 20px; margin-right: 360px;" placeholder="식단 이름을 적어주세요.">
						<a href="#"><i class="bi bi-bookmark " style="font-size: 20px;"></i></a>
					</div>
					<div id="category">
						아이콘 식단 카테고리 선택
						<select name="category">
							<option>다이어트</option>
							<option>육류</option>
							<option>해산물</option>
						</select>
					</div>
					<br>
					<div id="userInfo">
						<img src="resources/image/mudo.png" style="width: 100px; height: 100px; border-radius: 50%">
						<p style="font-weight: bold;">000영양사</p>
						<p>*****(별점)</p>
						<textarea name="subContent" rows="6" cols="80" placeholder="식단에 대한 설명을 입력해주세요."></textarea>
					</div>
					
					<br><br>
					
				</div>
			</div>
			
		
			
			<div class="mid">
				식단 종류
			</div>
			
			<br>
			
			<div id="order">
				<div id="orderList">
				
					<c:forEach begin="1" end="7" varStatus="vs">
						<table id="menuTable" class="mb-3">
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
									<input type="number" class="cost" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="63000" min="0" readonly>
								</td>
								<td style="width: 50px; font-size: 16px; font-weight: bold; text-align: left;">원 - </td>
								<td>
									<input type="number" class="discount" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" min="0" max="99">
								</td>
								<td style="width: 50px; font-size: 16px; font-weight: bold; text-align: left;">% =</td>
								<td>
									<input type="number" class="resultCost" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" readonly>
								</td>
								<td style="width: 30px; font-size: 16px; font-weight: bold; text-align: left;">원</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
			<br><br><br>
			
			<div class="mid">
				영양 정보
			</div>
			
			<br><br>
			
			<table id="infoTable">
				<tr id="infoTop">
					<th>분류</th>
					<th>1일차</th>
					<th>2일차</th>
					<th>3일차</th>
					<th>4일차</th>
					<th>5일차</th>
					<th>6일차</th>
					<th>7일차</th>
				</tr>
				<tr class="infoContent">
					<td class="text-center">칼로리</td>
					<td><input type="number" min="0" readonly>kcal</td>
					<td><input type="number" min="0" readonly>kcal</td>
					<td><input type="number" min="0" readonly>kcal</td>
					<td><input type="number" min="0" readonly>kcal</td>
					<td><input type="number" min="0" readonly>kcal</td>
					<td><input type="number" min="0" readonly>kcal</td>
					<td><input type="number" min="0" readonly>kcal</td>
				</tr>
				<tr class="infoContent">
					<td class="text-center">탄수화물</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
				</tr>
				<tr class="infoContent">
				<td class="text-center">탄수화물</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
				</tr>
				<tr class="infoContent">
					<td class="text-center">트랜스지방</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
				</tr>
				<tr class="infoContent">
					<td class="text-center">포화지방</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
				</tr>
				<tr class="infoContent">
					<td class="text-center">나트륨</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
				</tr>
				<tr class="infoContent">
					<td class="text-center">당류</td>	
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
					<td><input type="number" min="0" readonly>g</td>
				</tr>
				<tr class="infoContent">
					<td class="text-center">콜레스테롤</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
					<td><input type="number" min="0" readonly>mg</td>
				</tr>
				
			</table>
			
			<br><br>	
			
			<div class="d-flex justify-content-center mb-5">
				<div class="d-flex">
					<button class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
					<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
				</div>
			</div>
		</form>
	</div>
	
	<br><br><br><br>
	
	<script>
	
		window.onload = () =>{
			const cost = document.getElementsByClassName('cost')[0];
			const discount = document.getElementsByClassName('discount')[0];
			let resultCost = document.getElementsByClassName('resultCost')[0];
// 			기본 계산
			resultCost.value = cost.value*(100-discount.value)*0.01;
			
// 			가격 계산 이벤트
			cost.addEventListener('change', ()=>{
				calculate();
			})
			discount.addEventListener('change', ()=>{
				calculate();
			})
		}
	
//		가격 계산 함수
		function calculate(){
			const cost = document.getElementsByClassName('cost')[0].value;
			const discount = document.getElementsByClassName('discount')[0].value;
			let resultCost = document.getElementsByClassName('resultCost')[0];
			
			resultCost.value = cost*(100-discount)*0.01;
		}
	</script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
	.mid::before{content: ""; flex-grow: 1; margin: 23px 16px 15px 200px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}
	.mid::after{content: ""; flex-grow: 1; margin: 23px 200px 15px 16px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}
	
/* 	식품 상세설명 */
	#order{width: 900px; background: lightgray; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black;}

/* 	영양 정보 */
	#infoTable{width: 1100px; margin: auto; border: 1px solid black; border-radius: 10px;}
	#infoTop{border-bottom: 1px solid black; background-color: lightgray; border-radius: 10px 10px 0 0;}
	#infoTop th{width: 157px; text-align: center; border-right: 1px solid black}
	.infoContent td{padding: 3px; border-right: 1px solid black;}
	.infoContent td input{width: 100px; margin: 0px 3px;}
	
	
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
		<form action="${contextPath}/adminFoodUpdate.ad" method="post">
			<div id="top">
				<div id="thumImg">
					<img src="${contextPath}/resources/images/logo.png" style="width: 100%; height: 100%; border-radius: 5px;">
					<input type="file" >
				</div>
				<div style="width: 50px; height: 500px; display: inline-block; left: 500px;"></div>
				<div id="imformation">
					<div id="title">
						<input type="text" name="title" style="font-size: 20px; margin-right: 360px;" placeholder="식품 이름을 적어주세요.">
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
						<img src="#" style="width: 100px; height: 100px; border-radius: 50%">
						<p style="font-weight: bold;">000영양사</p>
						<p>*****(별점)</p>
						<textarea name="subContent" rows="6" cols="80" placeholder="식품에 대한 설명을 입력해주세요."></textarea>
					</div>
					
					<br><br>
					
				</div>
			</div>
		
			
			<div class="mid">
				식품 상세설명
			</div>
			
			<br>
			
			<div id="order">
				<div id="detailBox" style="padding:30px 40px;">
					
					<div class="menuTable1">
						<table class="mb-3 w-100">
							<tr>
								<td class="num" style="width: 5%; text-align: center">1</td>
								<td style="width: 30%;">
									<div style="width: 250px; height: 200px;" class="d-flex justify-content-center">
										<img src="${contextPath}/resources/images/logo.png" width="200" height="200" class="d-flex">
									</div>
									<input type="file">
								</td>
								<td style="width: 58%;">
									<textarea rows="8" style="width: 100%" maxlength="200" placeholder="내용을 입력해주세요."></textarea>
								</td>
								<td style="width: 7%; text-align: center">
									<button onclick="del(this)" type="button" style="width: 45px; border: 2px solid rgba(0,0,0,0.3); border-radius: 5px;" class="deleteBtn">삭제</button>
								</td>
							</tr>
						</table>
					</div>
					<div class="menuTable2">
						<table class="mb-3 w-100">
							<tr>
								<td style="width: 58%;">
									<textarea rows="8" style="width: 100%" maxlength="200" placeholder="내용을 입력해주세요."></textarea>
								</td>
								<td style="width: 30%;">
									<div style="width: 250px; height: 200px;" class="d-flex justify-content-center">
										<img src="${contextPath}/resources/images/logo.png" width="200" height="200" class="d-flex">
									</div>
									<input type="file">
								</td>
								<td class="num" style="width: 5%; text-align: center">2</td>
								<td style="width: 7%; text-align: center">
									<button onclick="del(this)" type="button" style="width: 45px; border: 2px solid rgba(0,0,0,0.3); border-radius: 5px;" class="deleteBtn">삭제</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
				 
				<br>
				<div style="padding: 40px 30px;">
					<div class="text-end mb-5">
						<button id="addLeft" type="button" style="width: 100px; border: 2px solid rgba(0,0,0,0.3); border-radius: 10px;">왼쪽사진<br>내용추가</button>
						<button id="addRight" type="button" style="width: 100px; border: 2px solid rgba(0,0,0,0.3); border-radius: 10px;">오른쪽사진<br>내용추가</button>
					</div>
					
		<!-- 			<p style="font-size: 20px; font-weight: bold; text-align: right;">가격</p> -->
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
									<input type="number" class="cost" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" min="0">
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
			
			<table id="infoTable" style="margin-bottom: 100px;">
				<tr id="infoTop">
					<th>칼로리</th>
					<th>탄수화물</th>
					<th>지방</th>
					<th>트랜스지방</th>
					<th>포화지방</th>
					<th>나트륨</th>
					<th>당류</th>
					<th>콜레스테롤</th>
				</tr>
				<tr class="infoContent">
					<td>
						<input type="number" min="0">kcal
					</td>
					<td>
						<input type="number" min="0">g
					</td>
					<td>
						<input type="number" min="0">g
					</td>
					<td>
						<input type="number" min="0">g
					</td>
					<td>
						<input type="number" min="0">g
					</td>
					<td>
						<input type="number" min="0">mg
					</td>
					<td>
						<input type="number" min="0">g
					</td>
					<td>
						<input type="number" min="0">mg
					</td>
				</tr>
			</table>
		
			<div class="d-flex justify-content-center mb-5">
				<div class="d-flex">
					<button class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">작성하기</button>
					<button onclick="location.href='${contextPath}/adminFoodManage.ad'" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
				</div>
			</div>
		</form>
	</div>
	<br><br><br><br>
	
	
	<script>
		
		window.onload =()=>{
			const menuTable1 = document.getElementsByClassName('menuTable1')[0].innerHTML;
			const menuTable2 = document.getElementsByClassName('menuTable2')[0].innerHTML;
			
			const addLeft = document.getElementById('addLeft');
			const addRight = document.getElementById('addRight');
			
// 			왼쪽사진내용추가 버튼 이벤트
			addLeft.addEventListener('click', () => {
				let detailBox = document.getElementById('detailBox');
				detailBox.innerHTML += menuTable1;
				
				numbering();
			})
			
// 			오른쪽사진내용추가 버튼 이벤트
			addRight.addEventListener('click', () => {
				let detailBox = document.getElementById('detailBox');
				detailBox.innerHTML += menuTable2; 
				
				numbering();
			})

			
// 			가격 계산 이벤트
			const cost = document.getElementsByClassName('cost')[0];
			const discount = document.getElementsByClassName('discount')[0];
			cost.addEventListener('blur', ()=>{
				calculate();
			})
			discount.addEventListener('blur', ()=>{
				calculate();
			})
			
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
		
// 		가격 계산 함수
		function calculate(){
			const cost = document.getElementsByClassName('cost')[0].value;
			const discount = document.getElementsByClassName('discount')[0].value;
			let resultCost = document.getElementsByClassName('resultCost')[0];
			
			resultCost.value = cost*(100-discount)*0.01;
		}
	
	</script>
		
	
</body>
</html>
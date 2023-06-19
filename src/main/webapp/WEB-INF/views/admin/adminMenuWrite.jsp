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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
	#order{width: 1200px; background: lightgray; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black;}
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
	#infoTop th{width: 157px; text-align: center;}
	.infoContent td{padding: 3px;}
	.infoContent td input{width: 70px; margin: 0px 3px; text-align: right;}
	.infoContentDay td input{width: 70px; margin: 0px 3px; text-align: right;}
	
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
/* 	table tr th{border:none;} */
/* 	table tr td{border:none;} */
/* 	table tr{border: 1px solid gray;} */
	
</style>
</head>
<body>
	
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox">
		<form action="${contextPath}/adminMenuInsert.ad" method="post" enctype="multipart/form-data">
			<div id="top">
				<div id="thumImg">
					<img class="previewImage" src="${contextPath}/resources/images/Logo.png" style="width: 100%; height: 100%; border-radius: 5px;">
					<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">
				</div>
				<div style="width: 50px; height: 500px; display: inline-block; position: absolute; left: 500px;"></div>
				<div id="imformation">
					<div id="title">
						<input type="text" name="menuName" style="font-size: 20px; margin-right: 360px;" placeholder="식단 이름을 적어주세요.">
						<a href="#"><i class="bi bi-bookmark " style="font-size: 20px;"></i></a>
					</div>
					<div id="category" style="margin-bottom: 200px;">
						아이콘 식단 카테고리 선택
						<select name="menuType">
							<option value="1">다이어트</option>
							<option value="2">육류</option>
							<option value="3">해산물</option>
						</select>
					</div>
					
					<div id="userInfo">
						<textarea name="menuContent" rows="6" cols="80" placeholder="식단에 대한 설명을 입력해주세요."></textarea>
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
						<div style="margin-bottom: 30px; border: 3px solid rgba(0,0,0,0.7); border-radius: 5px; box-shadow: 1px 1px 5px 2px rgba(0,0,0,0.3);">
							<table id="menuTable${vs.index}"style="width:100%">
								<tr>
									<td class="no" rowspan="4" style="width:5%; font-size: 18px; font-weight: bold;">
										${vs.index}일차
										</td>
									<td class="imageTd" style="width:20%; text-align: center;">
<!-- 										<input type="hidden" name="productNo" value="0"> -->
										<input type="hidden" class="nutrient" value="">
										<input type="hidden" class="index" value="${vs.index-1}">
										<img class="previewImage" src="${contextPath}/resources/images/Logo.png" width="200px" height="200px" alt="메인메뉴사진">
									</td>
									<td class="content align-top p-3" style="width:40%">
										<p style="font-size: 18px;">식품 이름</p>
										<p>식품 내용</p>
									</td>
									<td style="width:25%">
										<select name="foodProductNo" class="foodSelector" style="width: 100%; height: 40px; font-size: 16px;">
											<option value="0">-- 메인메뉴 --</option>
											<c:forEach items="${fList1}" var="f">
												<option value="${f.productNo}">${f.foodName}</option>
											</c:forEach>
										</select>
									</td>
									<td style="width:10%; text-align: center">
										<input type="number" class="priceBox pb${vs.index}" readonly style="width:80%" value="0"><span style="width:20%">원</span>
									</td>
								</tr>
								
								<c:forEach begin="1" end="3">
									<tr>
										<td class="imageTd" style="width:20%; text-align: center;">
<!-- 											<input type="hidden" name="productNo" value="0"> -->
											<input type="hidden" class="nutrient" value="0,0,0,0,0,0,0,0">
											<input type="hidden" class="index" value="${vs.index-1}">
											<img class="previewImage" src="${contextPath}/resources/images/Logo.png" width="200px" height="200px" alt="서브메뉴사진">
										</td>
										<td class="content align-top p-3" style="width:40%">
											<p style="font-size: 18px;">식품 이름</p>
											<p>식품 내용</p>
										</td>
										<td style="width:25%">
											<select name="foodProductNo" class="foodSelector" style="width: 100%; height: 40px; font-size: 16px;">
												<option value="0">-- 서브메뉴 --</option>
												<c:forEach items="${fList2}" var="f">
													<option value="${f.productNo}">${f.foodName}</option>
												</c:forEach>
											</select>
										</td>
										<td style="width:10%; text-align: center">
											<input type="number" class="priceBox pb${vs.index}" readonly style="width:80%" value="0"><span style="width:20%">원</span>
										</td>
									</tr>
								</c:forEach>
							</table>
						
							<table class="infoTableDay border-none" style="width:1120px; margin: 10px 0px 15px 0px; text-align: center;">
								<tr>
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
								<tr class="infoContentDay">
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>kcal</td>
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>g</td>
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>g</td>
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>g</td>
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>g</td>
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>g</td>
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>mg</td>
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>g</td>
									<td><input type="number" class="dayNutrient" min="0" value="0" readonly>mg</td>
								</tr>
							</table>
						</div>
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
									<input type="number" name="productPrice" style="width: 100px; font-size: 18px; font-weight: bold; text-align: right;" value="0" min="0" readonly>
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
				<c:forEach begin="1" end="7" varStatus="i">
					<tr class="infoContent">
						<td class="text-center">${i.index}일차</td>
						<td><input type="number" min="0" value="0" readonly>kcal</td>
						<td><input type="number" min="0" value="0" readonly>g</td>
						<td><input type="number" min="0" value="0" readonly>g</td>
						<td><input type="number" min="0" value="0" readonly>g</td>
						<td><input type="number" min="0" value="0" readonly>g</td>
						<td><input type="number" min="0" value="0" readonly>g</td>
						<td><input type="number" min="0" value="0" readonly>mg</td>
						<td><input type="number" min="0" value="0" readonly>g</td>
						<td><input type="number" min="0" value="0" readonly>mg</td>
					</tr>
				</c:forEach>
				
			</table>
			
			<br><br>	
			
			<div class="d-flex justify-content-center mb-5">
				<div class="d-flex">
					<button class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">작성하기</button>
					<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
				</div>
			</div>
		</form>
	</div>
	
	<br><br><br><br>
	
	<script>
	
		window.onload = () =>{
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
							}
							reader.readAsDataURL(imageFiles[i].files[0])
						}
					})
				}
			}
			
// 			메인메뉴 정보 불러오기 이벤트(ajax)
			const selectors = document.getElementsByClassName('foodSelector');
			for(const sel of selectors){
				sel.addEventListener('change',function(){
					if(sel.value==0){
						const tr = this.parentElement.parentElement;
						tr.querySelector('.content').querySelectorAll('p')[0].innerText = '식품 이름';
						tr.querySelector('.content').querySelectorAll('p')[1].innerText = '식품 내용';
						tr.querySelectorAll('.priceBox')[0].value = 0;
						tr.querySelector('.previewImage').src = '${contextPath}/resources/images/Logo.png';
						tr.querySelector('.imageTd').children[0].value = this.value;
						cal1();
					}else{
						$.ajax({
							url: '${contextPath}/adminFoodSelector.ad',
							data: {pNo:this.value},
							success: data =>{
								const tr = this.parentElement.parentElement;
								tr.querySelector('.content').querySelectorAll('p')[0].innerText = data.foodName;
								tr.querySelector('.content').querySelectorAll('p')[1].innerText = data.foodContent.split("@")[0];
								tr.querySelectorAll('.priceBox')[0].value = data.productPrice;
								tr.querySelector('.nutrient').value = data.foodContent.split("@")[3];
								console.log(tr.querySelector('.nutrient').value);
								tr.querySelector('.imageTd').children[0].value = this.value;
								
								dayNutrient(tr.querySelector('.index').value);
								
								$.ajax({
									url: '${contextPath}/adminFoodImageSelector.ad',
									data: {pNo:this.value},
									success: data =>{
										tr.querySelector('.previewImage').src = "${contextPath}/resources/uploadFiles/"+data.imageRenameName;
									}
								})
							},
							fail: data => {
								console.log(data);
							}
						});
						cal1();
					}
				})
			}
			
// 			가격 계산 이벤트
			const prices = document.getElementsByClassName('priceBox');
			const selectors2 = document.getElementsByClassName('foodSelector');
			const pPrice = document.getElementsByName('productPrice')[0];
			const pSale = document.getElementsByName('productSale')[0];
			const tPrice = document.getElementsByClassName('totalPrice')[0];

			pPrice.addEventListener('change', ()=>{
				cal();
			})
			pSale.addEventListener('change', ()=>{
				cal();
			})
		}
	
// 		총 가격 계산 함수
		function cal1(){
			setTimeout(function() {
				const prices = document.getElementsByClassName('priceBox');
				let p = 0;
				for(const price of prices){
					p += price.value*1;
				}
				document.getElementsByName('productPrice')[0].value = p;
				cal();
				
			}, 100);
		}
		
//		최종가격 계산 함수
		function cal(){
			const pPrice = document.getElementsByName('productPrice')[0];
			const pSale = document.getElementsByName('productSale')[0];
			const tPrice = document.getElementsByClassName('totalPrice')[0];
			tPrice.value = Math.round(pPrice.value * (1 - pSale.value * 0.01));
		}
		
// 		해당 일차의 영양성분 계산 함수
		function dayNutrient(i){
			const infoContentDay = document.getElementsByClassName('infoContentDay')[i];
			const inputs = infoContentDay.querySelectorAll('.dayNutrient');
			const nutrients = infoContentDay.parentElement.parentElement.parentElement.querySelectorAll('.nutrient');
			console.log(nutrients)
			for(const input of inputs){
				input.value = 0;
			}
			let arr = [0,0,0,0,0,0,0,0,0];
			for(const n of nutrients){
				const nut = n.value.split(',');
				for(const j in inputs){
					if(j < nut.length){
						arr[j] += nut[j]*1;
					}
				}
			}
			for(const j in inputs){
				inputs[j].value = Math.floor(arr[j]*100)/100;
			}
			totalNutrient(i);
		}
		
// 		영양 정보 표 채우기 함수
		function totalNutrient(i){
			const infoContentDay = document.getElementsByClassName('infoContentDay')[i];
			const inputs = infoContentDay.querySelectorAll('.dayNutrient');
			const infoContent = document.getElementsByClassName('infoContent')[i];
			const totalInputs = infoContent.querySelectorAll('input');
			for(let j = 0; j < totalInputs.length; j++){
				totalInputs[j].value = inputs[j].value;
			}
		}
		
	</script>
	
</body>
</html>
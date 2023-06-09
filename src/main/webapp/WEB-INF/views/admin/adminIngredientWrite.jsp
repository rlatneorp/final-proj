<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<style>
	span{height:25px;}
</style>
</head>
<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top my-5 p-4 ps-5 rounded" style="width: 900px; height:1000px; border: 2px solid rgba(0,0,0,0.1);">
		<h4 class="py-4 mb-0">식재료관리</h4>
		
		<form action="${contextPath}/adminIngredientInsert.ad" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-6 row">
					<input type="hidden" name="productType" value="3">
					<h5 class="mt-3 mb-5">- 식재료등록 -</h5>
					<input type="hidden" name="usersNo" value="1">
					<span class="col-3">등록자</span>
					<input type="text" class="col-9 pb-1 mb-2 rounded border" value="adminNickName" readonly>
					<span class="col-3">재료이름</span>
					<input type="text" name="ingredientName" class="col-9 pb-1 mb-2 rounded" placeholder="재료 이름을 입력해주세요.">
					<span class="col-3">분류</span>
					<input type="text" name="ingredientType" class="col-9 pb-1 mb-2 rounded" placeholder="재료 종류를 선택해주세요.">
					<span class="col-3">재고</span>
					<input type="number" name="productStock" class="col-9 pb-1 mb-2 rounded" placeholder="재고를 입력해주세요." value="0">

					<div class="col-12 row priceBox" style="opacity: 0.3">
						<span class="col-4">가격</span>
						<input type="number" name="productPrice" class="col-6 pb-1 mb-2 rounded" min="0" placeholder="가격을 입력해주세요." value="0" readonly>
						<span class="col-2">원</span>
						<span class="col-4">할인율</span>
						<input type="number" name="productSale" class="col-6 pb-1 mb-2 rounded" min="0" max="99.9" placeholder="할인율을 입력해주세요." value="0" readonly>
						<span class="col-2">%</span>
						<span class="col-5 text-end">=</span>
						<input type="number" class="totalPrice col-5 pb-1 mb-2 rounded border" value="0" readonly>
						<span class="col-2">원</span>
					</div>
					
					<span class="col-3">내용</span>					
					<textarea rows="10" name="ingredientContent" class="col-9 mb-2 rounded" placeholder="재료 내용을 입력해주세요."></textarea>
					
					<span class="col-3 mb-3">공식등록</span>
					<input type="hidden" name="isAccept" value="Y">
					<button type="button" class="col-2 isAccept" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">Y</button>
					<button type="button" class="col-2 isAccept" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; height: 30px; font-size: 14px;">N</button>
					<span class="col-5"></span>
					
					<span class="col-3 mb-3">공개상태</span>
					<input type="hidden" name="ingredientStatus" value="Y">
					<button type="button" class="col-2 igdStatus" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">Y</button>
					<button type="button" class="col-2 igdStatus" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; height: 30px; font-size: 14px;">N</button>
					<span class="col-5"></span>
					
					<span class="col-3">상품등록</span>
					<input type="hidden" name="productStatus" value="N">
					<button type="button" class="col-2 productStatus" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; height: 30px; font-size: 14px;">Y</button>
					<button type="button" class="col-2 productStatus" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">N</button>
					<span class="col-5"></span>
					
					<span class="col-12"></span>
	
					
				</div>
				
				<div class="col-6 ps-5">
					<div class="border" style="margin-top:56px; width:360px; height:270px;">
						<img class="previewImage" width="360px" height="270px">
					</div>
					<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">
					<p style="font-size: 12px; color: gray">최적 이미지 비율은 4:3입니다.</p>
				</div>
				
				<div class="d-flex justify-content-center mb-5">
					<div class="d-flex">
						<button type="button" onclick="check()" class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">등록하기</button>
						<button type="button" onclick="location.href='${contextPath}/adminIngredientManage.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	
	<script>
		window.onload = () =>{
			
// 			이미지 미리보기 함수, 이벤트
			const imageFile = document.getElementsByName('imageFile')[0];
			const previewImage = document.getElementsByClassName('previewImage')[0];
			
			function readImage(imageFile) {
			    // 인풋 태그에 파일이 있는 경우
			    if(imageFile.files && imageFile.files[0]) {
			        // 이미지 파일인지 검사 (생략)
			        // FileReader 인스턴스 생성
			        const reader = new FileReader()
			        // 이미지가 로드가 된 경우
			        reader.onload = e => {
			            previewImage.src = e.target.result
			        }
			        // reader가 이미지 읽도록 하기
			        reader.readAsDataURL(imageFile.files[0])
			    }
			}
			// input file에 change 이벤트 부여
			imageFile.addEventListener("change", e => {
			    readImage(e.target);
			})
			
// 			공식등록 / 공개상태 버튼 이벤트
			const acBtns = document.getElementsByClassName('isAccept');
			const isAccept = document.getElementsByName('isAccept')[0];
			const igdStBtns = document.getElementsByClassName('igdStatus');
			const igdStatus = document.getElementsByName('ingredientStatus')[0];
			
			acBtns[0].addEventListener('click', () => {
				isAccept.value = acBtns[0].innerText;
				acBtns[0].style.background = "#19A7CE";
				acBtns[1].style.background = "gray";
			});
			acBtns[1].addEventListener('click', () => {
				isAccept.value = acBtns[1].innerText;
				acBtns[1].style.background = "#19A7CE";
				acBtns[0].style.background = "gray";
			});
			
			igdStBtns[0].addEventListener('click', () => {
				igdStatus.value = igdStBtns[0].innerText;
				igdStBtns[0].style.background = "#19A7CE";
				igdStBtns[1].style.background = "gray";
			});
			igdStBtns[1].addEventListener('click', () => {
				igdStatus.value = igdStBtns[1].innerText;
				igdStBtns[1].style.background = "#19A7CE";
				igdStBtns[0].style.background = "gray";
			});
			
			
// 			상품등록 버튼 이벤트
			const priceBox = document.getElementsByClassName('priceBox')[0];
			const pStBtns = document.getElementsByClassName('productStatus');
			const pStatus = document.getElementsByName('productStatus')[0];
			const pPrice = document.getElementsByName('productPrice')[0];
			const pSale = document.getElementsByName('productSale')[0];
			const tPrice = document.getElementsByClassName('totalPrice')[0];

			pStBtns[0].addEventListener('click', ()=>{
				pStatus.value = pStBtns[0].innerText;
				pStBtns[0].style.background = "#19A7CE";
				pStBtns[1].style.background = "gray";
				pPrice.readOnly = false;
				pSale.readOnly = false;
				priceBox.style.opacity ='1';
			});
			pStBtns[1].addEventListener('click', ()=>{
				pStatus.value = pStBtns[1].innerText;
				pStBtns[1].style.background = "#19A7CE";
				pStBtns[0].style.background = "gray";
				pPrice.readOnly = true;
				pSale.readOnly = true;
// 				pPrice.value = '';
// 				pSale.value = '';
				priceBox.style.opacity ='0.3';
			});

// 			잘못된 값 거르기 / 가격*할인율 계산 이벤트 
			pPrice.addEventListener('change', ()=>{
				if(pPrice.value < 0){
					pPrice.value = 0;
				}else if(pPrice.value < 0){
					pPrice.value = 0;
				}
				cal();
			});
			pSale.addEventListener('change', ()=>{
				if(pSale.value > 99.9){
					pSale.value = 99.9;
				}else if(pSale.value < 0){
					pSale.value = 0;
				}
				cal();
			});
			
			cal();
		}
		
		
// 		가격 계산 함수
		function cal(){
			const pPrice = document.getElementsByName('productPrice')[0];
			const pSale = document.getElementsByName('productSale')[0];
			const tPrice = document.getElementsByClassName('totalPrice')[0];
			tPrice.value = Math.round(pPrice.value * (1 - pSale.value * 0.01));
		}
		
//		Submit 전 검토하기
		
		function check(){
			if(document.getElementsByName('ingredientName')[0].value.trim() == ''){
				alert("재료이름을 입력해주세요.");
				document.getElementsByName('ingredientName')[0].focus();
			}else if(document.getElementsByName('ingredientType')[0].value.trim() == ''){
				alert("분류를 입력해주세요.");
				document.getElementsByName('ingredientType')[0].focus();
			}else if(document.getElementsByName('productStock')[0].value.trim() == ''){
				alert("재고를 입력해주세요.");
				document.getElementsByName('productStock')[0].focus();
			}else if(document.getElementsByName('ingredientContent')[0].value.trim() == ''){
				alert("재료 내용을 입력해주세요.");
				document.getElementsByName('ingredientContent')[0].focus();
			}else{
				document.getElementsByTagName('form')[0].submit();
			}
		}
	
	</script>
</body>
</html>
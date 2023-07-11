<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"> -->
<title>홀로세끼</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script> -->
<style>
	.menu3{margin-top: 5px;}
	.cart-icon{margin-top: 5px;}


.carrier {
	/* 		border:2px solid #dee2e6; */
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

table {
	position: relative;
	text-align: center;
	border: 2px solid #dee2e6;
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

tr {
	border: 2px solid #dee2e6;
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

.barSpan {
	font-weight: bold;
	font-size: 17px;
	left: 690px;
	position: relative
}

.check {
	width: 16px;
	height: 16px;
	border: 2px solid #000;
	border-radius: 4px;
	outline: none;
	cursor: pointer;
	justify-content: center;
}

hr {
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

.vertical-line {
	width: 1px;
	background-color: black;
	height: 100%;
	margin-left: 20%; /* 필요에 따라 간격 조정 */
}

.tableBorder1 {
	border-right: 2px solid #dee2e6;
	border-bottom: 2px solid #dee2e6
}

.imgTab {
	height: 300px;
}

.aHover {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 상위 요소의 색상 상속 */
}

.aHover:hover {
	color: #0055FF;
}

.chBox {
	width: 20px;
	height: 20px;
}

input[type="radio"] {
	transform: scale(1.5); /* 원하는 크기로 스케일 조정 */
}

input[type="text"] {
	height: 35px;
}

/* 형광펜 css */
.highlight{
  display: inline;
   box-shadow: inset 0 -15px 0 rgba(255, 0, 0, 0.45);
  /*-10px은 highlight의 두께*/
}


.address {
	width: 150px;
	height: 60px;
	border: 2px solid #dee2e6;
	background-color: #B0DAFF;
	border-right: none;
	text-align: left;
	padding: 20px;
}
.cTitle{
  text-align:center;
  margin:0 auto;
}

#allChec{
	height: 50px; margin: 0 auto; width: 1200px; background-color: #B0DAFF; 
	border-bottom: 2px solid #dee2e6; border-left: none; border-right: none; border-top: 2px solid #dee2e6; 
	display: flex; align-items: center
}



/* 3D Button */
.btn-3d {
	text-decoration: none;
 	width: 100px; 
	height: 35px;
/* 	position: absolute; */
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
	padding: 5px;
	/*   padding: 20px 60px; */
	color: white;
	margin: 20px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
}

.btn-3d.blue:hover {
	color: white;
	background-color: #699DD1;
}

.btn-3d:active {
	top: 9px;
}

.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 8px 0 0 rgba(110, 164, 219, .7), 0 8px 0 1px
		rgba(0, 0, 0, .4), 0 8px 8px 1px rgba(0, 0, 0, 0.5);
}

.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 0 0 1px rgba(0, 0, 0, 0.4);
}


#shop{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

.custom-font-size {
	padding-top:30px; font-size: 17px; font-weight: 400;
}
/* 구매버튼 */
#goPay{cursor:pointer;}
</style>
</head>
<body>



<%@include file="../common/storeTop.jsp" %>
<br><br><br><br><br><br>

	<div>
	<!-- 장바구니 상단 부분 -->
	<div class="carrier" style="margin-bottom: 10px;">
		<span style="font-size: 30px;"><b>장바구니</b></span> 
		<span class="barSpan">
			<a class="aHover" id="basketHover" style="color: #0055FF" onclick="location.href='${contextPath}/basket.ma'">01 장바구니 > </a>
			<a class="aHover" id="payWrite" style="color:lightgray;">02 ㅈㅁㅅㅈㅅ/ㄱㅈ</a> 
			<a class="aHover" id="paySuccess" style="color:lightgray"> > 03 ㅈㅁㅇㄹ</a>
		</span>
	</div>
	<div id="allChec">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="selectAllCheckBox" style="width: 20px; height: 20px; margin-right: 10px;"> 
		<div><label for="selectAllCheckBox" style="cursor:pointer">전체 선택</label></div>&nbsp;&nbsp; 
		| &nbsp;&nbsp;<i class="bi bi-trash" id="trash" style="margin-right: 7px;"></i>
		<div style="cursor:pointer;" onclick="checkDelete()">선택 삭제</div>
	</div><br><br>

	<!-- 장바구니 테이블 -->
	<table>
		<tr style="border: 2px solid #dee2e6; background-color: #B0DAFF;">
			<th class="tableBorder1" colspan="2" style="height: 40px"><b>상품/옵션정보</b></th>
			<th class="tableBorder1"><b>수량</b></th>
			<th class="tableBorder1" style="width:150px"><b>상품가격</b></th>
			<th class="tableBorder1"><b>적립</b></th>
			<th class="tableBorder1"><b>합계금액</b></th>
		</tr>
		<tbody id="products">
			<c:if test="${!empty cartList }">
			<c:set var="previousPreorderNo" value="" />
			<c:forEach items="${ cartList}" var="cl" varStatus="status" >
				<c:if test="${cl.preorderNo != previousPreorderNo}">
					<c:set var="previousPreorderNo" value="${cl.preorderNo}" />
					<tr class="productInfos" style="border-top: 2px solid #dee2e6;">
						<td class="imgTab">
							<input type="hidden" id="basketNo-${cl.preorderNo }" class="basketNos" value="${ cl.preorderNo }">
							<input type="checkbox" onchange="changeCheckBox(this)" value="${cl.productNo }" id="chec-${cl.preorderNo }" name="checkProduct" style="width: 20px; height: 20px; margin-right:15px; margin-left: -8px;">
							<c:if test="${cl.productType != 2 }">
								<img src="${contextPath }/resources/uploadFiles/${cl.imgName}" onclick="location.href='${contextPath}/market_detail.ma?productNo=${cl.productNo}'" style="cursor:pointer; border: 1px solid black; width: 200px; height: 200px;">
							</c:if>
							<c:if test="${cl.productType == 2 }">
								<img src="${contextPath }/resources/uploadFiles/${cl.imgName}" onclick="location.href='${contextPath}/menuDetail.mn?mNo=${cl.productNo}'" style="cursor:pointer; border: 1px solid black; width: 200px; height: 200px;">
							</c:if>
							<input type="hidden" value="${cl.preorderNo }">
						</td>
						<td style="border-right: 2px solid #dee2e6; text-align: left">
							<b>${cl.productName}</b><br><br>
							<c:forEach items="${cl.optionName }" var="opt">
								<input type="hidden" value="${opt.optionNo }">
								<c:if test="${fn:length(opt.optionValue) > 10}">
									<span id="optNo-${opt.optionNo }">
										${opt.optionName } : <br> ${ opt.optionValue }<br><br>
									</span>
								</c:if>
								<c:if test="${fn:length(opt.optionValue) < 10}">
									<span id="optNo-${opt.optionNo }">
										${opt.optionName } : ${ opt.optionValue }<br><br>
									</span>
								</c:if>
							</c:forEach>
						</td>
						<td style="border-right: 2px solid #dee2e6; width:150px">
							<i class="bi bi-dash-square-fill" id="minus-${cl.preorderNo}" style="color: #00AAFF; font-size: 15px;"></i>&nbsp;
							<span title="클릭하여 수량 변경" class="cartCount cTitle" style="cursor:pointer; "id="size-${cl.preorderNo}">
								${cl.cartCount}
							</span>
							<input type="hidden" class="insertSizeId" value="${cl.preorderNo }">
							<input type="text" class="insertSize" id="insertSize-${cl.preorderNo }" style="width: 30px; display: none;">개
							<i class="bi bi-plus-square-fill" id="plus-${cl.preorderNo }" style="color: #00AAFF; font-size: 15px"></i>
						</td>
						<td style="border-right: 2px solid #dee2e6; width:150px " >
							<c:if test="${cl.sale ne 0 }">
								<span id="sale-${cl.preorderNo }" class="highlight"><b>${cl.sale }% 할인</b></span>
								<br><br> <span style="text-decoration: line-through;" id="originP-${cl.preorderNo }">${cl.productPrice}</span>
								<br><span id="pp-${cl.preorderNo }" style="font-size:20px; font-weight:bold" class="price">
									${cl.productPrice}
								</span>원
							</c:if>
							<c:if test="${cl. sale eq 0 }">
								<span id="pp-${cl.preorderNo }" class="price">
									${cl.productPrice}
								</span>원
							</c:if>
						</td>
						<td style="border-right: 2px solid #dee2e6; width:130px">
							<span class="point" id="point-${cl.preorderNo }"></span>P 적립
						</td>
						<td style="border-right: 2px solid #dee2e6; width:160px">
							<span class="sum" style="font-size:25px; font-weight:bold" id="sum-${cl.preorderNo }">
							${cl.sum }
							</span>원
						</td>
				</tr>
				</c:if>
			</c:forEach>
			</c:if>
			<c:if test="${ empty cartList }">
				<tr>
					<td colspan="6" height="330">
						<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
						<b>장바구니에 담긴 상품이 없습니다.</b>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table><br><br>
	<div style="cursor:pointer; width: 1200px; margin: 0 auto; font-align: right">
		<i class="bi bi-caret-left-fill"></i><i class="bi bi-caret-left-fill"></i>
		<b><a style="color:inherit; text-decoration:none" href="${contextPath}/kitchenToolMain.ma">쇼핑 계속하기</a></b><br>
	</div><br>
	
	<!-- 금액 -->
	<table>
		<tbody>
			<tr style="height: 130px; font-size: 20px;">
				<td style="width: 800px; text-align: right">
					<b>선택한 총 <span id="orderSize">1</span>개의 상품 금액<br><br>
					<span style="color: #00AAFF" id="trTotalSum">46,500</span>원</b>
				</td>
				<td>
					&nbsp;&nbsp;&nbsp;<i class="bi bi-plus-circle-fill" style="color: #00AAFF; font-size: 30px"></i>
				</td>
				<td>
					<b>배송비<br><br><span style="color: #00AAFF" id="shipPrice">0</span>원</b>
				</td>
				<td>
					<span class="material-symbols-outlined" style="color: #00AAFF">equal</span>
				</td>
				<td>
					<b>합계<br><br><span style="color: #00AAFF" id="shipSum">46,500</span>원</b>
				</td>
			</tr>
			<tr>
			</tr>
		</tbody>
		
	</table><br>
	<table style="border:none">
		<tbody>
			<tr>
				<td><a id="goPay" class="btn-3d blue" style="margin-left:92%" >구매</a></td>
			</tr>
		</tbody>
	</table><br><br><br><br><br><br><br><br><br><br><br><br>
</div>


	   

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


<%@include file="../common/footer.jsp" %>


</body>

<script>
	window.onload = () => {
		
		const insertSizes = document.getElementsByClassName('insertSize'); //input 타입 
		const cartCount = document.getElementsByClassName('cartCount'); //수량 
		for(size of cartCount) {
			const preorderNo = size.nextElementSibling.value;
			let prevValue = document.getElementById('size-' + preorderNo).innerText // 이전 값 저장
			
			size.addEventListener('click', function() {
				const input = this.nextElementSibling.nextElementSibling;
				this.style.display = 'none';
				input.style.display = 'inline-block';
				
				let isInputBlurEventRegistered = false;
				 
 				input.addEventListener('blur', function() {
 					
 					if(!isInputBlurEventRegistered) {
 						isInputBlurEventRegistered = true;
 						if(isNaN(this.value)) {
 							alert('숫자만 입력 가능합니다.');
 							this.value = '';
 							this.style.display = 'none';
 							this.previousElementSibling.previousElementSibling.style.display = 'inline-block';
 						} else {
 							$.ajax({
 								url:'inputCartCount.ma',
 								data:{
 									preorderNo:preorderNo,
 									size:this.value
 								},
 								success: data =>{
 									if(data == 'yes') {
 										this.style.display = 'none';
 										this.previousElementSibling.previousElementSibling.style.display = 'inline-block';
 										this.previousElementSibling.previousElementSibling.innerText = this.value;
 										// 페이지 리로드 함수
 										window.location.reload();
 									}
 								},
 								error: data => {
 									
 								}
 							})
 						}
 					}
					
				})
				
			});
		}
		
		document.getElementById('trTotalSum').innerText = '0';	
		document.getElementById('orderSize').innerText = '0';
		document.getElementById('shipSum').innerText = '0';
		document.getElementById('shipPrice').innerText ='3,000'
		
		let trTotalSum = 0;
		let totalCount = 0;
		
		changeCheckBox = (checkbox) => {
			
			//전체 선택 해제 및 적용 
			//전체 체크박스
			let allCheck = document.getElementsByName('checkProduct')
// 			//체크 된 체크박스 
			let checked = document.querySelectorAll('input[name="checkProduct"]:checked');
// 			//select all 체크박스 
			let selectAll = document.getElementById('selectAllCheckBox');
			
			if(allCheck.length === checked.length) {
				selectAll.checked = true;
			} else if(selectAll.checked) {
				selectAll.checked = false;
			}
			
			const checkSum = checkbox.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText.replace(/,/g, ''); // 합계금액이 표시된 요소
			const checkCount = checkbox.parentElement.nextElementSibling.nextElementSibling.innerText.replace(/,/g, ''); // 체크된 카운트 수
			const intCheckSum = parseInt(checkSum);
			const intCheckCount = parseInt(checkCount);
			
			const count = parseInt(document.getElementById('orderSize').innerText);
			if (checkbox.checked) {
				const plus = parseInt(document.getElementById('trTotalSum').innerText.replace(/,/g, '')) + intCheckSum;
				document.getElementById('trTotalSum').innerText = plus;
				document.getElementById('orderSize').innerText = count + intCheckCount;
				
				//배송비 - 총합 
				let shipping = parseInt(document.getElementById('shipSum').innerText);  
				if(plus >= 30000) { //합계금액 
					document.getElementById('shipPrice').innerText = '0';
					document.getElementById('shipSum').innerText = parseInt(plus).toLocaleString();
				} else {
					document.getElementById('shipPrice').innerText = '3,000';
	 				const shipPrice = parseInt(document.getElementById('shipPrice').innerText.replace(/,/g, ''))
	 				document.getElementById('shipSum').innerText = parseInt(plus+shipPrice).toLocaleString();
				}
			}else if (document.getElementById('trTotalSum').innerText != '0') {  
				const intTrTotal = parseInt(document.getElementById('trTotalSum').innerText.replace(/,/g, ''));
				const minus = intTrTotal - intCheckSum; //총 금액에서 체크한 금액의 합계를 뺀다.
				document.getElementById('trTotalSum').innerText = minus;  
				if(intCheckCount != '0') {
					document.getElementById('orderSize').innerText = count - intCheckCount;
				}
				
				//배송비
				if(minus >= 30000) { //합계금액 
					document.getElementById('shipPrice').innerText = '0';
					document.getElementById('shipSum').innerText = parseInt(minus).toLocaleString();
				} else {
					document.getElementById('shipPrice').innerText = '3,000';
	 				const shipPrice = parseInt(document.getElementById('shipPrice').innerText.replace(/,/g, ''))
	 				document.getElementById('shipSum').innerText = parseInt(minus+shipPrice).toLocaleString();
				}
			}
			
			var totalSum = document.getElementById('trTotalSum').innerText;
			var formattedTotalSum = parseInt(totalSum).toLocaleString();
			document.getElementById('trTotalSum').innerText = formattedTotalSum;			
		} //change 함수 끝 
		
		
		//상품가격 금액 형태로 변환 
		const prices = document.getElementsByClassName('price');
		for(originPrice of prices) {
			const detailPrice = originPrice.innerText;
			const numericPrice = parseFloat(detailPrice);// 숫자로 변환

			// 금액 형식으로 변환
			const formattedPrice = new Intl.NumberFormat('ko-KR', {
		    style: 'currency',
		    currency: 'KRW',
		    currencyDisplay: 'code' // 통화 기호 제거
		  	}).format(numericPrice);
			
			const priceWithoutCurrency = formattedPrice.replace('KRW', '').trim()
			originPrice.innerText = priceWithoutCurrency;
		}
			
		//합계금액 금액 형태로 변환 
		const transSum = document.getElementsByClassName('sum');
		const numericPrice = 0;
		for(sum of transSum) {
			const detailSum = sum.innerText;
			const numericPrice = parseFloat(detailSum);// 숫자로 변환
			
			// 금액 형식으로 변환
			const formattedPrice = new Intl.NumberFormat('ko-KR', {
		    style: 'currency',
		    currency: 'KRW',
		    currencyDisplay: 'code' // 통화 기호 제거
		  	}).format(numericPrice);
			
			const priceWithoutCurrency = formattedPrice.replace('KRW', '').trim()
			sum.innerText = priceWithoutCurrency;
		}
		
		
				
	} //window.onload 
			
	const parentPnos = document.getElementsByClassName('imgTab');
	for(let p of parentPnos) { 
		let preOrder = p.lastChild.previousElementSibling.value;
		let pNos = p.children[1].value;
		let size = parseInt(document.getElementById('size-'+ preOrder).innerText);
		
		//상품가격 및 개별 상품 합계 금액 
		const sales =document.getElementById('sale-' + preOrder);
		if(sales != null) {
			const sale = parseInt(sales.innerText);
			const originP = parseInt(document.getElementById('originP-' + preOrder).innerText);
			const discountAmount = originP * (sale / 100);
			const discountedPrice = originP - discountAmount;
			document.getElementById('pp-' + preOrder).innerText = discountedPrice;
			document.getElementById('sum-' + preOrder).innerText = (size * discountedPrice);
		}
		
		//적립금(POINT)
		const sum = parseFloat(document.getElementById('sum-' + preOrder).innerText.replace(/,/g, ''));
		let pointRate = Math.floor(sum*0.005);
		
		document.getElementById('point-' + preOrder).innerText = pointRate; 
		
		const shippingPrice = document.getElementById('shippingPrice-' + preOrder);
		const originPriceString = document.getElementById('pp-'+preOrder).innerText;
		const price = parseInt(originPriceString.replace(/[,원]/g, ""));
		let totalPrice = 0;
			
		//1. 수량 증가 시 
		const clickPlus = document.getElementById('plus-' + preOrder);
		const cartCount = document.getElementsByClassName('cartCount');
		clickPlus.addEventListener('click', function() {
			//tr당 수량 증가 
			size++;
			document.getElementById('size-'+ preOrder).innerText = size;
			
			$.ajax({
				url:'${contextPath}/plusCount.ma',
				data:{
					preorderNo:preOrder,
					price:price
				},
				success: data => {
					//포인트
					pointRate = Math.floor(data*0.005);
					document.getElementById('point-' + preOrder).innerText = pointRate;
						
					//플러스 버튼 누를 때마다 개당 합계 금액 금액화 
					const formattedPrice = new Intl.NumberFormat("ko-KR", { style: "currency", currency: "KRW" }).format(data);
					const sum = formattedPrice.replace(/[₩]/g, "");
					document.getElementById('sum-'+preOrder).innerText = sum;
					let trTotalPrice = 0;
					let clickPlusSum= parseInt(sum.replace(/,/g, '')); //플러스 눌렀을 때 금액 
					//플러스 버튼 누를 때마다 해당 tr이 나옴 
					if(document.getElementById('chec-' + preOrder).checked) {
						let zz = parseInt(document.getElementById('trTotalSum').innerText.replace(/,/g, '')) + price;
						
						//요약 수량 증가
						let count = parseInt(document.getElementById('orderSize').innerText);
						count++;
						document.getElementById('orderSize').innerText = count;
						document.getElementById('trTotalSum').innerText = parseInt(zz).toLocaleString();
						//배송비 - 총합 
						let shipping = parseInt(document.getElementById('shipSum').innerText);  
						if(zz >= 30000) { //합계금액 
							document.getElementById('shipPrice').innerText = '0';
							document.getElementById('shipSum').innerText = parseInt(zz).toLocaleString();
						} else {
							document.getElementById('shipPrice').innerText = '3,000';
			 				const shipPrice = parseInt(document.getElementById('shipPrice').innerText.replace(/,/g, ''))
			 				document.getElementById('shipSum').innerText = parseInt(zz+shipPrice).toLocaleString();
						}
					} else {}
				},
				error: data => {}
			})
		})
				
	//2.수량 감소 시 
	const clickMinus = document.getElementById('minus-' + preOrder);
	clickMinus.addEventListener('click', function() {
		const minSize = parseInt(document.getElementById('size-'+ preOrder).innerText);
		if(minSize != 1) {
			size--;
			document.getElementById('size-'+ preOrder).innerText = size; //감소 수량 삽입 
			$.ajax({
				url:'${contextPath}/minusCount.ma',
				data:{
					preorderNo:preOrder,
					price:price
				},
				success: data => {
					//포인트
					pointRate = Math.floor(data*0.005);
					document.getElementById('point-' + preOrder).innerText = pointRate;
						
					//마이너스 버튼 누를 때마다 개당 합계 금액 금액화 
					const formattedPrice = new Intl.NumberFormat("ko-KR", { style: "currency", currency: "KRW" }).format(data);
					const sum = formattedPrice.replace(/[₩]/g, "");
					document.getElementById('sum-'+preOrder).innerText = sum; 
					let clickPlusSum= parseInt(sum.replace(/,/g, '')); // 개당 합계 금액 
					let trTotalPrice = 0;
					if(document.getElementById('chec-' + preOrder).checked) {
						let zz = parseInt(document.getElementById('trTotalSum').innerText.replace(/,/g, '')) - price;
						document.getElementById('trTotalSum').innerText = parseInt(zz).toLocaleString();
						
						//요약 수량 감소
						let count = parseInt(document.getElementById('orderSize').innerText);
						count--;
						document.getElementById('orderSize').innerText = count;
						
						//배송비 - 총합 
						let shipping = parseInt(document.getElementById('shipSum').innerText);  
						if(zz >= 30000) { //합계금액 
							document.getElementById('shipPrice').innerText = '0';
							document.getElementById('shipSum').innerText = parseInt(zz).toLocaleString();
						} else {
							document.getElementById('shipPrice').innerText = '3,000';
			 				const shipPrice = parseInt(document.getElementById('shipPrice').innerText.replace(/,/g, ''))
			 				document.getElementById('shipSum').innerText = parseInt(zz+shipPrice).toLocaleString();
						}
					} else {} 
				},
				error: (data) => {}
			}) //ajax끝
		} else {
			swal("수량은 1개 미만일 수 없습니다.", {
  			  buttons: false,
  			  timer: 1000,
  			});
			return;
		}
	})
} //for문 끝 
			
	//마우스 올렸을 때 글자 변화 
	document.getElementById('payWrite').addEventListener('mouseover', function() {
		this.innerHTML = '02 주문서작성/결제';
	})
	document.getElementById('payWrite').addEventListener('mouseleave', function() {
		this.innerHTML = '02 ㅈㅁㅅㅈㅅ/ㄱㅈ';
	})
	document.getElementById('paySuccess').addEventListener('mouseover', function() {
		this.innerHTML = '> 03 주문완료 &nbsp;';
	})
	document.getElementById('paySuccess').addEventListener('mouseleave', function() {
		this.innerHTML = '> 03 ㅈㅁㅇㄹ &nbsp;';
	})
			
	//전체 선택 체크 
	const selAllChec = document.getElementById('selectAllCheckBox');
	selAllChec.addEventListener('change', () => { //속성이 변할 때마다 이벤트 발생 

		const checkboxes = document.querySelectorAll('input[type="checkbox"]');
		checkboxes.forEach(function(checkbox) { //모든 checkbox를 순회 
		      checkbox.checked = selAllChec.checked; //selAllChec의 체크 속성을 대입 (항상 같이 움직이게)
		});
		
		//수량 반영 
		const trSum = document.getElementsByClassName('sum');
		let trTotalSum = 0;
		let totalCount = 0;
		for(sum of trSum) {
			//체크 되어 있는지 확인해서 체크 되어 있다면 수량 반영해라 
			const checBox = sum.parentElement.parentElement.children[0].children[1];
			const checNo = sum.parentElement.parentElement.children[0].children[1].value;
			const preOrder = sum.parentElement.parentElement.children[0].children[0].value;
			const size = parseInt(document.getElementById('size-' + preOrder).innerText);
			
			if(checBox.checked) {
				//1. 합계 금액 
				trTotalSum += parseInt(sum.innerText.replace(/,/g, ""));
				//2. 개수 
				totalCount += size;
			} 
		}
		document.getElementById('trTotalSum').innerText = parseInt(trTotalSum).toLocaleString();
		document.getElementById('orderSize').innerText = totalCount;
		//3. 배송비 및 총 합계 
		if(trTotalSum >= 30000) {
			document.getElementById('shipPrice').innerText = 0;
			document.getElementById('shipSum').innerText = trTotalSum.toLocaleString();
		} else {
			document.getElementById('shipPrice').innerText = '3,000';
			document.getElementById('shipSum').innerText = parseInt((trTotalSum+3000)).toLocaleString();
		}
		
	})
	
	//선택 삭제 버튼 클릭 시 선택 된 리스트 삭제 
	checkDelete = () => {
		
		const basketNos = document.getElementsByClassName('basketNos');
		const checkProducts = products.querySelectorAll('input[type="checkbox"]:checked');
		if(checkProducts.length == 0) {
			swal("삭제할 상품을 한 개 이상 선택해주세요.", {
   			  buttons: false,
   			  timer: 1000,
   			});
			return;
		}
		//체크 된 부분만 삭제 처리 
		swal({
		    text: '정말 삭제하시겠습니까?',
		    icon: 'warning',
		    buttons: ["취소", "삭제하기"]
		}).then((YES) => {
		    if (YES) {
		    	let trCreated = false;
		    	
		    	for(basketNo of basketNos) {
		 			let delPreOrder = basketNo.nextElementSibling.nextElementSibling.nextElementSibling.value;
		 			if(basketNo.nextSibling.nextSibling.checked) {
		 				const delBasket = basketNo.value;
		 				$.ajax({
		 					url:'${contextPath}/delBasket.ma',
		 					data:{ 
		 						preorderNo:delPreOrder
		 					},
		 					success: (data) => {
		 						//해당 상품 삭제
		 						for (const checkProduct of checkProducts) {
		 							let list = checkProduct.parentNode.parentNode;
		 							list.remove();
		 							
		 							document.getElementById('cartCount').innerText = document.getElementsByClassName('productInfos').length;
		 						}
		 						swal("선택하신 상품이 삭제 되었습니다.", {
		 			    			  buttons: false,
		 			    			  timer: 1000,
		 			    		});
		 						
		 						//담긴 상품이 0개일 때 담긴 상품이 없다는 메시지가 뜨도록 
		 						if(!trCreated && document.getElementsByClassName('productInfos').length == 0) {
		 							
		 							var trElement = document.createElement('tr');
		 						    var tdElement = document.createElement('td');
		 						    tdElement.setAttribute('colspan', '6');
		 						    tdElement.setAttribute('height', '330');

		 						    var iElement = document.createElement('i');
		 						    iElement.classList.add('fa-regular', 'fa-face-grin-beam-sweat');
		 						    iElement.style.color = 'skyblue';
		 						    iElement.style.fontSize = '80px';

		 						    var bElement = document.createElement('b');
		 						    bElement.innerText = '장바구니에 담긴 상품이 없습니다.';

		 						    tdElement.appendChild(iElement);
		 						    tdElement.appendChild(document.createElement('br'));
		 						    tdElement.appendChild(document.createElement('br'));
		 						    tdElement.appendChild(bElement);

		 						    trElement.appendChild(tdElement);

		 						    var tableElement = document.querySelector('table'); // Assuming the table exists
		 						    tableElement.appendChild(trElement);
									
		 						    trCreated = true; 
								}
		 						
		 						//초기화
		 						document.getElementById('orderSize').innerText = '0'; 
		 						document.getElementById('trTotalSum').innerText = '0';
		 						document.getElementById('shipPrice').innerText = '3,000';
		 						document.getElementById('shipSum').innerText = '0';
		 						},
		 					error: (data) => {
		 					}
		 				}) //ajax 
		    		} //if문 
		 		} //for문 
		 	  } //yes 선택 시 
// 		   } 
		});
	}
	
	//장바구니 내 상품 한 개 이상 클릭 시 구매 버튼 실행 
	document.getElementById('goPay').addEventListener('click', function() {
		const products = document.getElementById('products');
		const checkProducts = products.querySelectorAll('input[type="checkbox"]:checked');
		if(checkProducts.length == 0){
			swal("구매할 상품을 한 개 이상 선택해주세요.", {
	   			  buttons: false,
	   			  timer: 1000,
	   		});
		} else {
			let preorderNos = [];
			for(cp of checkProducts) { //체크 된 input type checkbox 
				const preorderNo = cp.parentElement.lastElementChild.value;
				preorderNos.push(preorderNo);
			}
			
			const form = document.createElement('form');
			form.method = 'POST';
			form.action = '${contextPath}/payDetail.ma'
			
			const prNoInput = document.createElement('input');
			prNoInput.type = 'hidden';
			prNoInput.name = 'preorderNos';
			prNoInput.value = preorderNos;
			
			form.appendChild(prNoInput);
			
			document.body.appendChild(form);
			form.submit();
			
		}
	})
	
	
	
	
	
</script>



</html>

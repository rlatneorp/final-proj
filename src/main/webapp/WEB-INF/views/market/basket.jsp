<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- 예쁜 alert창 : https://sweetalert.js.org/ -->
<style>

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



.address {
	width: 150px;
	height: 60px;
	border: 2px solid #dee2e6;
	background-color: #B0DAFF;
	border-right: none;
	text-align: left;
	padding: 20px;
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
	position: relative;
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

/* 구매버튼 */
#goPay{cursor:pointer;}
</style>
</head>
<body>



<%@include file="../common/top.jsp" %>
<br><br><br><br><br><br>



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
		<div>전체 선택</div>&nbsp;&nbsp; 
		| &nbsp;&nbsp;<i class="bi bi-trash" id="trash" style="margin-right: 7px;"></i>
		<div style="cursor:pointer;" onclick="checkDelete()">선택 삭제</div>
	</div><br><br>

	<!-- 장바구니 테이블 -->
	<table>
		<tr style="border: 2px solid #dee2e6; background-color: #B0DAFF;">
			<th class="tableBorder1" colspan="2" style="height: 40px"><b>상품/옵션정보</b></th>
			<th class="tableBorder1"><b>수량</b></th>
			<th class="tableBorder1"><b>상품가격</b></th>
			<th class="tableBorder1"><b>적립/할인</b></th>
			<th class="tableBorder1"><b>합계금액</b></th>
			<th style="border-bottom: 2px solid #dee2e6">배송비</th>
		</tr>
		<tbody id="products">
			<c:forEach items="${ cartList}" var="cl">
				<tr style="border-top: 2px solid #dee2e6;">
					<td class="imgTab">
						<input type="hidden"  id="basketNo-${cl.productNo }" class="basketNos" value="${ cl.productNo }">
						<input type="checkbox" style="width: 20px; height: 20px; margin-left:-15px; margin-right: 20px;">
						<img src="" style="border: 1px solid black; width: 200px; height: 200px;">
					</td>
					<td style="border-right: 2px solid #dee2e6; text-align: left">
						<c:forEach items="${ productList }" var="p">
							<c:if test="${cl.productNo eq p.productNo }">
									<c:if test="${p['class'].simpleName eq 'Food'}">
								    	<b>${p.foodName}</b><br><br>
								  	</c:if>
									<c:if test="${p['class'].simpleName eq 'Tool'}">
								    	<b>${p.ToolName}</b><br><br>
								  	</c:if>
									<c:if test="${p['class'].simpleName eq 'Ingredient'}">
								    	<b>${p.ingredientName}</b><br><br>
								  	</c:if>
							</c:if>
						</c:forEach>
						옵션 : 
						<select>
							<c:forEach var="option" items="${fn:split(cl.productOption, ',')}">
								<option value="${option}">${option}</option>
							</c:forEach>
						</select>
					</td>
					<td style="border-right: 2px solid #dee2e6; width:130px">
						<i class="bi bi-dash-square-fill" id="minus" style="color: #00AAFF; font-size: 15px;"></i>&nbsp;
						<span id="size">1</span>개&nbsp;
						<i class="bi bi-plus-square-fill" id="plus" style="color: #00AAFF; font-size: 15px"></i>
					</td>
					<td style="border-right: 2px solid #dee2e6;"><span id="price">46,500</span>원</td>
					<td style="border-right: 2px solid #dee2e6;"><span>2,325</span>P적립</td>
					<td style="border-right: 2px solid #dee2e6; width:160px"><span id="sum">46,500</span>원</td>
					<td>무료배송</td>
				</tr>
			</c:forEach>
		</tbody>
	</table><br><br>
	<div style="width: 1200px; margin: 0 auto; font-align: right">
		<i class="bi bi-caret-left-fill"></i><i class="bi bi-caret-left-fill"></i>
		<i class="bi bi-caret-left-fill"><b>쇼핑 계속하기</b></i><br>
	</div><br>
	
	<!-- 금액 -->
	<table>
		<tbody>
			<tr style="height: 130px; font-size: 20px;">
				<td style="width: 800px; text-align: right">
					<b>총 <span>1</span>개의 상품 금액<br><br>
					<span style="color: #00AAFF">46,500</span>원</b>
				</td>
				<td>
					&nbsp;&nbsp;&nbsp;<i class="bi bi-plus-circle-fill" style="color: #00AAFF; font-size: 30px"></i>
				</td>
				<td>
					<b>배송비<br><br><span style="color: #00AAFF">0</span>원</b>
				</td>
				<td>
					<span class="material-symbols-outlined" style="color: #00AAFF">equal</span>
				</td>
				<td>
					<b>합계<br><br><span style="color: #00AAFF">46,500</span>원</b>
				</td>
			</tr>
			<tr>
				
			</tr>
		</tbody>
	</table><br>
	<!-- 작성 버튼 -->
	<div style="width:1370px; text-align: right; margin-left: 190px;">
		<a id="goPay" class="btn-3d blue">구매</a>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	


	   

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


<%@include file="../common/footer.jsp" %>


</body>

<script>
	
	window.onload = () => {
		
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
		
		
	}
	
	//전체 선택 체크 
	const selAllChec = document.getElementById('selectAllCheckBox');
	selAllChec.addEventListener('change', function() { //속성이 변할 때마다 이벤트 발생 
		const checkboxes = document.querySelectorAll('input[type="checkbox"]');
		checkboxes.forEach(function(checkbox) { //모든 checkbox를 순회 
		      checkbox.checked = selAllChec.checked; //selAllChec의 체크 속성을 대입 (항상 같이 움직이게)
		    });
		
	})
	
	//선택 삭제 버튼 클릭 시 선택 된 리스트 삭제 
	checkDelete = () => {
		const basketNos = document.getElementsByClassName('basketNos');
		const checkProducts = products.querySelectorAll('input[type="checkbox"]:checked');
		//체크 된 부분만 삭제 처리 
		for(basketNo of basketNos) {
			if(basketNo.nextSibling.nextSibling.checked) {
				const delBasket = basketNo.value;
				$.ajax({
					url:'${contextPath}/delBasket.ma',
					data:{ 
						productNo:delBasket
					},
					success: (data) => {
						for(const checkProduct of checkProducts) {
							let list = checkProduct.parentNode.parentNode;
							list.remove(); 
						}
					},
					error: (data) => {
					}
				})
			}
		}
	}
	
	//
	document.getElementById('goPay').addEventListener('click', function() {
		const products = document.getElementById('products');
		const checkProducts = products.querySelectorAll('input[type="checkbox"]:checked');
		if(checkProducts.length == 0){
			swal({
				 text: "상품을 한 개 이상 선택해주세요.",
				 icon: "error",
				 button: "확인",
				});
		} else {
			location.href ='${contextPath}/payDetail.ma'
		}
	})
	
	
</script>


</html>

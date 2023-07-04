<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,0" />
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	.modal-body p{margin-bottom: 8px; padding-right: 0px;}
	table .tr:hover{cursor: pointer; background: rgba(0,0,0,0.2)};
</style>
</head>

<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="mainBox d-inline-block align-top" style="margin-bottom: 100px; width:1600px;">
		<h4 class="py-4 mb-2">주문관리</h4>
		<c:if test="${ab.searchText != null && ab.searchText != ''}">
			<c:if test="${fn:substring(ab.searchText,6,8) ne ''}">
				<h5 class="mb-4">20${fn:substring(ab.searchText,0,2)}년 ${fn:substring(ab.searchText,3,5)}월 ${fn:substring(ab.searchText,6,8)}일 매출현황</h5>
			</c:if>
			<c:if test="${fn:substring(ab.searchText,6,8) eq ''}">
				<h5 class="mb-4">20${fn:substring(ab.searchText,0,2)}년 ${fn:substring(ab.searchText,3,5)}월 매출현황</h5>
			</c:if>
		</c:if>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>
				
		<table class="w-100 text-center mb-3">
			<c:if test="${ab.searchText != null && ab.searchText != ''}">
				<tr style="background: rgba(176, 218, 255, 0.7);">
					<c:if test="${ab.searchText != null && ab.searchText != ''}">
						<c:if test="${fn:substring(ab.searchText,6,8) ne ''}">
							<th colspan="8">일별 합계</th>
						</c:if>
						<c:if test="${fn:substring(ab.searchText,6,8) eq ''}">
							<th colspan="8">월별 합계</th>
						</c:if>
					</c:if>
					<th><fmt:formatNumber pattern="###,###,###,###" value="${sales.sales}"/></th>
				</tr>
			</c:if>
		
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 8%;">주문번호</th>
				<th style="width: 14%;">주문자</th>
				<th style="width: 8%;">처리상태</th>
				<th style="width: 10%;">주문일자</th>
				<th style="width: 5%;">상품번호</th>
				<th style="width: 20%;">상품명</th>
				<th style="width: 20%;">옵션명</th>
				<th style="width: 5%;">주문수량</th>
				<th style="width: 10%;">주문금액</th>
			</tr>
			
			
			<c:forEach items="${odList}" var="od" varStatus="vs">
				<tr class="tr" style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td class="orderNo">${od.orderNo}</td>
					<td>(${od.usersNo}) ${od.usersId}</td>
					<td>
						<c:if test="${od.orderDeliveryDate eq null}">배송준비중</c:if>
						<c:if test="${od.orderDeliveryDate ne null}">배송완료</c:if>
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${od.orderDate}"/></td>
					<td>${od.productNo}</td>
					<td>${od.productName}</td>
					<td>${od.options}</td>
					<td><fmt:formatNumber pattern="###,###,###,###" value="${od.orderCount}"/></td>
					<td><fmt:formatNumber pattern="###,###,###,###" value="${od.totalPrice}"/>원</td>
				</tr>
			</c:forEach>
			
			<c:if test="${ab.searchText != null && ab.searchText != ''}">
				<tr style="background: rgba(176, 218, 255, 0.7);">
					<c:if test="${ab.searchText != null && ab.searchText != ''}">
						<c:if test="${fn:substring(ab.searchText,6,8) ne ''}">
							<th colspan="8">일별 합계</th>
						</c:if>
						<c:if test="${fn:substring(ab.searchText,6,8) eq ''}">
							<th colspan="8">월별 합계</th>
						</c:if>
					</c:if>
					<th><fmt:formatNumber pattern="###,###,###,###" value="${sales.sales}"/></th>
				</tr>
			</c:if>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


<!-- Modal -->
	<div class="modal fade" id="ordersModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">주문 상세조회</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row" style="font-size:14px; padding: 30px 50px;">
						<p class="col-3">주문번호 	</p><p class="col-9 modalOrderNo">0</p>
						<hr>
						<p class="col-3">주문자 	</p><p class="col-9 modalUsers">users</p>
						<hr>
						<p class="col-3">주문날짜 	</p><p class="col-9 modalDate mb-0">2023-00-00 hh:mm:ss</p>
						<hr>
						<p class="col-3">상품 	</p><p class="col-9 modalProduct">(1000) 후라이펜</p>
						<hr>
						<p class="col-3">옵션 	</p><p class="col-9 modalOptions">(1000) 후라이펜</p>
						<hr>
						<p class="col-3">주문금액 	</p><p class="col-9 modalTotalPrice">0원</p>
						<hr>
						<p class="col-3">배송비 	</p><p class="col-9 modalShipPrice">0원</p>
						<hr>
						<p class="col-3">주문수량 	</p><p class="col-9 modalOrderCount">0개</p>
						<hr>
						<p class="col-3">주문주소 	</p><p class="col-9 modalAddress">orderAddress</p>
						<hr>
						<p class="col-3">처리상태 	</p><p class="col-9 modalOrderDelivery">배송준비중</p>
						<hr>
						<p class="col-3">배송날짜 	</p><p class="col-9 modalOrderDeliveryDate">2023-00-00</p>
						<hr>
						<p class="col-3">배송 요청사항 </p><p class="col-9 modalOrderComment"></p>
						<hr>
						<p class="col-3">주문 상세정보 </p><p class="col-9 modalOrderInfo"></p>
						
					</div>
					<div class="modalImageBox">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	
	<script>
		window.onload = () =>{
//			td 클릭시 모달창 띄우기 이벤트
			const tds = document.getElementsByTagName('table')[0].querySelectorAll('td');
			const modal = document.getElementById('ordersModal');
			for(let i = 0; i < tds.length; i++){
				tds[i].setAttribute('data-bs-toggle', 'modal');
				tds[i].setAttribute('data-bs-target', '#ordersModal');
				
				tds[i].addEventListener('click', function(){
					const orderNo = this.parentElement.children[0].innerText;
					
// 					let modalReviewNo_Hd = document.getElementsByName('modalReviewNo')[0];

// 					const modalTitle = document.getElementsByClassName('modal-title')[0];
// 					const modalReviewNo = document.getElementsByClassName('modalReviewNo')[0];
// 					const modalWriter = document.getElementsByClassName('modalWriter')[0];
// 					const modalDate = document.getElementsByClassName('modalDate')[0];
// 					const modalContent = document.getElementsByClassName('modalContent')[0];
// 					const modalBtns = document.getElementsByClassName('modalStatusBtn');
					
//					선택된 내용에 따라 order정보 불러오기 ajax
					$.ajax({
						url: '${contextPath}/adminSelectOrders.ad',
						data: {orderNo:orderNo},
						success: o => {
							document.getElementsByClassName('modalOrderNo')[0].innerText = o.orderNo; 
							document.getElementsByClassName('modalUsers')[0].innerText = "("+o.usersNo+") "+o.usersId;
							document.getElementsByClassName('modalDate')[0].innerText = new Date(o.orderDate).toISOString().replace('T', ' ').slice(0, -5);
							document.getElementsByClassName('modalProduct')[0].innerText = "("+o.productNo+") "+o.productName;
							document.getElementsByClassName('modalOptions')[0].innerHTML = o.options.replace("<br>", "").replace(",", "<br>");
							document.getElementsByClassName('modalTotalPrice')[0].innerText = o.totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원";
							document.getElementsByClassName('modalShipPrice')[0].innerText = o.shipPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"; 
							document.getElementsByClassName('modalOrderCount')[0].innerText = o.orderCount;
							let address = document.getElementsByClassName('modalAddress')[0];
							address.innerHTML = '';
							for(let i = 0; i < o.orderAddress.split(",").length; i++){
								address.innerHTML += o.orderAddress.split(",")[i] + "<br>";
							}
							let DeliveryStatus = '';
							let DeliveryDate = '';
							if(o.orderDeliveryDate != null){
								DeliveryStatus = "배송완료"
								DeliveryDate = o.orderDeliveryDate;
							}else{
								DeliveryStatus = "배송준비중"
								DeliveryDate = "배송준비중"
							}
							document.getElementsByClassName('modalOrderDelivery')[0].innerText = DeliveryStatus; 
							document.getElementsByClassName('modalOrderDeliveryDate')[0].innerText = DeliveryDate;
							document.getElementsByClassName('modalOrderComment')[0].innerText = o.orderDeliveryComment;
							let info = document.getElementsByClassName('modalOrderInfo')[0]; 
							info.innerHTML = '';
							for(let i = 0; i < o.orderInfo.split(",").length; i++){
								info.innerHTML += o.orderInfo.split(",")[i] + "<br>";
							}
						},
						error: data =>{
							console.log(data);
						}
					})
				})
			}
		}
		
	</script>
	
	
</body>
</html>
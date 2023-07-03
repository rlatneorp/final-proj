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
</head>

<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="mainBox d-inline-block align-top" style="margin-bottom: 100px;">
		<h4 class="py-4 mb-2">주문관리</h4>
		<c:if test="${fn:substring(ab.searchText,6,8) ne ''}">
			<h5 class="mb-4">20${fn:substring(ab.searchText,0,2)}년 ${fn:substring(ab.searchText,3,5)}월 ${fn:substring(ab.searchText,6,8)}일 매출현황</h5>
		</c:if>
		<c:if test="${fn:substring(ab.searchText,6,8) eq ''}">
			<h5 class="mb-4">20${fn:substring(ab.searchText,0,2)}년 ${fn:substring(ab.searchText,3,5)}월 매출현황</h5>
		</c:if>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>
				
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 8%;">주문번호</th>
				<th style="width: 10%;">처리상태</th>
				<th style="width: 10%;">주문일자</th>
				<th style="width: 8%;">상품코드</th>
				<th style="width: 24%;">상품명</th>
				<th style="width: 20%;">옵션명</th>
<!-- 				<th class="border" style="width: 10%;">합계</th> -->
				<th style="width: 10%;">결제방법</th>
				<th style="width: 10%;">금액</th>
			</tr>
			
			
			<c:forEach items="${odList}" var="od" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>
<%-- 							<a href="${contextPath}/adminOrderDetail.ad?page=${pi.currentPage}&orderNo="> --%>
							${od.orderNo}
<!-- 							</a> -->
						</td>
					<td>
						<c:if test="${od.orderDeliveryDate eq null}">배송준비중</c:if>
						<c:if test="${od.orderDeliveryDate ne null}">배송완료</c:if>
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${od.orderDate}"/></td>
					<td>${od.productNo}</td>
					<td>${od.productName}</td>
					<td>${od.options}</td>
					<td>??결제</td>
					<td>
						<fmt:formatNumber pattern="###,###,###,###" value="${od.totalPrice}"/>
					</td>
<!-- 					<td> -->
<%-- 						<fmt:formatNumber pattern="###,###,###,###" value="${od.totalPrice}"/> --%>
<!-- 					</td> -->
				</tr>
			</c:forEach>
			
<!-- 			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);"> -->
<!-- 				<td rowspan="2" class="border"> -->
<%-- 					<a href="${contextPath}/adminOrderDetail.ad?page=${pi.currentPage}&orderNo="> --%>
<!-- 						2023052317011010 -->
<!-- 					</a> -->
<!-- 				</td> -->
				
<!-- 				<td class="border">배송완료</td> -->
<!-- 				<td class="border">2023-05-23-17:01</td> -->
<!-- 				<td class="border">1071</td> -->
<!-- 				<td class="border">국자세트</td> -->
<!-- 				<td class="border">color-white,3</td> -->
<!-- 				<td class="border"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###,###" value="36000"/> --%>
<!-- 				</td> -->
<!-- 				<td rowspan="2" class="border"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###,###" value="84000"/> --%>
<!-- 				</td> -->
<!-- 				<td rowspan="2" class="border">카드결제</td> -->
<!-- 			</tr> -->
<!-- 			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);"> -->
<!-- 				<td class="border">배송완료</td> -->
<!-- 				<td class="border">2023-05-23-17:01</td> -->
<!-- 				<td class="border">1071</td> -->
<!-- 				<td class="border">도마세트</td> -->
<!-- 				<td class="border">color-black,2</td> -->
<!-- 				<td class="border"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###,###" value="48000"/> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
			
			
			<tr style="background: rgba(176, 218, 255, 0.7);">
				<th colspan="7">일일 합계</th>
				<th>
					<fmt:formatNumber pattern="###,###,###,###" value="${sales.sales}"/>
				</th>
<!-- 				<th> -->
<%-- 					<fmt:formatNumber pattern="###,###,###,###" value="970400"/> --%>
<!-- 				</th> -->
				
			</tr>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
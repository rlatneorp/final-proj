<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSalesDetail</title>
<style>
	tr{height: 40px;}
	td{font-size: 14px;}
</style>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top">
		<h4 class="py-4 mb-3">주문관리</h4>
		<div style="width: 100%; border:1px solid black; margin-bottom:1px;"></div>
		<div style="width: 100%; border:1px solid black; margin-bottom:30px;"></div>
<!-- 		<h5 class="mb-4">2023년 5월 20일 매출현황</h5> -->
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th class="border" style="width: 13%;">주문번호</th>
				<th class="border" style="width: 10%;">처리상태</th>
				<th class="border" style="width: 13%;">주문일자</th>
				<th class="border" style="width: 8%;">상품코드</th>
				<th class="border" style="width: 14%;">상품명</th>
				<th class="border" style="width: 12%;">옵션명</th>
				<th class="border" style="width: 10%;">금액</th>
				<th class="border" style="width: 10%;">합계</th>
				<th class="border" style="width: 10%;">결제방법</th>
			</tr>
			
			
			<c:forEach begin="1" end="7" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td class="border">
							<a href="${contextPath}/adminOrderDetail.ad?page=${pi.currentPage}&orderNo=">
								20230523170110${21-vs.index}
							</a>
						
						</td>
					<td class="border">배송완료</td>
					<td class="border">2023-05-23-17:01</td>
					<td class="border">1071</td>
					<td class="border">국자세트</td>
					<td class="border">color-white,3</td>
					<td class="border">
						<fmt:formatNumber pattern="###,###,###,###" value="36000"/>
					</td>
					<td class="border">
						<fmt:formatNumber pattern="###,###,###,###" value="36000"/>
					</td>
					<td class="border">카드결제</td>
				</tr>
			</c:forEach>
			
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
				<td rowspan="2" class="border">
					<a href="${contextPath}/adminOrderDetail.ad?page=${pi.currentPage}&orderNo=">
						2023052317011010
					</a>
				</td>
				
				<td class="border">배송완료</td>
				<td class="border">2023-05-23-17:01</td>
				<td class="border">1071</td>
				<td class="border">국자세트</td>
				<td class="border">color-white,3</td>
				<td class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="36000"/>
				</td>
				<td rowspan="2" class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="84000"/>
				</td>
				<td rowspan="2" class="border">카드결제</td>
			</tr>
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
				<td class="border">배송완료</td>
				<td class="border">2023-05-23-17:01</td>
				<td class="border">1071</td>
				<td class="border">도마세트</td>
				<td class="border">color-black,2</td>
				<td class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="48000"/>
				</td>
			</tr>
			
			
			<tr style="background: rgba(176, 218, 255, 0.7);">
				<th class="border" colspan="6">일일 합계</th>
				<th class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="970400"/>
				</th>
				<th class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="970400"/>
				</th>
				<th class="border"></th>
				
			</tr>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
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
	<div class="d-inline-block align-top mt-5" style="width: 900px;">
		<h4 class="py-4 mb-3">매출관리</h4>
		
		<h5 class="mb-4">2023년 5월 20일 매출현황</h5>
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th class="border" style="width: 16%;">주문번호</th>
				<th class="border" style="width: 14%;">주문자</th>
				<th class="border" style="width: 16%;">주문합계</th>
				<th class="border" style="width: 10%;">쿠폰</th>
				<th class="border" style="width: 10%;">포인트</th>
				<th class="border" style="width: 12%;">계좌이체</th>
				<th class="border" style="width: 12%;">카드결제</th>
				<th class="border" style="width: 10%;">주문취소</th>
			</tr>
			
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td class="border">
						<a href="${contextPath}/adminOrderDetail.ad?page=${pi.currentPage}&orderNo=">
							20230523170110${21-vs.index}
						</a>		
					</td>
					<td class="border">ganggangsu${vs.index}</td>
					<td class="border">
						<fmt:formatNumber pattern="###,###,###,###" value="38000"/>
					</td>
					<td class="border">
						<fmt:formatNumber pattern="###,###,###,###" value="1000"/>
					</td>
					<td class="border">
						<fmt:formatNumber pattern="###,###,###,###" value="3000"/>
					</td>
					<td class="border">
						<fmt:formatNumber pattern="###,###,###,###" value="0"/>
					</td>
					<td class="border">
						<fmt:formatNumber pattern="###,###,###,###" value="34000"/>
					</td>
					<td class="border">
						<fmt:formatNumber pattern="###,###,###,###" value="0"/>
					</td>
				</tr>
			</c:forEach>
			
			
			<tr style="background: rgba(176, 218, 255, 0.7);">
				<th class="border" colspan="2">일일 합계</th>
				<th class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="970400"/>
				</th>
				<th class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="21000"/>
				</th>
				<th class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="44000"/>
				</th>
				<th class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="84000"/>
				</th>
				<th class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="760700"/>
				</th>
				<th class="border">
					<fmt:formatNumber pattern="###,###,###,###" value="0"/>
				</th>
				
			</tr>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
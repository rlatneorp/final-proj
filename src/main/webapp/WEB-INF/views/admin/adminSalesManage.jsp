<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSalesManage</title>
<style>
	tr{height: 40px;}
	td{font-size: 14px;}
</style>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="d-inline-block align-top mt-5" style="width: 900px;">
		<h4 class="py-4 mb-3">매출관리</h4>
		
		<h5 class="mb-4">일일 매출 현황</h5>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th rowspan="2" style="width: 15%">날짜</th>
				<th rowspan="2" style="width: 10%">주문수</th>
				<th colspan="3">매출</th>
			</tr>
			<tr>
				<th style="width: 23%">매출액(a-b)</th>
				<th style="width: 23%">주문합계(a)</th>
				<th style="width: 23%">지출액(b)</th>
			</tr>
			
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>
						<a href="${contextPath}/adminSalesDetail.ad?page=${pi.currentPage}&date=">
							2023-05-${23-vs.index}
						</a>		
					</td>
					<td>${23-vs.index}</td>
					<td>
						<fmt:formatNumber pattern="###,###,###,###" value="7098020"/>원
					</td>
					<td>
						<fmt:formatNumber pattern="###,###,###,###" value="8007490"/>원
					</td>
					<td>
						<fmt:formatNumber pattern="###,###,###,###" value="909470"/>원
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
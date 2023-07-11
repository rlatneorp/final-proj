<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,0" />
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<%@ include file="../common/top.jsp" %>

	<div class="mainBox d-inline-block align-top" style="margin-bottom: 100px;">
		<h4 class="py-4 mb-2">매출관리</h4>
		<c:if test="${ab.kind eq null || ab.kind eq 0}">
			<h5 class="mb-4 mb-2">일별 매출 현황</h5>
		</c:if>
		<c:if test="${ab.kind eq 1}">
			<h5 class="mb-4 mb-2">월별 매출 현황</h5>
		</c:if>
		
		<div class="mb-3">
			<button onclick="selectSalesType(0)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 30px; font-size: 12px; font-weight: bold;">일별 조회</button>
			<button onclick="selectSalesType(1)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 30px; font-size: 12px; font-weight: bold;">월별 조회</button>
		</div>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>
		
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
			
			
			<c:forEach items="${sList}" var="s" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>
						<a href="${contextPath}/adminOrdersManage.ad?page=1&pageCount=${ab.pageCount}&searchText=${s.dateKind}&kind=${ab.kind}">
							${s.dateKind}
						</a>		
					</td>
					<td>${s.orderCount}</td>
					<td>
						<fmt:formatNumber pattern="###,###,###,###" value="${s.sales}"/>원
					</td>
					<td>
						<fmt:formatNumber pattern="###,###,###,###" value="${s.sales}"/>원
					</td>
					<td>
						<fmt:formatNumber pattern="###,###,###,###" value="0"/>원
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>

	<script>
		function selectSalesType(i){
			if(i == 0){
				location.href="${contextPath}/adminSalesManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}";
			}else if(i == 1){
				location.href="${contextPath}/adminSalesManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}"
								+"&kind=1";
			}
		}
	</script>

	
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain</title>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="mainBox d-inline-block align-top" style="margin-bottom: 100px;">
		<div class="row mt-5">
			<div class="dataBox col-6 border-end border-bottom p-4">
				<h4>매출</h4>
				<table class="w-100 text-center mt-3">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
						<th>날짜</th>
						<th>판매건수</th>
						<th>매출액</th>
						<th>월 누적 매출액</th>
					</tr>
					
					<c:forEach items="${salesList}" var="s" varStatus="vs">
						<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
							<td>${s.day}</td>
							<td><fmt:formatNumber value="${s.orderDayCount}" pattern="###,###,###"/>건</td>
							<td><fmt:formatNumber value="${s.orderDaySales}" pattern="###,###,###"/>원</td>
							<td><fmt:formatNumber value="${s.orderMonthSales}" pattern="###,###,###"/>원</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-end">
					<a href="${contextPath}/adminSalesManage.ad">
						<h6 class="mt-2 d-inline-block">매출관리</h6>
					</a>
				</div>
			</div>
			
			<div class="dataBox col-6 border-bottom p-4">
				<h4>레시피 등록수</h4>
				<table class="w-100 text-center mt-3">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
						<th>날짜</th>
						<th>신규 등록</th>
						<th>누적 등록</th>
					</tr>
					
					<c:forEach items="${recipeList}" var="r" varStatus="vs">
						<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
							<td>${r.day}</td>
							<td>${r.recipeDayCount}개</td>
							<td>${r.recipeTotalCount}개</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-end">
					<a href="${contextPath}/adminRecipeManage.ad">
						<h6 class="mt-2 d-inline-block">레시피관리</h6>
					</a>
				</div>
			</div>
			
			<div class="dataBox col-6 border-end p-4">
				<h4>회원 수</h4>
				<table class="w-100 text-center mt-3">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
						<th>날짜</th>
						<th>신규 가입</th>
						<th>누적 가입</th>
					</tr>
					
					<c:forEach items="${usersList}" var="u" varStatus="vs">
						<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
							<td>${u.day}</td>
							<td>${u.enrollDayCount}명</td>
							<td>${u.enrollTotalCount}명</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-end">
					<a href="${contextPath}/adminUsersManage.ad">
						<h6 class="mt-2 d-inline-block">회원관리</h6>
					</a>
				</div>
			</div>
			
			<div class="dataBox col-6 p-4">
				<h4>구독회원 수</h4>
				<table class="w-100 text-center mt-3">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
						<th>날짜</th>
						<th>신규 가입</th>
						<th>누적 가입</th>
					</tr>
					
					<c:forEach items="${menuList}" var="m" varStatus="vs">
						<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
							<td>${m.day}</td>
							<td>${m.menuDayCount}명</td>
							<td>${m.menuTotalCount}명</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-end">
					<a href="${contextPath}/adminMenuManage.ad">
						<h6 class="mt-2 d-inline-block">식단관리</h6>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
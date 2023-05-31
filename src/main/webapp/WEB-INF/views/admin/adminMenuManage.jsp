<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMenuManage</title>
<style>
	tr{height: 40px;}
	td{font-size: 14px;}
</style>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="d-inline-block align-top mt-5" style="width: 900px;">
		<h4 class="py-4 mb-0">식단관리</h4>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 9%">번호</th>
				<th style="width: 19%">식단이름</th>
				<th style="width: 9%">분류</th>
				<th style="width: 9%">가격</th>
				<th style="width: 9%">할인률</th>
				<th style="width: 9%">재고</th>
				<th style="width: 9%">구매자</th>
				<th style="width: 9%">조회수</th>
				<th style="width: 9%">좋아요</th>
				<th style="width: 9%">상태</th>
			</tr>
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>${11-vs.index}</td>
					<td>
						<a href="${contextPath}/adminMenuDetail.ad?page=${pi.currentPage}&productNo=">
							이거면5키로빼지!${11-vs.index}</a>
					</td>
					<td>채소</td>
					<td>
						<fmt:formatNumber pattern="###,###,###" value="20000"/>원
					</td>
					<td>20%</td>
					<td>${(11-vs.index)*15}</td>
					<td>${(11-vs.index)*9}</td>
					<td>${(11-vs.index)*8}</td>
					<td>${(11-vs.index)*32}</td>
					<td>Y</td>
				</tr>
			</c:forEach>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
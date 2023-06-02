<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminIngredientManage</title>
<style>
	tr{height: 40px;}
	td{font-size: 14px;}
</style>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top mt-5" style="width: 900px;">
		<h4 class="py-4 mb-0">식재료관리</h4>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 8%">번호</th>
				<th style="width: 20%">이름</th>
				<th style="width: 8%">분류</th>
				<th style="width: 8%">가격</th>
				<th style="width: 8%">할인률</th>
				<th style="width: 8%">재고</th>
				<th style="width: 8%">구매자</th>
				<th style="width: 8%">조회수</th>
				<th style="width: 8%">좋아요</th>
				<th style="width: 8%">공식등록</th>
				<th style="width: 8%">상태</th>
			</tr>
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>${11-vs.index}</td>
					<td>
						<a href="${contextPath}/adminIngredientDetail.ad?page=${pi.currentPage}&productNo=">
							양파(100g)${11-vs.index}</a>
					</td>
					<td>채소</td>
					<td>
						<fmt:formatNumber pattern="###,###,###" value="2000"/>원
					</td>
					<td>10%</td>
					<td>${(11-vs.index)*27}</td>
					<td>${(11-vs.index)*7}</td>
					<td>${(11-vs.index)*11}</td>
					<td>${(11-vs.index)*19}</td>
					<td>Y</td>
					<td>Y</td>
				</tr>
			</c:forEach>
		</table>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button onclick="location.href='${contextPath}/adminIngredientWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">식재료등록</button>
			</div>
		</div>
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
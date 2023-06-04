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
<style>
	tr{height: 40px;}
	td{font-size: 14px;}
</style>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top mt-5" style="width: 900px;">
		<h4 class="py-4 mb-0">레시피관리</h4>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 10%">번호</th>
				<th style="width: 20%">이름</th>
				<th style="width: 10%">상황 분류</th>
				<th style="width: 10%">종류 분류</th>
				<th style="width: 10%">작성자</th>
				<th style="width: 10%">조회수</th>
				<th style="width: 10%">등록일</th>
				<th style="width: 10%">수정일</th>
				<th style="width: 10%">상태</th>
			</tr>
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>${11-vs.index}</td>
					<td>
						<a href="${contextPath}/adminRecipeDetail.ad?page=${pi.currentPage}&recipeNo=">
							마늘샐러드${11-vs.index}</a>
					</td>
					<td>다이어트</td>
					<td>메인</td>
					<td>ganggangsu</td>
					<td>${(11-vs.index)*15}</td>
					<td>2023-05-${(21-vs.index)}</td>
					<td>2023-06-${(21-vs.index)}</td>
					<td>Y</td>
				</tr>
			</c:forEach>
		</table>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button onclick="location.href='${contextPath}/adminRecipeWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">레시피등록</button>
			</div>
		</div>
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
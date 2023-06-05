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
		<h4 class="py-4 mb-0">레시피 후기 관리</h4>
		<div style="width: 100%; border:1px solid black; margin-bottom:1px;"></div>
		<div style="width: 100%; border:1px solid black; margin-bottom:30px;"></div>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 6%">번호</th>
				<th style="width: 14%">작성자</th>
				<th style="width: 40%">내용</th>
				<th style="width: 24%">레시피</th>
				<th style="width: 9%">상태</th>
				<th style="width: 7%">
					<button type="button" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 45px; height: 25px; font-size: 12px; font-weight: bold;">삭제</button>
				</th>
			</tr>
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>${11-vs.index}</td>
					<td>ganggangsu${11-vs.index}</td>
					<td>
						<a href="${contextPath}/adminRecipeReviewDetail.ad?page=${pi.currentPage}&recipeReviewNo=">
							만들기 쉽고 재밌고 맛있어요.${11-vs.index}</a>
					</td>
					<td>(${11-vs.index})-마늘샐러드${11-vs.index}</td>
					<td>
						<button type="button" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;">Y</button>
						<button type="button" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;">N</button>
					</td>
					<td><input type="checkbox" style="width: 16px; height: 16px;"></td>				
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
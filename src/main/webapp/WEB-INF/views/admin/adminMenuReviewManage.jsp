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
		<h4 class="py-4 mb-0">식단구독 후기 관리</h4>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 8%">번호</th>
				<th style="width: 14%">작성자</th>
				<th style="width: 40%">내용</th>
				<th style="width: 30%">식단</th>
				<th style="width: 8%">상태</th>
			</tr>
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>${11-vs.index}</td>
					<td>ganggangsu${11-vs.index}</td>
					<td>
						<a href="${contextPath}/adminMenuReviewDetail.ad?page=${pi.currentPage}&menuReviewNo=">
							일주일밖에 안먹었지만 건강해진 느낌이에요!${11-vs.index}</a>
					</td>
					<td>(${11-vs.index})-건강식단${11-vs.index}</td>
					<td>Y</td>
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
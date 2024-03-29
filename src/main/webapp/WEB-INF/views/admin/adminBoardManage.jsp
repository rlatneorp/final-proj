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
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="mainBox d-inline-block align-top">
		<h4 class="py-4 mb-0">게시판관리</h4>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>		
		
<%-- 		<form id="deleteForm" action="${contextPath}/adminBoardDeletes.ad" method="post"> --%>
		<form id="deleteForm" action="${contextPath}/adminDeleteSelects.ad" method="post">
			<input type="hidden" name="type" value="8">
			<input type="hidden" name="url" value="adminBoardManage.ad">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 8%">작성자</th>
					<th style="width: 49%">제목</th>
<!-- 					<th style="width: 30%">내용</th> -->
					<th style="width: 7%">종류</th>
					<th style="width: 6%">조회수</th>
					<th style="width: 8%">날짜</th>
					<th style="width: 9%">상태</th>
					<th style="width: 7%">
						<button type="button" class="allSelect btns" style="background-color: #19A7CE; width: 45px;font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach items="${bList}" var="b" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${b.boardNo}
							<input type="hidden" name="boardNo" value="${b.boardNo}"></td>
						<td>${b.nickName}</td>
						<td>
							<a href="${contextPath}/detailFreeBoard.bo?bId=${b.boardNo}&writer=${b.nickName}&page=1">${fn:substring(b.boardTitle, 0, 20)}</a>
						</td>
<%-- 						<td>${fn:substring(b.boardContent, 0, 30)}</td> --%>
						<td>
							<c:if test="${b.boardType eq 0 || b.boardType eq 1}">
								 자유게시판
							</c:if>
						</td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${b.boardCount}"/></td>
						<td><fmt:formatDate value="${b.boardDate}" pattern="yyyy-MM-dd"/></td>
						<td>
							<c:if test="${b.boardStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${b.boardStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${b.boardNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h4 class="py-4 mb-0">1:1문의관리</h4>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>	
		
		<form id="deleteForm" action="${contextPath}/adminDeleteSelects.ad" method="post">
			<input type="hidden" name="type" value="10">
			<input type="hidden" name="url" value="adminQNAManage.ad">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 6%">카테고리</th>
					<th style="width: 10%">문의회원</th>
					<th style="width: 20%">제목</th>
					<th style="width: 26%">내용</th>
					<th style="width: 8%">작성날짜</th>
					<th style="width: 8%">답변</th>
					<th style="width: 9%">상태</th>
					<th style="width: 7%">
						<button type="button" class="allSelect btns" style="background-color: #19A7CE; width: 45px;font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach items="${qnaList}" var="q" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${q.qnaNo}
							<input type="hidden" name="qnaNo" value="${q.qnaNo}"></td>
						<td>
							<c:if test="${q.qnaType eq 1}">배송</c:if>
							<c:if test="${q.qnaType eq 2}">결제</c:if>
							<c:if test="${q.qnaType eq 3}">회원</c:if>
							<c:if test="${q.qnaType eq 4}">상품</c:if>
							<c:if test="${q.qnaType eq 0}">기타</c:if>
						</td>
						<td>(${q.usersNo}) ${q.usersId}</td>
						<td>
							<a href="${contextPath}/adminQNADetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&qnaNo=${q.qnaNo}">
							${fn:substring(q.qnaTitle, 0, 20)}</a>
						</td>
						<td>${fn:substring(q.qnaContent, 0, 30)}</td>
						<td><fmt:formatDate value="${q.qnaDate}" pattern="yyyy-MM-dd"/></td>
						<td>
							<c:if test="${q.answerContent ne null}"><span style="color: gray;">답변완료</span></c:if>
							<c:if test="${q.answerContent eq null}"><span style="color: #19A7CE; font-weight: bold;">대기중</span></c:if>
						</td>
						<td>
							<c:if test="${q.qnaStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${q.qnaStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${q.qnaNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>
	
	
</body>
</html>
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
		<h4 class="py-4 mb-0">회원관리</h4>

		<jsp:include page="../common/adminPageCountForm.jsp"/>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 6%">번호</th>
				<th style="width: 10%">이름</th>
				<th style="width: 13%">아이디</th>
				<th style="width: 24%">이메일</th>
				<th style="width: 13%">전화번호</th>
				<th style="width: 12%">가입일자</th>
				<th style="width: 12%">탈퇴일자</th>
				<th style="width: 10%">상태</th>
			</tr>
			
			<c:forEach items="${uList}" var="u" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>
						${u.usersNo}
						<input type="hidden" name="usersNo" value="${u.usersNo}">
					</td>
					
					<td>${u.usersName}</td>
					
					<c:if test="${u.usersPw eq '카카오로그인 회원입니다'}">
						<td>
							<a href="${contextPath}/adminUsersDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&usersNo=${u.usersNo}">
								카카오회원
							</a>
						</td>
						<td>카카오회원</td>
						<td>카카오회원</td>
					</c:if>
					
					<c:if test="${u.usersPw eq '네이버로그인 회원입니다'}">
						<td>
							<a href="${contextPath}/adminUsersDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&usersNo=${u.usersNo}">
								네이버회원
							</a>
						</td>
						<td>네이버회원</td>
						<td>네이버회원</td>
					</c:if>
					
					<c:if test="${u.usersPw ne '카카오로그인 회원입니다' && u.usersPw ne '네이버로그인 회원입니다'}">
						<td>
							<a href="${contextPath}/adminUsersDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&usersNo=${u.usersNo}">
								${u.usersId}
							</a>
						</td>
						<td>${u.email}</td>
						<td>
							${fn:substring(u.phone,0,3)}-${fn:substring(u.phone,3,7)}-${fn:substring(u.phone,7,11)}
						</td>
					</c:if>
					<td><fmt:formatDate value="${u.enrollDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${u.exitDate}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${u.status eq 'Y'}">
							<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
							<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
						</c:if>
						<c:if test="${u.status eq 'N'}">
							<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
							<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>

		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>
</body>
</html>
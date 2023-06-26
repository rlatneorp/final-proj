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
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
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

	<script>
		window.onload = () =>{
// 			상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			const uNos = document.getElementsByName('usersNo');
			
			for(const i in statusBtns){
				if(i<statusBtns.length){
					let j = Math.floor(i/2);
					if(uNos[j].value != 0){
						statusBtns[i].addEventListener('click', function(){
							$.ajax({
								url: '${contextPath}/adminUpdateStatus.ad',
								data: {dataNo:uNos[j].value,
									   dataStatus:statusBtns[i].innerText,
									   dataType:5},
								success: data =>{
									if(data == "success"){
										if(i%2 == 0){
											statusBtns[i].style.background = "#19A7CE";
											statusBtns[i].nextElementSibling.style.backgroundColor = "gray";
										}else if(i%2 == 1){
											statusBtns[i].style.background = "#19A7CE";
											statusBtns[i].previousElementSibling.style.backgroundColor = "gray";
										}
									}else{
										alert("상태 변경에 실패하였습니다.");
									}
								},
								error: data => {
									console.log(data);
								}
							})
						})
					}
				}
			}
		}
		
	</script>
	
	
	
	
	
</body>
</html>
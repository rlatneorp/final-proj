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

<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mainBox d-inline-block align-top">
		<h4 class="py-4 mb-0">포인트관리</h4>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 6%">번호</th>
				<th style="width: 10%">회원번호</th>
				<th style="width: 24%">변동사유</th>
				<th style="width: 16%">변동 전 Point</th>
				<th style="width: 16%">변동 Point</th>
				<th style="width: 16%">변동 후 Point</th>
				<th style="width: 12%">날짜</th>
			</tr>
			
			<c:forEach items="${pointList}" var="p" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>${p.pointNo}</td>
					<td>
						<a href="${contextPath}/adminUsersDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&usersNo=${p.usersNo}&uri=${uri}">
							${p.usersNo}
						</a>
					</td>
					<td>
						<c:if test="${p.pointType eq 1}">출석체크 지급</c:if>
						<c:if test="${p.pointType eq 2}">관리자 지급</c:if>
						<c:if test="${p.pointType eq 3}">상품구매 지급</c:if>
						<c:if test="${p.pointType eq 4}">회원가입 지급</c:if>
						<c:if test="${p.pointType eq 11}">상품구매 사용</c:if>
						<c:if test="${p.pointType eq 12}">이벤트 참여</c:if>
					</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${p.pointBefore}"/></td>
					<td><c:if test="${p.pointChange-p.pointBefore ge 0}">+</c:if><fmt:formatNumber pattern="###,###,###" value="${p.pointChange - p.pointBefore}"/></td>
					<td><fmt:formatNumber pattern="###,###,###" value="${p.pointChange}"/></td>
					<td><fmt:formatDate value="${p.modifyDate}" pattern="yyyy-MM-dd"/></td>
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
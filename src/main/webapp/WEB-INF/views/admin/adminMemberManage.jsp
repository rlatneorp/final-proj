<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMemberManage</title>
<style>
	tr{height: 40px;}
	td{font-size: 14px;}
</style>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="d-inline-block align-top mt-5" style="width: 900px;">
		<h4 class="py-4 mb-0">회원관리</h4>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>활동여부</th>
			</tr>
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>${11-vs.index}</td>
					<td>강건강${11-vs.index}</td>
					<td>
						<a href="${contextPath}/adminMemberDetail.ad?page=${pi.currentPage}&mNo=">
							ganggangsu${11-vs.index}</a>
					</td>
					<td>rkd${11-vs.index}@naver.com</td>
					<td>010-${vs.index-1}111-2222</td>
					<td>2023-05-05</td>
					<td>활동</td>
				</tr>
			</c:forEach>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain</title>
<style>
	tr{height: 34px;}
	td{font-size: 14px;}
	.dataBox{height: 400px;}
</style>
</head>
<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	
	<div class="d-inline-block align-top mt-5" style="width: 900px;">
		<div class="row mt-5">
			<div class="dataBox col-6 border-end border-bottom p-4">
				<h4>매출</h4>
				<table class="w-100 text-center mt-3">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
						<th>날짜</th>
						<th>매출액</th>
						<th>월 누적 매출액</th>
					</tr>
					
					<c:forEach begin="1" end="7" varStatus="vs">
						<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
							<td>2023-05-${20-vs.index}</td>
							<td>30,302,000원</td>
							<td>603,203,200원</td>
						</tr>
					</c:forEach>
				</table>
				<a href="${contextPath}/adminSalesManage.ad">
					<h6 class="text-end mt-2">더보기</h6>
				</a>
			</div>
			
			<div class="dataBox col-6 border-bottom p-4">
				<h4>레시피 등록수</h4>
				<table class="w-100 text-center mt-3">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
						<th>날짜</th>
						<th>신규 등록</th>
						<th>누적 등록</th>
					</tr>
					
					<c:forEach begin="1" end="7" varStatus="vs">
						<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
							<td>2023-05-${20-vs.index}</td>
							<td>${11-vs.index}명</td>
							<td>000명</td>
						</tr>
					</c:forEach>
				</table>
				<a href="${contextPath}/adminRecipeManage.ad">
					<h6 class="text-end mt-2">더보기</h6>
				</a>
			</div>
			
			<div class="dataBox col-6 border-end p-4">
				<h4>회원 수</h4>
				<table class="w-100 text-center mt-3">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
						<th>날짜</th>
						<th>신규 가입</th>
						<th>누적 가입</th>
					</tr>
					
					<c:forEach begin="1" end="7" varStatus="vs">
						<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
							<td>2023-05-${20-vs.index}</td>
							<td>${51-vs.index}명</td>
							<td>000명</td>
						</tr>
					</c:forEach>
				</table>
				<a href="${contextPath}/adminMemberManage.ad">
					<h6 class="text-end mt-2">더보기</h6>
				</a>
			</div>
			
			<div class="dataBox col-6 p-4">
				<h4>구독회원 수</h4>
				<table class="w-100 text-center mt-3">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
						<th>날짜</th>
						<th>신규 가입</th>
						<th>누적 가입</th>
					</tr>
					
					<c:forEach begin="1" end="7" varStatus="vs">
						<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
							<td>2023-05-${20-vs.index}</td>
							<td>${11-vs.index}명</td>
							<td>000명</td>
						</tr>
					</c:forEach>
				</table>
				<a href="${contextPath}/adminMenuManage.ad">
					<h6 class="text-end mt-2">더보기</h6>
				</a>
			</div>
		</div>
	</div>
</body>
</html>
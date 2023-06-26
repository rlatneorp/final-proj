<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<style>
	span{height:25px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mainBox d-inline-block align-top p-4 ps-5 rounded" style="border: 2px solid rgba(0,0,0,0.1); margin-bottom: 100px;">
		<h4 class="py-4 mb-0">자주묻는질문관리</h4>
		
		<form action="${contextPath}/adminFAQInsert.ad" method="post">
			<div class="row" style="padding: 0px 35px 0px 15px;">
				<h5 class="mt-3 mb-5">- 자주묻는질문 -</h5>
				<span class="col-12">제목</span>
				<input type="text" class="col-12 pb-1 mb-5" placeholder="제목을 입력해주세요.">
				
				<span class="col-12">내용</span>
				<textarea rows="10" class="col-12 mb-5" placeholder="내용을 입력해주세요."></textarea>
				
				<span class="col-12">답변내용</span>
				<textarea rows="10" class="col-12 mb-5" placeholder="내용을 입력해주세요."></textarea>

				<span class="col-2">공개상태</span>
					<button type="button" class="col-2 mb-2 rounded" style="border: 2px solid rgba(0,0,0,0.1); ">O</button>
				<span class="col-6"></span>
				<div class="mb-5"></div>
					
				<div class="d-flex justify-content-center mb-5">
					<div class="d-flex">
						<button class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">작성하기</button>
						<button onclick="location.href='${contextPath}/adminFAQManage.ad'" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	
</body>
</html>
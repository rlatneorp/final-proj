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
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top mt-5 p-4 ps-5 rounded" style="width: 900px; border: 2px solid rgba(0,0,0,0.1); margin-bottom: 100px;">
		<h4 class="py-4 mb-0">1:1문의관리</h4>
		
		<form action="${contextPath}/adminQNAUpdate.ad" method="post">
			<div class="row" style="padding: 0px 35px 0px 15px;">
				<h5 class="mt-3 mb-5">- 자주묻는질문 -</h5>
				<span class="col-2">카테고리</span>
				<input type="text" class="col-4 pb-1 mb-2 rounded border" value="이용방법" readonly>
				<div class="col-6"></div>
				
				<span class="col-2">질문자</span>
				<input type="text" class="col-4 pb-1 mb-2 rounded border" value="ganggangsu" readonly>
				<div class="col-6"></div>
				
				<span class="col-2">질문날짜</span>
				<input type="text" class="col-4 pb-1 mb-2 rounded border" value="2023-06-13" readonly>
				<div class="col-6"></div>
				
				<span class="col-2">상태</span>
				<input type="text" class="col-4 pb-1 mb-5 rounded border" value="O" readonly>
				<div class="col-6"></div>
				
				<span class="col-2">제목</span>
				<input type="text" class="col-10 pb-1 mb-5" placeholder="제목을 입력해주세요." value="비밀번호 찾는 방법 문의드려요1" readonly>
				
				<span class="col-2">내용</span>
				<textarea rows="10" class="col-10 mb-5" placeholder="내용을 입력해주세요." readonly>비밀번호를 분실하였습니다. 어떻게하면 제 머릿속에서 찾아낼 수 있을까요?</textarea>
				
				<div class="col-12 mb-5" style="border-bottom: 2px solid rgb(200,200,200);"></div>
				
				
				<span class="col-2">답변내용</span>
				<textarea rows="10" class="col-10 mb-5" placeholder="1:1문의 답변을 입력해주세요.">머리가 좋아지는 식단을 드셔보세요! 지금은 20%할인된 가격으로 판매하고있습니다!</textarea>

				
				<div class="d-flex justify-content-center mb-5">
					<div class="d-flex">
						<button onclick="location.href='${contextPath}/adminQNAUpdate.ad'" class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">답변하기</button>
						<button onclick="location.href='${contextPath}/adminQNAManage.ad'" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	
</body>
</html>
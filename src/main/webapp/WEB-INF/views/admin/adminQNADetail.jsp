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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,700,0,0" />
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mainBox d-flex justify-content-center align-top p-4 ps-5" style="margin-bottom: 100px;">
		<div class="d-flex border p-5" style="width: 1000px;">
			
			<form action="${contextPath}/adminQNAUpdate.ad" method="post" id="updateForm">
				<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
				<div class="row" style="padding: 0px 35px 0px 35px;">
					<h5 class="mt-3 mb-5">- 1:1문의 -</h5>
					<span class="col-12">분류</span>
					
					<input type="text" class="col-2 mb-3" 
						value='<c:if test="${qna.qnaType eq 1}">배송</c:if><c:if test="${qna.qnaType eq 2}">결제</c:if><c:if test="${qna.qnaType eq 3}">회원</c:if><c:if test="${qna.qnaType eq 4}">상품</c:if><c:if test="${qna.qnaType eq 0}">기타</c:if>' readonly>
					<span class="col-12">제목</span>
					<input type="text" name="qnaTitle" class="col-11 pb-1 mb-5" placeholder="제목을 입력해주세요." value="${qna.qnaTitle}" readonly>
					
					<span class="col-12">내용</span>
					<textarea rows="10" name="qnaContent" class="col-11 mb-5" placeholder="내용을 입력해주세요." readonly>${qna.qnaContent}</textarea>
					<span class="col-1"></span>
					
					<span class="col-1"></span>
					<span class="col-11">답변내용 <c:if test="${qna.adminNo ne null}">(<fmt:formatDate value="${qna.answerDate}" pattern="yyyy-MM-dd"/> - admin: ${qna.adminNo})</c:if></span>
					<span class="col-1 material-symbols-rounded" style="font-size:40px; color: #19A7CE;">subdirectory_arrow_right</span>
					<textarea rows="10" name="answerContent" class="col-11 mb-5" placeholder="내용을 입력해주세요.">${qna.answerContent}</textarea>
	
					<span class="col-2">공개상태</span>
					<div class="col-2">
						<input type="hidden" name="qnaStatus" value="${qna.qnaStatus}">
						<c:if test="${qna.qnaStatus eq 'Y'}">
							<button type="button" class="btns statusBtn" style="background-color: #19A7CE; width:50px; height:35px; font-size:16px;">Y</button>
							<button type="button" class="btns statusBtn" style="background-color: gray; width:50px; height:35px; font-size:16px;">N</button>
						</c:if>
						<c:if test="${qna.qnaStatus eq 'N'}">
							<button type="button" class="btns statusBtn" style="background-color: gray; width:50px; height:35px; font-size:16px;">Y</button>
							<button type="button" class="btns statusBtn" style="background-color: #19A7CE; width:50px; height:35px; font-size:16px;">N</button>
						</c:if>
					</div>
					<span class="col-6"></span>
					<div class="mb-5"></div>
						
					<div class="d-flex justify-content-center mb-5">
						<div class="d-flex">
							<button onclick="submitForm()" type="button" class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
							<button onclick="location.href='${contextPath}/adminFAQManage.ad'" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		window.onload = () =>{
// 			상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			const status = document.getElementsByName('qnaStatus')[0];
			for(let i = 0; i < statusBtns.length; i++){
				statusBtns[i].addEventListener('click', function(){
					if(i == 0){
						statusBtns[0].style.background = "#19A7CE";
						statusBtns[1].style.background = "gray";
						status.value = "Y";
					}else{
						statusBtns[0].style.background = "gray";
						statusBtns[1].style.background = "#19A7CE";
						status.value = "N";
					}
				})
			}
		}
		function submitForm(){
			const answerContent = document.getElementsByName('answerContent')[0];
			if(answerContent.value.trim() == ''){
				alert("답변내용을 작성해주세요.");
				answerContent.focus();
			}else{
				document.getElementById('updateForm').submit();
			}
			
		}
	</script>
</body>
</html>
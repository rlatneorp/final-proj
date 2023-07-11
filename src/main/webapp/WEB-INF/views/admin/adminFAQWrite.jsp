<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

<style>
	span{height:25px;}
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,700,0,0" />
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mainBox d-flex justify-content-center align-top p-4 ps-5" style="margin-bottom: 100px;">
		<div class="d-flex border p-5" style="width: 1000px;">
			
			<form action="${contextPath}/adminFAQInsert.ad" method="post">
				<div class="row" style="padding: 0px 35px 0px 35px;">
					<h5 class="mt-3 mb-5">- 자주묻는질문 -</h5>
					<span class="col-12">분류</span>
					<select name="faqType" class="col-2 mb-3">
						<option value="-1">공지사항</option>
						<option value="1">배송</option>
						<option value="2">결제</option>
						<option value="3">회원</option>
						<option value="0">기타</option>
					</select>
					<span class="col-12">제목</span>
					<input type="text" name="faqTitle" class="col-11 pb-1 mb-5" placeholder="제목을 입력해주세요.">
					
					<span class="col-12">내용</span>
					<textarea rows="10" name="faqContent" class="col-11 mb-5" placeholder="내용을 입력해주세요."></textarea>
					<span class="col-1"></span>
					
					<span class="col-1"></span>
					<span class="col-11">답변내용</span>
					<span class="col-1 material-symbols-rounded" style="font-size:40px; color: #19A7CE;">subdirectory_arrow_right</span>
					<textarea rows="10" name="faqAnswer" class="col-11 mb-5" placeholder="내용을 입력해주세요."></textarea>
	
					<span class="col-2">공개상태</span>
					<div class="col-2">
						<input type="hidden" name="faqStatus" value="Y">
						<button type="button" class="btns statusBtn" style="background-color: #19A7CE; width:50px; height:35px; font-size:16px;">Y</button>
						<button type="button" class="btns statusBtn" style="background-color: gray; width:50px; height:35px; font-size:16px;">N</button>
					</div>
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
	</div>
	
	<script>
		window.onload = () =>{
// 			상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			const status = document.getElementsByName('faqStatus')[0];
			for(let i = 0; i<statusBtns.length; i++){
				statusBtns[i].addEventListener('click', ()=>{
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
	</script>
</body>
</html>
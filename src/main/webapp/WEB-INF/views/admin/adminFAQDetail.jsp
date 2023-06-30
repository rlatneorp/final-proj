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
<!-- 	<div class="mainBox d-flex align-top p-4 ps-5" style="border: 2px solid rgba(0,0,0,0.1); margin-bottom: 100px;"> -->
	<div class="mainBox d-flex justify-content-center align-top p-4 ps-5" style="margin-bottom: 100px;">
		<div class="d-flex border p-5" style="width: 1000px;">
<!-- 			<h4 class="py-4 mb-0">자주묻는질문관리</h4> -->
			
			<form action="${contextPath}/adminFAQUpdate.ad" method="post">
				<div class="row" style="padding: 0px 35px 0px 15px;">
					<h5 class="mt-3 mb-5">- 자주묻는질문 -</h5>
					<span class="col-12">분류</span>
					<select name="faqType" class="col-2 mb-3">
						<option value="1"<c:if test="${faq.faqType eq 1}">selected</c:if>>배송</option>
						<option value="2"<c:if test="${faq.faqType eq 2}">selected</c:if>>결제</option>
						<option value="3"<c:if test="${faq.faqType eq 3}">selected</c:if>>회원</option>
						<option value="0"<c:if test="${faq.faqType eq 0}">selected</c:if>>기타</option>
					</select>
					<span class="col-12">제목</span>
					<input type="text" name="faqTitle" class="col-12 pb-1 mb-5" placeholder="제목을 입력해주세요." value="${faq.faqTitle}">
					
					<span class="col-12">내용</span>
					<textarea rows="10" name="faqContent" class="col-12 mb-5" placeholder="내용을 입력해주세요.">${faq.faqContent}</textarea>
					
					<span class="col-12">답변내용</span>
					<textarea rows="10" name="faqAnswer" class="col-12 mb-5" placeholder="내용을 입력해주세요.">${faq.faqAnswer}</textarea>
	
					<span class="col-2">공개상태</span>
					<div class="col-2">
						<input type="hidden" name="faqNo" value="${faq.faqNo}">
						<button type="button" class="btns statusBtn" style="background-color: #19A7CE; width:50px; height:35px; font-size:16px;">Y</button>
						<button type="button" class="btns statusBtn" style="background-color: gray; width:50px; height:35px; font-size:16px;">N</button>
					</div>
					<span class="col-6"></span>
					<div class="mb-5"></div>
						
					<div class="d-flex justify-content-center mb-5">
						<div class="d-flex">
							<button class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
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
			const Nos = document.getElementsByName('faqNo');
			for(const i in statusBtns){
				if(i<statusBtns.length){
					let j = Math.floor(i/2);
					if(Nos[j].value != 0){
						statusBtns[i].addEventListener('click', function(){
							console.log('aa');
							$.ajax({
								url: '${contextPath}/adminUpdateStatus.ad',
								data: {dataNo:Nos[j].value,
									   dataStatus:statusBtns[i].innerText,
									   dataType:9},
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
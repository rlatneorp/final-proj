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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,0" />
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	.reviewContent:hover{cursor: pointer; background: rgba(0,0,0,0.2);}
	.modal .btns{color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 50px; height: 35px; font-size: 14px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="mainBox d-inline-block align-top">
		<h4 class="py-4 mb-0">후기관리</h4>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>		
		
		<form id="deleteForm" action="${contextPath}/adminReviewDeletes.ad" method="post">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 8%">작성자</th>
					<th style="width: 7%">종류</th>
					<th style="width: 19%">레시피/상품 이름</th>
					<th style="width: 30%">댓글 내용</th>
					<th style="width: 8%">날짜</th>
					<th style="width: 9%">상태</th>
					<th style="width: 7%">
						<button type="button" class="allSelect btns" style="background-color: #19A7CE; width: 45px;font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach items="${rList}" var="r" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${r.reviewNo}
							<input type="hidden" name="index" value="${vs.index}">
							<input type="hidden" name="reviewNo" value="${r.reviewNo}">
						</td>
						<td>${r.reviewWriter}</td>
						<td>
							<c:if test="${r.foodNo ne 0 && r.orderNo eq 0}">레시피</c:if>
							<c:if test="${!(r.foodNo ne 0 && r.orderNo eq 0)}">
								<c:if test="${r.productType eq 1}">식단</c:if>
								<c:if test="${r.productType eq 2}">식품</c:if>
								<c:if test="${r.productType eq 3}">식재료</c:if>
								<c:if test="${r.productType eq 4}">도구</c:if>
							</c:if>
						</td>
						<td>
							<c:if test="${r.foodNo ne 0 && r.orderNo eq 0}">(${r.foodNo}) ${r.recipeName}</c:if>
							<c:if test="${!(r.foodNo ne 0 && r.orderNo eq 0)}">(${r.productNo}) ${r.productName}</c:if>
						</td>
						<td class="reviewContent">${fn:substring(r.reviewContent, 0, 30)}</td>
						<td><fmt:formatDate value="${r.reviewDate}" pattern="yyyy-MM-dd"/></td>
						<td>
							<c:if test="${r.reviewStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${r.reviewStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${r.reviewNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>
	
	
	<!-- Button trigger modal -->
<!-- 	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal"> -->
<!-- 		Launch demo modal -->
<!-- 	</button> -->
	
	<!-- Modal -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">modalTitle</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row" style="font-size:14px;">
						<p class="mb-0 pe-0 col-2" >글번호 :</p>
						<p class="modalReviewNo mb-0 pe-0 col-10">100</p>
						<p class="mb-0 pe-0 col-2">작성자 :</p>
						<p class="modalWriter mb-0 pe-0 col-10">문부야</p>
						<p class="pe-0 col-2">작성날짜 :</p>
						<p class="modalDate mb-0 col-10">2023-05-00</p>
					</div>
					<p class="modalContent">modalContent</p>
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
					<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		window.onload = () =>{
// 			댓글내용 클릭시 모달창 띄우기 이벤트
			const contents = document.getElementsByClassName('reviewContent');
			const modal = document.getElementById('reviewModal');
			for(let i = 0; i < contents.length; i++){
				contents[i].setAttribute('data-bs-toggle', 'modal');
				contents[i].setAttribute('data-bs-target', '#reviewModal');
				
				contents[i].addEventListener('click', function(){
					const reviewNo = this.parentElement.children[0].children[1].value;
					
					const modalTitle = document.getElementsByClassName('modal-title')[0];
					const modalReviewNo = document.getElementsByClassName('modalReviewNo')[0];
					const modalWriter = document.getElementsByClassName('modalWriter')[0];
					const modalDate = document.getElementsByClassName('modalDate')[0];
					const modalContent = document.getElementsByClassName('modalContent')[0];
					
					$.ajax({
						url: '${contextPath}/adminSelectReview.ad',
						data: {rNo:reviewNo},
						success: r => {
							let date = r.reviewDate.getFullYear() + "-" + (r.reviewDate.getMonth()+1) + "-" + r.reviewDate.getDate();
							
							let dateFormat2 = r.reviewDate.getFullYear() +
							'-' + ( (today.getMonth()+1) < 9 ? "0" + (today.getMonth()+1) : (today.getMonth()+1) )+
							'-' + ( (today.getDate()) < 9 ? "0" + (today.getDate()) : (today.getDate()) );
							
							modalTitle.innerText = "레시피이름 / 식단이름../ 식품/ //...";
							modalReviewNo.innerText = r.reviewNo;
							modalWriter.innerText = r.reviewWriter;
							modalDate.innerText = r.reviewDate;
							console.log(date);
							
							modalContent.innerText = r.reviewContent;
							console.log(r);
							
						},
						error: data =>{
							console.log(data);
						}
					})
					$.ajax({
						url: '${contextPath}/adminSelectReviewImage.ad',
						data: {rNo:reviewNo},
						success: iList => {
							if(iList.length != 0){
								console.log("사진있음");
							}
						},
						error: data =>{
							console.log(data);
						}
					})
					
					
				})
				
				
			}
			
			
			
// 			삭제 체크박스 전체선택 이벤트
			const allSelect = document.getElementsByClassName('allSelect')[0];
			allSelect.addEventListener('click', ()=>{
				selectDeletes = document.getElementsByName('selectDelete');
				let count = 0;
				for(const sDel of selectDeletes){
					if(sDel.checked == true){
						count += 1;
					}
				}
				if(count == selectDeletes.length){
					for(const sDel of selectDeletes){
						sDel.checked = false;
					}
				}else{
					for(const sDel of selectDeletes){
						sDel.checked = true;
					}
				}
			})
			
// 			삭제버튼 클릭 이벤트 (confirm 띄우기)
			const deleteBtn = document.getElementsByClassName('deleteBtn')[0];
			deleteBtn.addEventListener('click', ()=>{
				let count = 0;
				selectDeletes = document.getElementsByName('selectDelete');
				for(const sDel of selectDeletes){
					if(sDel.checked == true){
						count++;
					}
				}
				if(count > 0){
					const result = confirm("정말 삭제하시겠습니까?");
					if(result){
						document.getElementById('deleteForm').submit();
					}
				}else{
					alert("삭제할 후기를 선택해주세요.");
				}
			})
			
// 			상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			const Nos = document.getElementsByName('reviewNo');
			console.log(Nos);
			for(const i in statusBtns){
				if(i<statusBtns.length){
					let j = Math.floor(i/2);
					if(Nos[j].value != 0){
						statusBtns[i].addEventListener('click', function(){
							$.ajax({
								url: '${contextPath}/adminUpdateStatus.ad',
								data: {dataNo:Nos[j].value,
									   dataStatus:statusBtns[i].innerText,
									   dataType:7},
								success: data =>{
									let price = "";
									let sale = "";
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
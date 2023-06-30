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
		<div class="mb-3">
			<button onclick="selectReviewType(-1)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 38px; font-size: 14px; font-weight: bold;">전체</button>
			<button onclick="selectReviewType(0)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">레시피</button>
			<button onclick="selectReviewType(1)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">식단</button>
			<button onclick="selectReviewType(2)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">식품</button>
			<button onclick="selectReviewType(3)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">식재료</button>
			<button onclick="selectReviewType(4)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">도구</button>
		</div>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>		
		
<%-- 		<form id="deleteForm" action="${contextPath}/adminReviewDeletes.ad" method="post"> --%>
		<form id="deleteForm" action="${contextPath}/adminDeleteSelects.ad" method="post">
			<input type="hidden" name="type" value="7">
			<input type="hidden" name="url" value="adminReviewManage.ad">
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
								<c:if test="${r.productType eq 1}">식품 상품</c:if>
								<c:if test="${r.productType eq 2}">식단 상품</c:if>
								<c:if test="${r.productType eq 3}">식재료 상품</c:if>
								<c:if test="${r.productType eq 4}">도구 상품</c:if>
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
						<input type="hidden" name="modalReviewNo" value="0">
						<p class="mb-0 pe-0 col-2" >글번호 :</p>
						<p class="modalReviewNo mb-0 pe-0 col-10">100</p>
						<p class="mb-0 pe-0 col-2">작성자 :</p>
						<p class="modalWriter mb-0 pe-0 col-10">문부야</p>
						<p class="pe-0 col-2">작성날짜 :</p>
						<p class="modalDate mb-0 col-10">2023-05-00</p>
					</div>
					<div class="modalImageBox">
					</div>
					<hr>
					<p class="modalContent">modalContent</p>
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btns modalStatusBtn" style="background-color: gray;">Y</button>
					<button type="button" class="btns modalStatusBtn" style="background-color: #19A7CE;">N</button>
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
					
					let modalReviewNo_Hd = document.getElementsByName('modalReviewNo')[0];
					const modalTitle = document.getElementsByClassName('modal-title')[0];
					const modalReviewNo = document.getElementsByClassName('modalReviewNo')[0];
					const modalWriter = document.getElementsByClassName('modalWriter')[0];
					const modalDate = document.getElementsByClassName('modalDate')[0];
					const modalContent = document.getElementsByClassName('modalContent')[0];
					
					const modalBtns = document.getElementsByClassName('modalStatusBtn');
					
// 					선택된 댓글내용에 따라 review정보 불러오기 ajax
					$.ajax({
						url: '${contextPath}/adminSelectReview.ad',
						data: {rNo:reviewNo},
						success: r => {
							let day = new Date(r.reviewDate);
							let date = day.getFullYear() + 
							'-' + ( (day.getMonth()+1) < 9 ? "0" + (day.getMonth()+1) : (day.getMonth()+1) ) +
							'-' + ( (day.getDate()) < 9 ? "0" + (day.getDate()) : (day.getDate()) );
							
							if(r.orderNo == 0 ){
								modalTitle.innerText = "("+r.foodNo+") "+r.recipeName;
							}else if(r.orderNo != -1){
								modalTitle.innerText = "("+r.productNo+") "+r.productName;
							}
							
							if(r.reviewStatus == 'Y'){
								modalBtns[0].style.background = "#19A7CE";
								modalBtns[1].style.background = "gray";
							}else{
								modalBtns[0].style.background = "gray";
								modalBtns[1].style.background = "#19A7CE";
							}
							
							modalReviewNo_Hd.value = r.reviewNo;
							modalReviewNo.innerText = r.reviewNo;
							modalWriter.innerText = r.reviewWriter;
							modalDate.innerText = date;
							
							modalContent.innerText = r.reviewContent;
							
						},
						error: data =>{
							console.log(data);
						}
					})
					
// 					선택된 댓글내용에 따라 review정보 불러오기 ajax
					const modalImageBox = document.getElementsByClassName('modalImageBox')[0];
					$.ajax({
						url: '${contextPath}/adminSelectReviewImage.ad',
						data: {rNo:reviewNo},
						success: iList => {
							modalImageBox.innerHTML = ''; 
							if(iList.length != 0){
								for(let i = 0; i < iList.length; i++){
									if(i != 0){
										modalImageBox.innerHTML += "<br>"; 
									}
									modalImageBox.innerHTML += "<img src='${contextPath}/resources/uploadFiles/"+iList[i].imageRenameName+"' width='100%'><br>"; 
								}
								
							}
						},
						error: data =>{
							console.log(data);
						}
					})
					for(let i = 0; i < modalBtns.length; i++){
						modalBtns[i].addEventListener('click', function(){
							$.ajax({
								url: '${contextPath}/adminUpdateStatus.ad',
								data: {dataNo:modalReviewNo_Hd.value,
									   dataStatus:this.innerText,
									   dataType:7},
								success: data =>{
									if(data == "success"){
										if(i == 0){
											modalBtns[0].style.background = "#19A7CE";
											modalBtns[1].style.background = "gray";
										}else{
											modalBtns[0].style.background = "gray";
											modalBtns[1].style.background = "#19A7CE";
										}
									}else{
										alert("상태 변경에 실패하였습니다.");
									}
								},
								error: data => {
									console.log(data);
								}
							})
							const reviewNo = document.getElementsByName('reviewNo');
							const statusBtns = document.getElementsByClassName('statusBtn');
							for(let j = 0; j < reviewNo.length; j++){
								if(modalReviewNo_Hd.value == reviewNo[j].value){
									if(this.innerText == 'Y'){
										statusBtns[j*2].style.background = "#19A7CE";
										statusBtns[j*2+1].style.background = "gray";
									}else{
										statusBtns[j*2].style.background = "gray";
										statusBtns[j*2+1].style.background = "#19A7CE";
									}
									
								}
							}
						})
					}
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
		
// 		후기 타입 선택버튼 함수
		function selectReviewType(i){
			if(i == -1){
				location.href="${contextPath}/adminReviewManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}";
			}else if(i == 0){
				location.href="${contextPath}/adminReviewManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}"
								+"&kind=0";
			}else{
				location.href="${contextPath}/adminReviewManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}"
								+"&kind=1&type="+i;
			}
		}
		
		
	</script>
	
	
	
	
	
</body>
</html>
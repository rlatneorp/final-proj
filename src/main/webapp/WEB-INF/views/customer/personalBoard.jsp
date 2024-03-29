<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
.qnaCate{
	width: 150px; height: 35px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 20px;
	font-size: 20px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding-top: -20px;
}

#admin{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

.modify11{
	width: 100px; height: 35px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	margin-top: -40px;
	font-size: 20px;
	font-weight: 500;
	background-color: white;
}
.delete11{
	width: 100px; height: 35px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	margin-top: -40px;
	font-size: 20px;
	font-weight: 500;
	background-color: white;
}

</style>
</head>
<body>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ include file="../common/top.jsp" %>
<br><br>
	<div class="container-xxl" align="center">
		<br><br><br>
		<br>
		<br>
		<div class="customer d-flex align-items-start">
			<%@ include file="../common/customerBoardPanel.jsp" %>
			    <div class="tab-pane show text-center active" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" tabindex="2">
					<br>
					<h1 style="text-align: left;">1:1 문의</h1>
					<p style="text-align: left;">문의 글은 수정할 수 없습니다. 삭제 후 다시 작성해주세요.</p>
					<br>
					<hr style="width: 1000px;">
					<br>
					<c:if test="${loginUser eq null }">
					<h1 style="margin-top: 80px; margin-bottom: 30px;">로그인 후 문의 하실 수 있습니다.</h1>
					<button id="goToLogin" style="margin-bottom: 30px; font-size: 20px;" onclick="location.href='${contextPath}/login.en'">로그인 하러 가기</button>
					</c:if>
					<c:if test="${!empty loginUser}">
						<div class="accordion acCustomer" id="accordionFlushExample">
						<c:if test="${empty qlist}">
						    <img src="resources/images/qnaNull.png" width="700px" height="500px">
						</c:if>
<%-- 							<c:forEach items="${ plist }" var="c" varStatus="stc">  --%>
							<c:forEach items="${ qlist }" var="q" varStatus="stc">
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-headingOne-${stc.index +1 }c">
								<button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${stc.index +1 }c" aria-expanded="false" aria-controls="flush-collapseOne-${stc.index +1 }c">
								     <c:set var="date"><fmt:formatDate value="${q.qnaDate }" pattern=" MM월 dd일" /></c:set><c:out value="${date}" />	| 문의번호: ${q.qnaNo } | Q. ${q.qnaTitle }  
								</button>
								</h2>
								<div id="flush-collapseOne-${stc.index +1 }c" class="accordion-collapse collapse" aria-labelledby="flush-headingOne-${stc.index +1 }c">
									<div class="accordion-body">
										<div>
											<button type="button" class="qnaCate d-inline"></button>
											<c:if test="${empty q.answerContent }">
											<div class="d-inlne d-flex justify-content-end">
												<button class="delete11">삭제</button>
											</div>
											</c:if>
											<c:if test="${!empty q.toolName}">
												<h6>${q.toolName }</h6><h6>상품번호: ${q.productNo }</h6>
											</c:if>
											<c:if test="${!empty q.ingredientName}">
												<h6>${q.ingredientName }</h6><h6>상품번호: ${q.productNo }</h6>
											</c:if>
											<c:if test="${!empty q.foodName}">
												<h6>${q.foodName }</h6><h6>상품번호: ${q.productNo }</h6>
											</c:if>
											<c:if test="${!empty q.menuName}">
												<h6>${q.menuName }</h6><h6>상품번호: ${q.productNo }</h6>
											</c:if>
											<c:if test="${q.orderNo ne 0}">
											 	<h6>주문번호 ${q.orderNo}</h6>
											</c:if>
											<br>
											<h4>Q. ${q.qnaTitle } </h4>
											<span class="11answer">${q.qnaContent }</span>
											<input type="hidden" value="${q.qnaNo}" class="qHdn">
											<input type="hidden" value="${q.productNo}" class="pNoHdn">
										</div>
										<hr>
										<div> 
											<h4>A. 답변 내용</h4>
											<c:if test="${!empty q.answerContent}">
												<span class="11answer">${q.answerContent }</span>
											</c:if>
											<c:if test="${empty q.answerContent}">
												<h5>아직 답변 처리중입니다. 조금만 기다려주세요.</h5>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
<%-- 							</c:forEach> --%>
						</div>
						<div style="text-align: right;">
							<button class="askBtn" onclick="location.href='${contextPath}/personalQuestion.cs'">문의하기</button>
						</div>
						<div class="pageCustomers" > 
							<nav aria-label="Page navigation example">
								<ul class="pageCustomer pagination justify-content-center">
								    <c:if test="${ pi.currentPage > 1 }">
								    <li class="page-item">
								    	<c:url var="goBack" value="${ loc }">
											<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
										</c:url>
										<a class="page-link" href="${ goBack }" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>	
									</li>
									</c:if>
									<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
									   	<c:url var="goNum" value="${ loc }">
											<c:param name="page" value="${ p }"></c:param>
										</c:url>
									  	<li class="page-item pageCustomer"><a class="page-link" href="${ goNum }">${ p }</a></li>
									</c:forEach>
									<c:if test="${ pi.currentPage < pi.maxPage }">
									<li class="page-item">
										<c:url var="goNext" value="${ loc }">
											<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
										</c:url>
										<a class="page-link" href="${ goNext }" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
									</c:if>
								</ul>
							</nav>	
						</div>
					</c:if>
				</div>
		    </div>
		</div> 
	<br><br><br><br><br>
	
	
<%@ include file="../common/footer.jsp" %>

<div class="modal" id="deleteModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary deleteNo" data-bs-dismiss="modal">아니요</button>
	        <button type="button" class="btn btn-primary deleteYes">예(엔터)</button>
	      </div>
	    </div>
	  </div>
	</div>	
<script>

	 
	const accordion = document.querySelector('body');
	accordion.onload = ()=>{
		const qNos = document.getElementsByClassName('qHdn');
		const qNoss = Array.from(qNos);
		
		const acBodies = document.querySelectorAll('.qnaCate');
		for(let i = 0; i < qNoss.length; i++){
			$.ajax({
				url: 'qnaType.cs',
				data: {
					usersNo: '${loginUser.usersNo}',
					qnaNo: qNoss[i].value
				},
				success: data =>{
					for(const d of data){
						if(d.qnaType == 1){
							acBodies[i].innerText = '배송';
						}else if(d.qnaType == 2){
							acBodies[i].innerText = '결제';
						}else if(d.qnaType == 3){
							acBodies[i].innerText = '회원';
						}else if(d.qnaType == 4){
							acBodies[i].innerText = '상품';
						}else if(d.qnaType == 0){
							acBodies[i].innerText = '기타';
						}
						
					}
			 	},
				 error: data=>{
				 	console.log(data);
				}
			
		  	})
		}
	}	
	const qNos = document.getElementsByClassName('qHdn');
	const qNoss = Array.from(qNos);
	const pNoHdn = document.querySelectorAll('.pNoHdn');
	const pNo = Array.from(pNoHdn);
	const delete11 = document.getElementsByClassName('delete11');
	const deleteYes = document.getElementsByClassName('deleteYes');
	for(let j = 0; j < qNoss.length; j++){
		const qnoo = qNoss[j].value;
		const pnoo = pNo[j].value;
		const usersnoo = '${loginUser.usersNo}';
		delete11[j].addEventListener('click', ()=>{
			$('#deleteModal').modal("show");
 			for(const yes of deleteYes){
 				yes.focus();
 				yes.addEventListener('keydown', function(event){
 					if(event.keyCode == 13){
 						yes.click();
 					}
 				})
		 		yes.addEventListener('click', ()=>{
					$.ajax({
						url:'qnaDelete.cs',
						data:{
							usersNo: usersnoo,
							qnaNo: qnoo
						},
						success: data=>{
							if(data == 'success'){
								swal({
									 text: "문의글이 삭제되었습니다.",
									 icon: "success",
									 button: "확인",
									});
								location.reload();
							}
						}
					})
		 			
		 		})
		
			}
		})
	}	

</script>
</body>
</html>
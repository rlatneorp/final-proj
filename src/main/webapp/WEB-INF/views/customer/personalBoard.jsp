<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
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
					<br>
					<hr style="width: 1050px;">
					<br>
					<c:if test="${loginUser eq null }">
					<h1>로그인 후 문의 하실 수 있습니다.</h1>
					<button  id="goToLogin" onclick="location.href='${contextPath}/login.en'">로그인 하러 가기</button>
					</c:if>
					<c:if test="${loginUser ne null}">
						<div class="accordion acCustomer" id="accordionFlushExample">
							<c:forEach items="${ plist }" var="c" varStatus="stc"> 
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-headingOne-${stc.index +1 }c">
								<button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${stc.index +1 }c" aria-expanded="false" aria-controls="flush-collapseOne-${stc.index +1 }c">
								        글번호: ${stc.index +1 } 제목: ${c.qnaTitle } 
								</button>
								</h2>
								<div id="flush-collapseOne-${stc.index +1 }c" class="accordion-collapse collapse" aria-labelledby="flush-headingOne-${stc.index +1 }c">
									<div class="accordion-body">
										<div>
											<h4>Q. 질문한 내용</h4>
											<span class="11question">${c.qnaTitle }</span>
										</div>
										<hr>
										<div> 
											<h4>A. 답변한 내용</h4>
											<span class="11answer">${c.qnaContent }</span>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
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
</body>
</html>
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
<style>
	#admin{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}
</style>
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
		    <div class="tab-content" id="v-pills-tabContent">
			    <div class="tab-pane container text-center active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="1">
					<br>
					<h1 style="text-align: left;">자주 묻는 질문</h1>
					<br>
					<hr style="width: 1000px;">
					<br>
					<div class="categoryBtn row justify-content-end" style="margin-right: 20px;">
						<div class="ddd col-2">
							<select class="text-center" id="categoryBtn">
								<option value="all" <c:if test="${ category == 'all'}">selected</c:if>>전체</option>
								<option value="user" <c:if test="${ category == 'user'}">selected</c:if>>회원</option>
								<option <c:if test="${ category == 'delivery'}">selected</c:if> value="delivery">배송</option>
								<option <c:if test="${ category == 'pay'}">selected</c:if> value="pay">결제</option>
								<option <c:if test="${ category == 'etc'}">selected</c:if> value="etc">기타</option>
							</select>
						</div>
						<input class="col-3" id="searchText" type="text" name="search" value="<c:if test='${ !empty search }'>${ search }</c:if>">
						<button id="serachBtn" type="button" class="col-1 btn btn-outline-secondary">검색</button>
					</div>	
					<br>
					<div class="accordion acCustomer text-cetner" id="accordionFlush">
						<c:forEach items="${ flist }" var="i" varStatus="st"> 
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingOne-${st.index +1 }">
							<button class="accordion-button collapsed titleBt" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${st.index +1 }" aria-expanded="false" aria-controls="flush-collapseOne-${st.index +1 }">
							       　　Q. ${i.faqTitle } 
							</button>
							</h2>
							<div id="flush-collapseOne-${st.index +1 }" class="accordion-collapse collapse" aria-labelledby="flush-headingOne-${st.index +1 }">
								<div class="accordion-body">
									<div>
										<h4>Q. 질문한 내용</h4>
										<span class="question">${i.faqTitle }</span>
									</div>
									<hr>
									<div> 
										<h4>A. 답변한 내용</h4>
										<span class="answer">${i.faqContent }</span>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					<br><br><br>
					<div class="pageCustomers" > 
						<nav aria-label="Page navigation example">
							<ul class="pageCustomer pagination justify-content-center">
							    <c:if test="${ pi.currentPage > 1 }">
							    <li class="page-item">
							    	<c:url var="goBack" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
										<c:if test="${ category != null }">
											<c:param name="category" value="${ category }"/>
											<c:param name="search" value="${ search }"/>
										</c:if>
									</c:url>
									<a class="page-link" href="${ goBack }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								</c:if>
								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								   	<c:url var="goNum" value="${ loc }">
										<c:param name="page" value="${ p }"></c:param>
										<c:if test="${ category != null }">
											<c:param name="category" value="${ category }"/>
											<c:param name="search" value="${ search }"/>
										</c:if>
									</c:url>
								  	<li class="page-item pageCustomer">
								  		<a class="page-link" href="${ goNum }">${ p }</a>
								  	</li>
								</c:forEach>
								<c:if test="${ pi.currentPage < pi.maxPage }">
								<li class="page-item">
									<c:url var="goNext" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
										<c:if test="${ category != null }">
											<c:param name="category" value="${ category }"/>
											<c:param name="search" value="${ search }"/>
										</c:if>
									</c:url>
									<a class="page-link" href="${ goNext }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
								</c:if>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>	

<script>

window.onload=()=>{

	const categoryBtn = document.querySelector('#categoryBtn');
// 	const titleBt = document.querySelectorAll('.titleBt');
	const searchBtn = document.getElementById('serachBtn');
	let category = '';
	let search = '';
	
	 
	
	
	
	categoryBtn.addEventListener('change', ()=>{
		category = categoryBtn.value;
// 		for(int i = 0; i < titleBt.length; i++){
// 			titleBt[i].innerHTML = '<a>' + '[' + category + ']' + '</a>';
// 		}
		location.href='${contextPath}/faqBoard.cs?category=' + category;
		
	});
	
	searchBtn.addEventListener('click', function(){
		category = categoryBtn.value;
		search = this.previousElementSibling.value;
		this.style.backgroundColor = '#B0DAFF'; 
		location.href='${contextPath}/faqBoard.cs?category=' + category + '&search=' + search;
	});
	
	const searchText = document.getElementById('searchText');
	searchText.addEventListener('keyup', function(event){
		if(event.key == 'Enter'){
			category = categoryBtn.value;
			search = searchBtn.previousElementSibling.value;
			searchBtn.style.backgroundColor = '#B0DAFF'; 
			location.href='${contextPath}/faqBoard.cs?category=' + category + '&search=' + search;
		}
	});
	
	searchBtn.addEventListener('mouseenter', function() {
	    this.style.backgroundColor = '#B0DAFF'; 
	    this.style.cursor = 'pointer';
	});

// 	searchBtn.addEventListener('mouseleave', function() {
// 	    this.style.backgroundColor = 'white';
// 	}); 
}	
	
	
	
	
	
	
</script>
</body>
</html>
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
*{
font-family: 'Noto Sans KR', sans-serif;
}
.customer .page-link{
	color: black;
}

.csTitle{
	text-align: center;
	width: 200px; height: 72px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 20px;
	font-size: 30px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 7px; 
	margin-left: -10px;
	cursor: pointer;
	}
	

.csSide{
	padding: 10px;
	margin: 20px;
}


/* .nav-pills{ */
/* 	background-color: white; */
/* 	color: black; */
/* } */
.customer .nav-pills .nav-link{
	color:black;
	font-size: 20px; 
}
.customer .nav-pills .nav-link.active{ 
	color:black;
	width: 200px;
	height: 50px;
	text-align: left; 
	align: right;
	font-size: 20px; 
	background-color: rgb(248, 249, 250); 
}
.customer .btn-light{
	width:200px;
	height:50px;
	text-align: left; 
	align: right;
	font-size: 20px;
}
.nav{
	color: black;
	
}

.categoryBtn .btn-secondary{
	
	width:150px;
	height:50px;
	background-color: #B0DAFF;
	color:black;
	border: 2px solid black;
}
.categoryBtn .btn-secondary:hover{
	background-color: #B0DAFF;
	color:black;
}
.categoryBtn .btn-secondary:focus{
	background-color: #B0DAFF;
	color:black;
}

.askBtn{
	width: 150px; height: 46px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	font-size: 20px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 7px; 
	margin-top: 30px;
}

#accordionFlushExample{
	border: 3px solid black;
	border-radius: 10px;
	box-shadow: 0px 10px black;
	font-size: 20px;
	font-weight: 500;
}
#accordionFlush1{
	border: 3px solid black;
	border-radius: 10px;
	box-shadow: 0px 10px black;
	font-size: 20px;
	font-weight: 500;
}

#searchText{
	width:300px;
	height:50px;
	border: 1px solid lightgray;
}

#searchBtn{
	background: lightgray;
	border: solid #B0DAFF;
	font-size: 23px;
	text-align: center;
}
/* .btn-outline-secondary{ */
/* 	--bs-btn-hover-bg: #B0DAFF; */
/* 	--bs-btn-active-bg: #B0DAFF; */
/* 	--bs-btn-active-color: black; */
/* 	--bs-btn-hover-color: black; */

/* } */
/* .btn{ */
/* --bs-btn-line-height:35px; */
/*     --bs-btn-font-size: 20px; */

/* } */
/* .btn-secondary{ */
/* 	--bs-btn-bg: #B0DAFF; */
/* 	--bs-btn-hover-bg: #999a9a; */
/* 	--bs-btn-color: black; */
/* 	--bs-btn-font-size: 20px; */
/* 	--bs-btn-font-weight: 500; */
/* 	--bs-btn-active-bg: #B0DAFF; */
/* 	--bs-btn-active-color: black; */

/* } */

/* .accordion-button:not(.collapsed){ */
/* 	color:black; */
/* 	background-color: #B0DAFF; */
/* } */

.question{
	width:1020px;
	height:130px;
}
.answer{
	width:1020px;
	height:130px;
}
.11question{
	width:1020px;
	height:130px;
}
.11answer{
	width:1020px;
	height:130px;
}

.acCustomer .accordion-button:not(.collapsed){
	color:black;
	backgorund-color: #B0DAFF;
}

.customer .table{
	width: 1050px;
	height: auto;
}

.customer .dropdown-item:active{
	background-color: #B0DAFF;
	color:black;
}

#goToLogin{
	width: 200px; height: 46px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	font-size: 24px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 5px; 
}

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
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<div class="csTitle" onclick="location.href='${contextPath }/askBoard.cs'">고객센터</div><br>
					    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home"  role="tab" aria-controls="v-pills-home" aria-selected="true">공지사항<span class="material-symbols-outlined" style="margin-left: 60px; vertical-align: middle;">chevron_right</span></button><br>
					    <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile"  role="tab" aria-controls="v-pills-profile" aria-selected="false">자주 묻는 질문<span class="material-symbols-outlined" style="margin-left: 12px; vertical-align: middle;">chevron_right</span></button><br>
					    <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages"  role="tab" aria-controls="v-pills-messages" aria-selected="false">1:1 문의<span class="material-symbols-outlined" style="margin-left: 62px; vertical-align: middle;">chevron_right</span></button><br>
			   		<br><br>
			   		<button class="btn btn-light" id="11Btn" onclick="location.href='${contextPath}/personalQuestion.cs'">바로 1:1 문의하기</button>			   
			    </div>
			    <div class="tab-content" id="v-pills-tabContent">
				    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">
					<br>
					<h1 style="text-align: left;">공지사항</h1>
					<br>
					<hr>
					<br>
					<table class="table cols-12 table-bordered text-center">
				        <tr>
					        <th class="col-1">글번호</th>
					        <th class="col-9">제목</th>
					        <th class="col-2">작성날짜</th>
				    	</tr>
				    	<c:if test="${ empty faqType || faqType == 1 }">
				    	<c:forEach items="${ nlist }" var="i">
					    <tr>
					        <th class="col-1">${i.faqNo }</th>
					        <td class="col-9 text-start">${i.faqTitle }</td>
					        <td class="col-2">${i.faqDate }</td>
					    </tr>
					    </c:forEach>
					    </c:if>
					</table>
					<br><br>
					<div class="pageCustomers" > 
						<nav aria-label="Page navigation example">
							<ul class="pageCustomer pagination justify-content-center">
							    <li class="page-item disabled">
							    	<c:url var="goBack" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
									</c:url>
									<a class="page-link" href="${ goBack }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								   	<c:url var="goNum" value="${ loc }">
										<c:param name="page" value="${ p }"></c:param>
									</c:url>
								  	<li class="page-item pageCustomer"><a class="page-link" href="${ goNum }">${ p }</a></li>
								</c:forEach>
								<li class="page-item">
									<c:url var="goNext" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
									</c:url>
									<a class="page-link" href="${ goNext }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>	
					</div>
				</div>
			    <div class="tab-pane fade container text-center" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
					<br>
					<h1 style="text-align: left;">자주 묻는 질문</h1>
					<br>
					<hr style="width: 1050px;">
					<br>
					<div class="categoryBtn row justify-content-end" style="margin-right: 20px;">
						<div class="ddd col-2 dropdown-center">
							<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							    카테고리 전체
							</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">회원</a></li>
								<li><a class="dropdown-item" href="#">배송</a></li>
								<li><a class="dropdown-item" href="#">결제</a></li>
								<li><a class="dropdown-item" href="#">기타</a></li>
							</ul>
						</div>
						<input class="col-3" id="searchText" type="text" name="search">
						<button id="serachBtn" type="button" class="col-1 btn btn-outline-secondary">검색</button>
					</div>	
					<br>
					<div class="accordion acCustomer" id="accordionFlush">
<%-- 						<c:if test="${ faqType == 2 }"> --%>
						<c:forEach items="${ flist }" var="i" varStatus="st"> 
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingOne-${st.index +1 }">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${st.index +1 }" aria-expanded="false" aria-controls="flush-collapseOne-${st.index +1 }">
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
<%-- 						</c:if> --%>
					</div>
					<br><br><br>
					<div class="pageCustomers" > 
						<nav aria-label="Page navigation example">
							<ul class="pageCustomer pagination justify-content-center">
							    <li class="page-item disabled">
							    	<c:url var="goBack" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
									</c:url>
									<a class="page-link" href="${ goBack }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								   	<c:url var="goNum" value="${ loc }">
										<c:param name="page" value="${ p }"></c:param>
									</c:url>
								  	<li class="page-item pageCustomer"><a class="page-link" href="${ goNum }">${ p }</a></li>
								</c:forEach>
								<li class="page-item">
									<c:url var="goNext" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
									</c:url>
									<a class="page-link" href="${ goNext }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>	
					</div>
				</div>
			    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" tabindex="0">
					<br>
					<h1 style="text-align: left;">1:1 문의</h1>
					<br>
					<hr style="width: 1050px;">
					<br>
					<c:if test="${loginUser eq null }">
					<h1>로그인 후 문의 하실 수 있습니다.</h1>
					<button id="goToLogin">로그인 하러 가기</button>
					</c:if>
					<c:if test="${loginUser ne null}">
						<div class="accordion acCustomer" id="accordionFlushExample">
							<c:forEach items="${ plist }" var="c" varStatus="stc"> 
<%-- 							<c:if test="${ faqType == 3}"> --%>
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-headingOne-${stc.index +1 }c">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${stc.index +1 }c" aria-expanded="false" aria-controls="flush-collapseOne-${stc.index +1 }c">
								        글번호: ${stc.index +1 } 제목: ${c.faqTitle } 
								</button>
								</h2>
								<div id="flush-collapseOne-${stc.index +1 }c" class="accordion-collapse collapse" aria-labelledby="flush-headingOne-${stc.index +1 }c">
									<div class="accordion-body">
										<div>
											<h4>Q. 질문한 내용</h4>
											<span class="11question">${c.faqTitle }</span>
										</div>
										<hr>
										<div> 
											<h4>A. 답변한 내용</h4>
											<span class="11answer">${c.faqContent }</span>
										</div>
									</div>
								</div>
							</div>
<%-- 							</c:if> --%>
							</c:forEach>
						</div>
						<div style="text-align: right;">
							<button class="askBtn" onclick="location.href='${contextPath}/personalQuestion.cs'">문의하기</button>
						</div>
						<div class="pageCustomers" > 
							<nav aria-label="Page navigation example">
								<ul class="pageCustomer pagination justify-content-center">
								    <li class="page-item disabled">
								    	<c:url var="goBack" value="${ loc }">
											<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
										</c:url>
										<a class="page-link" href="${ goBack }" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
									   	<c:url var="goNum" value="${ loc }">
											<c:param name="page" value="${ p }"></c:param>
										</c:url>
									  	<li class="page-item pageCustomer"><a class="page-link" href="${ goNum }">${ p }</a></li>
									</c:forEach>
									<li class="page-item">
										<c:url var="goNext" value="${ loc }">
											<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
										</c:url>
										<a class="page-link" href="${ goNext }" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>	
						</div>
					</c:if>
				</div>
		    </div>
		</div> 
	</div>
	<br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>	

<script>

const boradTypeNo1 = document.querySelector('#v-pills-home-tab');
const boradTypeNo2 = document.querySelector('#v-pills-profile-tab');
const boradTypeNo3 = document.querySelector('#v-pills-messages-tab');

boradTypeNo1.addEventListener('click', ()=>{
	$.ajax({
		url:'${contextPath}/askBoard.cs',
		data:{faqType: 1},
		success: function(info){
			console.log(info);
		}
	});	
})

boradTypeNo2.addEventListener('click', ()=>{
	$.ajax({
		url:'${contextPath}/askBoard.cs',
		data:{faqType: 2},
		success: function(info2){
			console.log(info2);
		}
	});	
})

boradTypeNo3.addEventListener('click', ()=>{
	$.ajax({
		url:'${contextPath}/askBoard.cs',
		data:{
			faqType: 3
		},
		success: function(info3){
			console.log(info3);
		}
	});	
})



</script>
</body>
</html>
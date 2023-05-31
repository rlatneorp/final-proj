<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Center AskBoard</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
*{
font-family: 'Noto Sans KR', sans-serif;
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
}

.csSide{
	padding: 10px;
	margin: 20px;
}


.nav-pills{
	background-color: white;
	color: black;
}
.customer .nav-link{
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
	background-color: #B0DAFF; 
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
	margin-left: -10px;
	width:170px;
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
.table{
	width: 1050px;
	height: auto;
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
	width:400px;
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

.pageCustomers .pageCoustomer .page-item .page-link{
	color: black;
}

</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>
	<div class="container-xxl" align="center">
		<br><br><br>
		<br>
			<br>
			<div class="customer d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<div class="csTitle">고객센터</div><br>
				    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">공지사항<span class="material-symbols-outlined" style="margin-left: 60px; vertical-align: middle;">chevron_right</span></button><br>
				    <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">자주 묻는 질문<span class="material-symbols-outlined" style="margin-left: 12px; vertical-align: middle;">chevron_right</span></button><br>
				    <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">1:1 문의<span class="material-symbols-outlined" style="margin-left: 62px; vertical-align: middle;">chevron_right</span></button><br>
			   		<br><br>
			   		<button class="btn btn-light" id="11Btn"  onclick="location.href='personalQuestion.cs'">바로 1:1 문의하기</button>			   
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
					    <tr>
					        <th class="col-1">1</th>
					        <td class="col-9 text-start">Mark</td>
					        <td class="col-2">Otto</td>
					    </tr>
					    <tr>
					        <th>2</th>
					        <td class="col-9 text-start">Jacob</td>
					        <td>Thornton</td>
					    </tr>
					    <tr>
					        <th>3</th>
					        <td class="col-9 text-start">Larry the Bird</td>
					        <td>Larry the Bird</td>
					    </tr>
					    <tr>
					        <th>4</th>
					        <td class="col-9 text-start">Larry the Bird</td>
					        <td>Larry the Bird</td>
					    </tr>
					    <tr>
					        <th>5</th>
					        <td class="col-9 text-start">Larry the Bird</td>
					        <td>@twitter</td>
					    </tr>
					</table>
					<br><br>
					<div class="pageCustomers" > 
						<nav aria-label="Page navigation example">
							<ul class="pageCustomer pagination justify-content-center">
							    <li class="page-item disabled">
								    <a class="page-link">이전</a>
								</li>
							    <li class="page-item pageCustomer"><a class="page-link" href="#">1</a></li>
							    <li class="page-item"><a class="page-link" href="#">2</a></li>
							    <li class="page-item"><a class="page-link" href="#">3</a></li>
							    <li class="page-item"><a class="page-link" href="#">4</a></li>
							    <li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item">
								    <a class="page-link" href="#">다음</a>
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
					<div class="accordion acCustomer" id="accordionFlush1">
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingOne1">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne1" aria-expanded="false" aria-controls="flush-collapseOne1">
							        Accordion Item #1
							</button>
							</h2>
							<div id="flush-collapseOne1" class="accordion-collapse collapse" aria-labelledby="flush-headingOne1">
								<div class="accordion-body">
									<div>
										<h4>Q. 질문한 내용</h4>
										<span class="question"></span>
									</div>
									<hr>
									<div> 
										<h4>A. 답변한 내용</h4>
										<span class="answer"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingTwo1">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo1" aria-expanded="false" aria-controls="flush-collapseTwo1">
							        Accordion Item #2
							</button>
							</h2>
							<div id="flush-collapseTwo1" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo1">
								<div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingThree1">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree1" aria-expanded="false" aria-controls="flush-collapseThree1">
							        Accordion Item #3
							</button>
							</h2>
							<div id="flush-collapseThree1" class="accordion-collapse collapse" aria-labelledby="flush-headingThree1">
								<div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingFour1">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour1" aria-expanded="false" aria-controls="flush-collapseFour1">
							        Accordion Item #3
							</button>
							</h2>
							<div id="flush-collapseFour1" class="accordion-collapse collapse" aria-labelledby="flush-headingFour1">
								<div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingFive1">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive1" aria-expanded="false" aria-controls="flush-collapseFive1">
							        Accordion Item #3
							</button>
							</h2>
							<div id="flush-collapseFive1" class="accordion-collapse collapse" aria-labelledby="flush-headingFive1">
								<div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
							</div>
						</div>
					</div>
					<br><br><br>
					<div class="pageCustomers" > 
						<nav aria-label="Page navigation example">
							<ul class="pageCustomer pagination justify-content-center">
							    <li class="page-item disabled">
								    <a class="page-link">이전</a>
								</li>
							    <li class="page-item"><a class="page-link" href="#">1</a></li>
							    <li class="page-item"><a class="page-link" href="#">2</a></li>
							    <li class="page-item"><a class="page-link" href="#">3</a></li>
							    <li class="page-item"><a class="page-link" href="#">4</a></li>
							    <li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item">
								    <a class="page-link" href="#">다음</a>
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
					<div class="accordion acCustomer" id="accordionFlushExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
							        Accordion Item #1
							</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne">
								<div class="accordion-body">
									<div>
										<h4>Q. 질문한 내용</h4>
										<span class="11question"></span>
									</div>
									<hr>
									<div> 
										<h4>A. 답변한 내용</h4>
										<span class="11answer"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingTwo">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
							        Accordion Item #2
							</button>
							</h2>
							<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" >
								<div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingThree">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
							        Accordion Item #3
							</button>
							</h2>
							<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" >
								<div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingFour">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
							        Accordion Item #3
							</button>
							</h2>
							<div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour">
								<div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingFive">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
							        Accordion Item #3
							</button>
							</h2>
							<div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive">
								<div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
							</div>
						</div>
					</div>
					<div style="text-align: right;">
						<button class="askBtn" onclick="location.href='personalQuestion.cs'">문의하기</button>
					</div>
					<div class="pageCustomers"> 
						<nav aria-label="Page navigation example">
							<ul class="pageCustomer pagination justify-content-center">
							    <li class="page-item disabled">
								    <a class="page-link">이전</a>
								</li>
							    <li class="page-item"><a class="page-link" href="#">1</a></li>
							    <li class="page-item"><a class="page-link" href="#">2</a></li>
							    <li class="page-item"><a class="page-link" href="#">3</a></li>
							    <li class="page-item"><a class="page-link" href="#">4</a></li>
							    <li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item">
								    <a class="page-link" href="#">다음</a>
							    </li>
							</ul>
						</nav>
					</div>	
				</div>
		    </div>
		</div> 
	</div>
	
			
		
</body>
</html>
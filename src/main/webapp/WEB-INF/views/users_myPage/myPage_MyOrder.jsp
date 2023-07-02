<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 상품 구매내역</title>
<style>

.search {
	position: relative;
	width: 300px;
}

input, select {
	box-shadow:0px 5px 0px black;
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
	background: white;
}

select {
	-webkit-appearance: none;
	/* Safari, Chrome 등의 웹킷 기반 브라우저에서 기본 스타일링 제거 */
	-moz-appearance: none; /* Firefox에서 기본 스타일링 제거 */
	appearance: none; /* 일반적인 브라우저에서 기본 스타일링 제거 */
	padding-right: 30px; /* 화살표를 오른쪽으로 옮기기 위한 우측 패딩 설정 */
	background:
		url("https://img.icons8.com/fluency-systems-filled/48/sort-down.png")
		no-repeat right center; /* 화살표 이미지 설정 */
	background-size: 12px; /* 화살표 이미지의 크기 설정 */
/* 	border-bottom-right-radius: 0; */
/* 	border-top-right-radius: 0; */
	background-position: right 10px center;
	background-color: white;
}

input {
	width: 300px;
}

#searchIcon {
	position: absolute;
	width: 20px;
	top: 12px;
	right: 12px;
	margin-left: 30px;
}

#searchElement{
	width:1200px;
	right:1200;
}
table {
   text-align: center;
   margin: 0 auto;
   width: 900px;
   border-top: 2px solid #444444;
   border-bottom: 2px solid #444444;
   border-collapse: collapse;
}

th, td {
   border-top: 1px solid #444444;
   border-left: 1px solid #444444;
   padding: 10px;
}

th:first-child, td:first-child {
   border-left: none;
}
#searchIcon:hover {
   cursor:pointer;
}
.info{font-size: 12px;}
#orderSelect{
	border: none;; height: 100px;
	background: rgba(224, 224, 224, 0.74);
	display: flex; justify-content: center; align-items: center;
}
.term{
	width: 80px;
}
.search{
	width: 940px;
	display: flex;
    justify-content: center;
    align-items: center;
}

.buttonColor {
	background:gray;
}
.date{width: 140px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">상품 구매내역</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br>
				<div id="orderSelect">
					<div class="search" style="margin: 0 auto;">
						<input type="button" name="whole" value="전체" class="term" id="whole">
						<input type="button" name="today" value="오늘" class="term" id="today">
						<c:if test="${ start ne null}">
							<input type="hidden" id="requestStart" value="${start }">
							<input type="hidden" id="requestEnd" value="${end }">
						</c:if>
						<input type="button" value="1개월" class="term" id="1month">
						<input type="button" value="3개월" class="term" id="3month">
						<input type="button" value="6개월" class="term" id="6month">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${start ne null }">
							<input type="date" class="date" id="startDate" value="${start }">~
							<input type="date" class="date" id="endDate" value="${end }">
						</c:if>
						<c:if test="${start eq null }">
							<input type="date" class="date" id="startDate">~
							<input type="date" class="date" id="endDate">
						</c:if>
						&nbsp;&nbsp;
						<input type="button" value="조회" id="selectDate" style="width:70px;">
					</div>
				</div>
				<br>
<!-- 				<p class="info">- 주문이 <b>[상품준비중]</b>일 경우 취소 및 변경이 가능합니다.</p> -->
<!-- 				<p class="info">- <b>[배송준비중]</b>은 배송이 준비 중인 상태이므로 배송 전 취소를 원하실 경우 고객센터로 문의 부탁드립니다.</p> -->
<!-- 				<p class="info">- 제품 수령 후 교환/반품 신청은 배송 완료일 기준 7일 이내 부탁드립니다.</p> -->
				<br>
				<div id="tableDiv">
					<table>
						<thead>
							<tr style="background-color: #B0DAFF; opacity: 90%">
								<th>주문번호</th>
								<th>주문 종류</th>
								<th>상품 명</th>
								<th>주문 날짜</th>
								<th>총 주문금액</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${orderList }" var="ol">
								<tr onclick="location.href='${contextPath}/myPage_MyOrderDetail.me?orderNo='+${ol.orderNo}">
									<td>
										${ol.orderNo }
									</td>
									<c:if test="${ol.productType eq 1 }">
										<td>식품</td>
									</c:if>
									<c:if test="${ol.productType eq 2 }">
										<td>식단</td>
									</c:if>
									<c:if test="${ol.productType eq 3 }">
										<td>식재료</td>
									</c:if>
									<c:if test="${ol.productType eq 4 }">
										<td>주방도구</td>
									</c:if>
									<td>${ol.productName }</td>
									<td>${ol.orderDate }</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ol.totalPrice}" />원</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br><br>
				<div>
					<nav aria-label="Standard pagination example" style="float: center; margin-left: 420px;">
						<ul class="pagination">
							<li class="page-item">
								<c:url var="goBack" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
								</c:url>
								<a class="page-link" href="#" onclick="goToPage(${pi.currentPage - 1})" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var="goNum" value="${ loc }">
									<c:param name="page" value="${ p }"></c:param>
								</c:url>
								<li class="page-item"><a class="page-link" href="#" onclick="goToPage(${p})">${ p }</a></li>
							</c:forEach>
							<li class="page-item">
								<c:url var="goNext" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
								</c:url>
								<a class="page-link"  href="#" onclick="goToPage(${pi.currentPage + 1})" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
				<br>
				<div style="display: flex; width:300px; position: relative; margin: 0 auto;">
					<input type="text" placeholder="검색어 입력" name="searchWord" id="searchInput"> 
					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" id="searchIcon">
				</div>
			</div>
		</div>
	</div>
	
	<script>
	   //테이블에 마우스 올렸을 때 css
	   const tbody = document.getElementById('tbody');
	   const trs = tbody.children;
	   
	   for(tr of trs) {
	       tr.addEventListener('mouseenter', function() {
	             this.style.backgroundColor = 'rgba(176, 218, 255, 0.3)'; // 마우스를 올렸을 때의 스타일
	             this.style.cursor = 'pointer';
	           });
	
	        tr.addEventListener('mouseleave', function() {
	          this.style.backgroundColor = ''; // 마우스를 뗐을 때의 스타일 (기존 스타일로 복구)
	        }); 
	   }
	   
	   //검색 img 클릭했을 때
	   const searchInput = document.getElementById('searchInput');
	   document.getElementById('searchIcon').addEventListener('click', function() {
	      const searchWord = searchInput.value;
	      
	      if(document.getElementById('requestStart') == null) { //start가 없으면 
			   const url = '${contextPath}/searchWord.me?word=' + searchWord;
			   window.location.href = url;
		   } else {
			   const start = document.getElementById('requestStart').value;
			   const end = document.getElementById('requestEnd').value;
			   const url = '${contextPath}/searchWord.me?start=' + start + '&end=' + end + '&word=' + searchWord;
			   window.location.href = url;
		   }
// 	      searchInput.value = '';
	   })
	   
	   //검색어 입력 엔터 기능 
	   searchInput.addEventListener('keyup', function(event) {
	     if (event.key === 'Enter') {
	       const searchText = searchInput.value
	       //여기에 ajax로 searchText 넘기기 
	       
	       console.log('검색어:', searchText);
	       searchInput.value = '';
	     }
	   });
	   
	   //기간 클릭 시 원하는 데이터 조회 
	   //1. 현재 날짜 
	   let currentDate = new Date();
	   //2. 1개월 전 날짜 계산
	   let oneMonthAgo = new Date();
	   oneMonthAgo.setMonth(oneMonthAgo.getMonth() -1);
	   //3. 3개월 전 날짜 계산
	   let threeMonthsAgo = new Date();
	   threeMonthsAgo.setMonth(threeMonthsAgo.getMonth() -3);
	   //6. 6개월 전 날짜 계산
	   let sixMonthsAgo = new Date();
	   sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() -6);
	   
	   //오늘 조회 버튼 
	   document.getElementById('today').addEventListener('click', function() {
		   getBoardList(currentDate, currentDate); //1개월 전부터 현재시점까지 게시글 조회 
	   })
	   
	   //전체 조회 버튼 
	   document.getElementById('whole').addEventListener('click', function() {
		   location.href ='${contextPath}/myPage_MyOrder.me'
	   })
	   
	   //1개월 조회 버튼 
	   document.getElementById('1month').addEventListener('click', function() {
// 		   this.classList.add('buttonColor')
		   getBoardList(oneMonthAgo, currentDate); //1개월 전부터 현재시점까지 게시글 조회 
	   })
	   //3개월 조회 버튼
	   document.getElementById('3month').addEventListener('click', function() {
		   getBoardList(threeMonthsAgo, currentDate); //1개월 전부터 현재시점까지 게시글 조회 
	   })
	   //6개월 조회 버튼 
	   document.getElementById('6month').addEventListener('click', function() {
		   getBoardList(sixMonthsAgo, currentDate); //1개월 전부터 현재시점까지 게시글 조회 
	   })
	 
	   
	   document.getElementById('selectDate').addEventListener('click', function() {
		   let startDate = document.getElementById('startDate').value;
		   let endDate = document.getElementById('endDate').value;
		   //저기로 넘어가면 안 됨 아니면 이걸 걍 바꺼뽀까 
		   getBoardList(startDate, endDate); 
	   })
	   
	   // 게시글을 조회하는 함수 정의
	   function getBoardList(startDate, endDate) { //from 과거 to 현재
		   const start = formatDate(startDate);
		   const end = formatDate(endDate);
		   
		   const form = document.createElement('form');
		   form.action = '${contextPath}/selectPeriodOrders.me';
		   form.method = 'GET';
		   // start 값 추가
		   const startInput = document.createElement('input');
		   startInput.type = 'hidden'; startInput.name = 'start'; startInput.value = start;
		   form.appendChild(startInput);

		   // end 값 추가
		   const endInput = document.createElement('input');
		   endInput.type = 'hidden'; endInput.name = 'end'; endInput.value = end;
		   form.appendChild(endInput);

		   // 폼을 body에 추가하고 submit
		   document.body.appendChild(form);
		   form.submit();
	   }
	   
	   //날짜를 'YYYY-MM-DD' 형식으로 변환하는 함수
	   function formatDate(date) {
		  if(typeof date === 'string') {
			  return date;
		  }
		  var year = date.getFullYear(); //2023
		  var month = String(date.getMonth() + 1).padStart(2, '0'); //12월까지 가져온 후, 문자열의 길이를 2로 유지하고 왼쪽에 값이 없을 경우 0 채우기
		  var day = String(date.getDate()).padStart(2, '0');
		  return year + '-' + month + '-' + day;
	   }
	   
	   //페이징 (start, end 처리)
	   function goToPage(page) {
		   if(document.getElementById('requestStart') == null) {
			   const url = '${contextPath}/myPage_MyOrder.me?page=' + page;
			   window.location.href = url;
		   } else {
			   const start = document.getElementById('requestStart').value;
			   const end = document.getElementById('requestEnd').value;

			   const url = '${contextPath}/selectPeriodOrders.me?start=' + start + '&end=' + end + '&page=' + page;
			   window.location.href = url;
		   }
		 }
	   
	   //버튼 색상 변경 
	   if(document.getElementById('requestStart') != null && document.getElementById('requestEnd') != null ) {
		   const startInput = document.getElementById('requestStart');
		   const endInput = document.getElementById('requestEnd');
		   const startDate = new Date(startInput.value);
		   const endDate = new Date(endInput.value);
		   
		   const diffInMonths = calculateMonthDifference(startDate, endDate);
		   console.log(diffInMonths)
		   if(diffInMonths == 1) { 
			   document.getElementById('1month').style.background = 'lightgray';
		   } else if (diffInMonths == 3) {
			   document.getElementById('3month').style.background = 'lightgray';
		   } else if (diffInMonths == 6) {
			   document.getElementById('6month').style.background = 'lightgray';
		   } else if (diffInMonths == 0) {
			   document.getElementById('today').style.background = 'lightgray';
		   }
	   } else if(document.getElementById('requestStart') == null && document.getElementById('requestEnd') == null ){ 
		   document.getElementById('whole').style.background = 'lightgray';
		  
	   }
	   
	   // 두 날짜 사이의 월 차이 계산 함수
	   function calculateMonthDifference(startDate, endDate) {
	     const diffInMilliseconds = endDate - startDate;
	     const millisecondsPerMonth = 1000 * 60 * 60 * 24 * 30; // 평균적인 월의 밀리초 수
	     const diffInMonths = Math.round(diffInMilliseconds / millisecondsPerMonth);
	     return diffInMonths;
	   }
	   
	   //검색어 조회 시 
	   
	</script>
	
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.date{width: 140px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/memberSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">상품 구매내역</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br>
				<div id="orderSelect">
					<div class="search" style="margin: 0 auto;">
						<select style="width: 180px;">
							<option>전체 주문처리상태</option>
							<option>입금전</option>
							<option>배송준비중</option>
							<option>배송중</option>
							<option>배송완료</option>
							<option>취소</option>
							<option>교환</option>
							<option>반품</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="today" value="오늘" class="term">
						<input type="button" value="1개월" class="term">
						<input type="button" value="3개월" class="term">
						<input type="button" value="6개월" class="term">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="date" class="date">~
						<input type="date" class="date">
						&nbsp;&nbsp;
						<input type="button" value="조회" style="width:70px;">
					</div>
				</div>
				<br>
				<p class="info">- 주문이 <b>[상품준비중]</b>일 경우 취소 및 변경이 가능합니다.</p>
				<p class="info">- <b>[배송준비중]</b>은 배송이 준비 중인 상태이므로 배송 전 취소를 원하실 경우 고객센터로 문의 부탁드립니다.</p>
				<p class="info">- 제품 수령 후 교환/반품 신청은 배송 완료일 기준 7일 이내 부탁드립니다.</p>
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
								<th>주문 상태</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr onclick="location.href='${contextPath}/myPage_MyOrderDetail.me'">
								<td>1</td>
								<td>식품</td>
								<td>다이어트 식단</td>
								<td>2020-0620</td>
								<td>25000</td>
								<td>결제 확인중</td>
							</tr>
							<tr>
								<td>2</td>
								<td>식품</td>
								<td>당근 외 2개</td>
								<td>2020-0620</td>
								<td>10000</td>
								<td>결제 완료</td>
							</tr>
							<tr>
								<td>3</td>
								<td>상품</td>
								<td>냄비</td>
								<td>2020-0620</td>
								<td>25000</td>
								<td>배송중</td>
							</tr>
							<tr>
								<td>4</td>
								<td>식품</td>
								<td>몸보신 식단</td>
								<td>2020-0620</td>
								<td>25000</td>
								<td>주문 취소</td>
							</tr>
							<tr>
								<td>5</td>
								<td>상품</td>
								<td>튀김기</td>
								<td>2020-0620</td>
								<td>25000</td>
								<td>배송완료</td>
							</tr>
							<tr>
								<td>6</td>
								<td>식품</td>
								<td>고단백 식단</td>
								<td>2020-0620</td>
								<td>25000</td>
								<td>배송완료</td>
							</tr>
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
								<a class="page-link" href="${ goBack }" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var="goNum" value="${ loc }">
									<c:param name="page" value="${ p }"></c:param>
								</c:url>
								<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
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
				<br>
				<div style="display: flex; width:300px; position: relative; margin: 0 auto;">
					<input type="text" placeholder="검색어 입력" id="searchInput"> 
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
	      //여기에 ajax
	      searchInput.value = '';
	      
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
	</script>
	
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
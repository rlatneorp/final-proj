<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 좋아요</title>
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
}

#search {
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
.delete{
	box-shadow: none;
	width: 20px; height: 20px;
}
#trash{
	font-size: 30px;
}
 #delete{ 
 	font-size: 18px;
 	margin-left: 758px;
 }
 #tbody tr {height: 150px;}
 #tbody tr img {width: 50%;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/memberSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">좋아요</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<div class="search" style="margin: 0 auto; left: 480px;">
					<select style="width: 100px">
						<option>최신순</option>
						<option>레시피</option>
						<option>식단</option>
						<option>상품</option>
					</select>
				</div>
				<br>
				<label id="delete">선택삭제</label><i class="bi bi-trash" id="trash"></i>
				<br>
				<div id="tableDiv">
					<table>
						<thead>
							<tr style="background-color: #B0DAFF; opacity: 90%">
								<th width=250>사진</th>
								<th>종류</th>
								<th>제목</th>
								<th><input type="checkbox" class="delete" id="selectAllCheckBox"></th>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr>
								<td><img src="resources/images/food1.jpg"/></td>
								<td>레시피</td>
								<td>미역국</td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td><img src="resources/images/food2.jpg"/></td>
								<td>식단</td>
								<td>미역국</td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td><img src="https://recipe1.ezmember.co.kr/cache/data/goods/23/04/16/1000035599/1000035599_detail_046.jpg"></td>
								<td>상품</td>
								<td>냄비</td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td><img src="resources/images/food4.jpg"/></td>
								<td>레시피</td>
								<td>미역국</td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td><img src="resources/images/food5.jpg"/></td>
								<td>식단</td>
								<td>미역국</td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td><img src="resources/images/food6.jpg"/></td>
								<td>레시피</td>
								<td>미역국</td>
								<td><input type="checkbox" class="delete"></td>
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
					<input type="text" placeholder="검색어 입력" id="search"> 
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
	   const searchInput = document.getElementById('search');
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
	   
	 //전체 선택 체크 
		const selAllChec = document.getElementById('selectAllCheckBox');
		selAllChec.addEventListener('change', function() { //속성이 변할 때마다 이벤트 발생 
			const checkboxes = document.querySelectorAll('input[type="checkbox"]');
			checkboxes.forEach(function(checkbox) { //모든 checkbox를 순회 
			      checkbox.checked = selAllChec.checked; //selAllChec의 체크 속성을 대입 (항상 같이 움직이게)
			    });
			
		})
	</script>
	
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
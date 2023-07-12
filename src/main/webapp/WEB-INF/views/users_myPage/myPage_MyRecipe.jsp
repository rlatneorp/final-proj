<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 내 레시피</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
#dropdownMenu2{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

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
.page-link.disabled{color: lightgray;}
.page-link.disabled:hover{background: white; color: lightgray;}

</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">나의 레시피</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<div class="search" style="margin: 0 auto; left: 480px;">
					<select style="width: 120px">
						<option>--------</option>
						<option value="0">최신순</option>
						<option value="1">오래된순</option>
						<option value="2">조회순</option>
						<option value="3">스크랩순</option>
					</select>
				</div>
				<br>
				<div id="tableDiv">
					<table>
						<thead>
							<tr style="background-color: #B0DAFF; opacity: 90%">
								<th>번호</th>
								<th>레시피</th>
								<th>작성 날짜</th>
								<th>조회수</th>
								<th>스크랩수</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:if test="${ empty list and empty searchTitle and empty searchType }">
								<tr>
									<td colspan="6" height="370">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										<b>작성한 레시피가 없습니다.</b>
									</td>
								</tr>
							</c:if>
							<c:if test="${ empty list and !empty searchTitle }">
								<tr>
									<td colspan="6" height="370">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										<b>검색 결과가 없습니다.</b>
									</td>
								</tr>
							</c:if>
							<c:if test="${ empty list and !empty searchType }">
								<tr>
									<td colspan="6" height="370">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										<b>검색 결과가 없습니다.</b>
									</td>
								</tr>
							</c:if>
							<c:forEach items="${ list }" var="l">
								<tr onclick="location.href='${contextPath}/recipeDetail.rc?rId=' + '${ loginUser.usersId }' + '&rNo=' + '${ l.FOOD_NO }' + '&page=' + '${ pi.currentPage }'">
									<td>${ l.FOOD_NO }</td>
									<td>${ l.RECIPE_NAME }</td>
									<td>${ fn:split(l.RECIPE_MODIFY_DATE, ' ')[0] }</td>
									<td>${ l.RECIPE_COUNT }</td>
									<td>${ l.RECIPEBOOKCOUNT }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br><br>
				<div style="margin:0 auto">
					<nav aria-label="Standard pagination example" style="float:center">
						<ul class="pagination" style="justify-content:center">
							<li class="page-item">
								<c:if test="${ pi.currentPage <= 1 }">
									<a class="page-link disabled" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="goBack" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage - 1 }"></c:param>
										<c:param name="searchType" value="${searchType}"></c:param>
										<c:param name="searchTitle" value="${searchTitle}"></c:param>
									</c:url>
									<a class="page-link" href="${ goBack }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</c:if>
							</li>
							<c:if test="${ pi.endPage == 0 }">
								<li class="page-item"><a class="page-link">1</a></li>
							</c:if>
							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var="goNum" value="${ loc }">
									<c:param name="page" value="${ p }"></c:param>
									<c:param name="searchType" value="${searchType}"></c:param>
									<c:param name="searchTitle" value="${searchTitle}"></c:param>
								</c:url>
								<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
							</c:forEach>
							<li class="page-item">
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<a class="page-link disabled" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="goNext" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
										<c:param name="searchType" value="${searchType}"></c:param>
										<c:param name="searchTitle" value="${searchTitle}"></c:param>
									</c:url>
									<a class="page-link" href="${ goNext }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</c:if>
							</li>
						</ul>
					</nav>
				</div>
				<br>
				<div style="display: flex; width:300px; position: relative; margin: 0 auto;">
					<input type="text" placeholder="검색어 입력 (제목)" id="search"> 
					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" id="searchIcon">
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
	
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
	   
	   const search = () => {
		   const searchTitle = searchInput.value;
		   console.log(searchTitle);
		   location.href="${contextPath}/myPage_MyRecipe.me?searchTitle=" + searchTitle;
	   }
	   
	   //검색 img 클릭했을 때
	   const searchInput = document.getElementById('search');
	   document.getElementById('searchIcon').addEventListener('click', function() {
	      search();
	   })
	   
	   //검색어 입력 엔터 기능 
	   searchInput.addEventListener('keyup', function(event) {
	     if (event.key === 'Enter') {
	       search();
	     }
	   });
	   
		// 옵션 선택
		const selectElement = document.querySelector("select");

	    selectElement.addEventListener("change", function() {
	        const value = this.value; // 선택된 값 출력

	        // 선택된 값에 따라 URL을 생성하여 페이지 이동
	        if(value == 0){ // 최신
	        	location.href = "${contextPath}/myPage_MyRecipe.me?searchType=0";
	        } else if (value == 1) { // 오래된
	            location.href = "${contextPath}/myPage_MyRecipe.me?searchType=1";
	        } else if (value == 2) { // 조회
	            location.href = "${contextPath}/myPage_MyRecipe.me?searchType=2";
	        } else if (value == 3) { // 스크랩
	            location.href = "${contextPath}/myPage_MyRecipe.me?searchType=3";
	        }
	    });
	</script>
	
	
</body>
</html>
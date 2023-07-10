<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 후기 관리</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
.delete{
	box-shadow: none;
	width: 20px; height: 20px;
}
#selectAllCheckBox{
	box-shadow: none;
	width: 20px; height: 20px;
}
#trash{
	font-size: 30px;
}
#trash:hover{cursor: pointer;}
#delete{ 
	font-size: 18px;
	margin-left: 806px;
}
#tbody tr {height: 70px;}
.edit{
	border: none; border-radius: 5px;
	font-weight: bold; font-size: 12px;
	width: 50px; height: 30px;
	background: #B0DAFF;
	box-shadow: none; padding: 0;
	text-align: center;
}
.btn-3d {
	text-decoration: none;
	width: 100px;
	height: 35px;
	position: relative;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
	padding: 5px;
	/*   padding: 20px 60px; */
	color: white;
	margin: 20px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
	cursor: pointer;
	margin-left: 450px;
}

.btn-3d.blue:hover {
	color: white;
	background-color: #699DD1;
}

.btn-3d:active {
	top: 9px;
}

.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 8px 0 0 rgba(110, 164, 219, .7), 0 8px 0 1px
		rgba(0, 0, 0, .4), 0 8px 8px 1px rgba(0, 0, 0, 0.5);
}

.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 0 0 1px rgba(0, 0, 0, 0.4);
}
/* .review-star{width: 100px; font-size: 13px; margin: 10px;  text-align:right; color: gold;} */
.fa-star{font-size: 14px; color: gold;}
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
				<p id="pmyPage">후기 관리</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<p style="font-size: 14px;">- 후기 수정과 삭제는 후기 상세페이지에서 할 수 있습니다.</p>
				<br>
				<div id="tableDiv">
					<table>
						<thead>
							<tr style="background-color: #B0DAFF; opacity: 90%">
								<th>번호</th>
								<th>종류</th>
								<th>상품 명</th>
								<th>작성 날짜</th>
								<th>별점</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:if test="${ empty list }">
								<tr>
									<td colspan="6" height="380">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										<b>후기가 없습니다.</b>
									</td>
								</tr>
							</c:if>
							<c:forEach items="${ list }" var="r">
								<c:if test="${ r.ORDER_NO == 0 }">
									<tr onclick="location.href='${contextPath}/recipeDetail.rc?rId=' + '${ r.USERS_ID }' + '&rNo=' + '${ r.PRODUCT_NO }' + '&page=' + '${ pi.currentPage }'">
										<td>${ r.REVIEW_NO }</td>
										<td>레시피</td>
										<td>${ r.RECIPE_NAME }</td>
										<td>${ fn:split(r.REVIEW_DATE, ' ')[0] }</td>
										<c:if test="${ r.REVIEW_SCORE == 5 }">
											<td class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 4 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 3 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 2 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 1 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
									</tr>
								</c:if>
								<c:if test="${ r.ORDER_NO != 0 and r.PRODUCT_TYPE == 2 }">
									<tr onclick="location.href='${contextPath}/menuDetail.mn?mNo=' + '${ r.PRODUCT_NO }' + '&page=' + '${pi.currentPage}'">
										<td>${ r.REVIEW_NO }</td>
										<td>식단</td>
										<td>${ r.MENU_NAME }</td>
										<td>${ fn:split(r.REVIEW_DATE, ' ')[0] }</td>
										<c:if test="${ r.REVIEW_SCORE == 5 }">
											<td class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 4 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 3 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 2 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 1 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
									</tr>
								</c:if>
								<c:if test="${ r.ORDER_NO != 0 and r.PRODUCT_TYPE != 2 }">
									<tr onclick="location.href='${contextPath}/editReview.ma?reviewNo=' + '${ r.REVIEW_NO }'">
										<td>${ r.REVIEW_NO }</td>
										<c:if test="${ r.PRODUCT_TYPE == 1 and r.FOOD_TYPE == 1 }">
											<td>식품 - 식재료</td>
											<td>${ r.FOOD_NAME }</td>
										</c:if>
										<c:if test="${ r.PRODUCT_TYPE == 1 and r.FOOD_TYPE == 2 }">
											<td>${ r.FOOD_NAME }</td>
											<td>가지볶음</td>
										</c:if>
										<c:if test="${ r.PRODUCT_TYPE == 3 }">
											<td>식재료</td>
											<td>${ r.INGREDIENT_NAME }</td>
										</c:if>
										<c:if test="${ r.PRODUCT_TYPE == 4 }">
											<td>상품</td>
											<td>${ r.TOOL_NAME }</td>
										</c:if>
										<td>${ fn:split(r.REVIEW_DATE, ' ')[0] }</td>
										<c:if test="${ r.REVIEW_SCORE == 5 }">
											<td class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 4 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 3 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 2 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
										<c:if test="${ r.REVIEW_SCORE == 1 }">
											<td><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></td>
										</c:if>
									</tr>
								</c:if>
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
									</c:url>
									<a class="page-link" href="${ goNext }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</c:if>
							</li>
						</ul>
					</nav>
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
	             this.style.backgroundColor = 'rgba(176, 218, 255, 0.1)'; // 마우스를 올렸을 때의 스타일
	             this.style.cursor = 'pointer';
	           });
	
	        tr.addEventListener('mouseleave', function() {
	          this.style.backgroundColor = ''; // 마우스를 뗐을 때의 스타일 (기존 스타일로 복구)
	        }); 
	   }
	</script>	
	
</body>
</html>
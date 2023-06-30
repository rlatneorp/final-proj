<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 스크랩</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
#trash:hover{cursor: pointer;}
#delete{ 
	font-size: 18px;
	margin-left: 785px;
}
#tbody tr {height: 150px;}
#tbody tr img {width: 50%;}
#selectAllCheckBox{
	box-shadow: none;
	width: 20px; height: 20px;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">스크랩</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<div class="search" style="margin: 0 auto; left: 480px;">
					<select style="width: 120px">
						<option>--------</option>
						<option value="0">최신순</option>
						<option value="1">오래된순</option>
						<option value="2">레시피</option>
						<option value="3">식단</option>
					</select>
				</div>
				<br>
				<label id="delete">선택삭제</label><i class="bi bi-trash" id="trash"></i>
				<br>
				<div id="tableDiv">
					<table>
						<thead>
							<tr style="background-color: #B0DAFF; opacity: 90%">
								<th width=150>사진</th>
								<th>종류</th>
								<th>제목</th>
								<th>작성자</th>
								<th><input type="checkbox" id="selectAllCheckBox"></th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:if test="${ empty list }">
								<tr>
									<td colspan="5" height="260">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										스크랩 내역이 없습니다.
									</td>
								</tr>
							</c:if>
							<c:forEach items="${ list }" var="l">
								<c:if test="${ l.NUMBER_TYPE == 1 and !empty l.RECIPE_NAME }">
									<tr onclick="if(event.target.tagName != 'INPUT')location.href='${contextPath}/recipeDetail.rc?rId=' + '${ loginUser.usersId }' + '&rNo=' + '${ l.FOOD_NO }' + '&page=' + '${ pi.currentPage }'" data-bookMark-no="${l.BOOKMARK_NO}">
										<td><img src="${ contextPath }/resources/uploadFiles/${l.RECIPE_IMAGE}" style="width: 100%; height: 100%"/></td>
										<td>레시피</td>
										<td>${ l.RECIPE_NAME }</td>
										<td>${ l.NICKNAME }</td>
										<td><input type="checkbox" class="delete" onchange="changeCheckBox(this)"></td>
									</tr>
								</c:if>
								<c:if test="${ l.NUMBER_TYPE == 2 }">
									<tr onclick="if(event.target.tagName != 'INPUT')location.href='${contextPath}/recipeDetail.rc?rId=' + '${ loginUser.usersId }' + '&rNo=' + '${ l.FOOD_NO }' + '&page=' + '${ pi.currentPage }'" data-bookMark-no="${l.BOOKMARK_NO}">
										<td><img src="${ contextPath }/resources/uploadFiles/${l.MENU_IMAGE}" style="width: 100%; height: 100%"/></td>
										<td>식단</td>
										<td>${ l.MENU_NAME }</td>
										<td>${ l.NAME }</td>
										<td><input type="checkbox" class="delete" onchange="changeCheckBox(this)"></td>
									</tr>
								</c:if>
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
					<input type="text" placeholder="검색어 입력 (제목)" id="search"> 
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
	   
	   const search = () => {
		   const searchTitle = searchInput.value;
		   console.log(searchTitle);
		   location.href="${contextPath}/myPage_MyBookMark.me?searchTitle=" + searchTitle;
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
	   
		//전체 체크박스
		let allCheck = document.getElementsByClassName('delete');
		//체크 된 체크박스 
		let checked = document.querySelectorAll('input.delete:checked');
		//select all 체크박스 
		let selectAll = document.getElementById('selectAllCheckBox');
		
		//전체 선택 해제 및 적용
		changeCheckBox = (checkbox) => {
			if(allCheck.length === checked.length) {
				selectAll.checked = true;
			} else if(selectAll.checked) {
				selectAll.checked = false;
			}
		}
		
		// 전체 선택 클릭시 전체 선택
		const selAllChec = document.getElementById('selectAllCheckBox');
		
		selAllChec.addEventListener('change', function() { //속성이 변할 때마다 이벤트 발생 
			const checkboxes = document.querySelectorAll('input[type="checkbox"]');
			checkboxes.forEach(function(checkbox) { //모든 checkbox를 순회 
			      checkbox.checked = selAllChec.checked; //selAllChec의 체크 속성을 대입 (항상 같이 움직이게)
			});
		});
		
		// 쓰레기통 클릭했을 때 해당 정보 지우기 - ajax
		const trash = document.getElementById('trash');
		
		trash.addEventListener('click', () => {
			let checked = document.querySelectorAll('input.delete:checked');
			const selectedBookmarkNos = [];
			let bookmarkNo = 0;
			checked.forEach((checkbox) => {
				bookmarkNo = checkbox.closest('tr').getAttribute('data-bookMark-no');
				selectedBookmarkNos.push(bookmarkNo);
 			});
			swal({
			    text: '정말 삭제하시겠습니까?',
			    icon: 'warning',
			    buttons: ["취소", "삭제하기"]
			}).then((YES) => {
			    if (YES) {
			      	$.ajax({
						url : '${contextPath}/myPage_deleteBookMark.me',
						data : {bookmarkNo : JSON.stringify(selectedBookmarkNos)},
						success : data => {
							console.log(data);
							if(data == 'yes'){
								location.reload();
							} else {
								swal('', '삭제를 실패하였습니다.', 'error');
							}
						},
						error : data => {
							console.log(data);
						}
					});
			    }
			});
		});
		
		// 옵션 선택
		const selectElement = document.querySelector("select");

	    selectElement.addEventListener("change", function() {
	        const value = this.value; // 선택된 값 출력

	        // 선택된 값에 따라 URL을 생성하여 페이지 이동
	        if(value == 0){ // 최신순
	        	location.href = "${contextPath}/myPage_MyBookMark.me?searchType=0";
	        } else if (value == 1) { // 오래된순
	            location.href = "${contextPath}/myPage_MyBookMark.me?searchType=1";
	        } else if (value == 2) { // 레시피
	            location.href = "${contextPath}/myPage_MyBookMark.me?searchType=2";
	        } else if (value == 3) { // 식단
	            location.href = "${contextPath}/myPage_MyBookMark.me?searchType=3";
	        }
	    });
	</script>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 좋아요</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
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
	margin-left: 808px;
}
#tbody tr {height: 150px;}
#tbody tr img {width: 50%;}
#selectAllCheckBox{
	box-shadow: none;
	width: 20px; height: 20px;
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
				<p id="pmyPage">찜 관리</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<div class="search" style="margin: 0 auto; left: 480px;">
					<select style="width: 100px">
						<option>--------</option>
						<option value="0">전체</option>
						<option value="2">식단</option>
						<option value="3">식품</option>
						<option value="4">식재료</option>
						<option value="5">상품</option>
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
								<th>가격</th>
								<th><input type="checkbox" id="selectAllCheckBox"></th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:if test="${ empty list and empty searchTitle and empty searchType }">
								<tr>
									<td colspan="6" height="320">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										<b>찜 내역이 없습니다.</b>
									</td>
								</tr>
							</c:if>
							<c:if test="${ empty list and !empty searchTitle }">
								<tr>
									<td colspan="6" height="320">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										<b>검색 결과가 없습니다.</b>
									</td>
								</tr>
							</c:if>
							<c:if test="${ empty list and !empty searchType }">
								<tr>
									<td colspan="6" height="320">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										<b>검색 결과가 없습니다.</b>
									</td>
								</tr>
							</c:if>
							<c:forEach items="${ list }" var="l">
								<c:if test="${ l.NUMBER_TYPE == 2 }">
									<c:if test="${ l.PRODUCT_TYPE == 1 and l.FOOD_TYPE == 2 }">
										<tr onclick="if(event.target.tagName != 'INPUT')location.href='${contextPath}/market_detail.ma?productNo=' + '${ l.PRODUCT_NO }' + '&page=' + '${pi.currentPage}'" data-like-no="${ l.LIKE_NO }">
											<td>
												<c:if test="${ empty l.IMAGE_RENAMENAME }">
													<img src="${contextPath }/resources/images/noImg.png" style="width: 100%; height: 100%"/>
												</c:if>
												<c:if test="${ !empty l.IMAGE_RENAMENAME }">
													<img src="${ contextPath }/resources/uploadFiles/${l.IMAGE_RENAMENAME}" style="width: 100%; height: 100%"/>
												</c:if>
											</td>
											<td>식품 - 밀키트</td>
											<td>${ l.FOOD_NAME }</td>
											<td><fmt:formatNumber pattern="###,###,###">${ l.PRODUCT_PRICE }</fmt:formatNumber>원</td>
											<td><input type="checkbox" class="delete"></td>
										</tr>
									</c:if>
									<c:if test="${ l.PRODUCT_TYPE == 1 and l.FOOD_TYPE == 1 }">
										<tr onclick="if(event.target.tagName != 'INPUT')location.href='${contextPath}/market_detail.ma?productNo=' + '${ l.PRODUCT_NO }' + '&page=' + '${pi.currentPage}'" data-like-no="${ l.LIKE_NO }">
											<td>
												<c:if test="${ empty l.IMAGE_RENAMENAME }">
													<img src="${contextPath }/resources/images/noImg.png" style="width: 100%; height: 100%"/>
												</c:if>
												<c:if test="${ !empty l.IMAGE_RENAMENAME }">
													<img src="${ contextPath }/resources/uploadFiles/${l.IMAGE_RENAMENAME}" style="width: 100%; height: 100%"/>
												</c:if>
											</td>
											<td>식품 - 식재료</td>
											<td>${ l.FOOD_NAME }</td>
											<td><fmt:formatNumber pattern="###,###,###">${ l.PRODUCT_PRICE }</fmt:formatNumber>원</td>
											<td><input type="checkbox" class="delete"></td>
										</tr>
									</c:if>
									<c:if test="${ l.PRODUCT_TYPE == 2 }">
										<tr onclick="if(event.target.tagName != 'INPUT')location.href='${contextPath}/menuDetail.mn?mNo=' + '${ l.PRODUCT_NO }' + '&page=' + '${pi.currentPage}'" data-like-no="${ l.LIKE_NO }">
											<td>
												<c:if test="${ empty l.IMAGE_RENAMENAME }">
													<img src="${contextPath }/resources/images/noImg.png" style="width: 100%; height: 100%"/>
												</c:if>
												<c:if test="${ !empty l.IMAGE_RENAMENAME }">
													<img src="${ contextPath }/resources/uploadFiles/${l.IMAGE_RENAMENAME}" style="width: 100%; height: 100%"/>
												</c:if>
											</td>
											<td>식단</td>
											<td>${ l.MENU_NAME }</td>
											<td><fmt:formatNumber pattern="###,###,###">${ l.PRODUCT_PRICE }</fmt:formatNumber>원</td>
											<td><input type="checkbox" class="delete"></td>
										</tr>
									</c:if>
									<c:if test="${ l.PRODUCT_TYPE == 3 }">
										<tr onclick="if(event.target.tagName != 'INPUT')location.href='${contextPath}/market_detail.ma?productNo=' + '${ l.PRODUCT_NO }' + '&page=' + '${pi.currentPage}'" data-like-no="${ l.LIKE_NO }">
											<td>
												<c:if test="${ empty l.INGREIMAGE }">
													<img src="${contextPath }/resources/images/noImg.png" style="width: 100%; height: 100%"/>
												</c:if>
												<c:if test="${ !empty l.INGREIMAGE }">
													<img src="${ contextPath }/resources/uploadFiles/${l.INGREIMAGE}" style="width: 100%; height: 100%"/>
												</c:if>
											</td>
											<td>식재료</td>
											<td>${ l.INGREDIENT_NAME }</td>
											<td><fmt:formatNumber pattern="###,###,###">${ l.PRODUCT_PRICE }</fmt:formatNumber>원</td>
											<td><input type="checkbox" class="delete"></td>
										</tr>
									</c:if>
									<c:if test="${ l.PRODUCT_TYPE == 4 }">
										<tr onclick="if(event.target.tagName != 'INPUT')location.href='${contextPath}/market_detail.ma?productNo=' + '${ l.PRODUCT_NO }' + '&page=' + '${pi.currentPage}'" data-like-no="${ l.LIKE_NO }">
											<td>
												<c:if test="${ empty l.IMAGE_RENAMENAME }">
													<img src="${contextPath }/resources/images/noImg.png" style="width: 100%; height: 100%"/>
												</c:if>
												<c:if test="${ !empty l.IMAGE_RENAMENAME }">
													<img src="${ contextPath }/resources/uploadFiles/${l.IMAGE_RENAMENAME}" style="width: 100%; height: 100%"/>
												</c:if>
											</td>
											<td>상품</td>
											<td>${ l.TOOL_NAME }</td>
											<td><fmt:formatNumber pattern="###,###,###">${ l.PRODUCT_PRICE }</fmt:formatNumber>원</td>
											<td><input type="checkbox" class="delete"></td>
										</tr>
									</c:if>
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
										<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
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
										<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
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
		   location.href="${contextPath}/myPage_MyFavorite.me?searchTitle=" + searchTitle;
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
			const selectedLikeNos = [];
			let likeNo = 0;
			checked.forEach((checkbox) => {
				likeNo = checkbox.closest('tr').getAttribute('data-like-no');
				selectedLikeNos.push(likeNo);
			});
			swal({
			    text: '정말 삭제하시겠습니까?',
			    icon: 'warning',
			    buttons: ["취소", "삭제하기"]
			}).then((YES) => {
			    if (YES) {
			      	$.ajax({
						url : '${contextPath}/myPage_deleteLike.me',
						data : {likeNo : JSON.stringify(selectedLikeNos)},
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
	        if(value == 0){ // 전체
	        	location.href = "${contextPath}/myPage_MyFavorite.me?searchType=0";
	        } else if (value == 2) { // 식단
	            location.href = "${contextPath}/myPage_MyFavorite.me?searchType=2";
	        } else if (value == 3) { // 식품
	            location.href = "${contextPath}/myPage_MyFavorite.me?searchType=3";
	        } else if (value == 4) { // 식재료
	            location.href = "${contextPath}/myPage_MyFavorite.me?searchType=4";
	        } else if (value == 5) { // 상품
	            location.href = "${contextPath}/myPage_MyFavorite.me?searchType=5";
	        }
	    });
	    
	    window.onload = () => {
			const list = document.getElementById('tbody');
			const messageCell = document.querySelector('#tbody td[colspan="6"]');
			const page = '${pi.currentPage}';
			
			if(messageCell && messageCell.innerText.trim() == '찜 내역이 없습니다.' && page != 0 && page != 1) {
				const currentPage = parseInt(page);
				const newPage = currentPage - 1;
				location.href = '${contextPath}/myPage_MyFavorite.me?page=' + newPage;
			}
		};
	</script>
	
</body>
</html>
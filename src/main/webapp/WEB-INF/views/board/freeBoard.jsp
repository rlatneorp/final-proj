<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<title>홀로세끼</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

<style>
	
	#board{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}
	
	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 400,
	  'GRAD' 0,
	  'opsz' 48;
	  vertical-align: text-top;
	  font-size:20px;
	  
	}
	table {
		text-align: center;
		margin: 0 auto;
		width: 1200px;
		border-top: 2px solid #444444;
		border-bottom: 2px solid #444444;
		border-collapse: collapse;
		}
	
	th, td {
		border-top: 1px solid #444444;
		border-left: 1px solid #444444;
		padding: 10px;
		}
	
	th:first-child, td:first-child {border-left: none;}
	
	/* 3D Button */
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
		}
	
	.btn-3d.blue:hover {
		color: white;
		background-color: #699DD1;
		}
	
	.btn-3d:active {top: 9px;}
	
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
	
	.search {
		position: relative;
		width: 300px;
		display: flex;
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
		border-bottom-right-radius: 0;
		border-top-right-radius: 0;
		background-position: right 10px center;
		}
	
	input {
		border-left: none;
		border-bottom-left-radius: 0;
		border-top-left-radius: 0;
		}
	#searchBar{position: relative;}
	#searchInput{width: 250px; height: 40px;}
	#searchIcon{position: absolute; left: 300px; top: 6px;}
	#searchBtn{border-radius: 50%; width: 30px; height: 30px; border: none; background-color: #B0DAFF; cursor:pointer;}

.reThread{
	color: lightblue;
	font-size: 3px;
	border: none;
	background: none;
	vertical-align: top;
}
.page-link.disabled{color: lightgray;}
.page-link.disabled:hover{background: white; color: lightgray;}
	

</style>

</head>
<body>

	<%@include file="../common/top.jsp"%>

	<br><br><br><br>
	<div id="searchTable">	
		<div class="container" style="width: 1200px;">
			<h1> 게시판 </h1>
			<p>자유로운 소통을 하는 공간입니다</p>
		</div>
		<div class="search" style="margin:0 auto; left:400px;">
			<select id="categoryBtn" style="width: 100px; height: 40px; padding-top: 8px;">
				<option value="bId" <c:if test="${ category == 'bId'}">selected</c:if>>글번호</option>
				<option <c:if test="${ category == 'writer'}">selected</c:if> value="writer">작성자</option>
				<option <c:if test="${ category == 'title'}">selected</c:if> value="title">제목</option>
				<option <c:if test="${ category == 'content'}">selected</c:if> value="content">내용</option>
			</select>
			<div class="searchBar">
				<input id="searchInput" type="text" value="<c:if test='${ !empty search }'>${ search }</c:if>" placeholder="내용을 입력해 주세요"> 
				<div id="searchIcon">
					<button type="button" id="searchBtn"><i class="bi bi-search"></i></button>
				</div>
			</div>
		</div>
		
		<br><br>
	
	<!-- 자유게시글 -->
		<table>
			<tr style="background-color: #B0DAFF; opacity: 90%">
				<th style="width: 110px;">글번호</th>
				<th>작성자</th>
				<th style="width: 630px;">제목</th>
				<th style="width: 190px;">작성일</th>
				<th>조회수</th>
			</tr>
			<tbody id="tbody">
				<c:forEach items="${list }" var="b" > 
					<tr>
						<td>${b.boardNo }</td>
						<td>
							<c:set var="nick" value="${b.nickName }" />
							<c:choose>
							   <c:when test="${fn:length(nick) > 8 }">
							      <c:out value="${fn:substring(nick,0,8) }..." />        
							   </c:when>
							   <c:otherwise>
							      <c:out value="${nick}" /> 
							   </c:otherwise>
							</c:choose>
						</td>
						<td>
						    <c:if test="${ b.boardType eq 1}">
						  		<button type="button" class="reThread">●</button>
						    </c:if>
							<c:set var="title" value="${b.boardTitle }" />
							<c:choose>
							   <c:when test="${fn:length(title) > 25 }">
							      <c:out value="${fn:substring(title,0,25) }..." />        
							   </c:when>
							   <c:otherwise>
							      <c:out value="${title}" /> 
							   </c:otherwise>
							</c:choose>
							<c:set var="pic" value="${b.boardContent}"/>
							<c:if test="${fn:contains(pic, 'img')}">
								<span class="material-symbols-outlined">hallway</span>
							</c:if>
						    <c:forEach items="${replySum }" var="re">
						    <c:if test="${b.boardNo eq re.productNo }">
						    	[${re.replyN }]
						    </c:if>
						    </c:forEach>
						</td>
						<td>
							<c:set var="today" value="<%=new java.util.Date()%>"/>
							<c:set var="sys"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>
							<c:set var="bNow"><fmt:formatDate value="${b.boardDate}" pattern="yyyy-MM-dd"/></c:set>
							
							<c:if test="${bNow ne sys}">
								<fmt:formatDate value="${b.boardDate}" pattern="yyyy-MM-dd"/>
							</c:if>
							
							<c:if test="${bNow eq sys}">
								<fmt:formatDate value="${b.boardDate }" pattern="HH:mm:ss"/>
							</c:if>
						</td>
						<td>${b.boardCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br><br>
	<div class="pageFreeBoard" > 
		<nav aria-label="Page navigation example">
			<ul class="pageFreeBoard pagination justify-content-center">
			    <li class="page-item">
			    	<c:if test="${ pi.currentPage <= 1 }">
						<a class="page-link disabled" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</c:if>
				    <c:if test="${ pi.currentPage > 1 }">
				    	<c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
						</c:url>
						<a class="page-link" href="${ goBack }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>	
					</c:if>
				</li>
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				   	<c:url var="goNum" value="${ loc }">
						<c:param name="page" value="${ p }"></c:param>
					</c:url>
				  	<li class="page-item pageFreeBoard"><a class="page-link" href="${ goNum }">${ p }</a></li>
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
						</c:url>
						<a class="page-link" href="${ goNext }" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</c:if>
				</li>
			</ul>
		</nav>	
	</div>
	
	<!-- 작성 버튼 -->
	<c:if test="${!empty loginUser}">
		<div style="width: 1100px; margin: 0 auto; text-align: right; margin-top: -70px;">
			<a href="${contextPath }/freeBoardWrite.bo" class="btn-3d blue">작성하기</a>
		</div><br><br><br>
	</c:if>
	
	<br><br><br><br>
	<%@include file="../common/footer.jsp"%>


</body>
<script>
window.onload=()=>{
	//테이블에 마우스 올렸을 때 css
	const tbody = document.getElementById('tbody');
	const trs = tbody.children;
	const categoryBtn = document.querySelector('#categoryBtn');
	const searchBtn = document.getElementById('searchBtn');
	const searchText = document.getElementById('searchInput');
	let category = '';
	let search = '';
	
	for(tr of trs) {
		tr.addEventListener('click', function() {
			const trTd = this.children;
			const boardId = trTd[0].innerText;
			const boardWriter = trTd[1].innerText;
			location.href = '${contextPath}/detailFreeBoard.bo?bId=' + boardId + '&writer=' + boardWriter + '&page=' + ${pi.currentPage};
		})
		
		 tr.addEventListener('mouseenter', function() {
			    this.style.backgroundColor = 'rgba(176, 218, 255, 0.3)'; // 마우스를 올렸을 때의 스타일
			    this.style.cursor = 'pointer';
			  });

		  tr.addEventListener('mouseleave', function() {
		    this.style.backgroundColor = ''; // 마우스를 뗐을 때의 스타일 (기존 스타일로 복구)
		  }); 
	}
	
	searchBtn.addEventListener('click', function(){
		category = categoryBtn.value;
		search = searchText.value;
		this.style.backgroundColor = '#B0DAFF'; 
		location.href='${contextPath}/freeBoard.bo?category=' + category + '&search=' + search;
	});
	
	searchText.addEventListener('keyup', function(event){
		if(event.key == 'Enter'){
			category = categoryBtn.value;
			search = searchText.value;
			searchBtn.style.backgroundColor = '#B0DAFF'; 
			location.href='${contextPath}/freeBoard.bo?category=' + category + '&search=' + search;
		}
	});
	
	
}	
	
</script>
</html>
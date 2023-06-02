<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<title>Insert title here</title>
<style>
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

img {
	position: absolute;
	width: 20px;
	top: 12px;
	right: 12px;
	margin-left: 30px;
}

img:hover {
	cursor:pointer;
}

#searchElement{
	width:1200px;
	right:1200;
}
</style>

</head>
<body>

	<%@include file="../common/top.jsp"%>

	
	<br><br><br><br>
	
	
	<div id="searchTable">	
		<div class="search" style="margin:0 auto; left:290px;">
			<select style="width: 100px">
				<option>글번호</option>
				<option>작성자</option>
				<option>제목</option>
				<option>내용</option>
			</select>
			<div>
				<input id="searchInput" type="text" placeholder="검색어 입력"> 
				<img id="searchIcon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			</div>
		</div><br><br><br><br><br>
	
	<!-- 자유게시글 -->
	<table>
			<tr style="background-color: #B0DAFF; opacity: 90%">
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tbody id="tbody">
			<tr>
				<td>1</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[59]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[10]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[19]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[2]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[8]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[8]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[8]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[8]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[8]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
			<tr>
				<td>2</td>
				<td>박보보</td>
				<td>이렇게 드셔보세요[8]</td>
				<td>2023-06-01</td>
				<td>15912</td>
			</tr>
		</tbody>
	</table>
	</div>
	
	<!-- 작성 버튼 -->
	<div style="width: 900px; margin: 0 auto; text-align: right;">
		<a href="${contextPath }/freeBoardWrite.bo" class="btn-3d blue">작성하기</a>
	</div><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<%@include file="../common/footer.jsp"%>


</body>
<script>
	//테이블에 마우스 올렸을 때 css
	const tbody = document.getElementById('tbody');
	const trs = tbody.children;
	
	for(tr of trs) {
		tr.addEventListener('click', function() {
			location.href = '${contextPath}/selectFreeBoard.bo';
		})
		
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
	
	//작성하기 버튼 클릭 시 작성하기 페이지로 이동 
	document.getElementById('')
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

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

#searchElement{
	width:1200px;
	right:1200;
}
	
</style>

</head>
<body>

	<div class="search" style="margin: 0 auto; left: 290px;">
		<select style="width: 100px">
			<option>글번호</option>
			<option>작성자</option>
			<option>제목</option>
			<option>내용</option>
		</select>
		<div>
			<input type="text" placeholder="검색어 입력"> 
			<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
		</div>
	</div>







</body>
</html>
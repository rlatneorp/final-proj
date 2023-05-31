<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
*{
font-family: 'Noto Sans KR', sans-serif;
}

</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>
	<div class="container-xxl" align="center">
		<h1>1:1 문의하기</h1>
		<br>
		<hr>
		<br>
		<div>
			<h1>문의 작성</h1>
			<div>
				<input type="text"/>
				<input type="file" value="사진첨부">
				<br>
				<input type="text"/>
			</div>
			<div>
				<button>등록</button>
				<button>작성</button>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
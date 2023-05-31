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
.Qtitle .dropdown-center{
	margin-left: -40px;
}

.customerQ #floatingInput{
	width: 900px;
	height: 85px;
}

.customerQ #floatingText{
	width: 900px;
	height: 500px;
}
.customerQ .form-floating{
	width: 900px;
}
.customerQ .dropdown-item:active{
	background-color: #B0DAFF;
	color:black;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}

.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 7px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 35%;
    color: #999999;
}

#add{
	width: 200px;
	height: 50px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	font-size: 20px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 7px; 
	margin-top: 30px;
}
</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>
<br><br>
	<div class="container-xxl" align="center">
		<h1 style="text-align: left; margin-left: 100px;">1:1 문의하기</h1>
		<br>
		<hr>
		<br>
		<div>
			<h2>문의 작성</h2>
			<br><br>
			<div class="customerQ">
				<div class="Qtitle row justify-content-evenly">
					<div class="dropdown-center d-inline col-4">
					    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    문의종류
					    </button>
					    <ul class="dropdown-menu">
					        <li><a class="dropdown-item" href="#">배송</a></li>
					        <li><a class="dropdown-item" href="#">결제</a></li>
					        <li><a class="dropdown-item" href="#">회원</a></li>
					    </ul>
					</div>
					<div class="filebox d-inline col-4">
					    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
					    <label for="file">사진첨부</label> 
					    <input type="file" id="file">
					</div>
				</div>
				<br><br>
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingInput" placeholder="문의사항의 제목을 적어주세요.">
				  <label for="floatingInput">제목</label>
				</div>
				<div class="form-floating">
				  <input type="text" class="form-control" id="floatingText" placeholder="문의사항을 적어주세요.">
				  <label for="floatingText">내용</label>
				</div>
				<br>
			</div>
			<div>
				<button id="add">작성완료</button>
			
			</div>
		</div>
	</div>
	<br><br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
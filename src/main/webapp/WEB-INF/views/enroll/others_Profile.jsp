<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.out-div{display: flex; justify-content: center;}
	.users-info{
		width: 200px;
		border: 1px solid black;
		text-align: center;}
	.users-profile-img-out{display: flex; justify-content: center;}
	.users-profile-img{
		width: 120px; height: 120px; 
		border-radius: 50%; 
		overflow: hidden; 
		margin: 10px; margin-bottom: 10px;}
	.profile-img{object-fit: cover; object-position: center;}	
	.users-nickname{font-weight: bold; font-size: 18px;}
	.follow{display: flex; justify-content: center;}
	.list{
		width: 800px;
		border: 1px solid black;}
</style>
</head>

<body>
	<%@ include file="../common/top.jsp"%>
	<br>
	
	<div class="out-div">
		<div class="users-info">
			<div class="users-profile-img-out">
				<div class="users-profile-img"><img class="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png" ></div>
			</div>
			<div class="users-nickname">유저 닉네임</div>
			<div class="follow">
				<a>팔로워 200 </a><a style="font-size: 12px; margin-top: 2px; margin-left: 5px; margin-right: 5px;"> | </a><a>팔로잉 100</a>
			</div>
		</div>
		<div class="list">작성 글 내역 나오는 부분</div>
	</div>
	
	
	<br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
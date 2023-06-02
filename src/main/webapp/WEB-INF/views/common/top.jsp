<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>Insert title here</title>

<style>
	.top-div{
		margin-top:25px;
		display: flex; 
		justify-content: center;}
	header{display: flex;}
	.menus{
		margin-top: 25px;
		border-bottom: 1.5px solid gray; 
		width: 530px; height: 35px;
		text-align: center; 
		display: flex; justify-content: center;
		}
	.menu, .dropdown{
		font-size: 20spx; 
		width: 70px; 
		color:black; 
		text-decoration: none;
		cursor: pointer;
		margin-left: 10px; margin-right: 10px;  margin-bottom: 10px;
		}
	.menu:hover{
		border-bottom: 1px solid black;
		font-weight: bold;}
	.logo{
		width: 120px; height: 120px; 
		border-radius: 50%;
		margin-left:10px; margin-right: 10px;
		}
	.logo-img{
		width: 100%; height: 100%;
		object-fit: cover;
		object-position: center;
		}
	
	#dropdownMenu2{border: none; background: none;}
	.drop-list{text-align: center; font-weight: bold; margin-bottom: 5px;}
	.drop-btn{
		border: 2px solid black; border-radius: 10px; 
		width : 100px; 
		margin-top: 10px; 
		background: #B0DAFF;
		}
	.cart{font-size: 20px; margin-bottom: 10px; border-radius: 50%; background: #B0DAFF; width: 30px; height: 30px;}
	
</style>
</head>
<body>
	<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
	<div class="top-div">
		<header>
			<div>
				<div class="menus">
					<div style="width:80px"></div>
					<div class="menu" onclick="location.href='#'">공지</div>
					<div class="menu" onclick="location.href='#'">레시피</div>
					<div class="menu" onclick="location.href='#'">식단</div>
					
				</div>
			</div>
			<div class="logo">
				<img class="logo-img" src="resources/images/Logo.png">
			</div>
			<div>
				<div class="menus">
					<div class="menu" onclick="location.href='#'">쇼핑</div>
					<div class="menu" onclick="location.href='#'">게시판</div>
					<div class="dropdown">
						<button type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
					    로그인
						</button>
				  		<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
				  			<div class="drop-list">이름</div>
				  			<div><button class="dropdown-item" type="button"><i class="bi bi-coin"></i> 1000 포인트</button></div>
				  			<div><button class="dropdown-item" type="button"><i class="bi bi-person-circle"></i> 마이페이지</button></div>
				  			<div><button class="dropdown-item" type="button"><i class="bi bi-bookmark"></i> 스크랩</button></div>
				  			<div class="drop-list"><button class="drop-btn" type="button">로그아웃</button></div>
				  		</div>
					</div>
					<div style="width:80px"></div>
					<div class="cart"><i class="bi bi-basket2-fill"></i></div>
				</div>
			</div>
		</header>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
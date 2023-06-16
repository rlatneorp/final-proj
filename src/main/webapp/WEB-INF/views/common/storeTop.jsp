<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> -->
<style>
	.top-top{
		width: 100%; height: 40px; 
		background: black; color: white; 
		display: flex; justify-content: center; text-align: center; align-items: center;}
	.top-text{width: 1000px;}
	.empty{width: 200px; display: flex;  align-items: center;}
	.bar{margin-left: 10px; margin-right: 10px; font-size: 10px;}
	.login-signin{cursor: pointer;}
	.login-signin:hover{font-weight: bold;}
	
	.top-div{
		margin-top: 35px;
		display: flex; 
		justify-content: center;
		}
	header{display: flex;}
	.menus{
		border-bottom: 2px solid gray; 
		width: 530px; height: 60px;
		text-align: center; 
		display: flex; justify-content: center;
		}
	.menu, .dropdown{
		font-size: 22px; font-weight : bold;
		width: 90px; 
		color:black; 
		text-decoration: none;
		cursor: pointer;
		margin-left: 10px; margin-right: 10px;  margin-bottom: 10px;
		}
	.menu:hover{
		font-weight: bold;}
	.menu2{
		font-size: 8px; font-weight : bold;
		width: 90px; 
		color: white; 
		text-decoration: none;
		}
	.menu:hover .menu2{color: red;}
 	.menu:hover .menu4{width: 90px; height: 20px; background: rgba(176, 218, 255, 0.4); margin-top: -20px;  
 		animation: btn1Ani 0.3s linear 1;
 		}
 		@keyframes btn1Ani{
            0%{width: 0px;}
            100%{width: 100%;}
        }
	
	.logo{
		width: 170px; height: 170px; 
		border-radius: 50%;
		margin-left: 15px; margin-right: 15px;
		cursor: pointer;
		}
	.logo-img{
		width: 100%; height: 100%;
		object-fit: cover;
		object-position: center;
		}
		
	/*드롭메뉴 관련*/
	#dropdownMenu2{border: none; background: none;}
	.dropdown-menu{box-shadow: 5px 5px 0px rgba(0, 0, 0, 0.7);}
	.profile-img-div{
		width: 60px; height: 60px; 
		border-radius: 50%;
		margin-top: 5px; margin-bottom: 10px; margin-left: 30%;
		overflow: hidden;
		}
	.profile-img{
		width: 100%; height: 100%;
		object-fit: cover;
		object-position: center;
		}
	.userName{
		font-size: 18px; 
		text-align: center; cursor: default; 
		border-bottom: 1px solid lightgray; 
		padding-bottom: 8px; margin-bottom: 10px;
		}
	.point-div{cursor: default;}
	.drop-item{margin-top: 5px; margin-bottom: 5px;}
	.drop-ic{margin-right: 10px;}	
	.logout-btn{
		border: 2px solid black; border-radius: 20px;; 
		width : 80px; height: 30px;
		background: #B0DAFF;
		box-shadow: 0px 5px 0px black;
		text-align: center;
		margin: 0 auto;
		margin-top: 10px; margin-bottom: 15px;
		}
	.point{margin-top: 5px; margin-bottom: 5px; margin-left: 16px; cursor: default;}
	
	.cart{
		font-size: 18px;
	    margin-top: 15px;
	    padding-top: 4px;
	    border-radius: 50%;
	    background: #B0DAFF;
	    width: 37px; height: 35px;
	    cursor: pointer;}
	.cart:hover{background: #1f8acb; color: white;  transition: all 0.3s ease 0s;}
	.menu-list{display: none; width: 90px; background: rgba(176, 218, 255, 0.4); margin: 5px;}
	.menu-div:hover .menu-list{display: block;} 
</style>
</head>
<body>

	<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
	
	<div class=top-top>
		<div class="empty"></div>
		<c:if test="${ loginUser == null }"><div class="top-text"></div></c:if>
		<c:if test="${ loginUser != null }"><div class="top-text"><i class="fa-solid fa-utensils"></i>&nbsp; ${ loginUser.usersName } 님, 반갑습니다 &nbsp;<i class="fa-solid fa-utensils"></i></div></c:if>
		<div class="empty">
			<c:if test="${ loginUser == null }">
				<div onclick="location.href='${contextPath}/login.en'" class="login-signin">로그인</div>
				<div class="bar">|</div>
				<div onclick="location.href='${contextPath}/join.en'" class="login-signin">회원가입</div>
			</c:if>
		</div>
		
	</div>
	<div class="top-div">
		<header>
			<div style="margin-top: 20px;">
				<div class="menus">
					<div style="width:80px"></div>
					<div class="menu" >
						<div class="menu2"><i class="bi bi-record-fill"></i></div>
						<div>
							<div class="menu3" onclick="location.href='#'">공 지</div>
							<div class="menu4"></div>
						</div>
						
					</div>
					<div class="menu" >
						<div class="menu2"><i class="bi bi-record-fill"></i></div>
						<div>
							<div class="menu3" onclick="location.href='${contextPath}/recipeList.rc'">레시피</div>
							<div class="menu4"></div>
						</div>
						
					</div>
					<div class="menu" >
						<div class="menu2"><i class="bi bi-record-fill"></i></div>
						<div>
							<div class="menu3" onclick="location.href='${contextPath}/menuList.mn'">식 단</div>
							<div class="menu4"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="logo">
				<a href="${ contextPath }"><img class="logo-img" src="${ contextPath }/resources/images/storeLogo.png"></a>
			</div>
			<div style="margin-top: 20px;">
				<div class="menus">
					<div class="menu" >
						<div class="menu2"><i class="bi bi-record-fill"></i></div>
						<div id="menu-div">
							<div class="menu3" id="menu3" onclick="location.href='${contextPath}/kitchenToolMain.ma'">쇼 핑</div>
							<div class="menu4"></div>
								<div class="menu-list">
									<div>list1</div>
									<div>list2</div>
								</div>
							
						</div>
					</div>
					<div class="menu" >
						<div class="menu2"><i class="bi bi-record-fill"></i></div>
						<div>
							<div class="menu3" onclick="location.href='${contextPath}/freeBoard.bo'">게시판</div>
							<div class="menu4"></div>
						</div>
						
					</div>
					<div class="menu" >
						<div class="menu2"><i class="bi bi-record-fill"></i></div>
						<div>
							<c:if test="${ loginUser == null }">
								<div class="menu3" onclick="location.href='${contextPath}/login.en'">로그인</div>
							</c:if>
							<c:if test="${ loginUser != null }">
								<div class="menu3" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">MY</div>
								<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
									<div class="profile-img-div">
										<c:if test="${ fn:contains(loginUser.usersPw, '$2a$')}">
											<img src="https://botsitivity.org/static/media/noprofile.c3f94521.png" class="profile-img">
										</c:if>
										<c:if test="${ !fn:contains(loginUser.usersPw, '$2a$')}">
											<img src="${ socialUser.socialProfileImg }" class="profile-img">
										</c:if>
									</div>
						  			<div class="userName">
						  				${ loginUser.usersName } 님
						  			</div>
						  			<div class="point"><i class="bi bi-coin drop-ic"></i>${ loginUser.point } P</div>
						  			<div class="dropdown-item" onclick="location.href='${contextPath}/myPage_Main.me'"><i class="bi bi-person-circle drop-ic"></i>마이페이지</div>
						  			<div class="dropdown-item"><i class="bi bi-bookmark drop-ic"></i>스크랩</div>
						  			<div class="logout-btn" onclick="location.href='logout.en'">로그아웃</div>
						  		</div>
							</c:if>
							<div class="menu4"></div>
						</div>
					</div>
					<div style="width:80px"></div>
					<c:if test="${ loginUser == null }"><div style="width:37px;"></div></c:if>
					<c:if test="${ loginUser != null }"><div class="cart" onclick="location.href='${contextPath}/basket.ma'"><i class="fa-solid fa-cart-shopping"></i></div></c:if>
					
				</div>
			</div>
		</header>
	</div>
	<br>
	
<script>
// 	document.getElementById('menu3').addEventListener('mouseover', function(){
// 		 document.getElementById('menu-list').style.display = 'block';
// 	})
	
// 	document.getElementById('menu3').addEventListener('mouseout', function(){
// 		 document.getElementById('menu-list').style.display = 'none';
// 	})

// 	$(()=>{
// 		$('#menu3').hover(function(){
// 			$(this).toggleClass('menu-hover');
// 		}, function(){
// 			$(this).toggleClass('menu-hover');
// 		});
// 	})
</script>



<script src="https://kit.fontawesome.com/243bcd4d8b.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
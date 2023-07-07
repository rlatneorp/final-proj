<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
	#Div{
		display: flex; justify-content: center;
	}
	.myPageDiv{
		width: 1200px;
	}
	.sideBar{
		width: 200px; height: 700px;
		display: inline-block; vertical-align: top;
	}
	.myPage{
		border: 3px solid black; width: 170px; height: 50px;
		margin: 0 auto; text-align: center; border-radius: 20px;
		font-size: 28px; background: rgb(176, 218, 255);
		box-shadow: 0px 8px 0px 0px black;
 		margin-right: 15px; line-height : 50px;
 		font-weight: bold;
	}
	#menu{
		font-size: 20px; text-align: center;
		vertical-align: center; font-weight: bold;
	}
	.arrow{
		font-size: 30px; vertical-align: middle; 
		margin-bottom: 7px;
	}
	.arrow1{
		font-size: 30px; color: black;
  		margin-bottom: 10px;
		vertical-align: middle;
	}
	.content{
		display: inline-block; margin-left: 40px;
		width: 940px; vertical-align: top;
	}
	.nameBar{
		border: none; height: 180px;
		background: rgba(224, 224, 224, 0.74);
		display: flex; justify-content: center; align-items: center;
	}
	.name{
		width: 170px; height: 170px; border-radius: 15px;
		background: white; text-align: center;
		margin: 70px; display: inline-block;
	}
	#mbtn{
		width: 130px; height: 40px; border-radius: 10px;
		border: none; font-weight: bold; font-size: 17px;
	}
	.service{
		font-weight: bold; font-size: 16px;
	}
	.dollars{
		color: rgb(241, 196, 15); font-size: 35px;
	}
	.profile{
		font-size: 26px; font-weight: bold;
		margin-left: 20px;
	}
	.sub{
		margin-left: 25px;
	}
	.moveBtn{
		width: 80px; height: 33px;
		border: 2px solid black;
		border-radius: 20px;
		box-shadow: 0px 5px black;
		font-weight: bold;
	}
	a{
		color: black; text-decoration: none;
		padding-top: 10px; padding-bottom: 10px;
	}
	.menuBar:hover{
		color: black; text-decoration: none; background: #B0DAFF;
		cursor: pointer; border-radius: 10px;
	}
	#myPage:hover{color: black; text-decoration: none;}
	#pmyPage{font-size: 25px; margin-top: 25px; font-weight: bold;}
</style>
</head>
<body>
	<div class="sideBar">
		<br>
		<div class="myPage">
			<a href="myPage_Main.me" id="myPage">마이페이지</a>
		</div>
		<br><br>
		<div id="menu">
			<a class="menuBar" href="${ contextPath }/myPage_MyRecipe.me">나의 레시피 &nbsp;&nbsp;&nbsp;
			<span class="material-symbols-outlined arrow">
			chevron_right
			</span></a>
			<br><br>
			<a class="menuBar" href="${ contextPath }/myPage_MyBookMark.me">스크랩 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="material-symbols-outlined arrow">
			chevron_right
			</span></a>
			<br><br>
			<a class="menuBar" href="${ contextPath }/myPage_MyFavorite.me">찜 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="material-symbols-outlined arrow">
			chevron_right
			</span></a>
			<br><br>
			<a class="menuBar" href="${ contextPath }/myPage_MyOrder.me">상품 구매내역
			<span class="material-symbols-outlined arrow" style="margin-left: 10px;">
			chevron_right
			</span></a>
			<br><br>
			<a class="menuBar" href="${ contextPath }/myPage_MyAddress.me">배송지 관리 &nbsp;&nbsp;&nbsp;
			<span class="material-symbols-outlined arrow">
			chevron_right
			</span></a>
			<br><br>
			<a class="menuBar" href="${ contextPath }/myPage_Review.me">후기 관리 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="material-symbols-outlined arrow">
			chevron_right
			</span></a>
			<br><br>
			<a class="menuBar" href="${ contextPath }/myPage_Point.me">포인트 관리 &nbsp;&nbsp;&nbsp;
			<span class="material-symbols-outlined arrow">
			chevron_right
			</span></a>
			<br><br>
			<a class="menuBar" href="${ contextPath }/myPage_edit.me">회원 정보 수정
			<span class="material-symbols-outlined arrow">
			chevron_right
			</span></a>
		</div>
	</div>
</body>
</html> 

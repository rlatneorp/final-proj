<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<style>
	#Div{
		display: flex; justify-content: center;
	}
	.myPageDiv{
		border: 1px solid black; width: 1200px;
	}
	.sideBar{
		width: 200px; height: 700px; border-right: 1px solid gray;
		display: inline-block; vertical-align: top;
	}
	.myPage{
		border: 3px solid black; width: 170px; height: 50px;
		margin: 0 auto; text-align: center; border-radius: 20px;
		font-size: 28px; background: rgb(176, 218, 255);
		box-shadow: 8px 0px 0px 0px black;
 		margin-right: 15px; line-height : 50px;
	}
	.menu{
		font-size: 20px; text-align: center;
	}
	.arrow{
		width: 20px; height: 20px;
	}
	.content{
		border: 1px solid black; display: inline-block;
		width: 990px; height: 700px; vertical-align: top;
	}
	.nameBar{
		border: none; height: 180px;
		background: rgba(224, 224, 224, 0.74);
		display: flex; justify-content: center; align-items: center;
	}
	#name{
		width: 170px; height: 170px; border-radius: 15px;
		background: white; text-align: center;
		margin-left: 100px; display: inline-block;
	}
	#mbtn{
		width: 120px; height: 35px; border-radius: 10px;
		border: none; font-weight: bold;
	}
</style>
</head>
<body>
	<div id="Div">
		<div class="myPageDiv">
			<div class="sideBar">
				<br>
				<div class="myPage">
					마이페이지
				</div>
				<br><br>
				<div class="menu">
					나의 레시피 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="resources/image/arrow.png" class="arrow">
					<br><br><br>
					스크랩 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="resources/image/arrow.png" class="arrow">
					<br><br><br>
					좋아요 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="resources/image/arrow.png" class="arrow">
					<br><br><br>
					상품 구매내역 
					&nbsp;&nbsp;
					<img src="resources/image/arrow.png" class="arrow">
					<br><br><br>
					배송지 관리
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="resources/image/arrow.png" class="arrow">
					<br><br><br>
					포인트 관리
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="resources/image/arrow.png" class="arrow">
					<br><br><br>
					회원 정보 수정
					&nbsp;
					<img src="resources/image/arrow.png" class="arrow">
				</div>
			</div>
			<div class="content">
			<p style="font-size: 25px; margin-top: 25px; margin-left: 30px;">마이페이지</p>
			<div style="border: 1px solid black; background: black; height: 1px;"></div>
			<br>
			<div class="nameBar">
				<div id="name">
					<p style="font-size: 25px; font-weight: bold; color: rgb(52, 152, 219);">홍길동님</p>
					<br>
					<button id="mbtn">출석하기</button>
				</div>
				<div style="border: 1px solid black;"></div>
			</div>
			</div>
		</div>
	</div>
</body>
</html> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
	.arrow1{
		font-size: 30px; color: black;
  		margin-bottom: 10px;
		vertical-align: middle;
	}
	.content{
		display: inline-block;
		width: 990px; height: 700px; vertical-align: top;
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
		width: 140px; height: 45px; border-radius: 10px;
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
	}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
			<%@ include file="../common/memberSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">마이페이지</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br>
				<div class="nameBar">
					<div class="name">
						<br>
						<p style="font-size: 26px; font-weight: bold; color: rgb(52, 152, 219);">홍길동님</p>
						<br>
						<button id="mbtn">출석하기</button>
					</div>
					<div class="name">
						<br>
						<a style="font-size: 26px; font-weight: bold; color: rgb(52, 152, 219); margin-left: 10px;">고객센터
						<span class="material-symbols-outlined arrow1">
						chevron_right
						</span></a><br><br>
						<p class="service">자주 묻는 질문</p>
						<p class="service">1:1문의</p>
					</div>
					<div class="name">
						<br>
						<a style="font-size: 26px; font-weight: bold; color: rgb(52, 152, 219); margin-left: 10px;">포인트
						<span class="material-symbols-outlined arrow1">
						chevron_right
						</span></a><br>
						<table style="margin-left: 10px;">
						<tr>
						<td>
						<i class="bi bi-currency-dollar dollars"></i>
						</td>
						<td style="font-size: 18px; color: rgb(52, 152, 219);"><b>1000 포인트</b></td>
						</tr>
						</table>
						<p style="font-size: 13px;">소멸 예정 포인트 0원</p>
					</div>
				</div>
				<br><br>
				<label class="profile" style="margin-right: 600px;">프로필 관리하기</label><button class="moveBtn" onclick="location.href='myPage_Profile.me'">이동</button>
				<p class="sub">나의 프로필을 수정합니다.</p><br><br>
				<label class="profile" style="margin-right: 575px;">자기소개 관리하기</label><button class="moveBtn" onclick="location.href='myPage_Intro.me'">이동</button>
				<p class="sub">나를 직접 소개하여 사람들에게 알려보세요.</p><br><br>
				<label class="profile" style="margin-right: 605px;">팔로잉 / 팔로워</label><button class="moveBtn" onclick="location.href='myPage_Follow.me'">이동</button>
				<p class="sub">팔로잉과 팔로워를 볼 수 있습니다.</p>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html> 

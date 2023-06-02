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
		width: 130px; height: 40px; border-radius: 10px;
		border: none; font-weight: bold; font-size: 17px;
		margin-bottom: 10px;
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
	.follow{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 60px; height: 30px;
		background: #B0DAFF;
	}
	#modal{
		border: 1px solid black; width: 500px; height: 600px;
		border-radius: 15px; margin: 0 auto;
	}
	.modal-header{background: #B0DAFF;}
	#following{
		width: 500px; height: 600px;
		margin-left: 750px;
	}
	.followName{
		font-size: 17px; font-weight: bold;
		margin-right: 200px;
	}
	.modalFollow{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 60px; height: 30px;
		background: rgba(224, 224, 224, 0.74);
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
						<button id="mbtn">출석하기</button><br>
						<button class="follow" data-bs-toggle="modal" data-bs-target="#following">팔로잉</button>
						<button class="follow">팔로워</button>
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
	<div class="modal fade" id="following" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로잉</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="following" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로워</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html> 

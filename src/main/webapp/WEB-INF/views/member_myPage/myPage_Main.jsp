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
	#menu{
		font-size: 20px; text-align: center;
		vertical-align: center;
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
		border: 1px solid black; display: inline-block;
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
	}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
			<div class="sideBar">
				<br>
				<div class="myPage">
					마이페이지
				</div>
				<br><br>
				<div id="menu">
					<a>나의 레시피 &nbsp;&nbsp;&nbsp;
					<span class="material-symbols-outlined arrow">
					chevron_right
					</span></a>
					<br><br>
					<a>스크랩 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="material-symbols-outlined arrow">
					chevron_right
					</span></a>
					<br><br>
					<a>좋아요 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="material-symbols-outlined arrow">
					chevron_right
					</span></a>
					<br><br>
					<a>상품 구매내역
					<span class="material-symbols-outlined arrow" style="margin-left: 10px;">
					chevron_right
					</span></a>
					<br><br>
					<a>배송지 관리 &nbsp;&nbsp;&nbsp;
					<span class="material-symbols-outlined arrow">
					chevron_right
					</span></a>
					<br><br>
					<a>포인트 관리 &nbsp;&nbsp;&nbsp;
					<span class="material-symbols-outlined arrow">
					chevron_right
					</span></a>
					<br><br>
					<a>회원 정보 수정
					<span class="material-symbols-outlined arrow">
					chevron_right
					</span></a>
				</div>
			</div>
			<div class="content">
				<p style="font-size: 25px; margin-top: 25px; margin-left: 30px;">마이페이지</p>
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
				<label class="profile">프로필 관리하기</label><button>이동</button><br><br><br><br>
				<label class="profile">프로필 관리하기</label><button>이동</button><br><br><br><br>
				<label class="profile">프로필 관리하기</label><button>이동</button>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br>
	<%@ include file="../common/footer.jsp" %>
</body>
</html> 

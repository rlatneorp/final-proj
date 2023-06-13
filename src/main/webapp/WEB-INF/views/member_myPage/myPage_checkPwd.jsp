<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 프로필</title>
<style>
.btn-3d {
	text-decoration: none;
	width: 100px;
	height: 35px;
	position: relative;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
	padding: 5px;
	/*   padding: 20px 60px; */
	color: white;
	margin: 20px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
	cursor: pointer;
}

.btn-3d.blue:hover {
	color: white;
	background-color: #699DD1;
}

.btn-3d:active {
	top: 9px;
}

.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 8px 0 0 rgba(110, 164, 219, .7), 0 8px 0 1px
		rgba(0, 0, 0, .4), 0 8px 8px 1px rgba(0, 0, 0, 0.5);
}

.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 0 0 1px rgba(0, 0, 0, 0.4);
}
#check{text-align: center;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/memberSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">회원정보 수정</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br>
				<label class="profile">비밀번호 확인</label><br><br><br>
				<div id="check">
					<b style="font-size: 20px;">정보수정을 위해 비밀번호를 입력해주세요.</b><br><br>
					<label style="font-size: 15px;">회원님의 개인정보를 안전하게 보호하기 위해<br>
					<a style="color: red;">인증 후 변경이 가능</a>합니다.</label><br><br>
					<b style="font-size: 20px;">아이디 : </b>&nbsp;&nbsp;&nbsp;
					<label style="margin-right: 215px; font-size: 20px;">user01</label><br><br>
					<input type="text" name="memberPwd" placeholder="비밀번호를 입력하세요" style="width: 300px; height: 40px;">
					<br><br>
					<a class="btn-3d blue" href="${ contextPath }/myPage_editInfo.me">확인</a>
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
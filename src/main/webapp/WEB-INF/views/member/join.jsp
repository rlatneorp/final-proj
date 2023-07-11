<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홀로세끼</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">>
<style>
	.form-line{
		width: 600px; height: 800px;
		border: 3px solid #1f8acb;
		border-radius: 45px;
		margin-left: auto; margin-right: auto; margin-top: 100px;
		}
	.form-dot{
		width: 580px; height: 780px;
		border: 3px dotted #1f8acb;
		border-radius: 40px;
		margin: 7px;
		}
	.join-form{
		width: 560px; height: 755px;
		background: #1f8acb;
		border-radius: 25px;
		margin: 0 auto; margin-top: 12px;
/* 		box-shadow:5px 5px 0px black; */
		}
	.mid{
		display: flex; justify-content: center;}
	.join{
		font-size: 25px; font-weight: bold;
		margin: 10px; margin-top: 50px;
		color: white;
		}
	.join-line{
		width: 140px; height: 65px;
		border-bottom: 3px solid white;}
 	.form{margin-left: 0 auto; margin-right: 0 auto;}
	.input{
		border-radius: 20px; border: 2px solid black;
		width: 300px; height: 35px;
		padding-left: 10px;
		margin-bottom: 25px; margin-top: 5px;
		}
	.line{
		width: 380px; border-bottom: 3px solid white;
		margin-top: 20px;
		}
	.checkbox{margin-left: 50px; line-height: 40px;}
</style>
</head>
<body>
	<div class="outline">
		<div class="form-line">
			<div class="form-dot">
				<div class="join-form">
					<div class="mid">
						<div class="join-line"></div>
						<div class="join">회원가입</div>
						<div class="join-line"></div>
					</div>
					<br>
					<div class="mid">
						<form class="form" action="" method="post">
							<label class="label">아이디</label><br>
							<input type="text" name="id" class="input" placeholder="아이디를 입력하세요"><br>
							<label class="label">비밀번호</label><br>
							<input type="text" name="pwd" class="input" placeholder="비밀번호를 입력하세요"><br>
							<label class="label">비밀번호 확인</label><br>
							<input type="text" name="checkPwd" class="input" placeholder="비밀번호를 다시 입력하세요"><br>
						
							<label class="label">이름</label><br>
							<input type="text" name="name" class="input" placeholder="이름을 입력하세요"><br>
							<label class="label">닉네임</label><br>
							<input type="text" name="nickName" class="input" placeholder="닉네임을 입력하세요"><br>
							<label class="label">이메일</label><br>
							<input type="text" name="email" class="input" placeholder="메일주소를 입력하세요"><br>
						</form>
					</div>
					<div class="line"></div>
					<div class="checkbox">
						<input type="checkbox"><label>약관 전체 동의</label><br>
						<input type="checkbox"><label>이용약관 동의</label><br>
						<input type="checkbox"><label>개인정보 수집 및 이용동의</label><br>
						<input type="checkbox"><label>이벤트/마케팅 수신동의</label><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
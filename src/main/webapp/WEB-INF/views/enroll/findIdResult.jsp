<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>홀로세끼</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
	@font-face {
	    font-family: 'YESGothic-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESGothic-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* { font-family: 'YESGothic-Regular';}

	body{background: #B0DAFF;}	
	.form-line{
		width: 600px; height: 750px;
		border: 5px solid white;
		border-radius: 45px; 
		margin-left: auto; margin-right: auto; margin-top: 100px; margin-bottom: 100px;
		}
	.form-dot{
		width: 580px; height: 730px;
		border: 5px dotted white;
		border-radius: 40px;
		margin: 5px;
		}
	.join-form{
		width: 560px; height: 705px;
		background: white;
		border-radius: 30px;
		margin: 0 auto; margin-top: 12px;
		}
	.mid{
		display: flex; justify-content: center;  
		font-size: 18px; color: #1f8acb; font-weight: bold;
		}
	.mid33{
		font-size: 15px; color: #1f8acb; font-weight: bold;
		margin-top: 30px; margin-bottom: 20px;
		text-align: center;
		}
	
	.join{
		font-size: 25px; font-weight: bold;
		margin: 10px; margin-top: 100px; 
		color: #1f8acb;
		}
	.join-line{
		width: 135px; height: 120px;
		border-bottom: 3px solid #1f8acb;}
	.line{
		width: 400px; border-bottom: 3px solid #1f8acb;
		margin: 0 auto; margin-top: 30px; margin-bottom: 30px;
		}
	.mid22{margin: 0 auto;}
	
	.button{
		width: 150px; height: 50px;
		border-radius: 25px; border: 2px solid black;
		font-size: 20px; font-weight: bold;
		margin-top: 50px; margin-bottom: 20px; margin-left: 130px;
		background: #f0f0f0;
		box-shadow: 0px 5px 0px black;
		cursor: pointer; 
		}
	.button:active, .button2:active{box-shadow: 0px 1px 0px black; transform: translateY(5px); background: #b0daff;}
 	.mid-btn{display: flex; justify-content: center;} 
	.button2{
		width: 150px; height: 50px;
		border-radius: 25px; border: 2px solid black;
		font-size: 20px; font-weight: bold;
		margin-top: 50px; margin-bottom: 20px; margin-left: 5px; margin-right: 5px;
		background: #f0f0f0;
		box-shadow: 0px 5px 0px black;
		cursor: pointer; 
		}
	
	.find{display: flex; justify-content: center; font-size: 16px;}
	.find2{cursor: pointer; margin-right: 8px; margin-left: 8px; text-decoration: underline;}
	.result{
		margin-right: 8px; margin-left: 8px; font-size: 18px; line-height: 40px; }
</style>
</head>
<body>
	<div class="outline">
		<div class="form-line">
			<div class="form-dot">
				<div class="join-form">
					<div class="mid">
						<div class="join-line"></div>
						<div class="join">ID 찾기</div>
						<div class="join-line"></div>
					</div>
					<c:if test="${usersInfo == null}">
						<div class="mid33" style="font-size: 16px; line-height: 30px;">
							입력하신 정보와 일치하는 결과가 없습니다.<br>
							사이트 이용을 위해 회원가입을 해주세요.
						</div>
						<div class="mid33" style="font-size: 100px;">
						 	<i class="bi bi-exclamation-triangle-fill"></i>
						</div> 
						<div class="mid">
							<div class="mid22">
								<div class="mid-btn">
									<div><button class="button2" onclick="location.href='join.en'">회원가입</button></div>
									<div><button class="button2" onclick="location.href='home.do'">메인으로</button></div>
								</div>
								<div class="line"></div>
								<div class="find">
									<div class="find2" onclick="location.href='findPwd.en'">비밀번호를 잊어버리셨나요?</div>
								</div>
							</div>
						</div>
						
					</c:if>
					
					<c:if test="${ usersInfo != null }">
						<div class="mid33" style="font-size: 16px;"> 
 							입력하신 정보와 일치하는 결과 입니다.
						</div>
						<div class="mid33">
							<div class="result">이 름 : ${ usersInfo.usersName }</div>
							<div class="result">아이디 : ${ usersInfo.usersId }</div>
							<div class="result">가입일 : ${ usersInfo.enrollDate }</div>
						</div>
						<div class="mid">
							<div class="mid22">
								<div><button class="button" onclick="location.href='login.en'">로그인</button></div>
								<div class="line"></div>
								<div class="find">
									<div class="find2" onclick="location.href='findPwd.en'">비밀번호를 잊어버리셨나요?</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
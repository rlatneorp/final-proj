<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	.button:active{box-shadow: 0px 1px 0px black; transform: translateY(5px); background: #b0daff;}
	
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
					<div class="mid33">
						입력하신 정보와 일치하는 결과 입니다.
					</div>
					<br>
					<div class="mid33">
						<div class="result">이 름 : 최정흠</div>
						<div class="result">아이디 : wantyou0421</div>
						<div class="result">가입일 : 2023-06-02</div>
					</div>
					<div class="mid">
						<div class="mid22">
							<div><button class="button">로그인</button></div>
								
							<div class="line"></div>
							<div class="find">
								<div class="find2" onclick="location.href='findPwd.en'">비밀번호를 잊어버리셨나요?</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
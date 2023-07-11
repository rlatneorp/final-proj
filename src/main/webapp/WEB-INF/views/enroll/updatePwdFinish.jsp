<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트아이콘 -->
<title>홀로세끼</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
	body{background: #B0DAFF;}
	.form-line{
		width: 600px; height: 750px;
		border: 5px solid white;;
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
	.num{font-size: 30px; color: #1f8acb;}
	.mid-line{width:50px; height: 22.5px; border-bottom: 2.5px solid #1f8acb;}
	.mid33{
		font-size: 20px; color: #1f8acb; font-weight: bold;
		margin-top: 30px; margin-bottom: 20px;
		text-align: center;
		line-height: 25px;
		}
	.join{
		font-size: 25px; font-weight: bold;
		margin: 10px; margin-top: 100px;
		color: #1f8acb;
		}
	.join-line{
		width: 85px; height: 120px;
		border-bottom: 3px solid #1f8acb;}
	.input{
		border-radius: 8px; border: 2px solid #1f8acb;
		width: 320px; height: 35px;
		padding-left: 5px;
		margin-bottom: 25px; margin-top: 5px;
		font-size : 15px; 
		}
	.input2{
		margin-bottom: 5px;
		}
	.input, .label, .checkbox{margin-left: 35px;}
	.check{font-size: 12px; text-align: center; color: rgba(0,0,0,0); margin-bottom: 10px;}
	.line{
		width: 400px; border-bottom: 3px solid #1f8acb;
		margin: 0 auto; margin-top: 30px; margin-bottom: 30px;
		}
	.required{color: red; margin-left: 10px;}
	.text{ font-size: 12px; color: lightgray;}
	.mid22{margin: 0 auto;}
	.mid22-btn{display: flex; justify-content: center;}
	.button{
		width: 150px; height: 50px;
		border-radius: 25px; border: 2px solid black;
		font-size: 20px; font-weight: bold;
		margin-top: 20px; margin-bottom: 20px; margin-left: 5px; margin-right: 5px;
		background: #f0f0f0;
		box-shadow: 0px 5px 0px black;
		}
	.button:active{box-shadow: 0px 1px 0px black; transform: translateY(5px); background: #b0daff;}
	
	.swal-overlay {background-color: rgba(0, 0, 0, 0.5);}
		
	.pwd-ck{display: flex; justify-content: center;}
	.pwd-ck2{
		margin-right: 10px; margin-top: -20px; margin-bottom: 20px;
		font-size: 12px; text-align: center; color: lightgray;
		}
	.logincheck{font-size: 13px; margin-top: -15px;}
	.logincheck:hover{text-decoration: underline; cursor: pointer;}
	.modal-footer{justify-content: center;}
	.modal-body{font-size: 17px; text-align: center; margin-top: 50px; margin-bottom: 50px;}
	.button2{margin-left: 0px;}
	
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- 예쁜 alert창 : https://sweetalert.js.org/ -->

	<div class="outline">
		<div class="form-line">
			<div class="form-dot">
				<div class="join-form">
					<div class="mid">
						<div class="join-line"></div>
						<div class="join">비밀번호 재설정</div>
						<div class="join-line"></div>
					</div>
					<br>
					<div class="mid">
						<div class="num"><i class="bi bi-1-circle"></i></div>
						<div>
							<div class="mid-line"></div>
							<div></div>
						</div>
						<div class="num"><i class="bi bi-2-circle"></i></div>
						<div>
							<div class="mid-line"></div>
							<div></div>
						</div>
						<div class="num"><i class="bi bi-3-circle-fill"></i></div>
					</div>
					<div class="mid33">
						<i class="fa-solid fa-circle-check" style="font-size:90px;"></i>
						<br><br><br>
						비밀번호가 재설정되었습니다.
					</div>
					<br>
					<div class="mid">
						<div class="mid22">
							<div class="mid22-btn">
								<div><button class="button" id="submit" onclick="location.href='login.en'">로그인</button></div>
								<div><button class="button" id="submit" onclick="location.href='home.do'">메인</button></div>
							</div>
							<div class="line"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="https://kit.fontawesome.com/243bcd4d8b.js" crossorigin="anonymous"></script>
</body>
</html>
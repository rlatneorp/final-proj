<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트아이콘 -->
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>비밀번호찾기</title>
<style>
	@font-face {
	    font-family: 'YESGothic-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESGothic-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* { font-family: 'YESGothic-Regular';}

	body{background: #B0DAFF;}	
	#loading{position: absolute; margin-left: 43%; margin-top: 15%; }
 	#mask{width: 100%; height: 100%; position: absolute; z-index:9000; background: rgba(0, 0, 0, 0.5); top: 0;}
	.form-line{
		width: 600px; height: 1050px;
		border: 5px solid white;
		border-radius: 45px; 
		margin-left: auto; margin-right: auto; margin-top: 100px; margin-bottom: 100px;
		}
	.form-dot{
		width: 580px; height: 1030px;
		border: 5px dotted white;
		border-radius: 40px;
		margin: 5px;
		}
	.join-form{
		width: 560px; height: 1005px;
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
		line-height: 25px;
		}
	.mid44{
		font-size: 17px; color: #1f8acb; font-weight: bold;
		margin-top: 10px; margin-bottom: 20px;
		text-align: center;
		}
	.num{font-size: 30px; color: #1f8acb;}
	.mid-line{width:50px; height: 22px; border-bottom: 2.5px solid #1f8acb;}
	.join{
		font-size: 25px; font-weight: bold;
		margin: 10px; margin-top: 100px; 
		color: #1f8acb;
		}
	.join-line{
		width: 98px; height: 120px;
		border-bottom: 3px solid #1f8acb;}
	.input{
		border-radius: 8px; border: 2px solid #1f8acb;
		width: 320px; height: 35px;
		padding-left: 5px;
		margin-bottom: 25px; margin-top: 5px;
		font-size : 15px;
		}
	.input, .label, .checkbox{margin-left: 35px;}
	.line{
		width: 400px; border-bottom: 3px solid #1f8acb;
		margin: 0 auto; margin-top: 30px; margin-bottom: 30px;
		}
	.line2{
		width: 400px; border-bottom: 2px dashed #1f8acb;
		margin: 0 auto; margin-top: 30px; margin-bottom: 40px;
		}
	.mid22{margin: 0 auto;}
	.button{
		width: 150px; height: 50px;
		border-radius: 25px; border: 2px solid black;
		font-size: 20px; font-weight: bold;
		margin-top: 20px; margin-bottom: 20px; margin-left: 130px;
		background: #f0f0f0;
		box-shadow: 0px 5px 0px black;
		cursor: pointer;
		}
	.button:active{box-shadow: 0px 1px 0px black; transform: translateY(5px); background: #b0daff;}
	
	.logincheck{font-size: 13px; margin-top: -15px;}
	.logincheck:hover{text-decoration: underline; cursor: pointer;}
	
	.find{display: flex; justify-content: center; font-size: 16px;}
	.find2{cursor: pointer; margin-right: 8px; margin-left: 8px; text-decoration: underline;}
	
	.confirm{display: flex;}
	#email, #num{width: 250px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; border-right: none;}
	#button2, #button3{
		font-size : 13px; background: #1f8acb; color: white;
		width: 70px; height: 40px;
		border: 2px solid #1f8acb;
		border-bottom-right-radius: 8px; border-top-right-radius: 8px; 
		margin-top: 5px;
		cursor: pointer;}
	#time{margin-left: 205px; color: white; }
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- 예쁜 alert창 : https://sweetalert.js.org/ -->

	<div id="mask"></div>
	<div id="loading">
        <img src="${ contextPath }/resources/images/Spinner2.gif">    
    </div>


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
						<div class="num"><i class="bi bi-1-circle-fill"></i></div>
						<div>
							<div class="mid-line"></div>
							<div></div>
						</div>
						<div class="num"><i class="bi bi-2-circle"></i></div>
						<div>
							<div class="mid-line"></div>
							<div></div>
						</div>
						<div class="num"><i class="bi bi-3-circle"></i></div>
					</div>
					<div class="mid33">
						본인확인 후 비밀번호를 재설정 할 수 있습니다.<br>
						<u>회원가입시 입력한 정보</u>를 입력해주세요.
					</div>
					<br>
					<div class="mid">
						<div class="mid22">
							<form class="form" action="" method="post">
								<label class="label">아이디</label><br>
								<input type="text" name="id" id="id" class="input" placeholder="아이디를 입력하세요" required><br>
								<label class="label">이메일</label><br>
								<div class="confirm">
									<div><input type="email" name="email" id="email" class="input" placeholder="메일주소를 입력하세요" required></div>
									<div><button type="button" id="button2">인증번호 받기</button></div>
								</div>
							</form>
							<div class="line2"></div>
							<label class="label">인증번호</label><span id="time">03:00</span><br>
							<div class="confirm">
								<div><input type="text" name="num" id="num" class="input" placeholder="메일로 받은 인증번호를 입력하세요" required><br></div>
								<div><button type="button" id="button3">인증</button></div>
							</div>
							<div class="mid44" id="mid44">
								&nbsp;
							</div>
							<div><button class="button" id="next-btn" onclick="location.href='updatePwd.en?id=' + encodeURIComponent(document.getElementById('id').value)" disabled>다음</button></div>
							<div class="line"></div>
							<div class="find">
								<div class="find2" onclick="location.href='findId.en'">아이디를 잊어버리셨나요?</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function(){
		$("#loading").hide();
		$("#mask").hide();
	})


	const checkBtn = document.getElementById("button2");
	
	checkBtn.addEventListener('click', function(){
		if(document.getElementById('id').value == ''){
			swal({
				 text: "아이디를 입력해주세요",
				 icon: "error",
				 button: "확인",
				});
			document.getElementById('id').focus();
			return false;
		}
			
		if(document.getElementById('email').value == ''){
			swal({
				 text: "메일주소를 입력해주세요",
				 icon: "error",
				 button: "확인",
				});
			document.getElementById('email').focus();
			return false;
		} 
		
		// 인증메일 보내고 카운트다운 3분
		const time = document.getElementById('time');
		const num = document.getElementById('num');
		const alert = document.getElementById("mid44");
		let count = 179;
		
		time.style.color = 'red';
		num.placeholder = '메일로 받은 인증번호를 입력하세요';
		num.disabled = false;
		alert.innerHTML = '&nbsp;';
		
		const interval = window.setInterval(() =>{
			
			let min = Math.floor(count/60);
			let sec = count%60;
			
			time.innerText = ("0" + min).slice(-2) + ":" + ("0" + sec).slice(-2);
			count--;
			
			if(count > 0){
				document.getElementById('button3').addEventListener('click', function(){
					const inputCode = document.getElementById('num').value;
					
					if(inputCode == code){
						alert.innerText = '인증이 완료되었습니다.';
						clearInterval(interval);
						time.innerText = '';
						alert.style.color = '#8bb572';
						document.getElementById("next-btn").removeAttribute("disabled");
						return true;
					}else{
						alert.innerText = '인증번호가 일치하지 않습니다.';
						alert.style.color = 'red';
						return false;
					}
				})
			} else if(count < 0){
				clearInterval(interval);
				time.innerText = '';
				document.getElementById("button3").disabled = true;
				num.disabled = true;
				num.placeholder = '시간이 만료되었습니다.';
				alert.innerText = '인증을 다시 진행해주세요.';
				alert.style.color = 'red';
			}
		}, 1000);
		
		$("#loading").show();
		$("#mask").show();
		
		$.ajax({
			type:"POST",
			url: "findPwdCheck.en",
			data: {id: document.getElementById('id').value,
					email: document.getElementById('email').value},
			success: data=>{
				console.log(data);
				if( data == 0 ){
					$("#loading").hide();
					$("#mask").hide();
					
					swal({
						 text: "일치하는 정보가 없습니다.",
						 icon: "error",
						 button: "확인",
						});
					clearInterval(interval);
					time.innerText = '';
					return false;
				} else{
					$("#loading").hide();
					$("#mask").hide();
					
					swal({
						 text: "인증번호가 전송되었습니다.",
						 icon: "success",
						 button: "확인",
						});
					code = data;
				}
			},
			error: data =>{
				console.log(222);
				$("#loading").hide();
				$("#mask").hide();
				
				swal({
					 text: "인증번호 전송에 실패했습니다.",
					 icon: "error",
					 button: "확인",
					});
			}
		})
	});
		
</script>
</html>
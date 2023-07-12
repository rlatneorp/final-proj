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
	@font-face {
	    font-family: 'YESGothic-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESGothic-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* { font-family: 'YESGothic-Regular';}

	body{background: #B0DAFF;}
	.form-line{
		width: 600px; height: 800px;
		border: 5px solid white;;
		border-radius: 45px; 
		margin-left: auto; margin-right: auto; margin-top: 100px; margin-bottom: 100px;
		}
	.form-dot{
		width: 580px; height: 780px;
		border: 5px dotted white;
		border-radius: 40px;
		margin: 5px;
		}
	.join-form{
		width: 560px; height: 755px;
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
	.num{font-size: 30px; color: #1f8acb;}
	.mid-line{width:50px; height: 22.5px; border-bottom: 2.5px solid #1f8acb;}
	.button{
		width: 150px; height: 50px;
		border-radius: 25px; border: 2px solid black;
		font-size: 20px; font-weight: bold;
		margin-top: 20px; margin-bottom: 20px; margin-left: 130px;
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
						<div class="num"><i class="bi bi-2-circle-fill"></i></div>
						<div>
							<div class="mid-line"></div>
							<div></div>
						</div>
						<div class="num"><i class="bi bi-3-circle"></i></div>
					</div>
					<div class="mid33">
						<strong>${ id }</strong>님의 비밀번호를 재설정 합니다.
					</div>
					<br>
					<div class="mid">
						<div class="mid22">
							<form class="form" action="updatePwdResult.en?id=${id}" method="post">
								<label class="label">비밀번호 <span class="text">| 영어, 숫자, 특수문자 포함 8자 이상</span></label><br>
								<input type="password" name="pwd" id="pwd" class="input" placeholder="비밀번호를 입력하세요" required><br>
								<div class="pwd-ck">
									<div class="pwd-ck2" id="eng"><i class="bi bi-circle"></i> 영어</div>
									<div class="pwd-ck2" id="num"><i class="bi bi-circle"></i> 숫자</div>
									<div class="pwd-ck2" id="special"><i class="bi bi-circle"></i> 특수문자</div>
									<div class="pwd-ck2" id="more8"><i class="bi bi-circle"></i> 8자 이상</div>
								</div>
								<label class="label">비밀번호 확인</label><br>
								<input type="password" name="checkPwd" id="checkPwd" class="input input2" placeholder="비밀번호를 다시 입력하세요" required><br>
								<p class="check" id="pwdCheckMsg">&nbsp;</p>
								<div><button class="button" id="submit">설정</button></div>
								<div class="line"></div>
							</form>
			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 비밀번호 재설정 완료 모달 -->
	<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
			<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel3">비밀번호 재설정 완료!</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>비밀번호가 재설정 되었습니다! <br>로그인 화면으로 이동합니다!</div>	
				</div>
				<div class="modal-footer">
					<button type="button" class="button button2" data-bs-dismiss="modal" onclick="location.href='login.en'">로그인</button>
				</div>
			</div>
		</div>
	</div>

<script>
	
	// 비번 유효성검사 (영어, 숫자 포함 8자리 이상)
	const pwd = document.getElementById('pwd');
	const checkPwd = document.getElementById('checkPwd');
	
	pwd.onkeyup = () => {
		const checkEng = /[a-zA-Z]/;
		const checkNum = /[0-9]/;
		const checkSpecial = /[@$!%*#?^=+`~&]/;
		
		const eng = document.getElementById('eng');
		const num = document.getElementById('num');
		const more8 = document.getElementById('more8');
		const special = document.getElementById('special');
		
		eng.style.color = checkEng.test(pwd.value) ? '#8bb572' : '';
		eng.innerHTML =  checkEng.test(pwd.value) ? '<i class="bi bi-check-circle"></i> 영어' : '<i class="bi bi-circle"></i> 영어';
		
		num.style.color = checkNum.test(pwd.value) ? '#8bb572' : '';
		num.innerHTML = checkNum.test(pwd.value) ? '<i class="bi bi-check-circle"></i> 숫자' : '<i class="bi bi-circle"></i> 숫자';
		
		more8.style.color = pwd.value.length >= 8 ? '#8bb572' : '';
		more8.innerHTML = pwd.value.length >= 8 ? '<i class="bi bi-check-circle"></i> 8자 이상' : '<i class="bi bi-circle"></i> 8자 이상';
		
		special.style.color = checkSpecial.test(pwd.value) ? '#8bb572' : '';
		special.innerHTML = checkSpecial.test(pwd.value) ? '<i class="bi bi-check-circle"></i> 특수문자' : '<i class="bi bi-circle"></i> 특수문자';
	};

	pwd.addEventListener('focusout', ()=>{
		const regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?^=+`~&])[A-Za-z\d@$!%*#?^=+`~&]{8,}$/;
		
		checkPwd.value = '';
		
		if(pwd.length > 0){
			if(!regPwd.test(pwd)){
				swal({
					 text: "비밀번호는 영어와 숫자, 특수문자를 포함해 8자리 이상이어야 합니다.",
					 icon: "error",
					 button: "확인",
					});
				document.getElementById('pwd').value = '';
				document.getElementById('pwd').focus();
				document.getElementById('eng').style.color = '';
				document.getElementById('eng').innerHTML = "<i class='bi bi-circle'></i> 영어";
				document.getElementById('num').style.color = '';
				document.getElementById('num').innerHTML = "<i class='bi bi-circle'></i> 숫자";
				document.getElementById('more8').style.color = '';
				document.getElementById('more8').innerHTML = "<i class='bi bi-circle'></i> 8자 이상";
				document.getElementById('special').style.color = '';
				document.getElementById('special').innerHTML = "<i class='bi bi-circle'></i> 특수문자";
			}
		}
	})
	
	// 비번-비번확인 같은지 체크
	document.getElementById('checkPwd').addEventListener('change', ()=>{
		const pwd = document.getElementById('pwd').value;
		const checkPwd = document.getElementById('checkPwd').value;
		const pwdCheckMsg = document.getElementById('pwdCheckMsg');
		pwdCheckMsg.innerHTML = '';
		
		if(pwd != checkPwd){
			pwdCheckMsg.innerHTML = '<i class="bi bi-exclamation-triangle-fill"></i> 비밀번호확인을 정확하게 입력해주세요.';
			pwdCheckMsg.style.color = 'red';
			document.getElementById('checkPwd').value = '';
			document.getElementById('checkPwd').focus();
		}
	})
	
</script>
</body>
</html>
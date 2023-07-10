<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 회원정보 수정</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<style>
	#dropdownMenu2{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

	#btn{
		width: 85px; height: 40px;
		border: 2px solid black;
		border-radius: 20px;
		box-shadow: 0px 5px black;
		margin-left: 425px;
		font-weight: bold;
		background: white;
	}
	#btn:active{
		box-shadow: 0px 1px 0px black; transform: translateY(5px);
		background: #B0DAFF;
	}
	table {
	   text-align: left;
	   margin: 0 auto;
	   width: 900px;
	   border-top: 2px solid #444444;
	   border-bottom: 2px solid #444444;
	   border-collapse: collapse;
	}
	
	td {
	   border-top: 1px solid #444444;
	   border-left: 1px solid #444444;
	   padding: 10px;
	}
	.orderInfo{font-size: 17px; font-weight: bold;}
	.detail{
		width: 200px; background: #B0DAFF;
	}
	table tr{height: 70px; border-bottom: 1px solid lightgray;}
	input[type="text"],[type="password"] {height: 35px;}
	input[type="button"] {
		background: lightgray; border: none;
		border-radius: 5px; font-weight: bold;
	}
	.check{display: none; margin-left: 15px; font-size: 12px; color: green;}
	.pwd-ck2{margin-right: 10px; font-size: 12px; color: lightgray;}
	.pwd-ck{display: flex; margin-left: 45px; width: 300px; margin-top: 5px;}
	#editb{
		width: 85px; height: 40px;
		border: 2px solid black;
		border-radius: 20px;
		box-shadow: 0px 5px black;
		margin-left: 425px;
		font-weight: bold;
		background: white;
	}
	#editb:active{
		box-shadow: 0px 1px 0px black; transform: translateY(5px);
		background: #B0DAFF;
	}
	#deleteBtn{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 14px;
		width: 70px; height: 35px;
		margin-left: 850px;
	}
	.deleteB{background: lightgray;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">마이페이지</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br>
				<label class="profile">회원정보 수정</label><br><br><br>
				<table>
					<tr>
						<td class="detail">아이디</td>
						<td><input type="text" style="width: 300px; margin-left: 15px; background: lightgray;" name="usersId" readonly value="${ loginUser.usersId }" id="id"></td>
					</tr>
					<tr>
						<td class="detail">이름</td>
						<td><input type="text" style="width: 300px; margin-left: 15px; background: lightgray;" name="usersName" readonly value="${ loginUser.usersName }"></td>
					</tr>
					<tr>
						<td class="detail">닉네임</td>
						<td>
							<input type="text" style="width: 190px; margin-left: 15px;" name="nickName" value="${ loginUser.nickName }" id="nickName">
							<input type="button" style="width: 100px; height: 35px; margin-left: 10px;" value="중복확인" id="nickCheck">
							<div class="check"></div>
						</td>
					</tr>
					<tr>
						<td class="detail">이메일</td>
						<td>
							<input type="email" style="width: 190px; margin-left: 15px; margin-right: 10px; height: 35px;" name="email" placeholder="이메일을 입력해주세요" value="${ loginUser.email }" id="email">
							<input type="button" style="width: 100px; height: 35px;" value="중복확인" id="emailCheck">
							<div class="check"></div>
						</td>
					</tr>
					<tr>
						<td class="detail">휴대전화</td>
						<td>
							<div style="display: flex; align-items: center;">
								<input type="text" style="width: 300px; margin-left: 15px; margin-right: 10px; height: 35px;" name="phone" placeholder="번호를 입력해주세요" value="${ loginUser.phone }" id="phone">
							</div>
						</td>
					</tr>
				</table>
				<br>
				<button id="deleteBtn">회원탈퇴</button>
				<br>
				<button id="btn">수정하기</button>
				<br><br>
				<label class="profile">비밀번호 변경</label><br><br><br>
				<table>
					<tr>
						<td class="detail">현재 비밀번호</td>
						<td>
							<input type="password" style="width: 300px; margin-left: 15px" placeholder="현재 비밀번호를 입력해주세요" id="cpwd">
							<div class="check"></div>
						</td>
					</tr>
					<tr>
						<td class="detail">새 비밀번호</td>
						<td>
							<input type="password" style="width: 300px; margin-left: 15px;" name="newPw" placeholder="새로운 비밀번호를 입력해주세요" id="npwd">
							<div class="pwd-ck">
								<div class="pwd-ck2" id="eng"><i class="bi bi-circle"></i> 영어</div>
								<div class="pwd-ck2" id="num"><i class="bi bi-circle"></i> 숫자</div>
								<div class="pwd-ck2" id="special"><i class="bi bi-circle"></i> 특수문자</div>
								<div class="pwd-ck2" id="more8"><i class="bi bi-circle"></i> 8자 이상</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="detail">새 비밀번호 확인</td>
						<td>
							<input type="password" style="width: 300px; margin-left: 15px;" placeholder="한번 더 입력해주세요" id="fpwd">
							<div class="check"></div>
						</td>
					</tr>
				</table>
				<br><br>
				<button id="editb">변경하기</button>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		const cpwd = document.getElementById('cpwd');
		const id = document.getElementById('id');
		const check = document.getElementsByClassName('check');
		const editb = document.getElementById('editb');
		const npwd = document.getElementById('npwd');
		const fpwd = document.getElementById('fpwd');
		const pform = document.getElementById('pform');
		const eform = document.getElementById('eform');
		const emailCheck = document.getElementById('emailCheck');
		const nickCheck = document.getElementById('nickCheck');
		const email = document.getElementById('email');
		const nickName = document.getElementById('nickName');
		const btn = document.getElementById('btn');
		const phone = document.getElementById('phone');
		
		// 비번 = 비번 확인
		fpwd.addEventListener('keyup', () => {
			if(npwd.value == fpwd.value) {
				check[3].style.display = 'block';
				check[3].style.color = 'green';
				check[3].innerText = '비밀번호가 일치합니다.';
			} else {
				check[3].style.display = 'block';
				check[3].style.color = 'red';
				check[3].innerText = '새 비밀번호가 일치하지 않습니다.';
			}
		});
		
		// 비밀번호 변경
		editb.addEventListener('click', () => {
			if(cpwd.value == ''){
				swal({
					 text: "현재 비밀번호를 입력해주세요.",
					 icon: "error",
					 button: "확인"
					}).then(function() {
						cpwd.focus();
					});
			} else if(npwd.value == ''){
				swal({
					 text: "새로운 비밀번호를 입력해주세요.",
					 icon: "error",
					 button: "확인"
					}).then(function() {
						npwd.focus();
					});
			} else if(fpwd.value == ''){
				swal({
					 text: "비밀번호 확인을 진행해주세요.",
					 icon: "error",
					 button: "확인"
					}).then(function() {
						fpwd.focus();
					});
			} else{
				$.ajax({
					type : 'POST',
					url : '${contextPath}/myPage_checkPwd.me',
					data : {usersPwd : cpwd.value},
					success : data => {
						console.log(data);
						if(data == 'no'){
							check[2].style.display = 'block';
							check[2].style.color = 'red';
							check[2].innerText = '현재 비밀번호가 일치하지 않습니다.';
						} else {
							check[2].style.display = 'none';
							if(check[3].innerText == '비밀번호가 일치합니다.'){
								$.ajax({
									type : 'POST',
									url : '${contextPath}/myPage_UpdatePwd.me',
									data : {newPw : npwd.value, usersId : id.value},
									success : data => {
										if(data == 'yes'){
											swal({
												 text: "비밀번호가 변경되었습니다.",
												 icon: "success",
												 button: "확인"
											}).then(function() {
										        location.reload();
										    });;
											return true;
										} else if(data == 'no')  {
											swal({
												 text: "비밀번호를 다시 확인해주세요.",
												 icon: "error",
												 button: "확인"
											}).then(function() {
												fpwd.focus();
											});
											return false;
										}
									},
									error : data => {
										console.log(data);
									}
								});
							} else {
								swal({
									 text: "비밀번호를 다시 확인해주세욤.",
									 icon: "error",
									 button: "확인"
								}).then(function() {
									fpwd.focus();
								});
							}
						}
					},
					error : data => {
						console.log(data);
					}
				});
			}
		})
		
		// 비밀번호 정규표현식
		npwd.onkeyup = () => {
		  const checkEng = /[a-zA-Z]/;
		  const checkNum = /[0-9]/;
		  const checkSpecial = /[@$!%*#?^=+`~&]/;
		  
		  const eng = document.getElementById('eng');
		  const num = document.getElementById('num');
		  const more8 = document.getElementById('more8');
		  const special = document.getElementById('special');
		  
		  eng.style.color = checkEng.test(npwd.value) ? '#8bb572' : '';
		  eng.innerHTML =  checkEng.test(npwd.value) ? '<i class="bi bi-check-circle"></i> 영어' : '<i class="bi bi-circle"></i> 영어';
	
		  num.style.color = checkNum.test(npwd.value) ? '#8bb572' : '';
		  num.innerHTML = checkNum.test(npwd.value) ? '<i class="bi bi-check-circle"></i> 숫자' : '<i class="bi bi-circle"></i> 숫자';
		  
		  more8.style.color = npwd.value.length >= 8 ? '#8bb572' : '';
		  more8.innerHTML = npwd.value.length >= 8 ? '<i class="bi bi-check-circle"></i> 8자 이상' : '<i class="bi bi-circle"></i> 8자 이상';
		  
		  special.style.color = checkSpecial.test(npwd.value) ? '#8bb572' : '';
		  special.innerHTML = checkSpecial.test(npwd.value) ? '<i class="bi bi-check-circle"></i> 특수문자' : '<i class="bi bi-circle"></i> 특수문자';
		};
	
		npwd.addEventListener('focusout', ()=>{
			const regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?^=+`~&])[A-Za-z\d@$!%*#?^=+`~&]{8,}$/;
// 			const regPwd = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
			
			if(npwd.value.length > 0){
				if(!regPwd.test(npwd.value)){
					swal({
						 text: "비밀번호는 영어와 숫자, 특수문자를 포함해 8자리 이상이어야 합니다.",
						 icon: "error",
						 button: "확인",
						});
					document.getElementById('npwd').value = '';
					document.getElementById('npwd').focus();
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
		});
		
		// 닉네임 중복확인
		nickCheck.addEventListener('click', () => {
			if(nickName.value == ''){
				swal({
					 text: "닉네임을 입력해주세요.",
					 icon: "error",
					 button: "확인"
				});
			} else {
				$.ajax({
					url : '${contextPath}/checkNickName.en',
					data : {nickName : nickName.value},
					success : data => {
						console.log(data);
						if(data == 'yes'){
							check[0].style.display = 'block';
							check[0].style.color = 'green';
							check[0].innerText = '사용가능한 닉네임입니다.';
						} else {
							check[0].style.display = 'block';
							check[0].style.color = 'red';
							check[0].innerText = '중복되는 닉네임입니다.';
						}
					}
				});
			}
		});
		
		// 이메일 중복확인
		emailCheck.addEventListener('click', () => {
			if(email.value == ''){
				swal({
					 text: "이메일을 입력해주세요.",
					 icon: "error",
					 button: "확인"
				});
			} else {
				$.ajax({
					url : '${contextPath}/checkEmail.en',
					data : {email : email.value},
					success : data => {
						console.log(data);
						if(data == 'yes'){
							check[1].style.display = 'block';
							check[1].style.color = 'green';
							check[1].innerText = '사용가능한 이메일입니다.';
						} else {
							check[1].style.display = 'block';
							check[1].style.color = 'red';
							check[1].innerText = '중복되는 이메일입니다.';
						}
					}
				});
			}
		});
		
		btn.addEventListener('click', () => {
			const phoneInput = document.getElementById("phone");
			const phoneNumber = phoneInput.value;
	    	const regex = /[0-9]/;
	    	
	    	if (!regex.test(phoneNumber)) {
	    		swal({
					 text: "숫자만 입력해주세요.",
					 icon: "error",
					 button: "확인"
				}).then(function() {
					phoneInput.focus();
			    });
			} else if((check[0].innerText == '' || check[1].innerText == '') || (check[0].style.color == 'green' || check[1].style.color == 'green') && (check[0].style.color != 'red' && check[1].style.color != 'red')){
				$.ajax({
					type : 'POST',
					url : '${ contextPath }/myPage_UpdateInfo.me',
					data : {
							usersId : id.value,
							email : email.value, 
							nickName : nickName.value,
							phone : phone.value
						},
					success : data => {
						console.log(data);
						if(data == 'yes'){
							swal({
								 text: "정보수정이 완료되었습니다.",
								 icon: "success",
								 button: "확인"
							}).then(function() {
						        location.reload();
						    });;
						} else if(data == 'no')  {
							swal({
								 text: "정보를 다시 확인해주세요.",
								 icon: "error",
								 button: "확인"
							});
							return false;
						}
					},
					error : data => {
						console.log(data);
					}
				});
			} else {
				swal({
					 text: "정보를 다시 확인해주세요.",
					 icon: "error",
					 button: "확인"
				});
			}
		});
		
		const deleteBtn = document.getElementById('deleteBtn');
		
		deleteBtn.addEventListener('click', () => {
			swal({
				 title: "정말 홀로세끼를 떠나시나요?",
				 text: "* 회원 탈퇴 시 보유하신 적립금과 포인트는 소멸합니다.",
				 icon: "warning",
				 closeOnClickOutside: false,
				 closeOnEsc : false,
				 buttons : {
					 cancle : {
						 text : '나중에 하기',
						 value : true
					 },
					 confirm : {
						 text : '탈퇴하기',
						 value : false,
						 className : 'deleteB'
					 }
				 }
			}).then((result) => {
				if(result){
					swal('잘 생각하셨습니다!', '', 'success', {
						closeOnClickOutside : false,
						button : '확인'
					});
				} else {
					swal('탈퇴를 진행합니다', '안녕히가세요', 'warning', {
						closeOnClickOutside : false,
						button : '확인'
					}).then((result) => {
						if(result){
							location.href = '${contextPath}/myPage_deleteInfo.me?usersNo=${loginUser.usersNo}';
						}
					});
				}
			});
		});
		
	</script>
</body>
</html>
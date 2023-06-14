<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	body{background: #B0DAFF;}	
/* 	#mask{width: 100%; height: 100%; position: absolute; z-index:9000; display:none; background: red;} */
	.form-line{
		width: 600px; height: 840px;
		border: 5px solid white;
		border-radius: 45px; 
		margin-left: auto; margin-right: auto; margin-top: 100px; margin-bottom: 100px;
		}
	.form-dot{
		width: 580px; height: 820px;
		border: 5px dotted white;
		border-radius: 40px;
		margin: 5px;
		}
	.join-form{
		width: 560px; height: 795px;
		background: white;
		border-radius: 30px;
		margin: 0 auto; margin-top: 12px;
		}
	.mid{
		display: flex; justify-content: center;  
		font-size: 18px; color: #1f8acb; font-weight: bold;
		}
	.join{
		font-size: 25px; font-weight: bold;
		margin: 10px; margin-top: 100px;
		color: #1f8acb;
		}
	.join-line{
		width: 140px; height: 120px;
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
	.mid22{margin: 0 auto;}
	.button{
		width: 150px; height: 50px;
		border-radius: 25px; border: 2px solid black;
		font-size: 20px; font-weight: bold;
		margin-top: 20px; margin-bottom: 50px; margin-left: 130px;
		background: #f0f0f0;
		box-shadow: 0px 5px 0px black;
		cursor: pointer;
		}
	.button:active{box-shadow: 0px 1px 0px black; transform: translateY(5px); background: #b0daff;}
	
	.logincheck{font-size: 13px; margin-top: -15px;}
	.logincheck:hover{text-decoration: underline; cursor: pointer;}
	
	.find{display: flex; justify-content: center; font-size: 16px;}
	.find2{cursor: pointer; margin-right: 8px; margin-left: 8px; text-decoration: underline;}
	
	.socialLogin-btn{text-align: center; margin-top: 50px;}
	.kakao-login-btn{margin-bottom: 30px;}
</style>
</head>
<body>
	<div id="mask"></div>
	<div id="loading">
        <img src="${ contextPath }/resources/images/Spinner.gif">    
    </div>

	<div class="outline">
		<div class="form-line">
			<div class="form-dot">
				<div class="join-form">
					<div class="mid">
						<div class="join-line"></div>
						<div class="join">로그인</div>
						<div class="join-line"></div>
					</div>
					<br>
					<div class="mid">
						<div class="mid22">
							<form class="form" action="loginCheck.en" method="post">
								<label class="label">아이디</label><br>
								<input type="text" name="usersId" id="id" class="input" placeholder="아이디를 입력하세요" required><br>
								<label class="label">비밀번호</label><br>
								<input type="password" name="usersPw" id="pwd" class="input" placeholder="비밀번호를 입력하세요" required><br>
								<div><button class="button">로그인</button></div>
	
								<div class="find">
									<div class="find2" onclick="location.href='${contextPath}/findId.en'">ID 찾기</div>
									<div class="find2" onclick="location.href='${contextPath}/findPwd.en'">비밀번호 찾기</div>
								</div>
								<div class="line"></div>
								<div class="logincheck" onclick="location.href='${contextPath}/join.en'"> 아직 홀로세끼 계정이 없으신가요? SIGN IN</div>
							</form>
							
							<div class="socialLogin-btn">
								<div id="kakaoLogin">  
								    <a id="kakao-login-btn"></a>
								</div>
								<div id="naver_id_login"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> <!-- 카카오 간편로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> <!-- 네이버 간편로그인 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ contextPath }/resources/js/loadingoverlay.min.js"></script>
<script>
	$(document).ready(function(){
		$("#loading").hide();
	})

	Kakao.init('7bce9522ff9d4cff75ab0ce48d2ba440'); // javascript키를 사용
// 	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
	//카카오로그인
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
          
          Kakao.API.request({
              url: '/v2/user/me',
              success: data=>{
//                   console.log(data);
//                   console.log(data.id);							//2827339121
//                   console.log(data.kakao_account);
//                   console.log(data.properties.nickname);			//정흠
//                   console.log(data.kakao_account.email);			//sk6522@hanmail.net
//                   console.log(data.properties.profile_image);	//http://k.kakaocdn.net/dn/KMVzH/btrOQyPkSGp/6psjYBhYIgREkghu0yVwK0/img_640x640.jpg
				$("#loading").show();
	
                  $.ajax({
                    url:"kakaoLogin.en",
                    data:{"id":data.id, 
                    	  "name": data.properties.nickname, 
                    	  "email": data.kakao_account.email,
                    	  "profileImg": data.properties.profile_image}, 
                    Type:"post",
                    success: data=>{
                        location.href="${contextPath}/home.do";
                    }
                 });
              },
              fail: data=>{
                 console.log(data);
              }
          });
      },
      fail: data=>{
    	  console.log(data);
      }
    });

	// 네이버 로그인
  	var naverLogin = new naver_id_login("TNwmPDnti1AIGrKuJLCM", "http://localhost:8084/hollosekki/login.en");
  	var state = naverLogin.getUniqState();
  	naverLogin.setButton("green", 3, 48);
  	naverLogin.setDomain("http://localhost:8084");
  	naverLogin.setState(state);
  	naverLogin.init_naver_id_login();
  	
  	$("#loading").show();
  	
	function naverSignInCallback() {
		
		const id = naverLogin.getProfileData('id');
		const name = naverLogin.getProfileData('name');
		const nickName = naverLogin.getProfileData('nickname');
		const email = naverLogin.getProfileData('email');
		const phone = naverLogin.getProfileData('mobile');
		const profileImg = naverLogin.getProfileData('profile_image');
		
		console.log(id);
		console.log(name);
		console.log(nickName);
		console.log(email);
		console.log(phone);
		console.log(profileImg);
		
		$("#loading").show();
		
		$.ajax({
			url:"naverLogin.en",
			data: { "id":id,
					"name":name,
					"nickName":nickName,
					"email":email,
					"phone":phone,
					"profileImg":profileImg,
			},
			type:"post",
			success: data=>{
				console.log(1);
				location.href="${contextPath}/home.do";
			},
			error: data=>{
				console.log(data);
			}
		})
	}

 	// 네이버 사용자 프로필 조회 ???
	naverLogin.get_naver_userprofile("naverSignInCallback()");
	
	
</script>
</html>
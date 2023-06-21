<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#up{width: 60px; display: block; border-radius: 100%; margin: 0px auto;}
	.right{display: inline-block; text-align: left;}		
	.out{
		background: #B0DAFF;
		width: 1200px; height: 220px;
		margin: 0 auto;
		border-top-left-radius: 20px; border-top-right-radius: 20px;
		}
	.out22{ /*가로로 정렬...*/
		display: flex; 
		justify-content: center;
		align-items : center;
		}
	.out33{padding-top: 50px; padding-left: 20px; padding-right: 20px;}
	.large{font-size: 20px; color: white; font-weight: bold;}
	.img-center{text-align: center; margin-bottom: 5px;}
	.kakao-img{border-radius: 50%; width: 35px; cursor: pointer;}
</style>
</head>
<body>
	<div class="right" id="upToTop" style="position: fixed; bottom: 150px; right: 8%;">
 		<img class="up" src="resources/images/uptotop.png" onmouseover="this.src='resources/images/uptotop2.png'" onmouseout="this.src='resources/images/uptotop.png'" id="up">
  	</div>
	<div class="out">	
		<div class="out22">
			<div class="out33">
				<div class="large">고객만족센터</div>
				<div class="large">1234-5678</div>
				<div>평일 : 09:00 ~ 17:00</div>
				<div>점심시간 12:00 ~ 13:00</div>
			</div>
			<div class="out33">
				<div>(주)홀로세끼 | 대표 : 박신우</div>
				<div>사업자등록번호 : 123-15-342-7892</div>
				<div>통신판매업신고 : 제 - 2023 - 서울 -121</div>
				<div>본사 | 서울 중구 남대문로1 KH정보교육</div>
			</div>
			<div class="out33">
			
				<div class="img-center" id="add-channel-button" onclick="location.href='javascript:addChannel()'"><img class="kakao-img" src="resources/images/kakao.png" ></div>
				<div style="font-size: 14px;">카카오톡 채널 문의</div>
			</div>
		</div>
		<br>
		<div style="color:white; text-align: center; font-weight: bold;">Copyright (C) 2023 HOLLO. All Rights Reserved</div>
	</div>
<script>	
	var upToTop = () => {
		let up = document.getElementById('up');
			window.addEventListener('scroll', () => {
				if (document.querySelector('html').scrollTop > 15) {
				up.style.display = "block";
		   		} else {
		      	up.style.display = "none";
		   		}
		  	})
			
			up.addEventListener('click', () => {
		    	window.scrollTo({ top: 0, left: 0, behavior: 'smooth' })
			})
		};
		upToTop();
</script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
  integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
<script>
  Kakao.init('7bce9522ff9d4cff75ab0ce48d2ba440'); // 사용하려는 앱의 JavaScript 키 입력

  function addChannel() {
    Kakao.Channel.chat({
  	  channelPublicId: '_DeFxoxj' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
  	});
    
//     Kakao.Channel.addChannel({
//         channelPublicId: '_DeFxoxj',
// 	});
  }
</script>

</body>
</html>
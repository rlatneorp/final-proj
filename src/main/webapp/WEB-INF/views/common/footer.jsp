<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.out{
		background: #B0DAFF;
		width: 1200px; height: 200px;
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
	#up{width: 64px; display: block; border-radius: 100%; margin: 0px auto;}
	.right{display: inline-block; text-align: left;}		
</style>
</head>
<body>
	<div class="out">	
		<div class="out22">
			<div class="out33">
				<div class="large">고객만족센터</div>
				<div class="large">1234-5678</div>
				<div>09:00 ~ 17 : 00</div>
				<div>점심시간 12:00 ~ 13:00</div>
			</div>
			<div class="out33">
				<div>(주) ㅎㄹㅆㄲ | 대표 : 박신우</div>
				<div>사업자등록번호 : 123-15-342-7892</div>
				<div>통신판매업신고 : 제 - 2023 - 서울 -121</div>
				<div>본사 서울 중구 남대문로1 KH정보교육</div>
			</div>
			<div class="out33">
				<div>카카오톡 채널 문의</div>
				<div></div>
			</div>
		</div>
		<br>
		<div style="color:white; text-align: center; font-weight: bold;">Copyright (C) 2023 HOLLO. All Rights Reserved</div>
	</div>
	<div class="right" id="upToTop" style="position: fixed; bottom: 150px; right: 15%;">
 		<img class="up" src="resources/image/uptotop.png" onmouseover="this.src='resources/images/uptotop2.png'" onmouseout="this.src='resources/images/uptotop.png'" id="up">
  	</div>
<script>	
	var upToTop = () => {
		let up = document.getElementById('up');
			window.addEventListener('scroll', () => {
				if (document.querySelector('html').scrollTop > 10) {
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
</body>
</html>
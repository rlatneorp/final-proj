<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 프로필</title>
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
	.profile-img-container {
        width: 50%;
        margin-left: 230px;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
    }

    .profile-img-container img {
        max-width: 100%;
        max-height: 225px;
        border-radius: 50%;
        cursor: pointer;
    }
    #base{
    	border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 100px; height: 40px;
		background: #B0DAFF;
		margin-left: 360px;
    }
    #base:active{
		box-shadow: 0px 1px 0px black; transform: translateY(5px);
		background: #B0DAFF;
	}
	#profileImg{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 90px; height: 40px;
		background: #B0DAFF;
	}
	#profileImg:active{
		box-shadow: 0px 1px 0px black; transform: translateY(5px);
		background: #B0DAFF;
	}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">마이페이지</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br>
				<label class="profile">프로필 수정</label><br><br>
				<form action="${ contextPath }/myPage_UpdateProfile.me">
				<input type="hidden" name="usersNo" value="${ loginUser.usersNo }">
				<div class="profile-img-container">
					<img style="width: 50%;" src="resources/images/persons.png" id="pImg"/>
				</div>
				<div style="display: flex;">
					<button id="base" onclick="setBaseImage()" type="button">기본 이미지</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="profileImg" type="button">파일 선택</button>
					<input id="fileInput" type="file" style="display: none;" accept="image/*" name="file">
				</div>
				<br>
				<br><br>
				<button id="btn" type="submit">수정하기</button>
				</form>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		document.getElementById('profileImg').addEventListener('click', function() {
		    document.getElementById('fileInput').click();
		});
	
		// 파일 선택 시 이미지 업데이트 처리
		document.getElementById('fileInput').addEventListener('change', function(e) {
		    const file = e.target.files[0];
		    
		    if(file){
			    const reader = new FileReader();
		
			    reader.onload = function(e) {
			        document.getElementById('pImg').src = e.target.result;
			    };
		
		    reader.readAsDataURL(file);
		    }
		});
		
		function profile() {
			document.getElementById('pImg').src = "resources/images/persons.png";
		}
		
		function setBaseImage() {
			const fileInput = document.getElementById('fileInput');
			const baseImage = document.getElementById('profileImg');

			fileInput.value = '';
			baseImage.src = 'resources/images/persons.png';
		}
		
		const baseBtn = document.getElementById('base');
		
		baseBtn.addEventListener('click', () => {
			profile();
		});
	</script>
</body>
</html>
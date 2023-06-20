<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>마이페이지</title>
<style>
	.arrow1{
		font-size: 30px; color: black;
  		margin-bottom: 10px;
		vertical-align: middle;
	}
	.content{
		display: inline-block;
		width: 990px; height: 700px; vertical-align: top;
	}
	.nameBar{
		border: none; height: 180px;
		background: rgba(224, 224, 224, 0.74);
		display: flex; justify-content: center; align-items: center;
	}
	.name{
		width: 170px; height: 170px; border-radius: 15px;
		background: white; text-align: center;
		margin: 70px; display: inline-block;
	}
	#mbtn{
		width: 130px; height: 40px; border-radius: 10px;
		border: none; font-weight: bold; font-size: 17px;
		margin-bottom: 10px;
	}
	.service{
		font-weight: bold; font-size: 16px;
	}
	.dollars{
		color: rgb(241, 196, 15); font-size: 35px;
	}
	.profile{
		font-size: 26px; font-weight: bold;
		margin-left: 20px;
	}
	.sub{
		margin-left: 25px;
	}
	.moveBtn{
		width: 80px; height: 33px;
		border: 2px solid black;
		border-radius: 20px;
		box-shadow: 0px 5px black;
		background: white;
	}
	.moveBtn:active{
		box-shadow: 0px 1px 0px black; transform: translateY(5px);
		background: #B0DAFF;
	}
	.follow{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 60px; height: 30px;
		background: #B0DAFF;
	}
	#modal{
		border: 1px solid black; width: 500px; height: 600px;
		border-radius: 15px; margin: 0 auto;
	}
	.modal-header{background: #B0DAFF;}
	#following{
		width: 500px; height: 600px;
		margin-left: 750px;
	}
	.followName{
		font-size: 17px; font-weight: bold;
		margin-right: 200px;
	}
	.modalFollow{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 60px; height: 30px;
		background: rgba(224, 224, 224, 0.29);
		color: rgba(231, 76, 60, 0.86);
	}
	.modalFollower{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 60px; height: 30px;
		background: #B0DAFF;
	}
	#follower{
		width: 500px; height: 600px;
		margin-left: 750px;
	}
    #text{
    	margin: 0 auto;
    	font-size: 15px; width: 600px; 
    	background: white; text-align: center;
    }
    #texta{
    	margin: 0 auto;
    	font-size: 15px; width: 600px; 
    	background: white; text-align: center;
    }
    #texta:hover{textdecoration: underline; cursor: pointer;}
    #modalP{
    	width: 150px;
  		height: 150px;
        border-radius: 50%;
        cursor: pointer;
        object-fit: cover; object-position: center;
    }
    .base{
    	border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 80px; height: 40px;
		background: #B0DAFF;
		margin-left: 35px; margin-top: 10px;
    }
    #pImg{
    	width: 150px; height: 150px;
    	border-radius: 50%;
    	margin-left: 395px;
    	margin-bottom: 10px;
    	object-fit: cover; object-position: center;
    }
    #editB{
    	width: 80px; height: 40px;
    	border: 1px solid gray; background: white;
    	border-radius: 5px;
    }
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- 서머노트를 위해 추가해야할 부분 -->
	<script src="resources/summernotes/summernote-lite.js"></script>
	<script src="resources/summernotes/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/summernotes/summernote-lite.css">
	
	<div id="Div">
		<div class="myPageDiv">
			<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">마이페이지</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br>
				<div class="nameBar">
					<div class="name">
						<br>
						<p style="font-size: 26px; font-weight: bold; color: rgb(52, 152, 219);">${ loginUser.usersName }님</p>
						<button id="mbtn" onclick="location.href='${contextPath}/attendance_Check.ma'">출석하기</button><br>
						<button class="follow" data-bs-toggle="modal" data-bs-target="#following">팔로잉</button>
						<button class="follow" data-bs-toggle="modal" data-bs-target="#follower">팔로워</button>
					</div>
					<div class="name">
						<br>
						<a style="font-size: 26px; font-weight: bold; color: rgb(52, 152, 219); margin-left: 10px;" href="${ contextPath }/askBoard.cs">고객센터
						<span class="material-symbols-outlined arrow1">
						chevron_right
						</span></a><br><br>
						<p class="service">자주 묻는 질문</p>
						<p class="service">1:1문의</p>
					</div>
					<div class="name">
						<br>
						<a style="font-size: 26px; font-weight: bold; color: rgb(52, 152, 219); margin-left: 10px;">포인트
						<span class="material-symbols-outlined arrow1">
						chevron_right
						</span></a><br>
						<table style="margin-left: 10px;">
						<tr>
						<td>
						<i class="bi bi-currency-dollar dollars"></i>
						</td>
						<td style="font-size: 18px; color: rgb(52, 152, 219);"><p class="d-inline" id="myP">P</p></td>
						</tr>
						</table>
						<p style="font-size: 13px;">소멸 예정 포인트 0원</p>
					</div>
				</div>
				<br>
				<i class="bi bi-gear-fill" style="margin-left: 580px; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#profileModal"></i>
				<br>
				<c:if test="${ !fn:contains(loginUser.usersPw, '$2a$')}">
					<c:if test="${ image == null }">
						<img src="${ socialUser.socialProfileImg }" id="pImg">
					</c:if>
					<c:if test="${ image != null and image.imageType == '1' }">
						<img src="${ contextPath }/resources/uploadFiles/${ image.imageRenameName }" id="pImg" onerror="this.src='${ socialUser.socialProfileImg }';"/>
					</c:if>
				</c:if>
				<c:if test="${ fn:contains(loginUser.usersPw, '$2a$')}">
					<c:if test="${ image == null }">
						<img src="https://botsitivity.org/static/media/noprofile.c3f94521.png" id="pImg"/>
					</c:if>
					<c:if test="${ image != null and image.imageType == '1' }">
						<img src="${ contextPath }/resources/uploadFiles/${ image.imageRenameName }" onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';" id="pImg"/>
					</c:if>
				</c:if>
				<p style="font-size: 20px; font-weight: bold; margin-left: 440px;">${ loginUser.usersName }</p>
				<c:if test="${ empty loginUser.usersSelfIntro }">
					<div id="texta" data-bs-toggle="modal" data-bs-target="#profileModal"><i class="bi bi-pencil-fill"></i>&nbsp;자기소개를 등록해보세요!</div>
				</c:if>
				<c:if test="${ !empty loginUser.usersSelfIntro }">
					<div id="text">${ loginUser.usersSelfIntro }</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="modal fade" id="following" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로잉  0명</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">강건강</label>
					<button class="modalFollow">언팔로우</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="follower" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로워  0명</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
					<img src="resources/images/persons.png"/><label class="followName">남나눔</label>
					<button class="modalFollower">팔로우</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 800px; margin-left: 600px;">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">프로필 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<c:if test="${ image == null }">
					<form action="myPage_InsertProfile.me" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<c:if test="${ !fn:contains(loginUser.usersPw, '$2a$')}">
							<img src="${ socialUser.socialProfileImg }" id="modalP" onerror="this.src='${ socialUser.socialProfileImg }';">
						</c:if>
						<c:if test="${ fn:contains(loginUser.usersPw, '$2a$')}">
							<img id="modalP" src="https://botsitivity.org/static/media/noprofile.c3f94521.png"/>
						</c:if>
						<input id="fileInput" type="file" style="display: none;" accept="image/*" name="file">
						<br>
						<button class="base" type="button">기본 이미지</button>
						<br><br><hr><br>
						<p style="font-size: 18px; font-weight: bold; margin-left: 10px;">자기소개</p>
						<textarea class="summernote" name="usersSelfIntro">${ loginUser.usersSelfIntro }</textarea>
						<input type="hidden" name="usersNo" value="${ loginUser.usersNo }">
					</div>
					<div class="modal-footer">
						<div data-bs-dismiss="modal"><button id="editB">수정하기</button></div>
					</div>
					</form>
				</c:if>
				<c:if test="${ image != null and image.imageType == '1' }">
					<form action="myPage_UpdateProfile.me" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<c:if test="${ !fn:contains(loginUser.usersPw, '$2a$')}">
							<img src="${ contextPath }/resources/uploadFiles/${ image.imageRenameName }" id="modalP" onerror="this.src='${ socialUser.socialProfileImg }';">
						</c:if>
						<c:if test="${ fn:contains(loginUser.usersPw, '$2a$')}">
							<img id="modalP" src="${ contextPath }/resources/uploadFiles/${ image.imageRenameName }" onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"/>
						</c:if>
						<input id="fileInput" type="file" style="display: none;" accept="image/*" name="file">
						<br>
						<button class="base" type="button">기본 이미지</button>
						<br><br><hr><br>
						<p style="font-size: 18px; font-weight: bold; margin-left: 10px;">자기소개</p>
						<textarea class="summernote" name="usersSelfIntro">${ loginUser.usersSelfIntro }</textarea>
						<input type="hidden" name="usersNo" value="${ loginUser.usersNo }">
					</div>
					<div class="modal-footer">
						<div data-bs-dismiss="modal"><button id="editB">수정하기</button></div>
					</div>
					</form>
				</c:if>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		// 썸머노트
		$('.summernote').summernote({
			width: 750,
			height: 100,
			lang: "ko-KR",
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['link']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			disableResize: true,
		    disableResizeEditor: true,
		    resize: false
		});
		
		const profile = document.getElementById('modalP');
		const fileInput = document.getElementById('fileInput');
		
		// 파일선택
		profile.addEventListener('click', () => {
			fileInput.click();
		});
		
		// 선택한 이미지로 변경
		fileInput.addEventListener('change', function(e) {
		    const file = e.target.files[0];
		    
		    if(file){
			    const reader = new FileReader();
		
			    reader.onload = function(e) {
			    	profile.src = e.target.result;
			    };
		
		    reader.readAsDataURL(file);
		    }
		});
		
		// 기본이미지
		function profileImg() {
			const file = fileInput.files[0];

			  if (file) {
			    const reader = new FileReader();

			    reader.onload = function(e) {
			      profile.src = e.target.result;
			    };

			    reader.readAsDataURL(file);
			  } else {
				  $.ajax({
					type : 'POST',
					url : '${contextPath}/myPage_DeleteImage.me',
					data : {usersNo : ${loginUser.usersNo}},
					success : data => {
						console.log(data);
						if(data == 'yes'){
							profile.src = "https://botsitivity.org/static/media/noprofile.c3f94521.png";
						} else {
							console.log('nop');
						}
					},
					error : data => {
						console.log("실패");
					}
				});
			    
			  }
		}
		
		const baseBtn = document.getElementsByClassName('base')[1];
		const kakaoBtn = document.getElementsByClassName('base')[0];
		
		if(baseBtn){
			baseBtn.addEventListener('click', () => {
				fileInput.value = null;
				profileImg();
			});
		}
		
		if(kakaoBtn){
			kakaoBtn.addEventListener('click', () => {
				fileInput.value = null;
				
				const file = fileInput.files[0];
	
				  if (file) {
				    const reader = new FileReader();
	
				    reader.onload = function(e) {
				      profile.src = e.target.result;
				    };
	
				    reader.readAsDataURL(file);
				  } else {
					  $.ajax({
						type : 'POST',
						url : '${contextPath}/myPage_DeleteImage.me',
						data : {usersNo : ${loginUser.usersNo}},
						success : data => {
							console.log(data);
							if(data == 'yes'){
								profile.src = "${ socialUser.socialProfileImg }";
							} else {
								console.log('nop');
							}
						},
						error : data => {
							console.log("실패");
						}
					});
				    
				  }
			});
		}
		
		var loginUser = '${loginUser}';
		if(loginUser != ''){
			$.ajax({
				url: 'point.ma',
				success: function(info){
					console.log(info);
					let myP = document.querySelector('#myP');
					myP.innerHTML = info.point;
				}
				
			});
		}
	</script>
</body>
</html> 

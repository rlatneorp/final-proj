<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>마이페이지</title>
<style>
	#dropdownMenu2{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

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
		cursor: pointer;
		text-decoration: none;
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
	.followDiv{display: flex; justify-content: center;}
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
	.followName{
		font-size: 17px; font-weight: bold;
		width:100px; margin-top: 10px; margin-left: 10px;
		cursor: pointer;
	}
	.modalFollow{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 11.5px;
		width: 60px; height: 30px;
		color: white;
		background: rgba(231, 76, 60, 0.8);
		transform: scale(1.2);
		margin-left: 200px;
		margin-top: 10px;
	}
	.modalFollower{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 60px; height: 30px;
		background: #B0DAFF;
		transform: scale(1.2);
		margin-left: 200px;
		margin-top: 10px;
	}
    .modalFollow:hover {
	    border: 1px #C6C6C6 solid;
	    box-shadow: 1px 1px 1px #EAEAEA;
	    color: white;
	    background: rgba(231, 76, 60, 0.9);
	}
	
	.modalFollow:active {
	    box-shadow: inset 1px 1px 1px #DFDFDF;   
	}
    .modalFollower:hover {
	    border: 1px #C6C6C6 solid;
	    box-shadow: 1px 1px 1px #EAEAEA;
	    color: #333333;
	    background: #8bc4f7;
	}
	
	.modalFollower:active {
	    box-shadow: inset 1px 1px 1px #DFDFDF;   
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
        border: 2px solid gray;
    }
    .base{
    	border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 80px; height: 40px;
		background: #B0DAFF;
		margin-left: 35px; margin-top: 10px;
    }
    #base{
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
    	border: 2px solid gray;
    }
    #editB{
    	width: 80px; height: 40px;
    	border: 1px solid gray; background: white;
    	border-radius: 5px;
    }
    .followImage{
    	width: 50px; height: 50px;
    	border-radius: 50%;
    	border: 2px solid gray;
    	object-fit: cover; object-position: center;
    }
    #center{
    	font-size: 26px; font-weight: bold; 
    	color: rgb(52, 152, 219); margin-left: 10px;
    }
    #center:hover{text-decoration: none;}
    #point{
    	font-size: 26px; font-weight: bold; 
    	color: rgb(52, 152, 219); margin-left: 10px;
    }
    #point:hover{text-decoration: none;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br>
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
						<a id="center" href="${ contextPath }/noticeBoard.cs">고객센터
						<span class="material-symbols-outlined arrow1">
						chevron_right
						</span></a><br><br>
						<a class="service d-block" href="${ contextPath }/faqBoard.cs">자주 묻는 질문</a>
						<a class="service" href="${ contextPath }/personalBoard.cs">1:1문의</a>
					</div>
					<div class="name">
						<br>
						<a id="point" href="${ contextPath }/myPage_Point.me">포인트
						<span class="material-symbols-outlined arrow1">
						chevron_right
						</span></a><br>
						<table style="margin-left: 10px;">
							<tr>
								<td>
									<i class="bi bi-currency-dollar dollars"></i>
								</td>
								<td style="font-size: 18px; color: rgb(52, 152, 219);">
									<p class="d-inline" id="myP" style="font-weight: bold;">&nbsp;<fmt:formatNumber pattern="###,###,###">${ loginUser.point }</fmt:formatNumber> P</p>
								</td>
							</tr>
						</table>
						<p style="font-size: 13px;">소멸 예정 포인트 0원</p>
					</div>
				</div>
				<br>
				<i class="bi bi-gear-fill" style="margin-left: 580px; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#profileModal"></i>
				<br>
				<c:if test="${ fn:contains(loginUser.usersPw, '$2a$')}">
					<c:if test="${ empty loginUser.imageRenameName }">
						<img src="https://botsitivity.org/static/media/noprofile.c3f94521.png" id="pImg"/>
					</c:if>
					<c:if test="${ !empty loginUser.imageRenameName }">
						<img src="${ contextPath }/resources/uploadFiles/${ loginUser.imageRenameName }" id="pImg"/>
					</c:if>
				</c:if>
				<c:if test="${ !fn:contains(loginUser.usersPw, '$2a$')}">
					<c:if test="${ empty loginUser.imageRenameName }">
						<img src="${ loginUser.socialProfileImg }" id="pImg">
					</c:if>
					<c:if test="${ !empty loginUser.imageRenameName }">
						<img src="${ contextPath }/resources/uploadFiles/${ loginUser.imageRenameName }" id="pImg"/>
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
	<div class="modal fade" id="following" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로잉  ${ following }명</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<c:if test="${ following eq 0 }">
						<div style="justify-content: center; margin-top: 30px; margin-bottom: 80px; text-align: center;">
							<a style="font-size: 80px; margin: 10px; color:gray;"><i class="fa-solid fa-face-surprise"></i></a><br>
							<a>팔로잉이 없습니다</a>
						</div>
					</c:if>
					<c:if test="${ following ne 0 }">
						<c:forEach items="${followingList}" var="f">
						    <div class="followDiv">
						    	<div onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${f.USERS_ID}' + '&uNo=' + '${ f.FOLLOWING_USER_NO }' + '&page=' + '${page}'" style="cursor: pointer;">
						    		<c:if test="${ fn:contains(f.USERS_PW, '$2a$') }">
						    			<c:if test="${ empty f.IMAGE_RENAMENAME }">
						    				<img src="https://botsitivity.org/static/media/noprofile.c3f94521.png" class="followImage"/>
										</c:if>
										<c:if test="${ !empty f.IMAGE_RENAMENAME }">
											<img src="${contextPath}/resources/uploadFiles/${f.IMAGE_RENAMENAME}" class="followImage"/>
										</c:if>
						    		</c:if>
						    		<c:if test="${ !fn:contains(f.USERS_PW, '$2a$') }">
						    			<c:if test="${ empty f.IMAGE_RENAMENAME }">
											<img src="${f.SOCIAL_PROFILE_IMG}" class="followImage"/>
										</c:if>
										<c:if test="${ !empty f.IMAGE_RENAMENAME }">
											<img src="${contextPath}/resources/uploadFiles/${f.IMAGE_RENAMENAME}" class="followImage"/>
										</c:if>
						    		</c:if>
							    	<input type="hidden" value="${ f.FOLLOWING_USER_NO }" class="followingsNo">
							    	<label class="followName">${f.NICKNAME}</label>
						    	</div>
						    	<div class="unfollowDiv" data-user-no="${f.FOLLOWING_USER_NO}"><button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button></div>
						    </div><br>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="follower" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로워  ${ follower }명</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<c:if test="${ follower eq 0 }">
						<div style="justify-content: center; margin-top: 30px; margin-bottom: 80px; text-align: center;">
							<a style="font-size: 80px; margin: 10px; color:gray;"><i class="fa-solid fa-face-surprise"></i></a><br>
							<a>팔로워가 없습니다</a>
						</div>
					</c:if>
					<c:if test="${ follower ne 0 }">
						<c:forEach items="${followerList}" var="f">
							<div class="followDiv">
								<div onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${f.USERS_ID}' + '&uNo=' + '${ f.USERS_NO }' + '&page=' + '${page}'" style="cursor: pointer;">
								    <c:if test="${ fn:contains(f.USERS_PW, '$2a$') }">
						    			<c:if test="${ empty f.IMAGE_RENAMENAME }">
						    				<img src="https://botsitivity.org/static/media/noprofile.c3f94521.png" class="followImage"/>
										</c:if>
										<c:if test="${ !empty f.IMAGE_RENAMENAME }">
											<img src="${contextPath}/resources/uploadFiles/${f.IMAGE_RENAMENAME}" class="followImage"/>
										</c:if>
						    		</c:if>
						    		<c:if test="${ !fn:contains(f.USERS_PW, '$2a$') }">
						    			<c:if test="${ empty f.IMAGE_RENAMENAME }">
											<img src="${f.SOCIAL_PROFILE_IMG}" class="followImage"/>
										</c:if>
										<c:if test="${ !empty f.IMAGE_RENAMENAME }">
											<img src="${contextPath}/resources/uploadFiles/${f.IMAGE_RENAMENAME}" class="followImage"/>
										</c:if>
						    		</c:if>
								    <input type="hidden" value="${ f.USERS_NO }" class="followersNo">
								    <label class="followName">${f.NICKNAME}</label>
							    </div>
							    <c:set var="following" value="false"/>
							    <c:forEach items="${followingList}" var="fl">
							        <c:choose>
							            <c:when test="${fl.NICKNAME eq f.NICKNAME}">
							                <c:set var="following" value="true"/>
							                <div class="unfollowDiv" data-user-no="${f.USERS_NO}"><button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button></div>
							            </c:when>
							        </c:choose>
							    </c:forEach>
							    <c:if test="${not following}">
							        <div class="unfollowDiv" data-user-no="${f.USERS_NO}"><button class="modalFollower" onclick="followUser(this)">팔로우</button></div>
							    </c:if>
						    </div>
						    <br>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width: 800px; margin-left: 600px;" data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">프로필 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<c:if test="${ empty loginUser.imageRenameName }">
					<form action="myPage_InsertProfile.me" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<c:if test="${ !fn:contains(loginUser.usersPw, '$2a$')}">
							<img src="${ loginUser.socialProfileImg }" id="modalP">
						</c:if>
						<c:if test="${ fn:contains(loginUser.usersPw, '$2a$')}">
							<img id="modalP" src="https://botsitivity.org/static/media/noprofile.c3f94521.png"/>
						</c:if>
						<input id="fileInput" type="file" style="display: none;" accept="image/*" name="file">
						<br>
						<button type="button" id="base">기본 이미지</button>
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
				<c:if test="${ !empty loginUser.imageRenameName }">
					<form action="myPage_UpdateProfile.me" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<c:if test="${ !fn:contains(loginUser.usersPw, '$2a$')}">
							<img src="${ contextPath }/resources/uploadFiles/${ loginUser.imageRenameName }" id="modalP">
						</c:if>
						<c:if test="${ fn:contains(loginUser.usersPw, '$2a$')}">
							<img id="modalP" src="${ contextPath }/resources/uploadFiles/${ loginUser.imageRenameName }"/>
						</c:if>
						<input id="fileInput" type="file" style="display: none;" accept="image/*" name="file" value="${ loginUser.imageRenameName }">
						<br>
						<button type="button" class="base" id="delete-${ loginUser.imageRenameName }">기본 이미지</button>
						<input type="hidden" name="deletePicture" value="none">
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
		
		var loginUserP = '${loginUser.socialProfileImg}';
		
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
				  if (loginUserP) {
				      profile.src = loginUserP;
				    } else {
				      profile.src = "https://botsitivity.org/static/media/noprofile.c3f94521.png";
				    }
			  }
		}
		
		// deletePicture name에 삭제할 이미지 넣기
		const deleteBtn = document.querySelector('.base');
		
		if(deleteBtn != null){
			deleteBtn.addEventListener('click', function() {
				profileImg();
				const nextHidden = this.nextElementSibling;
				if(nextHidden.value == 'none'){
					nextHidden.value = this.id.split('-')[1];
				} else {
					nextHidden.value = 'none';
				}
			});
		}
		
// 		var loginUser = '${loginUser}';
// 		if(loginUser != ''){
// 			$.ajax({
// 				url: 'point.ma',
// 				success: function(info){
// 					let myP = document.querySelector('#myP');
// 					myP.innerHTML = info.point + ' P';
// 				}
				
// 			});
// 		}
		
		const usersNo = ${loginUser.usersNo};
		
		// 팔로잉 모달
		// 언팔
		function unfollowUser(button) {
		  var userNo = button.parentNode.dataset.userNo;
		
		  $.ajax({
		    type: 'POST',
		    url: '${contextPath}/myPage_unFollow.me',
		    data: { usersNo: usersNo, followingNo: userNo },
		    success: function (data) {
		      console.log('언팔로우 성공');
		      if (data == 'yes') {
		        var unfollowDiv = button.parentNode;
		        unfollowDiv.innerHTML = '<button class="modalFollower" onclick="followUser(this)">팔로우</button>';
		      }
		    },
		    error: function (data) {
		      console.log('언팔로우 실패');
		    }
		  });
		}
		
		// 팔로
		function followUser(button) {
			  var userNo = button.parentNode.dataset.userNo;
			  console.log(userNo);
			  
			  $.ajax({
			    type: 'POST',
			    url: '${contextPath}/myPage_follow.me',
			    data: { usersNo: usersNo, followNo: userNo },
			    success: function (data) {
			      console.log('팔로우 성공');
			      var unfollowDiv = button.parentNode;
			      unfollowDiv.innerHTML = '<button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button>';
			    },
			    error: function (data) {
			      console.log('실패');
			    }
			  });
		}
		
		// 모달 닫을 때 새로고침
		const reload = () => {
			location.reload();
		}
		
		// 모달 X버튼
		const close = document.querySelectorAll('.btn-close');
		close[0].addEventListener('click', () => {
			reload();
		});
		close[1].addEventListener('click', () => {
			reload();
		});
		close[2].addEventListener('click', () => {
			reload();
		});
		
		// ESC 누르면
		window.addEventListener('keydown', (e) => {
			if(e.keyCode == 27){
				reload();
			}
		});
		
// 		const modals = document.querySelectorAll('.modal');
// 		for(const modal of modals){
// 			console.log(modal);
// 			modal.addEventListener('click', () => {
// 			  	reload();
// 			});
// 		}

		
	</script>
</body>
</html> 

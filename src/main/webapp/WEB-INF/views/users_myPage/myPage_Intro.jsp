<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 자기소개 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="resources/summernotes/summernote-lite.js"></script>
<script src="resources/summernotes/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/summernotes/summernote-lite.css">
<style>
	#btn{
		width: 85px; height: 40px;
		border: 2px solid black;
		border-radius: 20px;
		box-shadow: 0px 5px black;
		margin-left: 330px;
		font-weight: bold;
		background: white;
	}
	#btn:active{
		box-shadow: 0px 1px 0px black; transform: translateY(5px);
		background: #B0DAFF;
	}
	.intro{
		font-size: 18px; font-weight: bold;
	}
	#introForm{
		margin-left: 120px;
	}
	.note-modal-content{height: 350px;}
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
				<label class="profile">자기소개 관리</label><br>
				<form method="post" id="introForm" action="">
	        		<br>
			        <div>
			            <label class="intro">제목</label><br><br>
			            <input type="text" name="introTitle" style="width: 751px;">
			        </div>
			        <br><br>
			        <div>
			            <label class="intro">내용</label><br><br>
			            <textarea class="summernote" name="introContent" style="resize: none;"></textarea>
			        </div>
			        <br><br>
			   		<button id="btn">수정하기</button>
			    </form>
			</div>
		</div>
	</div>
	<script>
		$('.summernote').summernote({
			width: 750,
			height: 350,
			lang: "ko-KR",
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	</script>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
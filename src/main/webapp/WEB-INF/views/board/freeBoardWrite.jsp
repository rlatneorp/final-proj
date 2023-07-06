<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
table {
	text-align: center;
	margin: 0 auto;
	width: 900px;
	border-top: 2px solid #444444;
	border-bottom: 2px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-top: 1px solid #444444;
	border-left: 1px solid #444444;
	padding: 10px;
}

th:first-child, td:first-child {
	border-left: none;
}

/* 3D Button */
.btn-3d {
	text-decoration: none;
	width: 100px;
	height: 35px;
	position: relative;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
	padding: 5px;
	/*   padding: 20px 60px; */
	color: white;
	margin: 20px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
}

.btn-3d.blue:hover {
	color: white;
	background-color: #699DD1;
}

.btn-3d:active {
	top: 9px;
}

.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 8px 0 0 rgba(110, 164, 219, .7), 0 8px 0 1px
		rgba(0, 0, 0, .4), 0 8px 8px 1px rgba(0, 0, 0, 0.5);
}

.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 0 0 1px rgba(0, 0, 0, 0.4);
}

#parentDiv{
	padding:75px; 
	border:5px solid #B0DAFF;
	width:1100px; 
	margin:0 auto;
	margin-left:400px;
	justify-content: center;
	border-radius:2em;
}

#goToLogin{
	width: 200px; height: 46px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	font-size: 24px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 5px; 
}
.note-modal-content{height:350px}
</style>

</head>
<body>

	<%@include file="../common/top.jsp"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- 서머노트를 위해 추가해야할 부분 -->
	<script src="resources/summernotes/summernote-lite.js"></script>
	<script src="resources/summernotes/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/summernotes/summernote-lite.css">
	
	<br><br><br><br><br><br>
	<c:if test="${!empty loginUser }">
		<form action="${contextPath }/freeBoardWriting.bo" method="post">
			<div id="parentDiv">
				<div>
					<label class="intro">제목</label><br>
					<input id="title" required="required" type="text" name="introTitle" style="width: 940px; height:45px">
				</div><br><br>
				<div>
					<label class="intro">내용</label><br>
					<textarea id="content" required="required" class="summernote" name="introContent" style="resize: none;"></textarea>
				</div>
			</div><br><br>
		<!-- 작성 버튼 -->
		<div style="margin: 0 auto; text-align: center;">
			<button class="btn-3d blue" id="boardSubmit" style="display: none;">작성하기</button>
		</div>
		</form>
		<div style="margin: 0 auto; text-align: center;">
			<button class="btn-3d blue" id="reBoardSubmit" style="display: none;">수정하기</button>
		</div>
	</c:if>
	<c:if test="${empty loginUser }">
		<div class="text-center">
			<h2>로그인 하셔야 글을 쓰실 수 있습니다.</h2>	
			<button  id="goToLogin" onclick="location.href='${contextPath}/login.en'">로그인 하러 가기</button>
		</div>
	</c:if>
	<input type="hidden" value="${login }" id="hDnNick">
	<input type="hidden" id="bInfo">
	<br><br><br><br><br><br><br>
	<%@include file="../common/footer.jsp"%>


</body>
<script>
const hDnNick = document.querySelector('#hDnNick')
const form = document.querySelector('form');

const urlParams = new URL(location.href).searchParams;
const boardNo = urlParams.get('bId');
const boardWriter = urlParams.get('writer');

const title = document.getElementById('title');
const content = document.getElementById('content');
const bInfo = document.getElementById('bInfo');

const boardSubmit = document.querySelector('#boardSubmit');
const reBoardSubmit = document.querySelector('#reBoardSubmit');
let pTag = '';

// 글 쓰고 바로 내가 글 쓴 페이지로 가지기
	boardSubmit.addEventListener('click', ()=>{
		$.ajax({
			url: 'goToMyBoard.bo',
			success: data=>{
				const bId = data.boardNo + 1;
				const writer = data.nickName;
				location.href='${contextPath}/detailFreeBoard.bo?bId=' + bId + '&writer=' + writer + '&page=1';
					
			}
			
		})		
	})
// 수정 버튼	
	reBoardSubmit.addEventListener('click', ()=>{
		console.log(pTag.innerText);
		console.log(title.value);
		console.log(bInfo.value);
		console.log(boardNo);
		$.ajax({
			url: 'reBoard.bo',
			data: {
				boardContent: pTag.innerHTML,
				boardTitle: title.value, 
				usersNo: bInfo.value,
				boardNo: boardNo
			},
			success: data=>{
				if(data == 'success'){
					location.href='${contextPath}/detailFreeBoard.bo?bId=' + boardNo + '&writer=' + boardWriter + '&page=1';
				}else{
					alert('글 수정에 실패하였습니다.');
					location.reload();
				}
			}
		})
	})

	$('.summernote').summernote({
		width : 940,
		height : 350,
		lang : "ko-KR",
		toolbar : [
				// [groupName, [list of button]]
				[ 'fontname', [ 'fontname' ] ],
				[ 'fontsize', [ 'fontsize' ] ],
				[
						'style',
						[ 'bold', 'italic', 'underline',
								'strikethrough', 'clear' ] ],
				[ 'color', [ 'forecolor', 'color' ] ],
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				[ 'height', [ 'height' ] ],
				[ 'insert', [ 'picture' ] ] ],
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
				'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림',
				'돋움체', '바탕체' ],
		fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
				'18', '20', '22', '24', '28', '30', '36', '50',
				'72' ],
		callbacks: {
			onImageUpload: function(files, editor, welEditable, image) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], this);
	            }
		        var file = image[0];
		        var reader = new FileReader();
		        reader.onloadend = function() {
		           var image = $('<img>').attr('src',  reader.result);
		              image.attr('width','100%');
		           $('.summernote').summernote("insertNode", image[0]);
		        }
		        reader.readAsDataURL(file);
	        }
        
   
		}
		
	});

//파일명 줄이기

	function sendFile(file, el) {
		var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
			data: form_data,
			type: "POST",
			url: 'fileUpload.bo',
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function(img_name) {
		  		$(el).summernote('editor.insertImage', img_name);
			}
		});
	}


		window.onload=()=>{

			if(boardNo != null && boardWriter != null){
				reBoardSubmit.style.display = 'inline-block';
			}else{
				boardSubmit.style.display = 'inline-block';
			}
			const contentEdit = document.getElementsByClassName('note-editable');
			
			for(let i = 0; i < contentEdit.length; i++){
				pTag = contentEdit[i].querySelector('p');
				$.ajax({
					url: 'reWriteBoardInfo.bo',
					data:{
						boardNo: boardNo,
						nickName: boardWriter			
					},
					success: data=>{
						title.value = data.boardTitle;
						pTag.innerHTML = data.boardContent;
						bInfo.value = data.usersNo;
					}
					
				})
				
			}
		}
	
	
	

	
	
</script>
</html>
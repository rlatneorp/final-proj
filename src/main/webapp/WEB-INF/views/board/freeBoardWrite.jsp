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
<title>홀로세끼</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

<style>

#board{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	
	<br><br><br><br><br><br>
	<c:if test="${!empty loginUser }">
			<div id="parentDiv">
			<a style="color: red;">[공지]공백인 상태에서 글을 작성하시면 관리자에 의해 삭제가 될 수 있습니다.</a> 
				<br><br>
				<div>
					<label class="intro">제목</label><br>
					<input id="title" required="required" type="text"  style="width: 940px; height:45px">
				</div><br><br>
				<div>
					<label class="intro">내용</label><br>
					<textarea id="content" required="required" class="summernote"  style="resize: none;"></textarea>
				</div>
			</div><br><br>
		<!-- 작성 버튼 -->
		
		<div style="margin: 0 auto; text-align: center;">
			<button class="btn-3d blue" id="boardSubmit" style="display: none;">작성하기</button>
		</div>
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

const firstBoardSubm = document.querySelector('#firstBoardSubm');
const boardSubmit = document.querySelector('#boardSubmit');
const reBoardSubmit = document.querySelector('#reBoardSubmit');
const goToLogin = document.querySelector('#goToLogin');
let pTag = '';
let firstWriter = '';

// 글 쓰고 바로 내가 글 쓴 페이지로 가지기

// 	boardSubmit.addEventListener('click', ()=>{
// 		$.ajax({
// 			type: 'POST',
// 			url: 'goToMyBoard.bo',
// 			success: data=>{
// 					const bId = data.boardNo +1;
// 					const writer = data.nickName;
// 						location.href='${contextPath}/detailFreeBoard.bo?bId=' + bId + '&writer=' + writer;
// 						location.reload();
// 			},
// 			error: data=>{
// 				swal({
// 					 text: "글 작성에 실패하였습니다.",
// 					 icon: "error",
// 					 button: "확인",
// 				});
// 			}
		
			
// 		})		
// 	})
	boardSubmit.addEventListener('click', ()=>{
		
		const contentEdit = document.getElementsByClassName('note-editable');
		for(let i = 0; i < contentEdit.length; i++){
			let contents = contentEdit[i].innerHTML;
			let divContent = contentEdit[i].innerText;
// 			let trimmedContent = content.replace(/\s+/g, "");
// 			trimmedContent = content.replace(/&nbsp;/gi, "");	
// 			if(divContent.includes("&nbsp;")){
// 				divContent = contents.replace(/^\s*/, "");
// 				divContent = contents.replace(/&nbsp;/gi, "");
// 			}
// 			divContent = divContent.trim();
			if ($('#content').summernote('isEmpty') || $('#content').summernote('code').includes("&nbsp;")) {
				$.ajax({
					type: 'POST',
					url: 'freeBoardWriting.bo',
					async:false,
					data: {
						boardTitle: title.value,
						boardContent: contents
					},
					success: data=>{
						if(data == 'success'){
							$.ajax({
								url: 'goToMyBoard.bo',
								success: data=>{
									const bId = data.boardNo;
									const writer = data.nickName;
									location.href='${contextPath}/detailFreeBoard.bo?bId='+ bId + '&writer=' + writer;
								}
							})		
						}else{
							swal({
								 text: "글 작성에 실패하였습니다. 첨부파일을 최대 3개로 작성해주세요",
								 icon: "error",
								 button: "확인",
							});
						}	
					},
					error: data=>{
						swal({
							 text: "글 작성에 실패하였습니다. 내용을 입력해주세요",
							 icon: "error",
							 button: "확인",
						});
					}
					
				})
					
			}else{
				swal({
					 text: "글 작성에 실패하였습니다. 공백은 작성이 안 됩니다.",
					 icon: "error",
					 button: "확인",
				});
			}
		}
	})
	reBoardSubmit.addEventListener('click', ()=>{
		console.log(pTag.innerText);
		console.log(title.value);
		console.log(bInfo.value);
		console.log(boardNo);
		$.ajax({
			type: 'POST',
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
					swal({
						 text: "글 수정에 실패하였습니다.",
						 icon: "error",
						 button: "확인",
						});
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
				'72' ]
		
	});
	
// 수정 버튼	

//파일명 줄이기

// 	function sendFile(file, el) {
// 		var form_data = new FormData();
// 			form_data.append('file', file);
// 			$.ajax({
// 			data: form_data,
// 			type: "POST",
// 			url: 'fileUpload.bo',
// 			cache: false,
// 			contentType: false,
// 			enctype: 'multipart/form-data',
// 			processData: false,
// 			success: function(img_name) {
// 		  		$(el).summernote('editor.insertImage', img_name);
// 			}
// 		});
// 	}


 	window.onload = ()=>{
 		
		if(boardNo != null && boardWriter != null){
			reBoardSubmit.style.display = 'inline-block';
		}else{
			boardSubmit.style.display = 'inline-block';
		}
		
// 			firstBoardSubm.style.display = 'inline-block';
			
		const contentEdit = document.getElementsByClassName('note-editable');
		if(boardNo != null && boardWriter !=null){
			
			for(let i = 0; i < contentEdit.length; i++){
				pTag = contentEdit[i].querySelector('p');
				$.ajax({
					type: 'POST',
					url: 'reWriteBoardInfo.bo',
					data:{
						boardNo: boardNo,
						nickName: boardWriter		
					},
					success: data=>{
						title.value = data.boardTitle;
						pTag.innerHTML = data.boardContent;
						bInfo.value = data.usersNo;
						firstWriter.value = data.nickName;
					}
					
				})
				
			}
		}
 	}
	
</script>
</html>
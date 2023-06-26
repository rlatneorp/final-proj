<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>
<style>

#floatingText{
	background-color: white;
	height: 500px;
	vertical-align: baseline;
}
#floatingInput{
	background-color: white;
}
/* table { */
/* 	text-align: center; */
/* 	margin: 0 auto; */
/* 	width: 900px; */
/* 	border-top: 2px solid #444444; */
/* 	border-bottom: 2px solid #444444; */
/* 	border-collapse: collapse; */
/* } */

/* th, td { */
/* 	border-top: 1px solid #444444; */
/* 	border-left: 1px solid #444444; */
/* 	padding: 10px; */
/* } */

/* th:first-child, td:first-child { */
/* 	border-left: none; */
/* } */

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
	width:1200px; 
	margin:0 auto;
/* 	margin-left:330px; */
	justify-content: center;
	border-radius:2em;
}

.note-modal-content{height:350px}

.comment{
	border:5px solid #B0DAFF;
	padding:75px; 
	width:1200px; 
	margin:0 auto;
/* 	margin-left:330px; */
	justify-content: center;
	border-radius:2em;
}

#replySubmit{
	display: inline-block;
 	margin-top: -50px; 
	vertical-align: top;
	 
}

</style>

</head>
<body>

	<%@include file="../common/top.jsp"%>
	<br><br><br><br><br><br><br><br><br><br><br>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- 서머노트를 위해 추가해야할 부분 -->
	<script src="resources/summernotes/summernote-lite.js"></script>
	<script src="resources/summernotes/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/summernotes/summernote-lite.css">
	<div id="parentDiv">
		<div class="intro form-floating mb-3">
		   <input readonly type="text" class="form-control" id="floatingInput" value="${ b.boardTitle }">
		   <label>제목</label>
		</div>
		<div class="row text-center">
			<p class="d-inline text-start col-5">작성자 : ${b.nickName }</p>
			<p class="d-inline col-3">조회수 : ${b.boardCount } </p>
			<p class="d-inline col-4">작성날짜 : <fmt:formatDate value="${b.boardDate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p>
		</div>
		<br>
		<div class="intro form-floating text-start text-wrap">
		   <textarea name="content" style="resize: none;" readonly class="form-control" id="floatingText">${b.boardContent}</textarea>
		   <label>내용</label>
		</div>
	</div><br>
		<div class="comment text-start">
			<div class="intro form-floating">
				<table class="form-control" id="commentContent">
				<c:if test="${!empty b.boardComment}">
				<tbody> 
					<tr>
						<td scope="row">${b.boardComment} </td>
						<td scope="row">${b.boardCommentNickName }</td>
						<td scope="row">${b.boardCommentDate }</td>
						<td scope="row">
							<button type="button" id="xBtn">삭제</button>
						</td>
						<td scope="row">
							<button type="button" id="reBtn">수정</button>
						</td>
					</tr>
				</tbody>	
				</c:if>
				</table>
				<label for="commentContent">댓글 내용</label>
			</div><br>
			<div class="intro form-floating">
				<input type="text" name="commentWrite" id="commentWrite" class="form-control">
				<label for="commentWrite">댓글 작성</label>
			</div>
			<div class="position-relative">
				<a id="replySubmit" class="btn-3d blue position-absolute end-0">작성하기</a>
			</div>
		</div>
	<!-- 작성 버튼 -->
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<div class="modal" id="deleteModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">댓글 삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>댓글을 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">예</button>
	        <button type="button" class="btn btn-primary">아니요</button>
	      </div>
	    </div>
	  </div>
	</div>

	<%@include file="../common/footer.jsp"%>

</body>
<script>

window.onload=()=>{
	const deleteModal = document.getElementById('deleteModal');
	const xBtn = document.getElementById('xBtn');
	xBtn.addEventListener('click', ()=>{
		 deleteModal.modal('show');
	}
	
	document.getElementById('replySubmit').addEventListener('click', ()=>{
		$.ajax({
			url: '${contextPath}/insertReply.bo',
			data: {
					reviewContent:document.getElementById('commentWrite').value,
					reviewWriter:'${loginUser.nickName}', 
					orderNo: -1 
			},
			success: data =>{
				console.log(data);
				const tbody = document.querySelector('tbody');
				
				for(const r of data){
					const tr = document.createElement('tr');
					
					const contentTd = document.createElement('td');
					contentTd.innerText = r.reviewContent;
					
					const writerTd = document.createElement('td');
					writerTd.innerText = r.reviewWriter;
					
					
					const dateTd = document.createElement('td');
					dateTd.innerText = r.reviewDate;
					
					tr.append(contentTd);
					tr.append(writerTd);
					tr.append(dateTd);
					
					tbody.append(tr);
					
					
				}
				document.getElementById('commentWrite').value = '';
			},
			error: data =>{
				console.log(data);
			}
		});
	})		
	
	
	
	
	
	
	
	
	
	
}

</script>
</html>
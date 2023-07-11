<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>

#board{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48;
  vertical-align: text-top;
  
}

#floatingText{
	background-color: white;
	height: 100%;
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
#pageDown {
  font-variation-settings:
  'FILL' 0,
  'wght' 500,
  'GRAD' 0,
  'opsz' 48;
  font-size: 40px;
  color:#6DA2D9;
  margin-top: -10px;
}
#pageUp {
  font-variation-settings:
  'FILL' 0,
  'wght' 500,
  'GRAD' 0,
  'opsz' 48;
  font-size: 40px;
  color:#6DA2D9;
  margin-top: -10px;
}


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
	cursor: pointer;
	 
}
#loginPlz{
	display: inline-block;
	vertical-align: baseline;
	cursor: pointer;
	text-decoration: none;
}

#reBtn{
	width: 47px; height: 28px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	font-size: 14px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 2px; 
}
#xBtn{
	width: 47px; height: 28px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	font-size: 14px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 2px; 
}
#xBtn:active{
	width: 47px; height: 28px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	font-size: 14px;
	font-weight: 500;
	background-color: white;
	padding: 2px; 
}
/* #xBtn:active{ */
/* 	width: 47px; height: 28px; */
/* 	border: 2px solid black; */
/* 	border-radius: 20px; */
/* 	font-size: 14px; */
/* 	font-weight: 500; */
/* 	background-color: white; */
/* 	padding: 2px;  */
/* } */

.reBox{
	width:500px; height: 40px;
  	text-align: center;
	border: 2px solid black;
	font-size: 18px;
	margin-left:-250px;
	border-radius: 10px;
	background-color: white;
	cursor: text;
	position: absolute;
	z-index: 90;
	
}

#rBoardBtn{
	width: 100px; height: 40px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	font-size: 20px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 2px; 
	

}

#dBoardBtn{
	width: 100px; height: 40px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	font-size: 20px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 2px; 
}

#boardList{
	width: 100px; height: 40px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	font-size: 20px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 2px; 
}
.reThread{
	width: 40px; height: 25px;
	border: 1px solid black;
	border-radius: 20px;
	font-size: 10px;
	font-weight: 500;
	background-color: white;
	padding: 2px; 
}

#nextBoard{
	font-size: 15px;
	font-weight: 600;
	color: #6DA2D9;
	cursor: pointer;
}
#previousBoard{
	font-size: 15px;
	font-weight: 600;
	color: #6DA2D9;
	cursor: pointer;
}

</style>

</head>
<body id="detailFreeBoardBody">
	
	<%@include file="../common/top.jsp"%>
	<br><br><br><br><br>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- 서머노트를 위해 추가해야할 부분 -->
	<script src="resources/summernotes/summernote-lite.js"></script>
	<script src="resources/summernotes/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/summernotes/summernote-lite.css">

	
	
	
	<div class="row text-center" style="width:1850px;">
		<div class="col-6"><button id="boardList" onclick="location.href='${contextPath}/freeBoard.bo'">최신목록</button></div>
		<c:if test="${loginUser.usersNo eq blist.usersNo }">
		<div class="col-6"><button id="rBoardBtn">수정</button>&nbsp;&nbsp;&nbsp;<button id="dBoardBtn">삭제</button></div>
		</c:if>
	</div>
	<br>
	<div id="parentDiv">
		<div class="intro form-floating mb-3">
		   <div class="form-control" id="floatingInput">
		   ${ blist.boardTitle }
		   <c:set var="pic" value="${blist.boardContent}"/>
		   <c:if test="${fn:contains(pic, 'img')}">
		   <span class="material-symbols-outlined">hallway</span>
		   </c:if>
		   <c:if test="${ blist.boardType eq 1}">
		  	 <button type="button" class="reThread">수정됨</button>
		   </c:if>
		   </div>
		   <label>제목</label>
		</div>
		<div class="row text-center">
			<c:forEach items="${ aList }" var="a">
				<c:if test="${ a.usersNo eq blist.usersNo }">
					<p style="cursor: pointer;" class="d-inline text-start col-5" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ a.usersId }' + '&uNo=' + '${ a.usersNo }' + '&page='">작성자 : ${blist.nickName }</p>
				</c:if>
			</c:forEach>
			<p class="d-inline col-3">조회수 : ${blist.boardCount } </p>
			<p class="d-inline col-4">작성날짜 : <fmt:formatDate value="${blist.boardDate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p>
		</div>
		<input type="hidden" id="hdnBoardNo" value="${blist.boardNo}">
		<input type="hidden" id="hdnUsersNo" value="${ blist.usersNo }">
		<br>
		<div class="intro form-floating text-start text-wrap">
		   <div class="form-control" id="floatingText">${blist.boardContent}</div>
		   <label>내용</label>
		</div>
	</div>
	<br>
		<div class="row text-center">
			<div class="col d-inline" id="pree"><span class="material-symbols-outlined" id="pageDown">keyboard_arrow_left</span><a id="previousBoard" style="cursor: pointer;">이전 글</a></div>
			<div class="col d-inline" id="nextt"><a id="nextBoard" style="cursor: pointer;">다음 글</a><span class="material-symbols-outlined" id="pageUp">keyboard_arrow_right</span></div>
		</div><br>
		<div class="comment text-start">
			<div class="intro">
				<table class="table text-center">
					<thead>
						<tr>
							<th class="col-6">댓글내용</th>
							<th class="col-2">작성자</th>
							<th class="col-2">작성일</th>
							<th class="col-1">수정</th>
							<th class="col-1">삭제</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list }" var="r" varStatus="var"> 
						<tr>
							<td>${r.reviewContent}</td>
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ r.usersNo eq a.usersNo }">
									<td style="cursor: pointer;" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ a.usersId }' + '&uNo=' + '${ a.usersNo }' + '&page=' ">
									<c:set value="${r.reviewWriter }" var="nick"/>
									<c:choose>
									   <c:when test="${fn:length(nick) > 6 }">
									      <c:out value="${fn:substring(nick,0,6) }..." />        
									   </c:when>
									   <c:otherwise>
									      <c:out value="${nick}" /> 
									   </c:otherwise>
									</c:choose>
									</td>
								</c:if>
							</c:forEach>
							<td><fmt:formatDate value="${r.reviewDate }" pattern="yy-MM-dd HH:mm"/></td>
							<td>
<%-- 								<c:if test="${loginUser.nickName eq r.reviewWriter }"> --%>
<!-- 									<button type="button" class="reBtn" id="reBtn">수정</button> -->
<%-- 								</c:if> --%>
								<button type="button" class="reBtn" id="reBtn" style="<c:if test="${loginUser.usersNo ne r.usersNo }">display: none;</c:if>">수정</button>
							</td>
							<td>
<%-- 								<c:if test="${loginUser.nickName eq r.reviewWriter }"> --%>
<!-- 									<button type="button" class="xBtn" id="xBtn">삭제</button> -->
<%-- 								</c:if> --%>
								<button type="button" class="xBtn" id="xBtn" style="<c:if test="${loginUser.usersNo ne r.usersNo }">display: none;</c:if>">삭제</button>
							</td>
							<td>
								<input type="hidden" class="hdnReplyNo" value="${r.reviewNo}">
								<input type="hidden" class="hdnReplyUsersNo" value="${ r.usersNo }">
							</td>
						</tr>
					</c:forEach>	
					</tbody>
				</table>
			</div><br>
			<input id="hiddenNickName" type="hidden" value="${ loginUser.nickName }">
			<c:if test="${!empty loginUser }">
			<div class="intro form-floating">
				<input type="text" id="commentWrite" class="form-control">
				<label for="commentWrite">댓글 작성</label>
			</div>
			<div class="position-relative">
				<a id="replySubmit" class="btn-3d blue position-absolute end-0">작성하기</a>
			</div>
			</c:if>
			<c:if test="${empty loginUser }">
			<div class="text-center">
				<label>로그인을 하셔야 댓글을 달 수 있습니다</label>
				<a id="loginPlz" class="btn-3d blue" onclick="location.href='${contextPath}/login.en'">로그인 하기</a>
			</div>
			</c:if>
		</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<div class="modal" id="deleteModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary deleteNo" data-bs-dismiss="modal">아니요</button>
	        <button type="button" class="btn btn-primary deleteYes">예(엔터)</button>
	      </div>
	    </div>
	  </div>
	</div>
		<br><br><br><br>
	<%@include file="../common/footer.jsp"%>

</body>
<script>
	const deleteModal = document.getElementById('deleteModal');
	const xBtn = document.querySelectorAll('.xBtn');
	const deleteYes = document.getElementsByClassName('deleteYes');
	const deleteNo = document.getElementsByClassName('deleteNo');
	const replySubmit = document.getElementById('replySubmit');
	const reviewCont = document.querySelector('#commentWrite');
	const hdnBoardNo = document.querySelector('#hdnBoardNo');
	const hdnUsersNo = document.querySelector('#hdnUsersNo');
	const hiddenNickName = document.getElementById('hiddenNickName');
	const rBoardBtn = document.getElementById('rBoardBtn');
	const nextt = document.getElementById('nextt');
	const pree = document.getElementById('pree');
	const loginPlz = document.getElementById('loginPlz');
	let beforeData = null;
	let beforeText = null;
	let ind = null;
	
			
		pree.addEventListener('click', ()=>{
			$.ajax({
				url: 'preDetailBoard.bo',
				data: {
					boardNo: hdnBoardNo.value
				},
				success: data=>{
					if(data.boardNo != undefined && data.nickName != undefined){
						location.href="${contextPath}/detailFreeBoard.bo?bId=" + data.boardNo + "&writer=" + data.nickName;
					}else{
						swal({
							 text: "이전 글이 더이상 없습니다.",
							 icon: "error",
							 button: "확인",
						});
					}
				}
			})
		})
		
		nextt.addEventListener('click', ()=>{
			$.ajax({
				url: 'nextDetailBoard.bo',
				data: {
					boardNo: hdnBoardNo.value
				},
				success: data=>{
					if(data.boardNo != undefined && data.nickName != undefined){
						location.href="${contextPath}/detailFreeBoard.bo?bId=" + data.boardNo + "&writer=" + data.nickName;
					} else{
						swal({
							 text: "다음 글이 더이상 없습니다.",
							 icon: "error",
							 button: "확인",
						});
					}
				}
			})
		})
		
	if(rBoardBtn != null){
			
			rBoardBtn.addEventListener('click', ()=>{
				const boardWriter = hiddenNickName.value;
				const boardNo = hdnBoardNo.value;
				location.href="${contextPath}/freeBoardWrite.bo?bId=" + boardNo + "&writer=" + boardWriter;
			})
	
		$('#dBoardBtn').click(function(ev){
			ev.preventDefault();
			$('#deleteModal').modal("show");
 			for(const yes of deleteYes){
 				yes.focus();
 				yes.addEventListener('keydown', function(event){
 					if(event.keyCode == 13){
 						yes.click();
 					}
 				})
				yes.addEventListener('click', ()=>{
					const hdnReplyNo = document.querySelectorAll('.hdnReplyNo');
					$.ajax({
						url:'deleteBoard.bo',
						data: {
							boardNo: hdnBoardNo.value,
							usersNo: hdnUsersNo.value,
							reviewWriter: hiddenNickName.value
						},
						success: data=>{
							if(data == 'success'){
								$('#deleteModal').modal("hide");
								location.href="${contextPath}/freeBoard.bo";
							}else{
								swal({
									 text: "게시글 삭제를 실패하였습니다.",
									 icon: "error",
									 button: "확인",
								});
							}
						},
						error: data=>{
							console.log(data);
						}
					})
				})
			}
		})	
		
	}
	
		
		$('.xBtn').each(function(index, item){
			$(this).click(function(e){
				e.preventDefault();
				$('#deleteModal').modal("show");
	 			const hdnReplyNo = document.querySelectorAll('.hdnReplyNo');
	 			const hdnReplyUsersNo = document.querySelectorAll('.hdnReplyUsersNo');
	 			for(const yes of deleteYes){
	 				yes.focus();
	 				yes.addEventListener('keydown', function(event){
	 					if(event.keyCode == 13){
	 						yes.click();
	 					}
	 				})
			 		yes.addEventListener('click', ()=>{
						$.ajax({
							url: 'replyDelete.bo',
							data:{
								reviewNo: hdnReplyNo[index].value,
								reviewWriter: '${login}',
								productNo: hdnBoardNo.value,
								usersNo: hdnReplyUsersNo[index].value
								
							},
							success: data=>{
								console.log(data);
								if(data == 'success'){
									const tbody = document.querySelector('tbody');
		 							const trs = tbody.querySelectorAll('tr');
		 							trs[index].innerHTML = '';
		 							$('#deleteModal').modal("hide");
		 							
								}else{
									swal({
										 text: "오류로 인해 삭제가 되지 않았습니다.(짧은 시간내의 반복되는 삭제)",
										 icon: "error",
										 button: "확인",
									});
									location.reload();
								}
							}
						});
					})
				}	
				
	 		})
			
		})
	
		
		const tbody = document.querySelector('tbody');
		const reBtns = document.querySelectorAll('.reBtn');
		const trs = tbody.querySelectorAll('tr');
		const trArr = Array.from(trs);
		const reBtnsArr = Array.from(reBtns);
		
	if(reBtns.length > 0){
		for(let i = 0; i < reBtnsArr.length; i++){
// 			const tds = trs.querySelectorAll('td');
			reBtnsArr[i].addEventListener('click', (ee)=>{
				const td = Array.from(trArr[i].querySelectorAll('td'));
				if(reBtnsArr[i].innerText == "수정"){
					td[0].innerHTML = '<input type="text" class="reBox" value="' + td[0].innerText + '">';
					reBtnsArr[i].innerText = '확인';
					reBtnsArr[i].style.background = 'white';
				}else if(reBtnsArr[i].innerText == "확인"){
					const reInput = Array.from(trArr[i].querySelectorAll('.reBox'));
					const hdnReplyNo = document.querySelectorAll('.hdnReplyNo');
					const hdnReplyUsersNo = document.querySelectorAll('.hdnReplyUsersNo');
					const hdnBoardNo = document.querySelector('#hdnBoardNo');
					if(reInput[0].value != ''){
						$.ajax({
							url: 'reReply.bo',
							data: {
								reviewContent: reInput[0].value,
								reviewWriter: '${login}',
								productNo: hdnBoardNo.value,
								reviewNo: hdnReplyNo[i].value,
								usersNo: hdnReplyUsersNo[i].value
							},
							success: data=>{
								if(data == 'success'){
									td[0].innerText = reInput[0].value;
									reBtnsArr[i].innerText = '수정';
									reBtnsArr[i].style.background = '#B0DAFF';
								}else{
									swal({
										 text: "댓글 수정 중 오류가 발생했습니다.",
										 icon: "error",
										 button: "확인",
										});
									location.reload();
								}
							}
								
						});
					}else{
						swal({
							 text: "댓글을 공백 상태로 수정할 수 없습니다.",
							 icon: "error",
							 button: "확인",
							});
						location.reload();
					}
					
				}
				
			})
		}
	}		
	if(loginPlz == null){
			
		replySubmit.addEventListener('click', ()=>{
			const hdnBoardNo = document.querySelector('#hdnBoardNo');
			const tbody = document.querySelector('tbody');
			const thead = document.querySelector('thead');
			const table = document.querySelector('table');
			beforeData = tbody.innerHTML;
			$.ajax({
				url: 'insertReply.bo',
				dataType: 'json',
				data: {
						productNo: hdnBoardNo.value,
						reviewContent: reviewCont.value,
						reviewWriter: '${login}',
						usersNo: '${usersNo}'
				},
				success: data =>{
					console.log(data);
					const hiddenNickName = document.getElementById('hiddenNickName').value;
					const trs = tbody.querySelectorAll('tr');
					tbody.innerHTML = '';
					
					const tbodied = document.createElement('tbody');
	
					for(const r of data){
						
						const tr = document.createElement('tr');
						
						const contentTd = document.createElement('td');
						contentTd.innerText = r.reviewContent;
						beforeText = r.reviewContent;
						
						const writerTd = document.createElement('td');
						writerTd.innerHTML = r.reviewWriter;
						
						const dateTd = document.createElement('td');
						dateTd.innerText = r.reviewDate;
						
						const modifyBtn = document.createElement('td');
						if(r.usersNo == '${usersNo}'){
							modifyBtn.innerHTML = '<button type="button" class="" id="reBtn">수정</button>';
						} else{
							modifyBtn.innerHTML = '<button type="button" class="" id="reBtn" style="display: none;">수정</button>'
						}
											 
						const deleteBtn = document.createElement('td');
						if(r.usersNo == '${usersNo}'){
							deleteBtn.innerHTML = '<button type="button" class="" id="xBtn">삭제</button>';
						}else{
							deleteBtn.innerHTML = '<button type="button" class="" id="xBtn" style="display: none;">삭제</button>';
						}
						
						const reviewNoTd = document.createElement('td');
						reviewNoTd.innerHTML = '<input type="hidden" id="hdnReplyNo">';
						
						tr.append(contentTd);
						tr.append(writerTd);
						tr.append(dateTd);
						tr.append(modifyBtn);
						tr.append(deleteBtn);
						tr.append(reviewNoTd);
				
						modifyBtn.querySelector('#reBtn').className = 'reBtn';
						deleteBtn.querySelector('#xBtn').className = 'xBtn';
						reviewNoTd.querySelector('#hdnReplyNo').value = r.reviewNo;
						
						tbody.append(tr);
						
						//아직 비동기식으로 c태그를 어떻게 담을지 모르겠음
						location.reload();
					}
					document.getElementById('commentWrite').value = '';
					
					for(const tr of trs){
						const tds = tr.querySelectorAll('td');
						tds[1].addEventListener('click', function(){
							
							$.ajax({
								url: 'detailFreeBoard.bo',
								success: data=>{
									if(data.nickName == tds[1].innerText){
										location.href='${contextPath}/otherUsersProfile.en?uId=' + data.usersId + '&uNo=' + data.usersNo + '&page=';
									}
								}
							})
						})
					}	
				},
				error: data =>{
					console.log(data);
					swal({
						 text: "댓글을 빠르게 반복해서 작성하지 말아주세요.",
						 icon: "error",
						 button: "확인",
						});
					location.reload();
				}
			});
		})	
	}	
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
	justify-content: center;
	border-radius:2em;
}

.note-modal-content{height:350px}

.comment{
	border:5px solid #B0DAFF;
	padding:75px; 
	width:1200px; 
	margin:0 auto;
	justify-content: center;
	border-radius:2em;
}

.btns{color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;}

</style>

</head>
<body>
	
	<%@include file="../common/top.jsp"%>
	
	<br>

	<div id="parentDiv">
		<p style="font-size: 20px;">
			<c:if test="${b.boardType eq 0}">자유게시판</c:if>
<%-- 			<c:if test="${b.boardType eq 1}">00게시판</c:if> --%>
		</p>
		<p style="font-size: 16px;">글번호 : ${b.boardNo}</p>
		
		<div class="row text-center">
			<p class="d-inline text-start col-5">작성자 : ${b.nickName }</p>
			<p class="d-inline col-3">조회수 : ${b.boardCount } </p>
			<p class="d-inline col-4">작성날짜 : <fmt:formatDate value="${b.boardDate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p>
		</div>
		<div class="intro form-floating mb-3">
		   <input readonly type="text" class="form-control" id="floatingInput" value="${ b.boardTitle }">
		   <label>제목</label>
		</div>
		<input type="hidden" id="hdnBoardNo" value="${b.boardNo}">
		<br>
		<div class="intro form-floating text-start text-wrap">
		   <textarea name="content" style="resize: none;" readonly class="form-control" id="floatingText">${b.boardContent}</textarea>
		   <label>내용</label>
		</div>
	</div><br>
	<div class="comment text-start">
	
		<p style="font-size: 20px;">댓글</p>
		<div class="intro">
			<table class="table text-center">
				<thead>
					<tr>
						<th class="col-1">댓글번호</th>
						<th class="col-5">댓글내용</th>
						<th class="col-2">작성자</th>
						<th class="col-2">작성일</th>
						<th class="col-2">상태</th>
					</tr>
				</thead>
				<tbody> 
					<c:forEach items="${rList}" var="r" varStatus="var"> 
						<tr>	
							<td><input type="hidden" name="reviewNo" value="${r.reviewNo}">
								${r.reviewNo}</td>
							<td>${r.reviewContent}</td>
							<td>${r.reviewWriter }</td>
							<td><fmt:formatDate value="${r.reviewDate }" pattern="yyyy-MM-dd HH:mm"/></td>
							<td>
								<c:if test="${r.reviewStatus eq 'Y'}">
									<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
									<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
								</c:if>
								<c:if test="${r.reviewStatus eq 'N'}">
									<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
									<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
								</c:if>
							</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
		<br>
	</div>
	<br>
	<div class="d-flex justify-content-center mb-5">
		<div class="d-flex">
			<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">뒤로가기</button>
		</div>
	</div>
	<!-- 작성 버튼 -->
	<br><br><br><br><br><br><br><br><br><br><br>

	<%@include file="../common/footer.jsp"%>


	<script>
	
		window.onload=()=>{
// 			상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			const Nos = document.getElementsByName('reviewNo');
			
			for(const i in statusBtns){
				if(i<statusBtns.length){
					let j = Math.floor(i/2);
					if(Nos[j].value != 0){
						statusBtns[i].addEventListener('click', function(){
							$.ajax({
								url: '${contextPath}/adminUpdateStatus.ad',
								data: {dataNo:Nos[j].value,
									   dataStatus:statusBtns[i].innerText,
									   dataType:7},
								success: data =>{
									let price = "";
									let sale = "";
									if(data == "success"){
										if(i%2 == 0){
											statusBtns[i].style.background = "#19A7CE";
											statusBtns[i].nextElementSibling.style.backgroundColor = "gray";
										}else if(i%2 == 1){
											statusBtns[i].style.background = "#19A7CE";
											statusBtns[i].previousElementSibling.style.backgroundColor = "gray";
										}
									}else{
										alert("상태 변경에 실패하였습니다.");
									}
								},
								error: data => {
									console.log(data);
								}
							})
						})
					}
				}
			}
			
		}
	
	</script>
</body>
</html>
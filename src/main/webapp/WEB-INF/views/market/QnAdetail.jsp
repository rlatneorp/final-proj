<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
	  integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	  crossorigin="anonymous">
</head>


<style>

#shop{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

body {

  padding-top: 70px;
  padding-bottom: 30px;

}

button {
	color:rgb(68, 133, 215);
	font-weight:bold;
	background:white;
	border: 1px solid rgb(68, 133, 215);
	margin-bottom: 10px;
	width: 100px;
	height: 40px;
	border-radius: 5px;

}

button:hover{
	color: white;
	background: rgb(68, 133, 215);
	border: 0.5px solid white;
}

 button:focus{
 	outline: white;
	color: white;
	background:rgb(68, 133, 215);
	border: 0.5px solid white;
}
.input_file{
    background-image: url(images/filePlus.jpg);
    cursor: pointer;
    display: inline-block;
    vertical-align: middle;
    appearance: none;
    width: 65px;
    height: 65px;
    margin: 0 5px 5px 0;
    background-repeat: no-repeat;
    display: none;

}

dl dd {
	display: flex;
	margin: auto;
}

dl dd div {
	width: 150px;
	height: 30px;
	text-align: center;
	border: 0.5px solid lightgray;
	vertical-align: center;
}

dl dd div:nth-child(2){
	border-left: none;
	border-right: none;
}

dl dd div input{
	display:none;
}

dl dd div input[type=radio]:checked + label{
	width:100%;
	height:100%;
	font-weight: 400;
	color:white;
}

dl dd div label{
	display: block;
}


.qnaForm fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

.qnaForm fieldset input[type=radio]{
	display: none;
}

.qnaForm fieldset label {
	font-size: 2em;
	color: transparent;
}

.qnaForm fieldset label:hover{
	text-shadow: 0 0 0 rgb(68, 133, 215);
}

.qnaForm fieldset label:hover ~ label{
	text-shadow: 0 0 0 rgb(68, 133, 215);
}

.qnaForm fieldset input[type=radio]:checked ~ label{
	text-shadow: 0 0 0  rgb(68, 133, 215);
}

select option {
	font-size: 18px;
	font-weight: bold;
}

select .form-control {
	font-size: 18px;
	font-weight: bold;
	color: rgb(68, 133, 215);
	
}

.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;
}


</style>


<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	
	
	<c:forEach items="${qnaList}" var="qna">
		<article>
	
			<div class="container" role="main">
	
				<div style="font-weight: 200; border-bottom: 1px solid black; color: rgb(68, 133, 215); font-weight: bold; 10px; font-size: 20px;">문의 작성</div>
	
					<div class="mb-3">
					
						<label for="qnaCate" style="font-weight: 800;">문의 내용</label>
							<br>
							<div style="color:white; font-size: 20px; font-weight: bold; width:auto; background-color: rgb(68, 133, 215); padding:5px; padding-left:20px;" >
							   <c:if test="${qna.qnaType eq 1 }"> 배송 </c:if>
		                       <c:if test="${qna.qnaType eq 2 }"> 결제 </c:if>
		                       <c:if test="${qna.qnaType eq 3 }"> 회원 </c:if>
		                       <c:if test="${qna.qnaType eq 4 }"> 상품 </c:if>
		                       <c:if test="${qna.qnaType eq 0 }"> 기타 </c:if>
							</div>
						<br>
	
						<label for="title" style="font-weight: 800;">작성자</label>
						<input type="text" class="form-control" name="usersId" value="${qna.nickName}" readonly>
	<%-- 					<input type="hidden" class="form-control" name="usersNo" value="${loginUser.usersNo}" readonly> --%>
	<%-- 					<input type="hidden" class="form-control" name="productNo" value="${productNo}" readonly> --%>
						
						<br>
						<label for="qnaTitle" style="font-weight: 800;" >제목</label>
						<input type="text" class="form-control" name="qnaTitle" id="qnaTitle" value="${qna.qnaTitle }" readOnly>
	
					</div>
	
					<div class="mb-3">
	
						<label for="content" style="font-weight: 800;">내용</label>
	
						<textarea class="form-control" rows="5" name="qnaContent" id="content" placeholder="${qna.qnaContent}"  readonly></textarea>
						
						<br>
						
						<label for="content" style="font-weight: 800; color:rgb(68, 133, 215) ">관리자 답변</label>
						
						<c:if test="${qna.answerContent ne null}">
							<textarea class="form-control" rows="5" name="qnaContent" id="content" placeholder="${qna.answerContent}" style="font-weight: bold;" readonly></textarea>
						</c:if>
						
						<c:if test="${qna.answerContent eq null}">
							<textarea class="form-control" rows="5" name="qnaContent" id="content" placeholder="잠시만 기다려주시면 답변을 드리겠습니다!"  readonly></textarea>
						</c:if>
					</div>
					
	
					<button type="button" class="button" id="btnList" onclick="history.back();">확인</button>
	
				<div >
	
					
				</div>
	
			</div>
	
		</article>
	</c:forEach>
</body>

</html>

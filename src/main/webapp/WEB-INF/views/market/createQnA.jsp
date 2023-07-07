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

#shop{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

</style>


<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	
	<article>

		<div class="container" role="main">

			<div style="font-weight: 200; border-bottom: 1px solid black; color: rgb(68, 133, 215); font-weight: bold; 10px; font-size: 20px;">문의 작성</div>

			<form name="form" id="form" role="form" method="post" action="insertQna.ma" class="qnaForm">

				<div class="mb-3">
				
					<label for="title" style="font-weight: 800;">문의 내용</label>
					<select class="form-control" name="qnaType">
						<option value="1">배송</option>
						<option value="2">결제</option>
						<option value="3">회원</option>
						<option value="4">상품</option>
						<option value="0">기타</option>
					</select>
				

					<label for="title" style="font-weight: 800;">아이디</label>

					<input type="text" class="form-control" name="usersId" value="${loginUser.usersId}" readonly>
					<input type="hidden" class="form-control" name="usersNo" value="${loginUser.usersNo}" readonly>
					<input type="hidden" class="form-control" name="productNo" value="${productNo}" readonly>
					
					<br>
					<label for="qnaTitle" style="font-weight: 800;" >제목</label>
					<input type="text" class="form-control" name="qnaTitle" id="qnaTitle" placeholder="제목을 입력해주세요 ">

				</div>

				<div class="mb-3">

					<label for="content" style="font-weight: 800;">내용</label>

					<textarea class="form-control" rows="5" name="qnaContent" id="content" placeholder="200자 이내로 리뷰를 작성해주세요."  ></textarea>

				</div>
				
<!-- 				<div class="mb-3"> -->

<!-- 					<label for="Filedata" style="cursor: pointer; font-weight: 800;">사진 첨부 &nbsp; <br><br> -->
<!-- 						<img  src="resources/images/filePlus.jpg"> -->
<!-- 					</label> -->

<!-- 					<input type="file" name="Filedata" id="Filedata" class="input_file"> -->

<!-- 				</div> -->

					<button class="submit"  type="button" class="button" >작성하기</button>

				<button type="button" class="button" id="btnList" onclick="history.back();">취소</button>
					

			</form>

			<div >

				
			</div>

		</div>

	</article>
	
	<script>
	const formControl = document.querySelector("#content");
	const qnaTitle = document.querySelector("#qnaTitle");
	const submit = document.querySelector(".submit");
	
	submit.addEventListener("click", function(){
		if(formControl.value.trim() == ""){
			formControl.value = ""
			formControl.focus();
			alert("후기를 작성해주세요!");
		
		}else if(qnaTitle.value.trim() == ""){
				qnaTitle.value = ""
				qnaTitle.focus();
				alert("제목을 입력해주세요!");
				return false;
				
		}else if(formControl.value.trim() != "" && qnaTitle.value.trim() != "") {
			submit.type = 'submt';
//				location.href = '${contextPath}/selectBoard.bo?bId='+boardId+'&writer='+writer+'&page='+${pi.currentPage};
		}
		

	
})
	
	</script>
	

</body>

</html>

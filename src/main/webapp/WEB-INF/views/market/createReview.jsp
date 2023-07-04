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

 button:active{
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

.form-control-lg {
    height: calc(2.875rem + 2px);
    padding: 0.5rem 1rem;
    font-size: 1.25rem;
    line-height: 1.5;
    border-radius: 0.3rem;
    background: rgb(68 133 215 / 77%);
    color: white;
    font-size: inherit;
    font-weight: 600;
}
.btn-outline-dark {
    color: rgb(68, 133, 215);
    border-color: rgb(68, 133, 215);
}

.btn-outline-dark:active {
    color: white;
    background: rgb(68, 133, 215);
    border: 0.5px solid white;
}

.btn-outline-dark:visited {
    color: rgb(68, 133, 215);
    background: rgb(68, 133, 215);
    border-color: rgb(68, 133, 215);
}

.btn-outline-dark:hover {
	font-weight: bold;
    color: white;
    background: rgb(68, 133, 215);
    border-color: rgb(68, 133, 215);
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


.reviewForm fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

.reviewForm fieldset input[type=radio]{
	display: none;
}

.reviewForm fieldset label {
	font-size: 2em;
	color: lightgray;
}

.reviewForm fieldset label:hover{
	color: rgb(68, 133, 215);
}

.reviewForm fieldset label:hover ~ label{
	color: rgb(68, 133, 215);
}

.reviewForm fieldset input[type=radio]:checked ~ label{
	color: rgb(68, 133, 215);
}

 button:focus{
 	outline: white;
	color: white;
	background:rgb(68, 133, 215);
	border: 0.5px solid white;
}


</style>


<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	
	<article>
		<div class="container" role="main">

			<div style="font-weight: 200; border-bottom: 1px solid black; color: rgb(68, 133, 215); font-weight: bold; 10px; font-size: 20px;">리뷰 작성</div>

			<form name="form" id="form" role="form" method="Post" action="${ contextPath }/insertReview.ma" enctype="multipart/form-data" class="reviewForm">

				<div class="mb-name">

					<label for="title" style="font-weight: 800;">아이디</label>

					<input type="hidden" class="form-control" name="productNo" id="productNo" value="${productNo}" readonly>
					<input type="text" class="form-control" name="title" id="title" value="${loginUser.usersId}" readonly>

				</div>

					<fieldset>
						<span style="font-weight: 800;"> 별점을 남겨주세요</span>
						<br>
						<input type="radio" name="reviewScore" value="5" id="reviewScore5">
							<label for="reviewScore5">★</label>
						<input type="radio" name="reviewScore" value="4" id="reviewScore4">
							<label for="reviewScore4">★</label>
						<input type="radio" name="reviewScore" value="3" id="reviewScore3">
							<label for="reviewScore3">★</label>
						<input type="radio" name="reviewScore" value="2" id="reviewScore2">
							<label for="reviewScore2">★</label>
						<input type="radio" name="reviewScore" value="1" id="reviewScore1">
							<label for="reviewScore1">★</label>
				  </fieldset>
				
				<br>
				
				<br>
				
				
				<div class="mb-contents">

					<label for="content" style="font-weight: 800;">내용</label>
					
					<textarea class="form-control" rows="5" name="reviewContent" id="content" placeholder="200자 이내로 리뷰를 작성해주세요."  ></textarea>

				</div>
				
				<div id="fileArea">
						<label style="cursor: pointer; font-weight: 800;">사진 첨부 &nbsp; <br><br>
							<img class="addImage" src="resources/images/filePlus.jpg">
						</label>
						
						<div class="mb-3">
							<input type="file" class="form-control form-control-lg" name="imageFile" accept="image/jpg, image/png, image/jpeg" >
						</div>
				</div>
						<div>
<%-- 							<c:forEach items="${ list }" var="a"> --%>
								<h5>
<%-- 									<a href="${ contextPath }/resources/uploadFils/" --%>
<!-- 														download=" "> </a> -->
									<button type="button" class="btn btn-outline-dark btn-sm deleteAttm" id="delete-">삭제 OFF</button>
									<input type="hidden" name="deleteAttm" value="none">
								</h5>
<%-- 							</c:forEach> --%>
						</div>					
					<button type="submit" class="button" id="Save">작성하기</button>
				<button type="button" class="button" id="btnList" onclick="javascript:history.back();">취소</button>
					

			</form>

			<div>
			</div>
		</div>
	</article>
	
	<script>
	window.onload = () =>{
		const fileArea = document.querySelector('#fileArea');
		document.querySelector(".addImage").addEventListener('click', (e)=>{
			const newDiv = document.createElement('div');
			newDiv.classList.add("mb-3");
			newDiv.innerHTML = '<input type="file" class="form-control form-control-lg" name="imageFile accept="image/jpg, image/png, image/jpeg">';
			
			if(document.querySelectorAll(".mb-3").length >= 3 ){
				e.preventDefault()
				alert("사진은 최대 3장 까지만 업로드 할 수 있습니다.");
			}else{
				fileArea.append(newDiv);
			}
			
		});
		
		
		console.log(file.val())
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	</script>
</body>

</html>

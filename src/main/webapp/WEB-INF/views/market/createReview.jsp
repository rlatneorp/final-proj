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
	color: transparent;
}

.reviewForm fieldset label:hover{
	text-shadow: 0 0 0 rgb(68, 133, 215);
}

.reviewForm fieldset label:hover ~ label{
	text-shadow: 0 0 0 rgb(68, 133, 215);
}

.reviewForm fieldset input[type=radio]:checked ~ label{
	text-shadow: 0 0 0  rgb(68, 133, 215);
}




</style>


<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	
	<article>

		<div class="container" role="main">

			<div style="font-weight: 200; border-bottom: 1px solid black; color: rgb(68, 133, 215); font-weight: bold; 10px; font-size: 20px;">리뷰 작성</div>

			<form name="form" id="form" role="form" method="post" action="${ contextPath }/insertReview.pr" class="reviewForm">

				<div class="mb-3">

					<label for="title" style="font-weight: 800;">아이디</label>

					<input type="text" class="form-control" name="title" id="title" value="${productNo}" readonly>

				</div>

					<fieldset>
					<span style="font-weight: 800;"> 별점을 남겨주세요</span>
					<br>
					<input type="radio" name="reviewStar" value="★★★★★" id="reviewStar5">
					<label for="reviewStar5">★</label>
					<input type="radio" name="reviewStar" value="★★★★" id="reviewStar4">
					<label for="reviewStar4">★</label>
					<input type="radio" name="reviewStar" value="★★★" id="reviewStar3">
					<label for="reviewStar3">★</label>
					<input type="radio" name="reviewStar" value="★★" id="reviewStar2">
					<label for="reviewStar2">★</label>
					<input type="radio" name="reviewStar" value="★" id="reviewStar1">
					<label for="reviewStar1">★</label>
				</fieldset>
				
				<br>
				
				<br>
				
				
				<div class="mb-3">

					<label for="content" style="font-weight: 800;">내용</label>

					<textarea class="form-control" rows="5" name="content" id="content" placeholder="200자 이내로 리뷰를 작성해주세요."  ></textarea>

				</div>
				
				<div class="mb-3">

					<label for="Filedata" style="cursor: pointer; font-weight: 800;">사진 첨부 &nbsp; <br><br>
						<img  src="resources/images/filePlus.jpg">
					</label>

					<input type="file" name="Filedata" id="Filedata" class="input_file">

				</div>

					<button type="submit" class="button" id="Save">작성하기</button>

				<button type="button" class="button" id="btnList">취소</button>
					

			</form>

			<div >

				
			</div>

		</div>

	</article>

</body>

</html>

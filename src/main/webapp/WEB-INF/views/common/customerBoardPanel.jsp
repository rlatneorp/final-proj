<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"> -->
<style>
@font-face {
	    font-family: 'YESGothic-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESGothic-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* { font-family: 'YESGothic-Regular';}
	
.customer .page-link{
	color: black;
}

.csTitle{
	text-align: center;
	width: 200px; height: 72px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 20px;
	font-size: 30px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 7px; 
	margin-left: -10px;
	cursor: pointer;
	}
	

.csSide{
	padding: 10px;
	margin: 20px;
}


/* .nav-pills{ */
/* 	background-color: white; */
/* 	color: black; */
/* } */
.customer .nav-pills .nav-link{
	color:black;
	font-size: 20px; 
}
.customer .nav-pills .nav-link.active{ 
	color:black;
	width: 200px;
	height: 50px;
	text-align: left; 
	align: right;
	font-size: 20px; 
	background-color: rgb(248, 249, 250); 
}
.customer .btn-light{
	width:200px;
	height:50px;
	text-align: left; 
	align: right;
	font-size: 20px;
}
.nav{
	color: black;
	
}

#categoryBtn{
	
	width:150px;
	height:50px;
	background-color: #B0DAFF;
	color:black;
	border: 2px solid black;
}
#categoryBtn:hover{
	background-color: #B0DAFF;
	color:black;
}
#categoryBtn:focus{
	background-color: #B0DAFF;
	color:black;
}

.askBtn{
	width: 150px; height: 46px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	font-size: 20px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 7px; 
	margin-top: 30px;
}

#accordionFlushExample{
	border: 3px solid black;
	border-radius: 10px;
	box-shadow: 0px 10px black;
	font-size: 20px;
	font-weight: 500;
}
#accordionFlush1{
	border: 3px solid black;
	border-radius: 10px;
	box-shadow: 0px 10px black;
	font-size: 20px;
	font-weight: 500;
}

#searchText{
	width:300px;
	height:50px;
	border: 1px solid lightgray;
}

#searchBtn{
	background: lightgray;
	border: solid #B0DAFF;
	font-size: 23px;
	text-align: center;
}
/* .btn-outline-secondary{ */
/* 	--bs-btn-hover-bg: #B0DAFF; */
/* 	--bs-btn-active-bg: #B0DAFF; */
/* 	--bs-btn-active-color: black; */
/* 	--bs-btn-hover-color: black; */

/* } */
/* .btn{ */
/* --bs-btn-line-height:35px; */
/*     --bs-btn-font-size: 20px; */

/* } */
/* .btn-secondary{ */
/* 	--bs-btn-bg: #B0DAFF; */
/* 	--bs-btn-hover-bg: #999a9a; */
/* 	--bs-btn-color: black; */
/* 	--bs-btn-font-size: 20px; */
/* 	--bs-btn-font-weight: 500; */
/* 	--bs-btn-active-bg: #B0DAFF; */
/* 	--bs-btn-active-color: black; */

/* } */

/* .accordion-button:not(.collapsed){ */
/* 	color:black; */
/* 	background-color: #B0DAFF; */
/* } */

.question{
	width:1020px;
	height:130px;
}
.answer{
	width:1020px;
	height:130px;
}
.11question{
	width:1020px;
	height:130px;
}
.11answer{
	width:1020px;
	height:130px;
}

.acCustomer .accordion-button:not(.collapsed){
	color:black;
	backgorund-color: #B0DAFF;
}

.customer .table{
	width: 1050px;
	height: auto;
}

.customer .qaaCategoryBtn:active{
	background-color: #B0DAFF;
	color:black;
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
</style>
</head>
<body>
	<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		<div class="csTitle" onclick="location.href='${contextPath }/noticeBoard.cs'">고객센터</div><br>
		    <button class="nav-link" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home"  role="tab"  onclick="location.href='${contextPath}/noticeBoard.cs'">공지사항<span class="material-symbols-outlined" style="margin-left: 60px; vertical-align: middle;">chevron_right</span></button><br>
		    <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile"  role="tab"  onclick="location.href='${contextPath}/faqBoard.cs'">자주 묻는 질문<span class="material-symbols-outlined" style="margin-left: 12px; vertical-align: middle;">chevron_right</span></button><br>
		    <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages"  role="tab" onclick="location.href='${contextPath}/personalBoard.cs'">1:1 문의<span class="material-symbols-outlined" style="margin-left: 62px; vertical-align: middle;">chevron_right</span></button><br>
   		<br><br>
   		<button class="btn btn-light" id="11Btn" onclick="location.href='${contextPath}/personalQuestion.cs'">바로 1:1 문의하기</button>			   
    </div>
<script>

const boradTypeNo1 = document.querySelector('#v-pills-home-tab');
const boradTypeNo2 = document.querySelector('#v-pills-profile-tab');
const boradTypeNo3 = document.querySelector('#v-pills-messages-tab');

boradTypeNo1.addEventListener('click', ()=>{
	$.ajax({
		url:'${contextPath}/noticeBoard.cs',
		data:{faqType: 1},
		success: function(info){
			console.log(info);
		}
	});	
})

boradTypeNo2.addEventListener('click', ()=>{
	$.ajax({
		url:'${contextPath}/faqBoard.cs',
		data:{faqType: 2},
		success: function(info2){
			console.log(info2);
		}
	});	
})

boradTypeNo3.addEventListener('click', ()=>{
	$.ajax({
		url:'${contextPath}/personalBoard.cs',
		type: 'post',
		data:{
			faqType: 3
		},
		success: function(info3){
			console.log(info3);
		}
	});	
})


</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	#search{width: 1200px; height: 250px; border-top: 1px solid black; border-bottom: 1px solid black; background-color: #B0DAFF; margin: auto;}
	#searchBar{position: relative;}
	#inputText{border-radius: 8px; border: 1px solid black; box-shadow: 0px 5px 0px 0px black; width: 300px; height: 40px; margin-left: 450px; margin-right: 450px; margin-top: 40px;}
	#searchIcon{position: absolute; right: 455px; top: 46px;}
	#searchBtn{border-radius: 50%; width: 30px; height: 30px; border: none; background-color: #B0DAFF}
	#category{width: 450px; margin-left: 375px; margin-right: 375px; margin-top: 30px;}
	
	.title{font-weight: bold;}
	.group-button1, .group-button2, .group-button3{padding: 10px; background-color: #B0DAFF; border: none; cursor: pointer;}
	
	#side{width: 250px; height: 100px; margin-top: 25px; margin-left: 1150px;}
	#recipeWrite{box-shadow: 0px 5px 0px 0px black; border-radius: 8px; border: 1px solid black; background-color: #B0DAFF; color: white; height: 35px; margin-left: 100px; cursor: pointer;}
	.group-button{padding: 10px; background-color: white; border: none; cursor: pointer; font-weight: bold;}
	
	#recipeList{width: 1150px;}
	
/* 	페이지 */
	.page_wrap {
		text-align:center;
		font-size:0;
	}
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		margin-top: 8px;
	}
	.page_nation .prev {
		background:white;
	}
	.page_nation .next {
		background:white;
	}
	.page_nation a.active {
		background-color:#B0DAFF;
		color:white;
		border:1px solid #B0DAFF;
		border-radius: 100%;
	}
</style>
	
</head>
<body>

<%@ include file="../common/top.jsp" %>

<br><br>

<div id="search">
	<div id="searchBar">
		<input type="text" id="inputText" name="input" placeholder=" 내용을 입력해 주세요.">
		<div id="searchIcon"><button id="searchBtn"><i class="bi bi-search"></i></button></div>
	</div>
	<div id="category">
		<div>
			<span class="title">재료별 | </span>
			<button class="group-button1" data-value="고기">고기</button>
			<button class="group-button1" data-value="해물">해물</button>
			<button class="group-button1" data-value="과일">과일</button>
			<button class="group-button1" data-value="채소">채소</button>
		</div>
		<div>
			<span class="title">상황별 | </span>
			<button class="group-button2" data-value="다이어트">다이어트</button>
			<button class="group-button2" data-value="술안주">술안주</button>
			<button class="group-button2" data-value="도시락">도시락</button>
			<button class="group-button2" data-value="아침식사">아침식사</button>
			<button class="group-button2" data-value="비건">비건</button>
		</div>
		<div>
			<span class="title">종류별 | </span>
			<button class="group-button3" data-value="메인반찬">메인반찬</button>
			<button class="group-button3" data-value="국">국</button>
			<button class="group-button3" data-value="간식">간식</button>
			<button class="group-button3" data-value="면">면</button>
			<button class="group-button3" data-value="반찬">반찬</button>
		</div>
	</div>
</div>

<div id="side">
	<button type="button" id="recipeWrite" onclick="location.href='recipeWrite.rc'">레시피 등록</button>
	
	<br><br>
	
	<div id="align">
		<button class="group-button" data-value="최신">최신순</button>
		<button class="group-button" data-value="인기">인기순</button>
		<button class="group-button" data-value="리뷰">리뷰순</button>
	</div>
</div>

<div class="album p-5 bg-white">
	<div class="container px-5">
	
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-5 g-2">
			
			<c:forEach begin="1" end="10">
				<div class="col">
					<div class="card shadow-sm">
					<a href="recipeDetail.rc">
						<img src="resources/image/chicken1.png" style="width: 100%; height: 100%;">
					</a>
						<div class="card-body">
							<h5>치킨</h5>
							<p class="card-text">사용자</p>
							<p>별점</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="page_wrap">
   <div class="page_nation">
      <a class="arrow prev" href="#"><i class="bi bi-chevron-left"></i></a>
      <a href="#" class="active">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a class="arrow next" href="#"><i class="bi bi-chevron-right"></i></a>
   </div>
</div>

<br>
<%@ include file="../common/footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>

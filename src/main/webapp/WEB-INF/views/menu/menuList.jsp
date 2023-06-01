<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>

/* 	검색 창 부분 */
	#search{width: 1200px; height: 250px; border-top: 1px solid black; border-bottom: 1px solid black; background-color: #B0DAFF; margin: auto;}
	#inputText{border-radius: 8px; border: 1px solid black; box-shadow: 0px 5px 0px 0px black; width: 300px; height: 30px; margin-left: 450px; margin-right: 450px; margin-top: 40px;}
	#category{width: 450px; margin-left: 375px; margin-right: 375px; margin-top: 30px;}
	
	.title{font-weight: bold;}
	.group-button1, .group-button2, .group-button3{padding: 10px; background-color: #B0DAFF; border: none; cursor: pointer;}
	
/* 	이번주 인기 식단 */
	#weekend{width: 1200px; height: 400px; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black; background-color: #B0DAFF;}
	#hotWeekend{width: 1200px; height: 25px; background-color: black; color: white; text-align: center; border-radius: 10px 10px 0 0;}
	#weekendBox{width: 1200px; height: 400px; margin: 37px 50px;}
	
	.wkalbum{position: relative;}
	.albumTitle{position: absolute; width: 300px; height: 50px; top: 250px; left: 30px; text-align: center; font-weight: bold;}
	.weekendPic{margin: 0 30px;}
	
/* 	최신 식단 */
	#middle{width: 1250px; height: 50px; font-weight: bold; font-size: 20px; border-bottom: 1px solid black; margin: auto;}
</style>

</head>
<body>

<%@ include file="../common/top.jsp" %>
<br><br>

<div id="search">
	<input type="text" id="inputText" name="input" placeholder=" 내용을 입력해 주세요.">
	
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

<br><br><br>

<div id="weekend">
	<div id="hotWeekend">이번주 ㅎㄹㅅㄲ의 인기 식단</div>
	
	<div id="weekendBox">
		<div class="d-inline-block wkalbum">
			<img src="#" width="300px" height="300px" class="weekendPic">
			<div class="albumTitle">고단백 / 영양사B</div>
		</div>
		<div class="d-inline-block wkalbum">
			<img src="#" width="300px" height="300px" class="weekendPic">
			<div class="albumTitle">다이어트 / 영양사C</div>
		</div>
		<div class="d-inline-block wkalbum">
			<img src="#" width="300px" height="300px" class="weekendPic">
			<div class="albumTitle">든든밥상 / 영양사E</div>
		</div>
	</div>
</div>

<br><br><br><br>

<div id="middle">최신 식단 목록</div>
<div class="album p-5 bg-white">
	<div class="container px-5">
	
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-5 g-2">
			
			<c:forEach begin="1" end="5">
				<div class="col">
					<div class="card shadow-sm">
					<a href="menuDetail.mn">
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

<br>
<%@ include file="../common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
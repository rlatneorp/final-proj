<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
/* 	레시피 소개 */
	#top{width: 1200px; height: 600px; margin: auto; position: relative;}
	#thumImg{width: 500px; height: 500px; display: inline-block; position: absolute; border-radius: 5px;}
	#imformation{width: 650px; height: 500px; display: inline-block; position: absolute; left: 550px;}
	#title{border-bottom: 1px solid black; width: 630px;}
	#grade{width: 570px; height: 50px; margin-left: 50px; margin-right: 50px; margin-top: 50px;}
	#userInfo{text-align: center;}
	
/* 	재료 */
	#ingredient{width: 1100px; height: 300px; background: lightgray; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black;}
	#ingrTitle{font-size: 23px; text-align: center; width: 100px; margin-left: 500px; margin-right: 500px; padding-top: 20px; height: 50px;}
	#ingrList{width: 500px; height: 220px; margin-left: 300px; margin-right: 300px;}
	.ingrElem{padding-top: 10px; padding-bottom: 10px;}
	.listE{width: 200px;}
	
/* 	중간선 */
	.mid{display: flex; flex-basis: 100%; align-item: center; color: rgba(0,0,0,1); font-size: 30px; margin: 5px 0px; font-weight: bold;}
	.mid::before{content: ""; flex-grow: 1; margin: 23px 16px 15px 250px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0spx;}
	.mid::after{content: ""; flex-grow: 1; margin: 23px 250px 15px 16px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}
	
/* 	조리순서 */
	#order{width: 1100px; background: lightgray; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black;}
	#orderList{padding: 60px 80px; }
	table{
		border-collapse: separate;
		border-spacing:0 15px;
	}
	td{text-align: center;}
	.no{width: 100px;}
	.content{width: 540px;}
	.image{width: 300px; height:300px}
	
/* 	완성된 사진 */
	#comText{text-align: center; font-weight: bold; font-size: 30px;}
	#completePic{width: 1100px; margin: auto;}
	.complPic{margin-left: 250px; margin-right: 250px;}
	
/* 	버튼 */
	#buttonBox{width: 270px; margin: auto;}
	.buy{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 130px; height: 40px;}
	
/* 	문의 */
	#qna{width: 1000px; margin: auto; text-align: center;}
	.write{width: 150px;}
	.date{width: 210px;}
	.board{border-collapse: collapse;}
	.boardTop{background-color: #B0DAFF;}
	.line{border-bottom: 1px solid black; border-top: 1px solid black;}
	.lineAll:hover{background-color: #19A7CE; color: white;}
	
/* 	입력 박스 */
	.inputBox{width:730px; height: 50px; margin: auto;}
	.inputText{border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 600px; height: 40px;}
	.enter{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px;}
	
/* 	후기 */
	.star{width: 110px;}
	.reviewWrite{width: 100px;}
	.reviewDate{width: 150px;}
</style>
</head>
<body>
	<div id="top">
		<div id="thumImg">
			<img src="resources/image/chicken1.png" style="width: 100%; height: 100%; border-radius: 5px;">
		</div>
		<div style="width: 50px; height: 500px; display: inline-block; position: absolute; left: 500px;"></div>
		<div id="imformation">
			<div id="title">
				<h2 style="display: inline-block; margin-right: 470px;">치킨치킨</h2>
				<input type="radio">
			</div>
			<div id="grade">
				<div class="d-inline-block" style="width: 50px; font-weight: bold">난이도</div>
				<div class="d-inline-block" style="width: 210px; text-align: center; font-weight: bolder; font-size: 20px;">* * * * *</div>
				<div class="d-inline-block" style="width: 30px; font-weight: bold">|</div>
				<div class="d-inline-block" style="width: 70px; font-weight: bold">조리시간</div>
				<div class="d-inline-block" style="width: 180px; text-align: center; font-weight: bolder; font-size: 20px;"> 15 분</div>
			</div>
			
			<div id="userInfo">
				<img src="resources/image/mudo.png" style="width: 100px; height: 100px;">
				<p>닉네임</p>
				<p>*****</p>
				<p>레시피에 대한 설명입니다. 이 요리는 어떠어떠한 요리입니다.</p>
			</div>
		</div>
	</div>
	
	<div id="ingredient">
		<div id="ingrTitle">재료</div>
		<div id="ingrList" class="text-center">
			<ul class="d-inline-block listE">
				<li class="ingrElem">재rkskekffkakkee</li>
				<li class="ingrElem">재료1</li>
				<li class="ingrElem">재료2</li>
				<li class="ingrElem">재료2</li>
				<li class="ingrElem">재료2</li>
			</ul>
			
			<ul class="d-inline-block listE">
				<li class="ingrElem">재료</li>
				<li class="ingrElem">재료1</li>
				<li class="ingrElem">재료2</li>
				<li class="ingrElem">재료2</li>
				<li class="ingrElem">재료2</li>
			</ul>
		</div>
	</div>
	
	<br><br><br>
	
	<div class="mid">
		조리 순서
	</div>
	
	<br><br>
	
	<div id="order">
		<div id="orderList">
			<table>
				<tr>
					<td class="no">1</td>
					<td class="content">만드는 순서 1....</td>
					<td class="image"><img src="#" width="250px" height="250px" alt="조리 순서 사진 1"></td>
				</tr>
				<tr>
					<td class="no">2</td>
					<td class="content">만드는 순서 2....</td>
					<td class="image"><img src="#" width="250px" height="250px" alt="조리 순서 사진 2"></td>
				</tr>
				<tr>
					<td class="no">3</td>
					<td class="content">만드는 순서 3....</td>
					<td class="image"><img src="#" width="250px" height="250px" alt="조리 순서 사진 3"></td>
				</tr>
				<tr>
					<td class="no">4</td>
					<td class="content">만드는 순서 4....</td>
					<td class="image"><img src="#" width="250px" height="250px" alt="조리 순서 사진 4"></td>
				</tr>
			</table>
		</div>
	</div>
	
	<br><br>
	<br><br>	
	
	
<!-- 	완성된 사진 캐러셀 -->

<div>
	<p id="comText">완성된 사진</p>
</div>
<div id="completePic">
	<div id="myCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="#" width= 600px height= 500px class="complPic">
			</div>
			<div class="carousel-item">
				<img src="#" width= 600px height= 500px class="complPic">
			</div>
			<div class="carousel-item">
				<img src="#" width= 600px height= 500px class="complPic">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
		  <span class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<br>
<div id="buttonBox">
	<button class="buy">밀키트 구매</button>
	<button class="buy">식재료 구매</button>
</div>

<br><br>

<p class="mid">문의</p>

<br>

<div id="qna">
	<table class="board">
		<tr class="boardTop">
			<th class="line no">No.</th>
			<th class="line content">내용</th>
			<th class="line write">작성자</th>
			<th class="line date">날짜</th>
		</tr>
		<tr class="lineAll">
			<td class="line">1</td>
			<td class="line">문의~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
		<tr class="lineAll">
			<td class="line">2</td>
			<td class="line">문의~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
		<tr class="lineAll">
			<td class="line">3</td>
			<td class="line">문의~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
		<tr class="lineAll">
			<td class="line">4</td>
			<td class="line">문의~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
		<tr class="lineAll">
			<td class="line">5</td>
			<td class="line">문의~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
	</table>
</div>
<br>

<div class="inputBox">
프사
<input type="text" class="inputText" placeholder=" 내용을 입력해주세요.">&nbsp;<button class="enter">등록</button>
</div>
<br><br>

<p class="mid">후기</p>

<br>

<div id="qna">
	<table class="board">
		<tr class="boardTop">
			<th class="line no">No.</th>
			<th class="line star">별점</th>
			<th class="line content">내용</th>
			<th class="line reviewWrite">작성자</th>
			<th class="line reviewDate">날짜</th>
		</tr>
		<tr class="lineAll">
			<td class="line">1</td>
			<td class="line">*****</td>
			<td class="line">후기~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
		<tr class="lineAll">
			<td class="line">2</td>
			<td class="line">*****</td>
			<td class="line">후기~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
		<tr class="lineAll">
			<td class="line">3</td>
			<td class="line">*****</td>
			<td class="line">후기~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
		<tr class="lineAll">
			<td class="line">4</td>
			<td class="line">*****</td>
			<td class="line">후기~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
		<tr class="lineAll">
			<td class="line">5</td>
			<td class="line">*****</td>
			<td class="line">후기~~~~~~~내용</td>
			<td class="line">작성자 아이디or닉네임</td>
			<td class="line">작성 날짜</td>
		</tr>
	</table>
</div>

<br>
<div class="inputBox">
프사
<input type="text" class="inputText" placeholder=" 내용을 입력해주세요.">&nbsp;<button class="enter">등록</button>
</div>
<br><br>



	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
/* 	레시피 소개 */
	#top{width: 1200px; height: 600px; margin: auto; position: relative;}
	#thumImg{width: 500px; height: 500px; display: inline-block; position: absolute; border-radius: 5px;}
	#imformation{width: 650px; height: 500px; display: inline-block; position: absolute; left: 550px;}
	#title{border-bottom: 1px solid black; width: 630px;}
	#grade{width: 570px; height: 50px; margin-left: 50px; margin-right: 50px; margin-top: 50px;}
	#userInfo{text-align: center;}
	#updateBox{width: 180px; margin: auto;}
	#updateBtn{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px;}
	#deleteBtn{background-color: lightgray; color: black; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px; margin-left: 10px;}
	
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
	.inputBox{width:730px; height: 50px; margin: auto; position: relative;}
	.profile{width: 35px; height: 35px; border: none; border-radius: 50%; position: absolute; top: 5px;}
	.profileImg{width:35px; height: 35px; border-radius: 50%;}
	.inputText{border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 600px; height: 40px; position: absolute; left: 40px;}
	.enter{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px; position: absolute; right: 0;}
	
/* 	후기 */
	.star{width: 110px;}
	.reviewWrite{width: 100px;}
	.reviewDate{width: 150px;}
	
/* 	모달 */
	.modal-body{text-align: center;}
	.bi-emoji-frown-fill{font-size: 60px; color: #B0DAFF;}
	.btn-n{background: lightgray; color: white;}
	.btn-n:hover{background: darkgray; color: black;}
	.btn-y{background: rgba(255, 170, 0, 0.5); color: white;}
	.btn-y:hover{background: rgba(255, 170, 0); color: black;}

	/*버튼*/
	.button {
	  width: 100px; height: 45px;
	  font-family: ;
	  font-size: 13px;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border: none;
	  border-radius: 45px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  margin: 5px;
	  }
	.button:hover {
		background-color: #B0DAFF;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		color: #fff;
		transform: translateY(-7px);
		}
		
	.footer{
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-top: 10px; margin-bottom: 30px;
		padding-top: 20px;
		border-top: 1px solid lightgray;
		}
	.footer{text-align: center;}
	.footer> .button{font-weight: bold;}
	
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
		margin-top: 0;
	}
	.page_nation .prev {
		background:white;
	}
	.page_nation .next {
		background:white;
	}
	.page_nation a.active {
		background-color:#19A7CE;
		color:white;
		border:1px solid #19A7CE;
		border-radius: 100%;
	}
</style>
</head>
<body>

<%@ include file="../common/top.jsp" %>
<br><br>

	<div id="top">
		<div id="thumImg">
			<img src="resources/image/chicken1.png" style="width: 100%; height: 100%; border-radius: 5px;">
		</div>
		<div style="width: 50px; height: 500px; display: inline-block; position: absolute; left: 500px;"></div>
		<div id="imformation">
			<div id="title">
				<h2 style="display: inline-block; margin-right: 470px;">치킨치킨</h2>
				<a href="#"><i class="bi bi-bookmark" style="font-size: 20px;"></i></a>
			</div>
			<div id="grade">
				<div class="d-inline-block" style="width: 50px; font-weight: bold">난이도</div>
				<div class="d-inline-block" style="width: 210px; text-align: center; font-weight: bolder; font-size: 20px;">* * * * *</div>
				<div class="d-inline-block" style="width: 30px; font-weight: bold">|</div>
				<div class="d-inline-block" style="width: 70px; font-weight: bold">조리시간</div>
				<div class="d-inline-block" style="width: 180px; text-align: center; font-weight: bolder; font-size: 20px;"> 15 분</div>
			</div>
			
			<div id="userInfo">
				<img src="resources/image/mudo.png" style="width: 100px; height: 100px; border-radius: 50%">
				<p>닉네임</p>
				<p>*****</p>
				<p>레시피에 대한 설명입니다. 이 요리는 어떠어떠한 요리입니다.</p>
			</div>
			
			<br><br>
			
<%-- 			<c:if test="${loginUser eq recipeWriter }"> --%>
			<div id="updateBox">
				<button id="updateBtn">수정</button>
				<button id="deleteBtn" data-bs-toggle="modal" data-bs-target="#exampleModal1">삭제</button>
			</div>
<%-- 			</c:if> --%>
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

<%-- <c:if test="${!(loginUser eq recipeWriter) }"> --%>
<div id="buttonBox">
	<button class="buy">밀키트 구매</button>
	<button class="buy">식재료 구매</button>
</div>
<%-- </c:if> --%>

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

<div class="page_wrap">
   <div class="page_nation">
      <a class="arrow prev" href="#"><i class="bi bi-chevron-left"></i></a>
      <a href="#" class="active">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a class="arrow next" href="#"><i class="bi bi-chevron-right"></i></a>
   </div>
</div>

<br>

<div class="inputBox">
	<div class="profile d-inline-block">
		<img src="resources/image/mudo.png" class="profileImg">
	</div>	
	<input type="text" class="inputText" placeholder=" 내용을 입력해주세요." name="recipeQnaInput">&nbsp;<button class="enter">등록</button>
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

<div class="page_wrap">
   <div class="page_nation">
      <a class="arrow prev" href="#"><i class="bi bi-chevron-left"></i></a>
      <a href="#" class="active">1</a>
      <a href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a class="arrow next" href="#"><i class="bi bi-chevron-right"></i></a>
   </div>
</div>

<br>
<div class="inputBox">
	<div class="profile d-inline-block">
		<img src="resources/image/mudo.png" class="profileImg">
	</div>
	<input type="text" class="inputText" placeholder=" 내용을 입력해주세요." name="recipeReviewInput">&nbsp;<button class="enter">등록</button>
</div>
<br><br>
<br>

<!-- 삭제 알림 모달 -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">게시글 삭제하기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<i class="bi bi-emoji-frown-fill"></i><br>
				삭제 된 게시글은 복구 할 수 없습니다.<br>
				정말 삭제하시겠습니까?
			</div>
			<div class="footer">
				<button type="button" class="button btn-n" data-bs-dismiss="modal">취소</button>
				<button type="button" class="button btn-y" id="deleteBoard">삭제하기</button>
			</div>
		</div>
	</div>
</div>




<%@ include file="../common/footer.jsp" %>


	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>	
</body>
</html>

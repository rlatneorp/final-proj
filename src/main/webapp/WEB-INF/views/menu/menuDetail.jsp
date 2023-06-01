<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
/* 	식단 소개 */
	#top{width: 1200px; height: 600px; margin: auto; position: relative;}
	#thumImg{width: 500px; height: 500px; display: inline-block; position: absolute; border-radius: 5px;}
	#imformation{width: 650px; height: 500px; display: inline-block; position: absolute; left: 550px;}
	#title{border-bottom: 1px solid black; width: 630px;}
	#category{width: 550px; height: 50px; margin-left: 50px; margin-right: 50px; margin-top: 50px; font-weight: bold; font-size: 18px; text-align: center;}
	#userInfo{text-align: center;}
	
/* 	중간선 */
	.mid{display: flex; flex-basis: 100%; align-item: center; color: rgba(0,0,0,1); font-size: 30px; margin: 5px 0px; font-weight: bold;}
	.mid::before{content: ""; flex-grow: 1; margin: 23px 16px 15px 200px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0spx;}
	.mid::after{content: ""; flex-grow: 1; margin: 23px 200px 15px 16px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}
	
/* 	식단 종류 */
	#order{width: 900px; background: lightgray; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black;}
	#orderList{padding: 30px 80px; }
	#menuTable{
		border-collapse: separate;
		border-spacing:0 30px;
	}
	#menuTable tr td{text-align: center;}
	.no{width: 50px;}
	.content{width: 400px;}
	.content2{border-top: 1px solid black;}
	.image{width: 250px; height:200px}
	
/* 	영양 정보 */
	#infoTable{width: 1100px; margin: auto; border: 1px solid black; border-radius: 10px;}
	#infoTop{border-bottom: 1px solid black; background-color: lightgray; border-radius: 10px 10px 0 0;}
	#infoTop th{width: 157px; text-align: center; border-right: 1px solid black}
	.infoContent td{padding: 3px; border-right: 1px solid black}
	
/* 	버튼 */
	#buttonBox{width: 110px; margin: auto;}
	.buy{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 110px; height: 50px;}
	
/* 	문의 */
	#qna{width: 1000px; margin: auto; text-align: center;}
	.boardNo{width: 100px;}
	.boardContent{width: 540px;}
	.boardWrite{width: 150px;}
	.boardDate{width: 210px;}
	.board{border-collapse: collapse; }
	.boardTop{background-color: #B0DAFF;}
	.line{border-bottom: 1px solid black; border-top: 1px solid black;}
	.lineAll:hover{background-color: #19A7CE; color: white;}
	
/* 	입력 박스 */
	.inputBox{width:730px; height: 50px; margin: auto;}
	.inputText{border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 600px; height: 40px;}
	.enter{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px;}
	
/* 	후기 */
	.star{width: 110px;}
	.boardReviewWrite{width: 100px;}
	.boardReviewDate{width: 150px;}
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
			<div id="category">
				아이콘 식단 카테고리
			</div>
			<br>
			<div id="userInfo">
				<img src="resources/image/mudo.png" style="width: 100px; height: 100px;">
				<p style="font-weight: bold;">닉네임</p>
				<p>*****(별점)</p>
				<p>식단에 대한 설명입니다. 이 식단는 어떠어떠한 요리가 있고 어떤 부분에서 좋습니다.</p>
			</div>
		</div>
	</div>
	
	<div class="mid">
		식단 종류
	</div>
	
	<br>
	
	<div id="order">
		<div id="orderList">
			<table id="menuTable">
				<tr>
					<td class="no" rowspan="2">1</td>
					<td class="image" rowspan="2"><img src="resources/image/mudo.png" width="200px" height="200px" alt="식단 사진 1"></td>
					<td class="content">밥 / 국 / 메인 반찬 / 반찬1 / 반찬2</td>
				</tr>
				<tr>
					<td class="content2">주요 / 재료 / 넣는 / 공간</td>
				</tr>
				<tr>
					<td class="no" rowspan="2">2</td>
					<td class="image" rowspan="2"><img src="resources/image/mudo.png" width="200px" height="200px" alt="식단 사진 1"></td>
					<td class="content">밥 / 국 / 메인 반찬 / 반찬1 / 반찬2</td>
				</tr>
				<tr>
					<td class="content2">주요 / 재료 / 넣는 / 공간</td>
				</tr>
				<tr>
					<td class="no" rowspan="2">3</td>
					<td class="image" rowspan="2"><img src="resources/image/mudo.png" width="200px" height="200px" alt="식단 사진 1"></td>
					<td class="content">밥 / 국 / 메인 반찬 / 반찬1 / 반찬2</td>
				</tr>
				<tr>
					<td class="content2">주요 / 재료 / 넣는 / 공간</td>
				</tr>
				<tr>
					<td class="no" rowspan="2">4</td>
					<td class="image" rowspan="2"><img src="resources/image/mudo.png" width="200px" height="200px" alt="식단 사진 1"></td>
					<td class="content">밥 / 국 / 메인 반찬 / 반찬1 / 반찬2</td>
				</tr>
				<tr>
					<td class="content2">주요 / 재료 / 넣는 / 공간</td>
				</tr>
				<tr>
					<td class="no" rowspan="2">5</td>
					<td class="image" rowspan="2"><img src="resources/image/mudo.png" width="200px" height="200px" alt="식단 사진 1"></td>
					<td class="content">밥 / 국 / 메인 반찬 / 반찬1 / 반찬2</td>
				</tr>
				<tr>
					<td class="content2">주요 / 재료 / 넣는 / 공간</td>
				</tr>
				<tr>
					<td class="no" rowspan="2">6</td>
					<td class="image" rowspan="2"><img src="resources/image/mudo.png" width="200px" height="200px" alt="식단 사진 1"></td>
					<td class="content">밥 / 국 / 메인 반찬 / 반찬1 / 반찬2</td>
				</tr>
				<tr>
					<td class="content2">주요 / 재료 / 넣는 / 공간</td>
				</tr>
				<tr>
					<td class="no" rowspan="2">7</td>
					<td class="image" rowspan="2"><img src="resources/image/mudo.png" width="200px" height="200px" alt="식단 사진 1"></td>
					<td class="content">밥 / 국 / 메인 반찬 / 반찬1 / 반찬2</td>
				</tr>
				<tr>
					<td class="content2">주요 / 재료 / 넣는 / 공간</td>
				</tr>
			</table>
		</div>
	</div>
	
	<br><br><br>
	
	<div class="mid">
		영양 정보
	</div>
	
	<br><br>
	
	<table id="infoTable">
		<tr id="infoTop">
			<th>1</th>
			<th>2</th>
			<th>3</th>
			<th>4</th>
			<th>5</th>
			<th>6</th>
			<th>7</th>
		</tr>
		<tr class="infoContent">
			<td>칼로리 : ...kcal</td>
			<td>칼로리 : ...kcal</td>
			<td>칼로리 : ...kcal</td>
			<td>칼로리 : ...kcal</td>
			<td>칼로리 : ...kcal</td>
			<td>칼로리 : ...kcal</td>
			<td>칼로리 : ...kcal</td>
		</tr>
		<tr class="infoContent">
			<td>탄수화물 : ...g</td>
			<td>탄수화물 : ...g</td>
			<td>탄수화물 : ...g</td>
			<td>탄수화물 : ...g</td>
			<td>탄수화물 : ...g</td>
			<td>탄수화물 : ...g</td>
			<td>탄수화물 : ...g</td>
		</tr>
		<tr class="infoContent">
			<td>지방 : ...g</td>
			<td>지방 : ...g</td>
			<td>지방 : ...g</td>
			<td>지방 : ...g</td>
			<td>지방 : ...g</td>
			<td>지방 : ...g</td>
			<td>지방 : ...g</td>
		</tr>
		<tr class="infoContent">
			<td>트랜스지방 : ...g</td>
			<td>트랜스지방 : ...g</td>
			<td>트랜스지방 : ...g</td>
			<td>트랜스지방 : ...g</td>
			<td>트랜스지방 : ...g</td>
			<td>트랜스지방 : ...g</td>
			<td>트랜스지방 : ...g</td>
		</tr>
		<tr class="infoContent">
			<td>포화지방 : ...g</td>
			<td>포화지방 : ...g</td>
			<td>포화지방 : ...g</td>
			<td>포화지방 : ...g</td>
			<td>포화지방 : ...g</td>
			<td>포화지방 : ...g</td>
			<td>포화지방 : ...g</td>
		</tr>
		<tr class="infoContent">
			<td>나트륨: ...mg</td>
			<td>나트륨: ...mg</td>
			<td>나트륨: ...mg</td>
			<td>나트륨: ...mg</td>
			<td>나트륨: ...mg</td>
			<td>나트륨: ...mg</td>
			<td>나트륨: ...mg</td>
		</tr>
		<tr class="infoContent">
			<td>당류 : ...</td>
			<td>당류 : ...</td>
			<td>당류 : ...</td>
			<td>당류 : ...</td>
			<td>당류 : ...</td>
			<td>당류 : ...</td>
			<td>당류 : ...</td>
		</tr>
		<tr class="infoContent">
			<td>콜레스테롤 : ...mg</td>
			<td>콜레스테롤 : ...mg</td>
			<td>콜레스테롤 : ...mg</td>
			<td>콜레스테롤 : ...mg</td>
			<td>콜레스테롤 : ...mg</td>
			<td>콜레스테롤 : ...mg</td>
			<td>콜레스테롤 : ...mg</td>
		</tr>
		
	</table>
	
	<br><br>	
	
<div id="buttonBox">
	<button class="buy">식단 구독</button>
</div>

<br><br>
<br><br>

<p class="mid">문의</p>

<br>

<div id="qna">
	<table class="board">
		<tr class="boardTop">
			<th class="line boardNo">No.</th>
			<th class="line boardContent">내용</th>
			<th class="line boardWrite">작성자</th>
			<th class="line boardDate">날짜</th>
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
			<th class="line boardNo">No.</th>
			<th class="line star">별점</th>
			<th class="line boardContent">내용</th>
			<th class="line boardReviewWrite">작성자</th>
			<th class="line boardReviewDate">날짜</th>
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

<br>
<%@ include file="../common/footer.jsp" %>

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>	
</body>
</html>

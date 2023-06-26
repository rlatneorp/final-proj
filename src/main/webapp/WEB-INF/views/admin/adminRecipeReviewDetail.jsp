<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	span{height:30px;}
	
/* 	식단 소개 */
	#top{width: 1200px; position: relative; display: inline-block; margin-top: 100px;}
	#thumImg{width: 500px; height: 500px; display: inline-block; position: absolute; border-radius: 5px;}
	#imformation{width: 650px; height: 500px; display: inline-block; position: absolute; left: 550px;}
	#title{border-bottom: 1px solid black; width: 630px;}
	#category{width: 550px; height: 50px; margin-left: 50px; margin-right: 50px; margin-top: 50px; font-weight: bold; font-size: 18px; text-align: center;}
	#userInfo{text-align: center;}
	#updateBtn{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px;}
	#deleteBtn{background-color: lightgray; color: black; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px; margin-left: 10px;}
	
/* 	중간선 */
	.mid{display: flex; flex-basis: 100%; align-item: center; color: rgba(0,0,0,1); font-size: 30px; margin: 5px 0px; font-weight: bold;}
	.mid::before{content: ""; flex-grow: 1; margin: 23px 16px 15px 200px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}
	.mid::after{content: ""; flex-grow: 1; margin: 23px 200px 15px 16px; background: rgba(0,0,0,1); height: 1px; font-size: 0px; line-height: 0px;}
	
/* 	식품 상세설명 */
	#order{width: 900px; background: lightgray; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black;}

/* 	영양 정보 */
	#infoTable{width: 1100px; margin: auto; border: 1px solid black; border-radius: 10px;}
	#infoTop{border-bottom: 1px solid black; background-color: lightgray; border-radius: 10px 10px 0 0;}
	#infoTop th{width: 157px; text-align: center; border-right: 1px solid black}
	.infoContent td{padding: 3px; border-right: 1px solid black;}
	.infoContent td input{width: 100px; margin: 0px 3px;}
	
	
/* 	버튼 */
	.buy{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 130px; height: 40px;}
	
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
	.inputBox{width:730px; height: 50px; margin: auto; position: relative;}
	.profile{width: 35px; height: 35px; border: none; border-radius: 50%; position: absolute; top: 5px;}
	.profileImg{width:35px; height: 35px; border-radius: 50%;}
	.inputText{border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 600px; height: 40px; position: absolute; left: 40px;}
	.enter{background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 5px 5px 7px 0px black; width: 80px; height: 40px; position: absolute; right: 0;}
	
/* 	후기 */
	.star{width: 110px;}
	.boardReviewWrite{width: 100px;}
	.boardReviewDate{width: 150px;}
	
/* 	기타 */
	.border-none tr th{border:none;}
	.border-none tr td{border:none;}
</style>
</head>
<body>
	
	<%@ include file="../common/top.jsp" %>
		
	<div class="mainBox">
		<div id="top" style="margin-bottom:120px;">
			<div id="thumImg">
				<img src="${contextPath}/resources/images/logo.png" style="width: 100%; height: 100%; border-radius: 5px;">
			</div>
			<div style="width: 50px; height: 500px; display: inline-block; left: 500px;"></div>
			<div id="imformation">
				<div id="title">
					<input type="text" name="title" style="font-size: 20px; width: 250px; margin-right: 340px;" placeholder="레시피 이름을 적어주세요." readonly>
					<a href="#"><i class="bi bi-bookmark " style="font-size: 20px;"></i></a>
				</div>
				<div id="category">
					카테고리 선택
					<select name="category">
						<option>다이어트</option>
						<option>육류</option>
						<option>해산물</option>
					</select>
				</div>
				<br>
				<div id="userInfo">
					<img src="#" style="width: 100px; height: 100px; border-radius: 50%">
					<p style="font-weight: bold;">000영양사</p>
					<p>*****(별점)</p>
					<textarea name="subContent" rows="6" cols="80" placeholder="레시피에 대한 설명을 입력해주세요." readonly></textarea>
				</div>
			</div>
		</div>
		<div style="width:1200px;" class="mb-5">
			<div class="mid mb-4">
				후기
			</div>
			<table class="w-100 text-center mb-3 border-none" style="border-top: 3px solid rgba(0,0,0,0.2); border-bottom: 3px solid rgba(0,0,0,0.2);">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(0,0,0,0.1);">
					<th style="width: 10%">번호</th>
					<th style="width: 50%">내용</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 15%">날짜</th>
					<th style="width: 10%">상태</th>
				</tr>
				
				<c:forEach begin="1" end="4" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${11-vs.index}</td>
						<td>한국인 기준 마늘 35알이 딱 적당한 것 같아요! 맛있게 잘먹었습니다!</td>
						<td>ganggangsu${11-vs.index}</td>
						<td>2023-06-${(21-vs.index)}</td>
						<td>Y</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="d-flex justify-content-center mb-5" style="width:1200px;">
			<div class="d-flex">
				<button onclick="location.href='${contextPath}/adminRecipeReviewManage.ad'" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">뒤로가기</button>
			</div>
		</div>
	</div>
	<br><br><br><br>
		
	
</body>
</html>
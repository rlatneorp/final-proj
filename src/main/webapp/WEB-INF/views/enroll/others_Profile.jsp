<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.out-div{display: flex; justify-content: center;}
	.users-info{
		padding-top: 55px;
		width: 200px;
		text-align: center;
		margin-right: 40px;}
	.users-profile-img-out{display: flex; justify-content: center;}
	.users-profile-img{
		width: 120px; height: 120px; 
		border-radius: 50%; 
		overflow: hidden; 
		margin: 10px; margin-bottom: 10px;}
	.profile-img{object-fit: cover; object-position: center;}	
	.users-nickname{font-weight: bold; font-size: 18px;}
	.follow-info{display: flex; justify-content: center;}
	.follow{
		border: 2px solid black; border-radius: 20px;; 
		width : 100px; height: 35px;
		background: #B0DAFF;
		box-shadow: 0px 5px 0px black;
		text-align: center;
		margin: 0 auto;
		margin-top: 10px; margin-bottom: 15px;
		cursor: pointer;
		padding: 3px;}
	.follow:active{box-shadow: 0px 1px 0px black; transform: translateY(5px);}
	
	.list{width: 880px;}
	.list-menu-out{display: flex; }
	.list-menu{
		width: 220px; height: 50px; 
		text-align: center; padding-top: 10px;
		cursor: pointer;
		border-bottom: 2px solid black;
		color: gray;
		}
	.list-menu:hover{font-weight: bold;}
	.select{
		background: #1f8acb; color: white;
		border-top-right-radius: 15px; border-top-left-radius: 15px;
		border-top: 2px solid dimgray; border-left: 2px solid dimgray; border-right: 2px solid dimgray; border-bottom: none;}
	.contents{
		border-left: 2px solid dimgray; border-right: 2px solid dimgray; border-bottom: 2px solid dimgray;}
		
	.recipe-contents, .bookmark-contents, .write-list-contents{flex-wrap: wrap; padding-top: 50px; padding-bottom: 50px; padding-left: 17px;}
	.recipe-content{
		width: 200px;
		border: 1px solid gray; border-radius: 3px;
		margin: 5px;
		text-align: center; 
		cursor: pointer;
		}
	.recipe-img-div{width: 100%; height: 170px; overflow: hidden;}
	.recipe-img{width: 100%; height: 100%; object-fit: cover; object-position: center;}
	.recipe-name{font-weight: bold; font-size: 18px; margin: 10px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis; }
	.recipe-date{margin: 10px;}
	
	.write-list-content{
		width: 200px;
		border: 1px solid gray; border-radius: 3px;
		margin: 5px;
		cursor: pointer;
		}
	
	
	
	#bookmark-btn{position: absolute; margin-top: -172px; margin-left: 60px; font-size:25px; color: #B70000;}
	.bookmark-contents-title{font-weight: bold; font-size: 18px; margin-top: 10px; margin-bottom: 10px;}
	
</style>
</head>

<body>
	<%@ include file="../common/top.jsp"%>
	<br><br>
	
	<div class="out-div">
		<div class="users-info">
			<div class="users-profile-img-out">
				<div class="users-profile-img"><img class="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png" ></div>
			</div>
			<div class="users-nickname">유저 닉네임</div><br>
			<div class="users-intro">요리에살고 요리에죽는 장현지입니다 ^^7</div><br>
			<div class="follow-info">
				<a>팔로워 200 </a><i class="bi bi-dot" style="color: lightgray;"></i><a>팔로잉 100</a>
			</div>
			<div class="follow">
				<a>팔로우</a>
			</div>
		</div>
		<div class="list">
			<div class="list-menu-out">
				<div class="list-menu" id="recipe"><i class="fa-solid fa-book-bookmark"></i> 레시피</div>
				<div class="list-menu" id="write-list"><i class="fa-solid fa-pencil"></i> 글</div>
				<div class="list-menu" id="write-reply"><i class="fa-solid fa-comment"></i> 댓글</div>
				<div class="list-menu" id="recipe-review"><i class="fa-solid fa-utensils"></i> 레시피후기</div>
				<div class="list-menu" id=bookmark><i class="fa-solid fa-bookmark"></i> 스크랩</div>
			</div>
			<div class="contents">
				<div class="recipe-contents" style="display: flex;">
					<div class="recipe-content">
						<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food1.jpg"></div>
						<div class="recipe-name">바삭바삭 맛있는 치킨</div>
						<div>
							<a>채소</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>비건</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>국</a>
						</div>
						<div class="recipe-date">2023-06-16</div>
					</div>
					<div class="recipe-content">
						<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food2.jpg"></div>
						<div class="recipe-name">바삭바삭 맛있는 치킨</div>
						<div>
							<a>채소</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>비건</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>국</a>
						</div>
						<div class="recipe-date">2023-06-16</div>
					</div>
					<div class="recipe-content" >
						<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food3.jpg"></div>
						<div class="recipe-name">바삭바삭 맛있는 치킨</div>
						<div>
							<a>채소</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>비건</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>국</a>
						</div>
						<div class="recipe-date">2023-06-16</div>
					</div>
					<div class="recipe-content">
						<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food4.jpg"></div>
						<div class="recipe-name">바삭바삭 맛있는 치킨</div>
						<div>
							<a>채소</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>비건</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>국</a>
						</div>
						<div class="recipe-date">2023-06-16</div>
					</div>
					<div class="recipe-content">
						<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food5.jpeg"></div>
						<div class="recipe-name">바삭바삭 맛있는 치킨</div>
						<div>
							<a>채소</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>비건</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>국</a>
						</div>
						<div class="recipe-date">2023-06-16</div>
					</div>
					<div class="recipe-content">
						<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food6.jpeg"></div>
						<div class="recipe-name">바삭바삭 맛있는 치킨</div>
						<div>
							<a>채소</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>비건</a>
							<i class="bi bi-dot" style="color: lightgray;"></i>
							<a>국</a>
						</div>
						<div class="recipe-date">2023-06-16</div>
					</div>
				</div>
				<div class="write-list-contents" style="display: flex;">
					<div class="write-list-content">
						<div class="board-title">제목</div>
						<div class="board-writer">작성일</div>
					</div>
				</div>
				<div class="write-reply-contents" style="display: flex;">
					<div>
						3333
					</div>
				</div>
				<div class="recipe-review-contents" style="display: flex;">
					<div>33</div>
				</div>
				<div class="bookmark-contents">
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 레시피</div>
					<div style="display: flex;">
						<div class="recipe-content">
							<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food4.jpg"></div>
							<i class="fa-solid fa-bookmark" id="bookmark-btn"></i>
							<div class="recipe-name">바삭바삭 맛있는 치킨</div>
							<div>
								<a>채소</a>
								<i class="bi bi-dot" style="color: lightgray;"></i>
								<a>비건</a>
								<i class="bi bi-dot" style="color: lightgray;"></i>
								<a>국</a>
							</div>
							<div style="margin: 10px;">작성자닉넴</div>
							<div class="recipe-date">2023-06-16</div>
						</div>
						<div class="recipe-content">
							<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food5.jpeg"></div>
							<i class="fa-solid fa-bookmark" id="bookmark-btn"></i>
							<div class="recipe-name">바삭바삭 맛있는 치킨</div>
							<div>
								<a>채소</a>
								<i class="bi bi-dot" style="color: lightgray;"></i>
								<a>비건</a>
								<i class="bi bi-dot" style="color: lightgray;"></i>
								<a>국</a>
							</div>
							<div style="margin: 10px;">작성자닉넴</div>
							<div class="recipe-date">2023-06-16</div>
						</div>
					</div>
					<br>
					
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 식단</div>
					<div style="display: flex;">
						<div class="recipe-content">
						<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food6.jpeg"></div>
						<i class="fa-solid fa-bookmark" id="bookmark-btn"></i>
						<div class="recipe-name">바삭바삭 맛있는 치킨</div>
						<div>
							<a>튼튼밥상</a>
						</div>
						<div style="margin: 10px;">영양사 이름</div>
						<div class="recipe-date">2023-06-16</div>
					</div>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
	
	
	<br><br><br>
	<%@ include file="../common/footer.jsp"%>
	
<script>
	$(()=>{
		$('#recipe').addClass('select');
		
		$('.recipe-contents').show();
		$('.write-list-contents').hide();
		$('.write-reply-contents').hide();
		$('.recipe-review-contents').hide();
		$('.bookmark-contents').hide();
		
		$('#recipe').on('click', function(){
			$('#recipe').addClass('select');
			$('#write-list, #write-reply, #recipe-review, #bookmark').removeClass('select');
			
			$('.recipe-contents').show();
			$('.write-list-contents').hide();
			$('.write-reply-contents').hide();
			$('.recipe-review-contents').hide();
			$('.bookmark-contents').hide();
		})
		
		$('#write-list').on('click', function(){
			$('#write-list').addClass('select');
			$('#recipe, #write-reply, #recipe-review, #bookmark').removeClass('select');
			
			$('.recipe-contents').hide();
			$('.write-list-contents').show();
			$('.write-reply-contents').hide();
			$('.recipe-review-contents').hide();
			$('.bookmark-contents').hide();
		})
		
		$('#write-reply').on('click', function(){
			$('#write-reply').addClass('select');
			$('#recipe, #write-list, #recipe-review, #bookmark').removeClass('select');
			
			$('.recipe-contents').hide();
			$('.write-list-contents').hide();
			$('.write-reply-contents').show();
			$('.recipe-review-contents').hide();
			$('.bookmark-contents').hide();
		})
		
		$('#recipe-review').on('click', function(){
			$('#recipe-review').addClass('select');
			$('#recipe, #write-list, #write-reply, #bookmark').removeClass('select');
			
			$('.recipe-contents').hide();
			$('.write-list-contents').hide();
			$('.write-reply-contents').hide();
			$('.recipe-review-contents').show();
			$('.bookmark-contents').hide();
		})
		
		$('#bookmark').on('click', function(){
			$('#bookmark').addClass('select');
			$('#recipe, #write-list, #write-reply, #recipe-review').removeClass('select');
			
			$('.recipe-contents').hide();
			$('.write-list-contents').hide();
			$('.write-reply-contents').hide();
			$('.recipe-review-contents').hide();
			$('.bookmark-contents').show();
		})
	})
	
		
	
	
	
	
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.out-div{display: flex; justify-content: center; min-height: 700px;}
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
	.users-id{font-size: 15px;}
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
		
	.recipe-contents, .bookmark-contents, .recipe-review-contents{flex-wrap: wrap; padding-top: 50px; padding-bottom: 50px; padding-left: 17px;}
	.recipe-content:hover, .bookmark-content:hover, .recipe-review-content:hover{
		box-shadow: 5px 5px 10px rgba(0,0,0,0.10), 0 5px 5px rgba(0,0,0,0.22); transform: translateY(-2px); transition: all 0.2s ease 0s;
		}
	/* 1. 작성한 레시피 */
	.recipe-content{
		width: 200px;
		border: 1px solid gray; border-radius: 3px;
		margin: 5px;
		text-align: center; 
		cursor: pointer;
		}
	.recipe-img-div{width: 100%; height: 170px; overflow: hidden;}
	.recipe-img, .recipe-review-img{width: 100%; height: 100%; object-fit: cover; object-position: center;}
	.recipe-name{font-weight: bold; font-size: 18px; margin: 10px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis; }
	.recipe-date{margin: 5px;}
	
	/* 2. 작성글 */
 	.thead{ 
 		border-bottom: 1.5px solid gray;  
 		height: 40px; 
 		background: #b0daff; 
 		text-align: center;
		} 
	.tbody{border-bottom: 1px solid lightgray;}
	.tbody:hover{background: rgba(176, 218, 255, 0.3); cursor:pointer; }
	.board-info{width: 750px; padding-left: 30px; padding-top: 10px; padding-bottom: 10px;}
	.date-count{font-size: 13px; color: gray; margin-bottom: 0px; margin-top: 5px;}
	.board-reply{width: 150px; text-align: center;}
	.reply-count{
		width: 40px; height: 40px; 
		border-radius: 50%; border:1px solid dimgray; 
		background: #b0daff; 
		padding-top: 6px; margin-left: 53px;
		}
	
	/* 3. 작성댓글 */
	.reply-content{
		margin-top: 10px; margin-left: 5px; margin-bottom: 0px;
		display: flex;
		}
	
	/* 4. 작성한 레시피 후기 */
	.recipe-review-content{
		width: 830px;
		border: 1px solid gray; border-radius: 3px;
		margin: 5px; margin-bottom: 10px;
		cursor: pointer; display: flex;
		}
	.recipe-review-img-div{width: 250px; height: 170px; overflow: hidden;}
	.recipe-review-content-div{width: 580px; height: 160px; padding: 5px;}
	.recipe-review-name{
		width: 440px;
		font-weight: bold; font-size: 18px; 
		margin: 10px; 
		white-space: nowrap; overflow:hidden; text-overflow: ellipsis;}
	.review-star{width: 100px; font-size: 15px; margin: 10px;  text-align:right; color: gold;}
	.recipe-review-cate{text-align: right; font-size: 13px; margin: 10px; margin-top: -5px;}
	.review-content{
		padding-left: 20px; padding-right: 20px; 
		word-break: break-word; text-align: justify;
		overflow: hidden; text-overflow: ellipsis;
  		display: -webkit-box;
  		-webkit-line-clamp: 3; -webkit-box-orient: vertical;}
	
	/* 5.스크랩 */
	#bookmark-btn{position: absolute; margin-top: -172px; margin-left: 60px; font-size:25px; color: #B70000;}
	.bookmark-contents-title{font-weight: bold; font-size: 18px; margin-top: 10px; margin-bottom: 10px;}
	
	.lightgray{color: ightgray;}
	.flex{display: flex;}
</style>
</head>

<body>
	<%@ include file="../common/top.jsp"%>
	<br><br>
	
	<div class="out-div">
		<div class="users-info">
			<div class="users-profile-img-out">
				<div class="users-profile-img">
					<c:if test="${ social == null }"> <!-- 일반유저일때 -->
						<c:if test="${ image == null }"> <!-- 일반유저-프사없을때 -->
							<img class="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png" >
						</c:if>
						<c:if test="${ image != null }"> <!-- 일반유저-프사있을때 -->
							<img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ image.imageRenameName }" >
						</c:if>
					</c:if>
					<c:if test="${ social != null }"> <!-- 소셜유저일때 -->
						<img class="profile-img" src="${ social.social_profile_img }" >
					</c:if>
					
				</div>
			</div>
			<div class="users-nickname">${ user.nickName }</div>
			<div class="users-id">(${ user.usersId })</div><br>
			<c:if test="${ user.usersSelfIntro == null }">
				<div class="users-intro" style="color:gray;">자기소개글이 없습니다.</div><br>
			</c:if>
			<c:if test="${ user.usersSelfIntro != null }">
				<div class="users-intro">${ user.usersSelfIntro }</div><br>
			</c:if>
			<div class="follow-info">
				<a>팔로워 200 </a><i class="bi bi-dot lightgray"></i><a>팔로잉 100</a>
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
			
				<!-- 메뉴1. 레시피목록 -->
				<div class="recipe-contents flex">
					<c:if test="${ rList == null }">
						<div style="text-align: center; font-size: 20px;">등록한 레시피가 없습니다.</div>
					</c:if>
					<c:if test="${ rList !=null }">
						<c:forEach items="${ rList }" var="r">
							<c:forEach items="${ iList }" var="i">
								<c:if test="${ r.foodNo eq i.imageDivideNo }">
									<div class="recipe-content" onclick="location.href='${ contextPath }/recipeDetail.rc?rId=' + '${ user.usersId }' + '&rNo=' + '${ r.foodNo }' + '&page=' + '${ page }'">
										<div class="recipe-img-div"><img class="recipe-img" src="${ contextPath }/resources/uploadFiles/${i.imageRenameName }"></div>
										<div class="recipe-name">${ r.recipeName }</div>
										<div>
											${ r.categoryIngredient }<i class="bi bi-dot lightgray"></i>${ r.categorySituation }<i class="bi bi-dot lightgray"></i>${ r.categoryType }
										</div>
										<div class="recipe-date">${ r.recipeCreateDate }</div>
									</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:if>
				</div>
				
				<!-- 메뉴2. 작성글 목록 -->
				<div class="write-list-contents flex">
					<div class="write-list-content">
						<table>
							<thead>
								<tr class="thead">
									<th>작성 글</th>
									<th>댓글</th>
								</tr>
							</thead>
							<tbody>
								<tr class="tbody">
									<td class="board-info">
										더운날엔 역시 냉면을 먹어줘야하는거 아니겠습니까ㅎㅎㅎㅎㅎㅎㅎㅎㅎ
										<p class="date-count">2023-06-17 ∣ 조회 16</p>
									</td>
									<td class="board-reply"><div class="reply-count">3</div></td>
								</tr>
								<tr class="tbody">
									<td class="board-info">
										오늘 날씨 진짜 더움요
										<p class="date-count">2023-06-17 ∣ 조회 16</p>
									</td>
									<td class="board-reply"><div class="reply-count">315</div></td>
								</tr>
								<tr class="tbody">
									<td class="board-info">
										아니..주말동안 서버 안되는거 에바 아닌가요?
										<p class="date-count">2023-06-17 ∣ 조회 16</p>
									</td>
									<td class="board-reply"><div class="reply-count">999</div></td>
								</tr>
								<tr class="tbody">
									<td class="board-info">
										우왕🤡💀👺👹👿😈🤓🤥☠️👻👽👾🤖💩🤠🥹😇🤧🤮🤢🤒🦒🦊🐮🐈🥗🥩🎉🔫
										<p class="date-count">2023-06-17 ∣ 조회 16</p>
									</td>
									<td class="board-reply"><div class="reply-count">999</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- 메뉴3. 작성댓글 목록 -->
				<div class="write-reply-contents flex">
					<div class="write-replt-content">
						<table>
							<thead>
								<tr class="thead">
									<th>작성 댓글</th>
									<th>댓글</th>
								</tr>
							</thead>
							<tbody>
								<tr class="tbody">
									<td class="board-info">
										<p class="date-count">더운날엔 역시 냉면을 먹어줘야하는거 아니겠습니까ㅎㅎㅎㅎㅎㅎㅎㅎㅎ</p>
										<p class="date-count">글쓴사람닉넴 ∣ 2023-06-17 ∣ 조회 16</p>
										<div class="reply-content">
											<div style="margin-right: 10px;"><i class="fa-solid fa-arrow-right-long"></i></div>
										 	<div>말도안되는 소리 하지마세요....</div>
										</div>
									</td>
									<td class="board-reply"><div class="reply-count">3</div></td>
								</tr>
								<tr class="tbody">
									<td class="board-info">
										<p class="date-count">오늘 날씨 진짜 더움요</p>
										<p class="date-count">글쓴사람닉넴 ∣ 2023-06-17 ∣ 조회 16</p>
										<div class="reply-content">
											<div style="margin-right: 10px;"><i class="fa-solid fa-arrow-right-long"></i></div>
										 	<div>댓글 엄청 길게 남겨도 여기에 잘 나옵니다.....엔터도 가능하게 만들어야하나요....??? 댓글을 구구절절 왕길게 써보세요 </div>
										</div>
									</td>
									<td class="board-reply"><div class="reply-count">315</div></td>
								</tr>
								<tr class="tbody">
									<td class="board-info">
										<p class="date-count">아니..주말동안 서버 안되는거 에바 아닌가요?</p>
										<p class="date-count">글쓴사람닉넴 ∣ 2023-06-17 ∣ 조회 16</p>
										<div class="reply-content">
											<div style="margin-right: 10px;"><i class="fa-solid fa-arrow-right-long"></i></div>
										 	<div>어쩔수 없시 쉬어야 겠네요~~~ 그냥 맘편하세 쉬세요</div>
										</div>
									</td>
									<td class="board-reply"><div class="reply-count">999</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- 메뉴4. 작성 레시피 후기글 목록 -->
				<div class="recipe-review-contents">
					<div class="recipe-review-content">
						<div class="recipe-review-img-div"><img class="recipe-review-img" src="resources/images/food5.jpeg"></div>
						<div class="recipe-review-content-div">
						<div class="flex">
							<div class="recipe-review-name">고기가득 맛나는 짜파구리</div>
							<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
						</div>
							<div class="recipe-review-cate">글쓴사람닉넴 ∣ 채소<i class="bi bi-dot lightgray"></i>비건<i class="bi bi-dot lightgray"></i>면</div>
							<div class="review-content">
							여기에 리뷰 내용이 들어갑니다~~ 고기가 많이들어가서 완전 맛있어요!! 레시피 순서대로 하나씩 따라서 해보니 별로 어렵지도 않고 요리초보도 간단하게 만들수 있더라구요!
							뭔가 기생충 생각도 나고...ㅎㅎ 다들 따라해보셔요~
							</div>
						</div>
					</div>
					<div class="recipe-review-content">
						<div class="recipe-review-img-div"><img class="recipe-review-img" src="resources/images/food7.jpg"></div>
						<div class="recipe-review-content-div">
						<div class="flex">
							<div class="recipe-review-name">뜨끈한 국물이 맛나는 우~~동</div>
							<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
						</div>
							<div class="recipe-review-cate">글쓴사람닉넴 ∣ 채소<i class="bi bi-dot lightgray"></i>비건<i class="bi bi-dot lightgray"></i>면</div>
							<div class="review-content">
							생각보다 별로에요...생생우동 끓여 먹으세요
							</div>
						</div>
					</div>
				</div>
				
				<!-- 메뉴5. 북마크 목록 -->
				<div class="bookmark-contents">
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 레시피</div>
					<div style="display: flex;">
						<div class="recipe-content">
							<div class="recipe-img-div"><img class="recipe-img" src="resources/images/food4.jpg"></div>
							<i class="fa-solid fa-bookmark" id="bookmark-btn"></i>
							<div class="recipe-name">바삭바삭 맛있는 치킨</div>
							<div>
								<a>채소</a>
								<i class="bi bi-dot lightgray"></i>
								<a>비건</a>
								<i class="bi bi-dot lightgray"></i>
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
								<i class="bi bi-dot lightgray"></i>
								<a>비건</a>
								<i class="bi bi-dot lightgray"></i>
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
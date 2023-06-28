<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
		border: 2px solid gray;
		overflow: hidden; 
		margin: 10px; margin-bottom: 10px;}
	.profile-img{object-fit: cover; object-position: center;}	
	.users-nickname{font-weight: bold; font-size: 18px;}
	.users-id{font-size: 15px;}
	.follow-info{display: flex; justify-content: center; cursor:pointer;}
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
	.follwing-profile{width:50px; height:50px; border-radius: 50%; overflow: hidden; border: 2px solid gray;}
	
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
	
	/* 4. 작성한 후기 */
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
	
	
	/* 모달 */
	#modal{
		border: 1px solid black; width: 500px; height: 600px;
		border-radius: 15px; margin: 0 auto;
	}
	.modal-header{background: #B0DAFF;}
	.followName{
		font-size: 17px; font-weight: bold;
		margin-right: 200px; margin-top: 10px; margin-left: 10px;
		width: 100px;
		cursor: pointer;
	}
	.modalFollow{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 11.5px;
		width: 60px; height: 30px;
		color: white;
		background: rgba(231, 76, 60, 0.8);
		transform: scale(1.2);
		margin-top: 10px;
	}
	.modalFollow:hover {
	    border: 1px #C6C6C6 solid;
	    box-shadow: 1px 1px 1px #EAEAEA;
	    color: white;
	    background: rgba(231, 76, 60, 0.9);
	}
	
	.modalFollow:active {
	    box-shadow: inset 1px 1px 1px #DFDFDF;   
	}
	.modalFollower{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 60px; height: 30px;
		background: #B0DAFF;
		transform: scale(1.2);
		margin-top: 10px;
	}
	.modalFollower:hover {
	    border: 1px #C6C6C6 solid;
	    box-shadow: 1px 1px 1px #EAEAEA;
	    color: #333333;
	    background: #8bc4f7;
	}
	.modalFollower:active {
	    box-shadow: inset 1px 1px 1px #DFDFDF;   
	}
    #modalP{
    	width: 150px;
  		height: 150px;
        border-radius: 50%;
        cursor: pointer;
        object-fit: cover; object-position: center;
    }
    .modalUsers{
		border: none; border-radius: 5px;
		font-weight: bold; font-size: 12px;
		width: 60px; height: 30px;
		transform: scale(1.2);
		background: white;
		margin-top: 10px;
	}
</style>
</head>

<body>
	<%@ include file="../common/top.jsp"%>
	<br><br>
	<div class="out-div">
		<div class="users-info">
			<div class="users-profile-img-out">
				<div class="users-profile-img">
					<c:if test="${ social eq null }"> <!-- 일반유저일때 -->
						<c:if test="${ userImage eq null }"> <!-- 일반유저-프사없을때 -->
							<img class="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png" >
						</c:if>
						<c:if test="${ userImage ne null }"> <!-- 일반유저-프사있을때 -->
							<img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ userImage.imageRenameName }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';">
						</c:if>
					</c:if>
					<c:if test="${ social ne null }"> <!-- 소셜유저일때 -->
						<img class="profile-img" src="${ social.socialProfileImg }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';">
					</c:if>
				</div>
			</div>
			<div class="users-nickname">${ user.nickName }</div>
			<div class="users-id">(${ user.usersId })</div><br>
			<c:if test="${ user.usersSelfIntro eq null }">
				<div class="users-intro" style="color:gray;">자기소개글이 없습니다.</div><br>
			</c:if>
			<c:if test="${ user.usersSelfIntro ne null }">
				<div class="users-intro">${ user.usersSelfIntro }</div><br>
			</c:if>
			
			<c:if test="${ loginUser != null }">
				<div class="follow-info flex">
					<div data-bs-toggle="modal" data-bs-target="#follower"><a>팔로잉 ${ following } </a></div>
					<i class="bi bi-dot lightgray"></i>
					<div data-bs-toggle="modal" data-bs-target="#following"><a>팔로워 ${ follow }</a></div>
				</div>
				
				<!-- 로그인유저의 팔로잉 리스트에 해당유저 있으면 언팔, 없으면 팔 -->
				<c:if test="${ user.usersNo != loginUser.usersNo }">
					<c:set var="followStatus" value="false" />
					<c:forEach items="${lList}" var="l">
						<c:if test="${l.FOLLOWING_USER_NO eq user.usersNo}">
							<c:set var="followStatus" value="true" />
							<div class="unfollowDiv" data-user-no="${ user.usersNo }"><button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button></div>
						</c:if>
					</c:forEach>
					<c:if test="${not followStatus}">
					 	<div class="unfollowDiv" data-user-no="${ user.usersNo }"><button class="modalFollower" onclick="followUser(this)">팔로우</button></div>
					</c:if>
				</c:if>
				
			</c:if>
			
		</div>
		<div class="list">
			<div class="list-menu-out">
				<div class="list-menu" id="recipe"><i class="fa-solid fa-book-bookmark"></i> 레시피</div>
				<div class="list-menu" id="write-list"><i class="fa-solid fa-pencil"></i> 글</div>
				<div class="list-menu" id="write-reply"><i class="fa-solid fa-comment"></i> 댓글</div>
				<div class="list-menu" id="recipe-review"><i class="fa-solid fa-utensils"></i> 후기</div>
				<div class="list-menu" id=bookmark><i class="fa-solid fa-bookmark"></i> 스크랩</div>
			</div>
			<div class="contents">
			
				<!-- 메뉴1. 레시피목록 -->
				<div class="recipe-contents flex">
					<c:if test="${ empty rList }">
						<div style="margin: 85px; width: 100%; text-align: center; color: gray;">등록한 레시피가 없습니다.</div>
					</c:if>
					<c:if test="${ !empty rList }">
						<c:forEach items="${ rList }" var="r">
							<c:forEach items="${ recipeImageList}" var="ri">
								<c:if test="${ r.foodNo eq ri.imageDivideNo }">
									<div class="recipe-content" onclick="location.href='${ contextPath }/recipeDetail.rc?rId=' + '${ user.usersId }' + '&rNo=' + '${ r.foodNo }' + '&page=' + '${ page }'">
										<c:if test="${ ri.imageDivideNo == r.foodNo }">
											<div class="recipe-img-div"><img class="recipe-img" src="${ contextPath }/resources/uploadFiles/${ri.imageRenameName}"></div>
										</c:if>	
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
									<th class="board-info">작성 글</th>
									<th class="board-reply">댓글</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${ !empty boList }">
									<c:forEach items="${ boList }" var="bo">
										<c:if test="${ user.usersNo == bo.usersNo }">
											<tr class="tbody" onclick="location.href='${contextPath}/selectFreeBoard.bo?bId=' + '${ bo.boardNo }' + '&writer=' + '${ user.nickName }' + '&page='">
												<td class="board-info">
													${ bo.boardTitle }
													<p class="date-count"><fmt:formatDate value="${ bo.boardDate }" pattern="yyyy-MM-dd"/> ∣ 조회 ${ bo.boardCount }</p>
												</td>
												<c:set var="count" value="0" />
												<c:forEach items="${replyList}" var="rp">
													<c:if test="${rp.productNo eq bo.boardNo}">
														<c:set var="count" value="${count + 1}" />
													</c:if>
												</c:forEach>
												<td class="board-reply"><div class="reply-count">${ count }</div></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<c:if test="${ empty boList }">
							<div style="margin: 90px; text-align: center; color: gray;">작성한 글이 없습니다.</div>
						</c:if>
					</div>
				</div>
				
				<!-- 메뉴3. 작성댓글 목록 -->
				<div class="write-reply-contents flex">
					<div class="write-replt-content">
						<table>
							<thead>
								<tr class="thead">
									<th class="board-info">작성 댓글</th>
									<th class="board-reply">댓글</th>
								</tr>
							</thead>
							<tbody>
							
								<c:if test="${ !empty replyList }">
									<c:forEach items="${replyList}" var="rp"> <!-- 모든 댓글 리스트 -->
										<c:forEach items="${ boList }" var="bo"> <!-- 모든 게시글리스트 -->
											<c:if test="${rp.productNo eq bo.boardNo}"> <!-- 해당게시글의 댓글가져옴.. -->
												<c:if test="${rp.reviewWriter eq user.usersId }"> <!-- 해당 유저가 작성한 댓글만 가져와야하니까.... -->
													<tr class="tbody">
														<td class="board-info">
															<p class="date-count">${ bo.boardTitle }</p>
															<c:forEach items="${ hList }" var="h">
																<c:if test="${ bo.usersNo eq h.usersNo }">
																	<p class="date-count">${ h.nickName } ∣ <fmt:formatDate value="${ bo.boardDate }" pattern="yyyy-MM-dd"/> ∣ 조회 ${ bo.boardCount }</p>
																</c:if>
															</c:forEach>
															<div class="reply-content">
																<div style="margin-right: 10px;"><i class="fa-solid fa-arrow-right-long"></i></div>
															 	<div>${ rp.reviewContent }</div>
															</div>
														</td>
													</tr>
												</c:if>
												
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:if>
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
				
				<!-- 메뉴4. 작성 후기 목록 -->
				<div class="recipe-review-contents">
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 레시피</div>
					
					<c:if test="${ empty rvList }">
						<div style="margin: 50px; text-align: center; color: gray;">작성한 레시피 후기가 없습니다.</div>
					</c:if>
						
					<c:forEach items="${ rvList }" var="rv">
						<div class="recipe-review-content" onclick="location.href='${ contextPath }/recipeDetail.rc?rId=' + '${ user.usersId }' + '&rNo=' + '${rv.orderNo }' + '&page=' + '${ page }'">
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ rv.orderNo == a.foodNo }">
									<c:forEach items="${ recipeImageList }" var="rImg">
										<c:if test="${ rImg.imageDivideNo == rv.orderNo }">
											<div class="recipe-review-img-div"><img class="recipe-review-img" src="${ contextPath }/resources/uploadFiles/${ rImg.imageRenameName }"></div>
										</c:if>
									</c:forEach>
									<div class="recipe-review-content-div">
									<div class="flex">
										<div class="recipe-review-name">${ a.recipeName }</div>
										<c:if test="${ rv.reviewScore == 5 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.reviewScore == 4 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.reviewScore == 3 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.reviewScore == 2 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.reviewScore == 1 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.reviewScore == 0 }">
											<div class="review-star"><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
									</div>
										<c:forEach items="${ hList }" var="h">
											<c:if test="${ h.usersNo == a.usersNo }">
												<div class="recipe-review-cate">${ h.nickName } ∣ ${ r.categoryIngredient }<i class="bi bi-dot lightgray"></i>${ a.categorySituation }<i class="bi bi-dot lightgray"></i>${ a.categoryType }</div>
											</c:if>
										</c:forEach>
										
										<div class="review-content">
											${ rv.reviewContent }
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
						
					<br>
					<div style='border: 1.1px dashed lightgray; margin-right: 15px;'></div>
					<br>	
					
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 식단</div>
					
					<c:if test="${ empty mrList }">
						<div style="margin: 50px; text-align: center; color: gray;">작성한 식단 후기가 없습니다.</div>
					</c:if>
					
					<c:forEach items="${ mrList }" var="mr">
						<div class="recipe-review-content">
							<c:forEach items="${ menuReviewImageList }" var="mrImg">
								<c:if test="${ mrImg.imageDivideNo == mr.REVIEW_NO }">
									<div class="recipe-review-img-div"><img class="recipe-review-img" src="${ contextPath }/resources/uploadFiles/${ mrImg.imageRenameName }"></div>
								</c:if>
							</c:forEach>
							<div class="recipe-review-content-div">
								<div class="flex">
									<div class="recipe-review-name">${ mr.MENU_NAME }</div>
									<c:if test="${ mr.REVIEW_SCORE == 5 }">
										<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
									</c:if>
									<c:if test="${ mr.REVIEW_SCORE == 4 }">
										<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></div>
									</c:if>
									<c:if test="${ mr.REVIEW_SCORE == 3 }">
										<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
									</c:if>
									<c:if test="${ mr.REVIEW_SCORE == 2 }">
										<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
									</c:if>
									<c:if test="${ mr.REVIEW_SCORE == 1 }">
										<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
									</c:if>
									<c:if test="${ mr.REVIEW_SCORE == 0 }">
										<div class="review-star"><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
									</c:if>
								</div>
								<c:forEach items="${ hList }" var="h">
									<c:if test="${ h.usersNo== mr.USERS_NO }">
										<div class="recipe-review-cate">${ h.nickName }</div>
									</c:if>
								</c:forEach>
								<div class="review-content">${ mr.REVIEW_CONTENT }</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
				
				<!-- 메뉴5. 북마크 목록 -->
				<div class="bookmark-contents">
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 레시피</div>
					<c:if test="${ rCount == 0 }">
						<div style="margin: 50px; text-align: center; color: gray;">스크랩한 레시피가 없습니다.</div>
					</c:if>
					<div style="display: flex;">
						<c:forEach items="${ bList }" var="b">
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ b.divisionNo == a.foodNo }">
									<div class="recipe-content" onclick="location.href='${ contextPath }/recipeDetail.rc?rId=' + '${ users.usersNo }' + '&rNo=' + '${ a.foodNo }' + '&page=' + '${ page }'">
										<c:forEach items="${ recipeImageList}" var="ri">
											<c:if test="${ ri.imageDivideNo == a.foodNo }">
												<div class="recipe-img-div"><img class="recipe-img" src="${ contextPath }/resources/uploadFiles/${ri.imageRenameName}"></div>
											</c:if>	
										</c:forEach>
										<i class="fa-solid fa-bookmark" id="bookmark-btn"></i>
										<div class="recipe-name">${ a.recipeName }</div>
										<div>
											${ a.categoryIngredient }<i class="bi bi-dot lightgray"></i>${ a.categorySituation }<i class="bi bi-dot lightgray"></i>${ a.categoryType }
										</div>
										<c:forEach items="${ hList }" var="h">
											<c:if test="${ h.usersNo == a.usersNo }">
												<div style="margin: 10px;">${ h.usersName }</div>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
					
					<br>
					<div style='border: 1.1px dashed lightgray; margin-right: 15px;'></div>
					<br>
					
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 식단</div>
					
					<c:if test="${ mCount == 0 }">
						<div style="margin: 50px; text-align: center; color: gray;">스크랩한 식단이 없습니다.</div>
					</c:if>
					<div style="display: flex;">
						<c:forEach items="${ bList }" var="b">
							<c:forEach items="${ mList }" var="m">
								<c:if test="${ b.divisionNo == m.productNo }">
									<div class="recipe-content">
										<c:forEach items="${ menuImageList}" var="mi">
											<c:if test="${ mi.imageDivideNo == m.productNo }">
												<div class="recipe-img-div"><img class="recipe-img" src="${contextPath}/resources/uploadFiles/${mi.imageRenameName}"></div>
											</c:if>
										</c:forEach>
										<i class="fa-solid fa-bookmark" id="bookmark-btn"></i>
										<div class="recipe-name">${ m.menuName }</div>
										<div>
											<c:if test="${ m.menuType == 1 }"><a>🏋다이어트</a></c:if>
											<c:if test="${ m.menuType == 2 }"><a>🤒몸보신</a></c:if>
											<c:if test="${ m.menuType == 3 }"><a>💪든든밥상</a></c:if>
											<c:if test="${ m.menuType == 4 }"><a>🥩고단백</a></c:if>
											<c:if test="${ m.menuType == 5 }"><a>🥗채식</a></c:if>
										</div>
										<c:forEach items="${ pList }" var="p">
											<c:if test="${ p.productNo == m.productNo }">
												<c:forEach items="${ hList }" var="h">
													<c:if test="${ h.usersNo == p.usersNo }">
														<div style="margin: 10px;">${ h.usersName }</div>
													</c:if>
												</c:forEach>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<br><br><br>
	<%@ include file="../common/footer.jsp"%>
	
	<!-- 팔로우, 팔로잉 모달 -->
	<div class="modal fade" id="following" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로워  ${ follow }명</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<c:if test="${ follow eq 0 }">
						<div style="justify-content: center; margin-top: 30px; margin-bottom: 80px; text-align: center;">
							<a style="font-size: 80px; margin: 10px; color:gray;"><i class="fa-solid fa-face-surprise"></i></a><br>
							<a>팔로워가 없습니다</a>
						</div>
					</c:if>
					
					<c:if test="${ follow ne 0}">
						<c:forEach items="${ followingLsit }" var="ing"> <!-- 해당 사용지의 팔로잉 목록 -->
							<div class="flex" style="justify-content: center; cursor: pointer;">
								<c:if test="${ fn:contains(ing.USERS_PW, '$2a$')}"> <!-- 일반 유저면 -->
									<c:if test="${ ing.IMAGE_NO != null }">
										<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ing.USERS_ID}' + '&uNo=' + '${ ing.USERS_NO }' + '&page=' + '${page}'"><img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ ing.IMAGE_RENAMENAME }" onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"></div>
									</c:if>
									<c:if test="${ ing.IMAGE_NO == null }">
										<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ing.USERS_ID}' + '&uNo=' + '${ ing.USERS_NO }' + '&page=' + '${page}'"><img class="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png" ></div>
									</c:if>
								</c:if>
								
								<c:if test="${ !fn:contains(ing.USERS_PW, '$2a$')}"> <!-- 소셜 유저면 -->
									<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ing.USERS_ID}' + '&uNo=' + '${ ing.USERS_NO }' + '&page=' + '${page}'"><img class="profile-img" src="${ ing.SOCIAL_PROFILE_IMG }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"></div>
								</c:if>
								
								<div><label class="followName" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ing.USERS_ID}' + '&uNo=' + '${ ing.USERS_NO }' + '&page=' + '${page}'">${ ing.NICKNAME }</label></div>
								
								<c:set var="follow" value="false"/>
							    <c:forEach items="${lList}" var="fl">
							        <c:choose>
							            <c:when test="${fl.NICKNAME eq ing.NICKNAME}">
							                <c:set var="follow" value="true"/>
							                <c:if test="${ ing.NICKNAME eq loginUser.nickName }">
							                	<div class="unfollowDiv"><button class="modalUsers"></button></div>
							                </c:if>
							                <c:if test="${ ing.NICKNAME ne loginUser.nickName }">
							                	 <div class="unfollowDiv" data-user-no="${ing.USERS_NO}"><button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button></div>
							                </c:if>
							            </c:when>
							        </c:choose>
							    </c:forEach>
							    <c:if test="${not follow}">
							    	<c:if test="${ ing.NICKNAME eq loginUser.nickName }">
					                	<div class="unfollowDiv"><button class="modalUsers"></button></div>
					                </c:if>
					                <c:if test="${ ing.NICKNAME ne loginUser.nickName }">
					                	 <div class="unfollowDiv" data-user-no="${ing.USERS_NO}"><button class="modalFollower" onclick="followUser(this)">팔로우</button></div>
					                </c:if>
							    </c:if>
							</div><br>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="follower" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로잉  ${ following }명</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				
					<c:if test="${ following eq 0 }">
						<div style="justify-content: center; margin-top: 30px; margin-bottom: 80px; text-align: center;">
							<a style="font-size: 80px; margin: 10px; color:gray;"><i class="fa-solid fa-face-surprise"></i></a><br>
							<a>팔로잉하는 사용자가 없습니다</a>
						</div>
					</c:if>
				
					<c:if test="${ following ne 0 }">
						<c:forEach items="${ followList }" var="wo">
							<div class="flex" style="justify-content: center; cursor: pointer;">
								<c:if test="${ fn:contains(wo.USERS_PW, '$2a$')}"> <!-- 일반 유저면 -->
									<c:if test="${ wo.IMAGE_NO != null }">
										<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${wo.USERS_ID}' + '&uNo=' + '${ wo.FOLLOWING_USER_NO }' + '&page=' + '${page}'"><img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ wo.IMAGE_RENAMENAME }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"></div>
									</c:if>
									<c:if test="${ wo.IMAGE_NO == null }">
										<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${wo.USERS_ID}' + '&uNo=' + '${ wo.FOLLOWING_USER_NO }' + '&page=' + '${page}'"><img class="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png" ></div>
									</c:if>
								</c:if>
								
								<c:if test="${ !fn:contains(wo.USERS_PW, '$2a$')}"> <!-- 소셜 유저면 -->
									<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${wo.USERS_ID}' + '&uNo=' + '${ wo.FOLLOWING_USER_NO }' + '&page=' + '${page}'"><img class="profile-img" src="${ wo.SOCIAL_PROFILE_IMG }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"></div>
								</c:if>
								
								<div><label class="followName" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${wo.USERS_ID}' + '&uNo=' + '${ wo.FOLLOWING_USER_NO }' + '&page=' + '${page}'">${ wo.NICKNAME }</label></div>
								
								<c:set var="following" value="false"/>
							    <c:forEach items="${lList}" var="fl">
							        <c:choose>
							            <c:when test="${fl.NICKNAME eq wo.NICKNAME}">
							                <c:set var="following" value="true"/>
							                
							                <c:if test="${ wo.NICKNAME eq loginUser.nickName }">
							                	<div class="unfollowDiv"><button class="modalUsers"></button></div>
							                </c:if>
							                <c:if test="${ wo.NICKNAME ne loginUser.nickName }">
							                	 <div class="unfollowDiv" data-user-no="${wo.USERS_NO}"><button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button></div>
							                </c:if>
							            </c:when>
							        </c:choose>
							    </c:forEach>
							    <c:if test="${not following}">
							    	<c:if test="${ wo.NICKNAME eq loginUser.nickName }">
					                	<div class="unfollowDiv"><button class="modalUsers"></button></div>
					                </c:if>
					                <c:if test="${ wo.NICKNAME ne loginUser.nickName }">
					                	 <div class="unfollowDiv" data-user-no="${wo.USERS_NO}"><button class="modalFollower" onclick="followUser(this)">팔로우</button></div>
					                </c:if>
							    </c:if>
							</div><br>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	
	
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
	
	
	const usersNo = '${loginUser.usersNo}'; // 얘 어케 수정함~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		// 팔로잉 모달
		// 언팔
		function unfollowUser(button) {
			const usersNo = '${loginUser.usersNo}';
			var userNo = button.parentNode.dataset.userNo;
		
			$.ajax({
			    type: 'POST',
			    url: '${contextPath}/myPage_unFollow.me',
			    data: { usersNo: usersNo, followingNo: userNo },
			    success: function (data) {
		     		 console.log('언팔로우 성공');
					if (data == 'yes') {
						var unfollowDiv = button.parentNode;
						unfollowDiv.innerHTML = '<button class="modalFollower" onclick="followUser(this)">팔로우</button>';
					}
		    	},
		    	error: function (data) {
					console.log('언팔로우 실패');
				}
			});
		}
		
		// 팔로
		function followUser(button) {
			var userNo = button.parentNode.dataset.userNo;
				console.log(userNo);
			  
			$.ajax({
				type: 'POST',
			    url: '${contextPath}/myPage_follow.me',
			    data: { usersNo: usersNo, followNo: userNo },
			    success: function (data) {
					console.log('팔로우 성공');
					var unfollowDiv = button.parentNode;
			  		unfollowDiv.innerHTML = '<button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button>';
				},
			    error: function (data) {
			 		console.log('실패');
			    }
			});
		}
	
</script>
</body>
</html>
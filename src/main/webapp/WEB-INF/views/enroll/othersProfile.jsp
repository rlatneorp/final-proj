<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홀로세끼</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
	@font-face {
	    font-family: 'YESGothic-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YESGothic-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* { font-family: 'YESGothic-Regular';}

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
		
	.recipe-contents-div, .bookmark-contents, .recipe-review-contents{flex-wrap: wrap; padding-top: 50px; padding-bottom: 50px; padding-left: 17px;}
	.recipe-content:hover, .bookmark-content:hover, .recipe-review-content:hover{
		box-shadow: 5px 5px 10px rgba(0,0,0,0.10), 0 5px 5px rgba(0,0,0,0.22); transform: translateY(-2px); transition: all 0.2s ease 0s;
		}
		
	.more, .more2, .more3, .more4, .more5, .more22, .more33, .more2-2, .more-2, .more3-2, .more4-2, .more5-2, .more22-2, .more33-2{width: 70px; text-align: center; cursor: pointer; margin: 0 auto; margin-top: 20px; margin-bottom: 20px;}
	.more:hover, .more2:hover, .more3:hover, .more4:hover, .more5:hover, .more22:hover, .more33:hover{font-weight: bold;}
	.more-2:hover, .more2-2:hover, .more3-2:hover, .more4-2:hover, .more5-2:hover, .more22-2:hover, .more33-2:hover{font-weight: bold;}
		
		
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
	.tbody, .tbody2{border-bottom: 1px solid lightgray;}
	.tbody:hover, .tbody2:hover{background: rgba(176, 218, 255, 0.3); cursor:pointer; }
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
		margin-right: 10px; margin-top: 10px; margin-left: 10px; padding-left: 10px;
		width: 300px;
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
		white-space: nowrap;
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
		white-space: nowrap;
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
	
	
	/* 	페이지 */
	.page_wrap {
		text-align:center;
		font-size:0;
		}
	.page_nation {display:inline-block;}
	.page_nation .none {display:none;}
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
	.page_nation .arrow {margin-top: 8px;}
	.page_nation .prev {background:white;}
	.page_nation .next {background:white;}
	.page_nation a.active {
		background-color:#B0DAFF;
		color:white;
		border:1px solid #B0DAFF;
		border-radius: 100%;
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
							<img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ userImage.imageRenameName }">
						</c:if>
					</c:if>
					<c:if test="${ social ne null }"> <!-- 소셜유저일때 -->
						<c:if test="${ userImage.imageDivideNo != user.usersNo }">
							<img class="profile-img" src="${ social.socialProfileImg }" />
						</c:if>
						<c:if test="${ userImage.imageDivideNo == user.usersNo and userImage.imageType == '1' }">
							<img class="profile-img" src="${contextPath}/resources/uploadFiles/${ userImage.imageRenameName }"/>
						</c:if>	
					</c:if>
				</div>
			</div>
			<div class="users-nickname">${ user.nickName }</div>
			
			<c:if test="${ social eq null }">
				<div class="users-id">(${ user.usersId })</div><br>
			</c:if>
			<c:if test="${ social ne null }">
				<div class="users-id">(소셜로그인 유저입니다)</div><br>
			</c:if>
			
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
				<div class="recipe-contents">
					<div class="flex recipe-contents-div">
					<c:if test="${ empty rList }">
						<div style="margin: 85px; width: 100%; text-align: center; color: gray;">등록한 레시피가 없습니다.</div>
					</c:if>
					<c:if test="${ !empty rList }">
						<c:forEach items="${ rList }" var="r">
							<c:forEach items="${ recipeImageList}" var="ri">
								<c:if test="${ r.foodNo eq ri.imageDivideNo }">
									<div class="recipe-content div-box" style="display: none;" onclick="location.href='${ contextPath }/recipeDetail.rc?rId=' + '${ user.usersId }' + '&rNo=' + '${ r.foodNo }' + '&page=' + '${ page }'">
										<c:if test="${ ri.imageDivideNo == r.foodNo }">
											<div class="recipe-img-div"><img class="recipe-img" src="${ contextPath }/resources/uploadFiles/${ri.imageRenameName}"></div>
										</c:if>	
										<div class="recipe-name">${ r.recipeName }</div>
										<div>
											${ r.categoryIngredient }<i class="bi bi-dot lightgray"></i>${ r.categorySituation }<i class="bi bi-dot lightgray"></i>${ r.categoryType }
										</div>
										<div class="recipe-date"><fmt:formatDate value="${ r.recipeCreateDate }" pattern="yyyy-MM-dd"/></div>
									</div>
								</c:if>
							</c:forEach>
						</c:forEach>
						
<!-- 						<div class="more"><i class="bi bi-chevron-double-down"></i> 더보기</div> -->
					</c:if>
					</div>
					<div style="display: flex; justify-content: center;">
						<div class="more"><i class="bi bi-chevron-double-down"></i> 더보기</div>
						<div class="more-2"><i class="bi bi-chevron-double-up"></i> 접기</div>
					</div>
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
											<tr class="tbody" onclick="location.href='${contextPath}/detailFreeBoard.bo?bId=' + '${ bo.boardNo }' + '&writer=' + '${ user.nickName }' + '&page='">
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
						<div style="display: flex; justify-content: center;">
							<div class="more22"><i class="bi bi-chevron-double-down"></i> 더보기</div>
							<div class="more22-2"><i class="bi bi-chevron-double-up"></i> 접기</div>
						</div>
						
<!-- 						<div class="more22"><i class="bi bi-chevron-double-down"></i> 더보기</div> -->
					</div>
				</div>
				
				<!-- 메뉴3. 작성댓글 목록 -->
				<div class="write-reply-contents">
					<div class="flex">
						<div class="write-replt-content">
							<table>
								<thead>
									<tr class="thead">
										<th class="board-info">작성 댓글</th>
										<th class="board-reply">댓글</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${ !empty userRList }">
										<c:forEach items="${replyList}" var="rp"> <!-- 모든 댓글 리스트 -->
											<c:forEach items="${ allBoardList }" var="ab"> <!-- 모든 게시글리스트 가져와야함..! -->
												<c:if test="${rp.productNo eq ab.boardNo}"> <!-- 해당게시글의 댓글가져옴.. -->
													<c:if test="${rp.reviewWriter eq user.nickName }"> <!-- 해당 유저가 작성한 댓글만 가져와야하니까.... -->
														<tr class="tbody2" onclick="location.href='${contextPath}/detailFreeBoard.bo?bId=' + '${ ab.boardNo }' + '&writer=' + '${ user.nickName }' + '&page='">
															<td class="board-info">
																<p class="date-count">글제목 : ${ ab.boardTitle }</p>
																<c:forEach items="${ hList }" var="h">
																	<c:if test="${ ab.usersNo eq h.usersNo }">
																		<p class="date-count">${ h.nickName } ∣ <fmt:formatDate value="${ ab.boardDate }" pattern="yyyy-MM-dd"/> ∣ 조회 ${ ab.boardCount }</p>
																	</c:if>
																</c:forEach>
																<div class="reply-content">
																	<div style="margin-right: 10px;"><i class="fa-solid fa-arrow-right-long"></i></div>
																 	<div>${ rp.reviewContent }</div>
																</div>
															</td>
															<c:set var="count" value="0" />
															<c:forEach items="${replyList}" var="rp">
																<c:if test="${rp.productNo eq ab.boardNo}">
																	<c:set var="count" value="${count + 1}" />
																</c:if>
															</c:forEach>
															<td class="board-reply"><div class="reply-count">${ count }</div></td>
														</tr>
													</c:if>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<c:if test="${ empty userRList }">
								<div style="margin: 90px; text-align: center; color: gray;">작성한 댓글이 없습니다.</div>
							</c:if>
							
							<div style="display: flex; justify-content: center;">
								<div class="more33"><i class="bi bi-chevron-double-down"></i> 더보기</div>
								<div class="more33-2"><i class="bi bi-chevron-double-up"></i> 접기</div>
							</div>
<!-- 							<div class="more33"><i class="bi bi-chevron-double-down"></i> 더보기</div> -->
						</div>
					</div>
				</div>
				
				<!-- 메뉴4. 작성 후기 목록 -->
				<div class="recipe-review-contents">
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 레시피</div>
					<c:if test="${ empty rvList }">
						<div style="margin: 50px; text-align: center; color: gray;">작성한 레시피 후기가 없습니다.</div>
					</c:if>
					<c:forEach items="${ rvList }" var="rv">
						<div class="recipe-review-content div-box4" style="display: none;" onclick="location.href='${ contextPath }/recipeDetail.rc?rId=' + '${ rv.USERS_ID }' + '&rNo=' + '${ rv.PRODUCT_NO }' + '&page=' + '${ page }'">
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ rv.PRODUCT_NO == a.foodNo }">
									<c:forEach items="${ recipeImageList }" var="rImg">
										<c:if test="${ rImg.imageDivideNo == rv.PRODUCT_NO }">
											<div class="recipe-review-img-div"><img class="recipe-review-img" src="${ contextPath }/resources/uploadFiles/${ rImg.imageRenameName }"></div>
										</c:if>
									</c:forEach>
									<div class="recipe-review-content-div">
									<div class="flex">
										<div class="recipe-review-name">${ a.recipeName }</div>
										<c:if test="${ rv.REVIEW_SCORE == 5 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.REVIEW_SCORE == 4 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.REVIEW_SCORE == 3 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.REVIEW_SCORE == 2 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.REVIEW_SCORE == 1 }">
											<div class="review-star"><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
										<c:if test="${ rv.REVIEW_SCORE == 0 }">
											<div class="review-star"><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></div>
										</c:if>
									</div>
										<c:forEach items="${ hList }" var="h">
											<c:if test="${ h.usersNo == a.usersNo }">
												<div class="recipe-review-cate">${ h.nickName } ∣ ${ a.categoryIngredient }<i class="bi bi-dot lightgray"></i>${ a.categorySituation }<i class="bi bi-dot lightgray"></i>${ a.categoryType }</div>
											</c:if>
										</c:forEach>
										<div class="review-content">
											${ rv.REVIEW_CONTENT }
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
					<div style="display: flex; justify-content: center;">
						<div class="more4"><i class="bi bi-chevron-double-down"></i> 더보기</div>
						<div class="more4-2"><i class="bi bi-chevron-double-up"></i> 접기</div>
					</div>
					
<!-- 					<div class="more4"><i class="bi bi-chevron-double-down"></i> 더보기</div> -->
						
					<br>
					<div style='border: 1.1px dashed lightgray; margin-right: 15px;'></div>
					<br>	
					
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 식단</div>
					<c:if test="${ empty mrList }">
						<div style="margin: 50px; text-align: center; color: gray;">작성한 식단 후기가 없습니다.</div>
					</c:if>
					<c:forEach items="${ mrList }" var="mr">
						<div class="recipe-review-content div-box5" style="display: none;" onclick="location.href='${contextPath}/menuDetail.mn?mNo=' + '${ mr.PRODUCT_NO }' + '&page='">
							<c:forEach items="${ menuImageList }" var="mImg">
								<c:if test="${ mImg.imageDivideNo == mr.PRODUCT_NO }">
									<div class="recipe-review-img-div"><img class="recipe-review-img" src="${ contextPath }/resources/uploadFiles/${ mImg.imageRenameName }"></div>
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
					<div style="display: flex; justify-content: center;">
						<div class="more5"><i class="bi bi-chevron-double-down"></i> 더보기</div>
						<div class="more5-2"><i class="bi bi-chevron-double-up"></i> 접기</div>
					</div>
<!-- 					<div class="more5"><i class="bi bi-chevron-double-down"></i> 더보기</div> -->
				</div>
				
				<!-- 메뉴5. 북마크 목록 -->
				<div class="bookmark-contents">
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 레시피</div>
					
					<c:if test="${ empty rCount }">
						<div style="margin: 50px; text-align: center; color: gray;">스크랩한 레시피가 없습니다.</div>
					</c:if>
					
					<div style="display: flex; flex-wrap: wrap; padding-top: 50px; padding-bottom: 50px; padding-left: 17px;">
						<c:forEach items="${ bList }" var="b">
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ b.divisionNo == a.foodNo }">
									<div class="recipe-content div-box2" style="display: none;" onclick="location.href='${ contextPath }/recipeDetail.rc?rId=' + '${ user.usersId }' + '&rNo=' + '${ a.foodNo }' + '&page=' + '${ page }'">
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
					<div style="display: flex; justify-content: center;">
						<div class="more2"><i class="bi bi-chevron-double-down"></i> 더보기</div>
						<div class="more2-2"><i class="bi bi-chevron-double-up"></i> 접기</div>
					</div>
					
					<br>
					<div style='border: 1.1px dashed lightgray; margin-right: 15px;'></div>
					<br>
					
					<div class="bookmark-contents-title"><i class="bi bi-check"></i> 식단</div>
					<c:if test="${ mCount == 0 }">
						<div style="margin: 50px; text-align: center; color: gray;">스크랩한 식단이 없습니다.</div>
					</c:if>
					<div style="display: flex; flex-wrap: wrap; padding-top: 50px; padding-bottom: 50px; padding-left: 17px;">
						<c:forEach items="${ bList }" var="b">
							<c:forEach items="${ mList }" var="m">
								<c:if test="${ b.divisionNo == m.foodProductNo }">
									<div class="recipe-content div-box3" style="display: none;" onclick="location.href='${ contextPath }/menuDetail.mn?mNo=' + '${ m.foodProductNo }' + '&page=' + '${ page }'">
										<c:forEach items="${ menuImageList}" var="mi">
											<c:if test="${ mi.imageDivideNo == m.foodProductNo }">
												<div class="recipe-img-div"><img class="recipe-img" src="${contextPath}/resources/uploadFiles/${mi.imageRenameName}"></div>
											</c:if>
										</c:forEach>
										<i class="fa-solid fa-bookmark" id="bookmark-btn"></i>
										<div class="recipe-name">${ m.menuName }</div>
										<div>
											<c:if test="${ m.menuKind == 1 }"><a>🥗다이어트</a></c:if>
											<c:if test="${ m.menuKind == 2 }"><a>🤒몸보신</a></c:if>
											<c:if test="${ m.menuKind == 3 }"><a>💪든든밥상</a></c:if>
											<c:if test="${ m.menuKind == 4 }"><a>🥩고단백</a></c:if>
											<c:if test="${ m.menuKind == 5 }"><a>🥬채식</a></c:if>
										</div>
										<c:forEach items="${ pList }" var="p">
											<c:if test="${ p.productNo == m.foodProductNo }">
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
					<div style="display: flex; justify-content: center;">
						<div class="more3"><i class="bi bi-chevron-double-down"></i> 더보기</div>
						<div class="more3-2"><i class="bi bi-chevron-double-up"></i> 접기</div>
					</div>
<!-- 					<div class="more3"><i class="bi bi-chevron-double-down"></i> 더보기</div> -->
				</div>
			</div>
		</div>
	</div>
	
	
	<br><br><br>
	<%@ include file="../common/footer.jsp"%>
	
	<!-- 팔로우, 팔로잉 모달 -->
	<div class="modal fade" id="following" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
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
									<c:if test="${ ing.IMAGE_DIVIDE_NO == null  }">
										<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ing.USERS_ID}' + '&uNo=' + '${ ing.USERS_NO }' + '&page=' + '${page}'"><img class="profile-img" src="${ ing.SOCIAL_PROFILE_IMG }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"></div>
									</c:if>
									<c:if test="${ ing.IMAGE_DIVIDE_NO != null  }">
										<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ing.USERS_ID}' + '&uNo=' + '${ ing.USERS_NO }' + '&page=' + '${page}'"><img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ ing.IMAGE_RENAMENAME }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"></div>
									</c:if>
								</c:if>
								
								<div class="followName" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ing.USERS_ID}' + '&uNo=' + '${ ing.USERS_NO }' + '&page=' + '${page}'">${ ing.NICKNAME }</div>
								
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
	
	<div class="modal fade" id="follower" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="followingLabel">팔로잉  ${ following }명</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
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
								
								<c:if test="${ !fn:contains(wo.USERS_PW, '$2a$')}"> <!-- 소셜 유저면 --> <!-- 프사 등록한거 있으면 등록한 프사 나오게 해야함, 없으면 소셜프사 나오게 해야함 -->
									<c:if test="${ wo.IMAGE_DIVIDE_NO == null  }">
										<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${wo.USERS_ID}' + '&uNo=' + '${ wo.FOLLOWING_USER_NO }' + '&page=' + '${page}'"><img class="profile-img" src="${ wo.SOCIAL_PROFILE_IMG }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"></div>
									</c:if>
									<c:if test="${ wo.IMAGE_DIVIDE_NO != null  }">
										<div class="follwing-profile" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${wo.USERS_ID}' + '&uNo=' + '${ wo.FOLLOWING_USER_NO }' + '&page=' + '${page}'"><img class="profile-img" src="${ contextPath }/resources/uploadFiles/${ wo.IMAGE_RENAMENAME }"  onerror="this.src='https://botsitivity.org/static/media/noprofile.c3f94521.png';"></div>
									</c:if>
								</c:if>
								
								<div class="followName" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${wo.USERS_ID}' + '&uNo=' + '${ wo.FOLLOWING_USER_NO }' + '&page=' + '${page}'">${ wo.NICKNAME }</div>
								
								<c:set var="following" value="false"/>
							    <c:forEach items="${lList}" var="fl">
							        <c:choose>
							            <c:when test="${fl.NICKNAME eq wo.NICKNAME}">
							                <c:set var="following" value="true"/>
							                
							                <c:if test="${ wo.NICKNAME eq loginUser.nickName }">
							                	<div class="unfollowDiv"><button class="modalUsers"></button></div>
							                </c:if>
							                <c:if test="${ wo.NICKNAME ne loginUser.nickName }">
							                	 <div class="unfollowDiv" data-user-no="${wo.FOLLOWING_USER_NO}"><button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button></div>
							                </c:if>
							            </c:when>
							        </c:choose>
							    </c:forEach>
							    <c:if test="${not following}">
							    	<c:if test="${ wo.NICKNAME eq loginUser.nickName }">
					                	<div class="unfollowDiv"><button class="modalUsers"></button></div>
					                </c:if>
					                <c:if test="${ wo.NICKNAME ne loginUser.nickName }">
					                	 <div class="unfollowDiv" data-user-no="${wo.FOLLOWING_USER_NO}"><button class="modalFollower" onclick="followUser(this)">팔로우</button></div>
					                </c:if>
							    </c:if>
							</div><br>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
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
	
	
	const usersNo = '${loginUser.usersNo}'; 
		
		// 팔로잉 모달
		// 언팔
		function unfollowUser(button) {
			var userNo = button.parentNode.dataset.userNo;
			
			$.ajax({
			    type: 'POST',
			    url: '${contextPath}/myPage_unFollow.me',
			    data: { usersNo: usersNo, followingNo: userNo },
			    success: function (data) {
		     		 console.log('언팔로우 성공');
					if (data == 'yes') {
						var unfollowDiv = button.parentNode;
// 						unfollowDiv.innerHTML = '<button class="modalFollower" onclick="followUser(this)">팔로우</button>';
					};
					swal({
						title: "🥲",
						text: "언팔로우 되었습니다.",
	          			buttons: false,
	          			closeOnClickOutside: false,
	          			closeOnEsc: false,
	          			});
		    	},
		    	error: function (data) {
					console.log('언팔로우 실패');
				}
			});
			location.reload();
		}
		
		// 팔
		function followUser(button) {
			var userNo = button.parentNode.dataset.userNo;
			  
			$.ajax({
				type: 'POST',
			    url: '${contextPath}/myPage_follow.me',
			    data: { usersNo: usersNo, followNo: userNo },
			    success: function (data) {
					console.log('팔로우 성공');
					var unfollowDiv = button.parentNode;
// 			  		unfollowDiv.innerHTML = '<button class="modalFollow" onclick="unfollowUser(this)">언팔로우</button>';
			  		swal({
			  			title: "🎉",
						text: "팔로우 되었습니다.",
	          			buttons: false,
	          			closeOnClickOutside: false,
	          			closeOnEsc: false,
	          			});
				},
			    error: function (data) {
			 		console.log('실패');
			    }
			});
			location.reload();
		}
		
		// 1. 작성 레시피 더보기
		$(function(){
		    var initialCount = 8; // 초기갯수
		    var totalCount = $(".div-box").length;
		    
		    $(".div-box").slice(0, initialCount).show();
		    $(".more-2").hide();
		    
		    if (totalCount <= initialCount) {
		        $(".more").hide();
		    }
		    
		    $(".more").click(function(e){ // 클릭시 more
		        e.preventDefault();
		        $(".div-box:hidden").slice(0, initialCount).show();
		        $(".more-2").show(); 
		        
		        if ($(".div-box:hidden").length == 0) { // 컨텐츠 남아있는지 확인
		            $(".more").hide(); // 컨텐츠 없을시 버튼 숨기기
		        }
		    });
		    
		    $(".more-2").click(function(e){
		        e.preventDefault();
		        $(".div-box").hide();
		        $(".more").show();
		        $(".more-2").hide(); 
		        $(".div-box").slice(0, initialCount).show();
		    });
		});
		
		// 2. 작성 글 더보기
		$(function(){
		    var initialCount = 8; // 초기갯수
		    var totalCount = $(".tbody").length;
		    
		    $(".tbody:gt(" + (initialCount - 1) + ")").hide();
		    $(".more22-2").hide();		    
		    
		    if ($(".tbody:hidden").length <= initialCount) {
		        $(".more22").hide();
		    }
		    
		    $(".more22").click(function(e) {
		        e.preventDefault();
		        $(".more22-2").show();
		        $(".tbody:hidden").slice(0, initialCount).show();
		        
		        if ($(".tbody:hidden").length <= initialCount) {
		            $(".more22").hide();
		        }
		    });
		    
		    $(".more22-2").click(function(e){
		        e.preventDefault();
		        $(".tbody").hide();
		        $(".tbody").slice(0, initialCount).show();
		        $(".more22-2").hide();
		        $(".more22").show();
		    });
		});
		
		// 3. 작성 댓글 더보기
		$(function(){
		    var initialCount = 8; // 초기갯수
		    var totalCount = $(".tbody2").length;
		    
		    $(".tbody2:gt(" + (initialCount - 1) + ")").hide();
		    $(".more33-2").hide();
		    
		    if ($(".tbody2:hidden").length <= initialCount) {
		        $(".more33").hide();
		    }
		    
		    $(".more33").click(function(e) {
		        e.preventDefault();
		        $(".more33-2").show();
		        $(".tbody2:hidden").slice(0, initialCount).show();
		        
		        if ($(".tbody2:hidden").length <= initialCount) {
		            $(".more33").hide();
		        }
		    });
		    
		    $(".more33-2").click(function(e){
		        e.preventDefault();
		        $(".tbody2").hide();
		        $(".tbody2").slice(0, initialCount).show();
		        $(".more33-2").hide();
		        $(".more33").show();
		    });
		});
		
// 		$(function(){
// 		    $(".tbody2:gt(9)").hide();
// 		    if ($(".tbody2:hidden").length <= 10) {
// 		        $(".more33").hide();
// 		    }
		    
// 		    $(".more33").click(function(e) {
// 		        e.preventDefault();
// 		        $(".tbody2:hidden").slice(0, 10).show();
		        
// 		        if ($(".tbody2:hidden").length <= 10) {
// 		            $(".more33").hide();
// 		        }
// 		    });
// 		});
		
		// 4-1. 레시피 후기 더보기
		$(function(){
		    var initialCount = 4; // 초기갯수
		    var totalCount = $(".div-box4").length;
		    
		    $(".div-box4").slice(0, initialCount).show();
		    $(".more4-2").hide();
		    
		    if (totalCount <= initialCount) {
		        $(".more4").hide();
		    }
		    
		    $(".more4").click(function(e){ // 클릭시 more
		        e.preventDefault();
		        $(".div-box4:hidden").slice(0, initialCount).show();
		        $(".more4-2").show(); 
		        
		        if ($(".div-box4:hidden").length == 0) { // 컨텐츠 남아있는지 확인
		            $(".more4").hide(); // 컨텐츠 없을시 버튼 숨기기
		        }
		    });
		    
		    $(".more4-2").click(function(e){
		        e.preventDefault();
		        $(".div-box4").hide();
		        $(".more4").show();
		        $(".more4-2").hide(); 
		        $(".div-box4").slice(0, initialCount).show();
		    });
		});
		
		// 4-2. 식단 후기 더보기
		$(function(){
		    var initialCount = 4; // 초기갯수
		    var totalCount = $(".div-box5").length;
		    
		    $(".div-box5").slice(0, initialCount).show();
		    $(".more5-2").hide();
		    
		    if (totalCount <= initialCount) {
		        $(".more5").hide();
		    }
		    
		    $(".more5").click(function(e){ // 클릭시 more
		        e.preventDefault();
		        $(".div-box5:hidden").slice(0, initialCount).show();
		        $(".more5-2").show(); 
		        
		        if ($(".div-box5:hidden").length == 0) { // 컨텐츠 남아있는지 확인
		            $(".more5").hide(); // 컨텐츠 없을시 버튼 숨기기
		        }
		    });
		    
		    $(".more5-2").click(function(e){
		        e.preventDefault();
		        $(".div-box5").hide();
		        $(".more5").show();
		        $(".more5-2").hide(); 
		        $(".div-box5").slice(0, initialCount).show();
		    });
		});
		
// 		$(function(){
// 		    $(".div-box5").slice(0, 5).show(); // 초기갯수
// 		    if($(".div-box5:hidden").length <= 5){ // 컨텐츠 남아있는지 확인
// 	        	$(".more5").hide(); // 컨텐츠 없을시 버튼숨기기
// 	        }
// 		    $(".more5").click(function(e){ // 클릭시 more
// 		        e.preventDefault();
// 		        $(".div-box5:hidden").slice(0, 5).show();
// 		        if($(".div-box5:hidden").length == 0){ // 컨텐츠 남아있는지 확인
// 		        	$(".more5").hide(); // 컨텐츠 없을시 버튼숨기기
// 		        }
// 		    });
// 		});
	
		// 5-1 .북마크-레시피 더보기
		$(function(){
		    var initialCount = 8; // 초기갯수
		    var totalCount = $(".div-box2").length;
		    
		    $(".div-box2").slice(0, initialCount).show();
		    $(".more2-2").hide();
		    
		    if (totalCount <= initialCount) {
		        $(".more2").hide();
		    }
		    
		    $(".more2").click(function(e){ // 클릭시 more
		        e.preventDefault();
		        $(".div-box2:hidden").slice(0, initialCount).show();
		        $(".more2-2").show(); 
		        
		        if ($(".div-box2:hidden").length == 0) { // 컨텐츠 남아있는지 확인
		            $(".more2").hide(); // 컨텐츠 없을시 버튼 숨기기
		        }
		    });
		    
		    $(".more2-2").click(function(e){
		        e.preventDefault();
		        $(".div-box2").hide();
		        $(".more2").show();
		        $(".more2-2").hide(); 
		        $(".div-box2").slice(0, initialCount).show();
		    });
		});
		
		// 5-2. 북마크-식단 더보기
		$(function(){
		    var initialCount = 8; // 초기갯수
		    var totalCount = $(".div-box3").length;
		    
		    $(".div-box3").slice(0, initialCount).show();
		    $(".more3-2").hide();
		    
		    if (totalCount <= initialCount) {
		        $(".more3").hide();
		    }
		    
		    $(".more3").click(function(e){ // 클릭시 more
		        e.preventDefault();
		        $(".div-box3:hidden").slice(0, initialCount).show();
		        $(".more3-2").show(); 
		        
		        if ($(".div-box3:hidden").length == 0) { // 컨텐츠 남아있는지 확인
		            $(".more3").hide(); // 컨텐츠 없을시 버튼 숨기기
		        }
		    });
		    
		    $(".more3-2").click(function(e){
		        e.preventDefault();
		        $(".div-box3").hide();
		        $(".more3").show();
		        $(".more3-2").hide(); 
		        $(".div-box3").slice(0, initialCount).show();
		    });
		});
		
		
// 		$(function(){
// 		    $(".div-box3").slice(0, 8).show(); // 초기갯수
// 		    if($(".div-box3:hidden").length <= 8){ // 컨텐츠 남아있는지 확인
// 	        	$(".more3").hide(); // 컨텐츠 없을시 버튼숨기기
// 	        }
// 		    $(".more3").click(function(e){ // 클릭시 more
// 		        e.preventDefault();
// 		        $(".div-box3:hidden").slice(0, 8).show();
// 		        if($(".div-box3:hidden").length == 0){ // 컨텐츠 남아있는지 확인
// 		        	$(".more3").hide(); // 컨텐츠 없을시 버튼숨기기
// 		        }
// 		    });
// 		});
		
</script>
</body>
</html>
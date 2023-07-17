<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 후기 관리</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
#dropdownMenu2{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}
.fa-star{font-size: 14px; color: gold;}
.page-link.disabled{color: lightgray;}
.page-link.disabled:hover{background: white; color: lightgray;}
.out-div{display: flex; justify-content: center; min-height: 700px;}
.list-menu{
	width: 450px; height: 50px; 
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
.list{width: 880px;}
.list-menu-out{display: flex; }	
.board{width: 876px; text-align: center;}
/* 2. 작성글 */
.thead{ 
	border-bottom: 1.5px solid gray;  
	height: 40px; 
	background: #b0daff; 
	text-align: center;
	} 
.tbody, .tbody2{border-bottom: 1px solid lightgray; height: 50px;}
.tbody:hover, .tbody2:hover{background: rgba(176, 218, 255, 0.3); cursor:pointer; }
/* .board-info{width: 750px; padding-left: 30px; padding-top: 10px; padding-bottom: 10px;} */
.date-count{font-size: 13px; color: gray; margin-bottom: 0px; margin-top: 5px;}
/* .board-reply{width: 150px; text-align: center;} */
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
	
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">게시글 관리</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<p style="font-size: 14px;">- 게시글/댓글 수정과 삭제는 상세페이지에서 할 수 있습니다.</p>
				<br>
				<div class="out-div">
					<div class="list">
						<div class="list-menu-out">
							<div class="list-menu" id="write-list"><i class="fa-solid fa-pencil"></i> 글</div>
							<div class="list-menu" id="write-reply"><i class="fa-solid fa-comment"></i> 댓글</div>
						</div>
						<div class="contents">
							<!-- 메뉴2. 작성글 목록 -->
							<div class="write-list-contents flex">
								<div class="write-list-content">
									<table class="board">
										<thead>
											<tr class="thead">
												<th>번호</th>
												<th>제목</th>
												<th>작성 날짜</th>
												<th>조회수</th>
												<th>댓글</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${ !empty bList }">
												<c:forEach items="${ bList }" var="b">
													<tr class="tbody" onclick="location.href='${contextPath}/detailFreeBoard.bo?bId=' + '${ b.BOARD_NO }' + '&writer=' + '${ loginUser.nickName }' + '&page='">
														<td>${ b.BOARD_NO }</td>
														<c:choose>
														    <c:when test="${fn:length(b.BOARD_TITLE) > 20}">
														    	<td>${fn:substring(b.BOARD_TITLE, 0, 20)}...</td>
														    </c:when>
														    <c:otherwise>
														        <td>${ b.BOARD_TITLE }</td>
														    </c:otherwise>
														</c:choose>
														<td><fmt:formatDate value="${ b.BOARD_DATE }" pattern="yyyy-MM-dd"/></td>
														<td>${ b.BOARD_COUNT }</td>
														<td>${ b.COMMENT_COUNT }</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									<c:if test="${ empty bList }">
										<div style="margin: 90px; text-align: center; color: gray; height: 225px;">
											<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
											<b>등록된 게시글이 없습니다.</b>
										</div>
									</c:if>
								</div>
								<br><br>
								<div style="margin:0 auto">
									<nav aria-label="Standard pagination example" style="float:center">
										<ul class="pagination" style="justify-content:center">
											<li class="page-item">
												<c:if test="${ bpi.currentPage <= 1 }">
													<a class="page-link disabled" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</c:if>
												<c:if test="${ bpi.currentPage > 1 }">
													<c:url var="goBack" value="${ loc }">
														<c:param name="bpage" value="${ bpi.currentPage - 1 }"></c:param>
														<c:param name="rpage" value="${rpi.currentPage}"></c:param>
														<c:param name="page" value="${ page }"></c:param>
													</c:url>
													<a class="page-link" href="${ goBack }" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</c:if>
											</li>
											<c:if test="${ bpi.endPage == 0 }">
												<li class="page-item"><a class="page-link">1</a></li>
											</c:if>
											<c:forEach begin="${ bpi.startPage }" end="${ bpi.endPage }" var="p">
												<c:url var="goNum" value="${ loc }">
													<c:param name="bpage" value="${ p }"></c:param>
													<c:param name="rpage" value="${rpi.currentPage}"></c:param>
													<c:param name="page" value="${ page }"></c:param>
												</c:url>
												<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
											</c:forEach>
											<li class="page-item">
												<c:if test="${ bpi.currentPage >= bpi.maxPage }">
													<a class="page-link disabled" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</c:if>
												<c:if test="${ bpi.currentPage < bpi.maxPage }">
													<c:url var="goNext" value="${ loc }">
														<c:param name="bpage" value="${ bpi.currentPage + 1 }"></c:param>
														<c:param name="rpage" value="${rpi.currentPage}"></c:param>
														<c:param name="page" value="${ page }"></c:param>
													</c:url>
													<a class="page-link" href="${ goNext }" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</c:if>
											</li>
										</ul>
									</nav>
								</div>
							</div>
							
							<!-- 메뉴3. 작성댓글 목록 -->
							<div class="write-reply-contents">
								<div class="flex">
									<div class="write-replt-content">
										<table class="board">
											<thead>
												<tr class="thead">
													<th>글 제목</th>
													<th>작성자</th>
													<th>댓글 내용</th>
													<th>작성 날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${ !empty rList }">
													<c:forEach items="${rList}" var="r"> <!-- 모든 댓글 리스트 -->
														<tr class="tbody2" onclick="boardClick('${r.BOARD_STATUS}', '${ r.PRODUCT_NO }', '${ r.NICKNAME }')">
															<c:choose>
															    <c:when test="${fn:length(r.BOARD_TITLE) > 20 || fn:length(r.REVIEW_CONTENT) > 20}">
															    	<td>${fn:substring(r.BOARD_TITLE, 0, 20)}...</td>
															    	<td>${ r.NICKNAME }</td>
																	<td>${fn:substring(r.REVIEW_CONTENT, 0, 20)}...</td>
															    </c:when>
															    <c:otherwise>
															        <td>${ r.BOARD_TITLE }</td>
															        <td>${ r.NICKNAME }</td>
																	<td>${ r.REVIEW_CONTENT }</td>
															    </c:otherwise>
															</c:choose>
															<td><fmt:formatDate value="${ r.REVIEW_DATE }" pattern="yyyy-MM-dd"/></td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
										<c:if test="${ empty rList }">
											<div style="margin: 90px; text-align: center; color: gray; height: 225px;">
												<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
												<b>등록된 댓글이 없습니다.</b>
											</div>
										</c:if>
									</div>
								</div>
								<br><br>
								<div style="margin:0 auto">
									<nav aria-label="Standard pagination example" style="float:center">
										<ul class="pagination" style="justify-content:center">
											<li class="page-item">
												<c:if test="${ rpi.currentPage <= 1 }">
													<a class="page-link disabled" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</c:if>
												<c:if test="${ rpi.currentPage > 1 }">
													<c:url var="goBack" value="${ loc }">
														<c:param name="rpage" value="${rpi.currentPage - 1}"></c:param>
														<c:param name="bpage" value="${ bpi.currentPage }"></c:param>
														<c:param name="page" value="${ page }"></c:param>
													</c:url>
													<a class="page-link" href="${ goBack }" aria-label="Previous">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</c:if>
											</li>
											<c:if test="${ rpi.endPage == 0 }">
												<li class="page-item"><a class="page-link">1</a></li>
											</c:if>
											<c:forEach begin="${ rpi.startPage }" end="${ rpi.endPage }" var="p">
												<c:url var="goNum" value="${ loc }">
													<c:param name="rpage" value="${ p }"></c:param>
													<c:param name="bpage" value="${ bpi.currentPage }"></c:param>
													<c:param name="page" value="${ page }"></c:param>
												</c:url>
												<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
											</c:forEach>
											<li class="page-item">
												<c:if test="${ rpi.currentPage >= rpi.maxPage }">
													<a class="page-link disabled" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</c:if>
												<c:if test="${ rpi.currentPage < rpi.maxPage }">
													<c:url var="goNext" value="${ loc }">
														<c:param name="rpage" value="${rpi.currentPage + 1}"></c:param>
														<c:param name="bpage" value="${ bpi.currentPage }"></c:param>
														<c:param name="page" value="${ page }"></c:param>
													</c:url>
													<a class="page-link" href="${ goNext }" aria-label="Next">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</c:if>
											</li>
										</ul>
									</nav>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(document).ready(function () {
		    let selectedMenu = localStorage.getItem("selectedMenu");
	
		    if (selectedMenu === "write-reply") {
		      $("#write-reply").addClass("select");
		      $(".write-list-contents").hide();
		      $(".write-reply-contents").show();
		      $(".qna-list-contents").hide();
		    } else {
		      $("#write-list").addClass("select");
		      $(".write-list-contents").show();
		      $(".write-reply-contents").hide();
		      $(".qna-list-contents").hide();
		    }
	
		    $("#write-list").on("click", function () {
		      localStorage.setItem("selectedMenu", "write-list");
		      loadContent("write-list");
		    });
	
		    $("#write-reply").on("click", function () {
		      localStorage.setItem("selectedMenu", "write-reply");
		      loadContent("write-reply");
		    });
	
		    // 페이지 로드 시 선택한 메뉴에 따라 콘텐츠를 로드합니다.
		    function loadContent(menu) {
		      $(".write-list-contents").hide();
		      $(".write-reply-contents").hide();
		      $(".qna-list-contents").hide();
	
		      if (menu === "write-list") {
		        $(".write-list-contents").show();
		        $("#write-list").addClass("select");
		        $("#write-reply").removeClass("select");
		      } else if (menu === "write-reply") {
		        $(".write-reply-contents").show();
		        $("#write-reply").addClass("select");
		        $("#write-list").removeClass("select");
		      }
		    }
	
		    // 페이지 로드 시 선택한 메뉴에 맞게 콘텐츠를 로드하고, 처음 접속 시 "글" 메뉴에 select 클래스를 적용합니다.
		    if (!selectedMenu) {
		      localStorage.setItem("selectedMenu", "write-list");
		      selectedMenu = "write-list";
		    }
		    loadContent(selectedMenu);
		  });
	
	
	   //테이블에 마우스 올렸을 때 css
	   const tbody = document.getElementById('tbody');
	   const trs = tbody.children;
	   
	   for(tr of trs) {
	       tr.addEventListener('mouseenter', function() {
	             this.style.backgroundColor = 'rgba(176, 218, 255, 0.1)'; // 마우스를 올렸을 때의 스타일
	             this.style.cursor = 'pointer';
	           });
	
	        tr.addEventListener('mouseleave', function() {
	          this.style.backgroundColor = ''; // 마우스를 뗐을 때의 스타일 (기존 스타일로 복구)
	        }); 
	   }
	   
	   function boardClick(status, productNo, nickName) {
	        if (status == 'Y') {
                location.href = '${contextPath}/detailFreeBoard.bo?bId=' + productNo + '&writer=' + nickName + '&page=';
	        } else {
	        	swal({
		            text: "해당 글을 삭제됐거나 없는 글입니다.",
		            icon: "error",
		            button: "확인",
		        });
	        }
	    }
	</script>	
	
</body>
</html>
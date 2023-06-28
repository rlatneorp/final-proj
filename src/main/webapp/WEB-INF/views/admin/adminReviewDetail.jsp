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
/* 	 span{font-size: 16px;} */
</style>
</head>
<body>
	
	<%@ include file="../common/top.jsp" %>
		
	<div class="mainBox d-flex justify-content-center" style="margin:auto;">
		<div class="d-flex">
			<div class="text-center" style="width: 900px; background: #B0DAFF; box-shadow: 1px 1px 2px 2px black; border-radius: 10px;">
				<div class="row" style="padding-top: 30px;">
					<c:if test="${r.orderNo eq -1}">
						<span class="col-12" style="font-size: 22px; font-weight: bold; margin-bottom: 50px;">게시판 댓글</span>
						<span class="col-2"></span>
						<span class="col-2">게시판</span>
						<span class="col-6 mb-3">
							<a href="${contextPath}/adminBoardDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&boardNo=${r.boardNo}">
							${r.boardTitle}</a>
						</span>
						<span class="col-2"></span>
					</c:if>
					<c:if test="${r.orderNo eq 0}">
						<span class="col-12" style="font-size: 22px; font-weight: bold; margin-bottom: 50px;">레시피 후기</span>
						<span class="col-2"></span>
						<span class="col-2">레시피</span>
						<span class="col-6 mb-3">
							<a href="${contextPath}/adminRecipeDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&foodNo=${r.foodNo}">
							(${r.productNo}) ${r.recipeName}</a>
						</span>
						<span class="col-2"></span>
					</c:if>
					
					<c:if test="${r.orderNo ne -1 && r.orderNo ne 0}">
						<span class="col-12" style="font-size: 22px; font-weight: bold; margin-bottom: 50px;">상품 구매후기</span>
						<span class="col-2"></span>
						<span class="col-2">상품</span>
						<span class="col-6 mb-3">
							<a href="${contextPath}/adminToolDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&toolNo=${r.productNo}">
							${r.productName}</a>
						</span>
						<span class="col-2"></span>
					
					</c:if>
					
					<span class="col-2"></span>
					<span class="col-2">작성자</span>
					<input class="col-6 mb-3" type="text" value="${r.reviewWriter}" readonly>
					<span class="col-2"></span>
					
					<span class="col-2"></span>
					<span class="col-2">작성일자</span>
					<input class="col-6 mb-3" type="text" value="${r.reviewDate}" readonly>
					<span class="col-2"></span>
					
					<span class="col-2"></span>
					<span class="col-2">별점</span>
					<input class="col-6 mb-3" type="number" value="${r.reviewScore}" readonly>
					<span class="col-2"></span>
					
<!-- 					<span class="col-2"></span> -->
<!-- 					<span class="col-2">제목</span> -->
<%-- 					<input class="col-6 mb-3" type="text" value="${r.reviewTitle}" readonly> --%>
<!-- 					<span class="col-2"></span> -->
					
					<span class="col-2"></span>
					<span class="col-2">내용</span>
					<textarea class="col-6 mb-3" rows="10" readonly>${r.reviewContent}</textarea>
					<span class="col-2"></span>
						
					<span class="col-2"></span>
					<span class="col-2">상태</span>
					<div class="col-2 mb-5">
<%-- 					<input type="hidden" name="reviewStatus" value="${r.reviewNo}"> --%>
						<c:if test="${r.reviewStatus eq 'Y'}">
							<button type="button" class="btns statusBtn" style="background-color: #19A7CE; width: 50px;">Y</button>
							<button type="button" class="btns statusBtn" style="background-color: gray; width: 50px;">N</button>
						</c:if>
						<c:if test="${r.reviewStatus eq 'N'}">
							<button type="button" class="btns statusBtn" style="background-color: gray; width: 50px;">Y</button>
							<button type="button" class="btns statusBtn" style="background-color: #19A7CE; width: 50px;">N</button>
						</c:if>
					</div>
					<span class="col-2"></span>
				</div>
				<div class="d-flex justify-content-center mb-5">
					<div class="d-flex">
						<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">뒤로가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br>
	<script>
		window.onload = () =>{
//	 		상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			
			statusBtns[0].addEventListener('click', ()=>{
				updateStatus(0, statusBtns[0].innerText);
			});
			statusBtns[1].addEventListener('click', ()=>{
				updateStatus(1, statusBtns[1].innerText);
			});
		
		}
		function updateStatus(i, status){
			const statusBtns = document.getElementsByClassName('statusBtn');
			
			$.ajax({
				url: '${contextPath}/adminUpdateStatus.ad',
				data: {dataNo:${r.reviewNo},
					   dataStatus:status,
					   dataType:7},
				success: data =>{
					console.log(${r.reviewNo});
					console.log(status);
					if(data == "success"){
						if(i == 0){
							statusBtns[0].style.background = "#19A7CE";
							statusBtns[1].style.background = "gray";
						}else{
							statusBtns[0].style.background = "gray";
							statusBtns[1].style.background = "#19A7CE";
						}
					}else{
						alert("상태 변경에 실패하였습니다.");
					}
				},
				error: data => {
					console.log(data);
				}
			})
		}
	</script>
</body>
</html>
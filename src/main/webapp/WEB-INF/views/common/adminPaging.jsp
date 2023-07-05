<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSidebar</title>
<style>
	.pagination a { color: #19A7CE; }
</style>
</head>
<body>
	<div>
		<nav aria-label="Standard pagination example">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<c:url var="goBack" value="${ loc }">
	       				<c:if test="${ pi.currentPage-1 lt 1 }">
	        				<c:param name="page" value="1"></c:param>
	        				<c:param name="pageCount" value="${ab.pageCount}"></c:param>
	        				<c:param name="searchType" value="${ab.searchType}"></c:param>
	        				<c:param name="searchText" value="${ab.searchText}"></c:param>
	        				<c:param name="kind" value="${ab.kind}"></c:param>
	        				<c:param name="type" value="${ab.type}"></c:param>
	       				</c:if>
	       				<c:if test="${ pi.currentPage-1 gt 0 }">
	        				<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
	        				<c:param name="pageCount" value="${ab.pageCount}"></c:param>
	        				<c:param name="searchType" value="${ab.searchType}"></c:param>
	        				<c:param name="searchText" value="${ab.searchText}"></c:param>
	        				<c:param name="kind" value="${ab.kind}"></c:param>
	        				<c:param name="type" value="${ab.type}"></c:param>
	       				</c:if>
	      			</c:url>
	       			<a class="page-link" href="${ goBack }" aria-label="Previous">
	       				<span aria-hidden="true">&laquo;</span>
	        		</a>
	       		</li>
	    		<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	      			<c:url var="goNum" value="${ loc }">
	      				<c:param name="page" value="${ p }"></c:param>
        				<c:param name="pageCount" value="${ab.pageCount}"></c:param>
        				<c:param name="searchType" value="${ab.searchType}"></c:param>
        				<c:param name="searchText" value="${ab.searchText}"></c:param>
        				<c:param name="kind" value="${ab.kind}"></c:param>
        				<c:param name="type" value="${ab.type}"></c:param>
	      			</c:url>
	    			<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	   			</c:forEach>
	      		<li class="page-item">
	       			<c:url var="goNext" value="${ loc }">
	       				<c:if test="${ pi.currentPage+1 gt pi.maxPage }">
	       					<c:param name="page" value="${ pi.maxPage }"></c:param>
	        				<c:param name="pageCount" value="${ab.pageCount}"></c:param>
	        				<c:param name="searchType" value="${ab.searchType}"></c:param>
	        				<c:param name="searchText" value="${ab.searchText}"></c:param>
	        				<c:param name="kind" value="${ab.kind}"></c:param>
	        				<c:param name="type" value="${ab.type}"></c:param>
	       				</c:if>
	       				<c:if test="${ pi.currentPage+1 le pi.maxPage }">
	       					<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
	        				<c:param name="pageCount" value="${ab.pageCount}"></c:param>
	        				<c:param name="searchType" value="${ab.searchType}"></c:param>
	        				<c:param name="searchText" value="${ab.searchText}"></c:param>
	        				<c:param name="kind" value="${ab.kind}"></c:param>
	        				<c:param name="type" value="${ab.type}"></c:param>
	       				</c:if>
	       			</c:url>
	       			<a class="page-link" href="${ goNext }" aria-label="Next">
	       				<span aria-hidden="true">&raquo;</span>
	       			</a>
	       		</li>
			</ul>
	  	</nav>
	</div>
	<script>
		let dataType = '';
// 		상태버튼 이벤트
		switch(location.pathname){
			case "/hollosekki/adminUsersManage.ad": dataType = 5; break;
			case "/hollosekki/adminMenuManage.ad": dataType = 2; break;
			case "/hollosekki/adminIngredientManage.ad": dataType = 3; break;
			case "/hollosekki/adminFoodManage.ad": dataType = 1; break;
			case "/hollosekki/adminToolManage.ad": dataType = 4; break;
			case "/hollosekki/adminRecipeManage.ad": dataType = 6; break;
			case "/hollosekki/adminBoardManage.ad": dataType = 8; break;
			case "/hollosekki/adminReviewManage.ad": dataType = 7; break;
			case "/hollosekki/adminFAQManage.ad": dataType = 9; break;
			case "/hollosekki/adminQNAManage.ad": dataType = 10; break;
		}
		adminUpdateStatus(dataType);
		
//		삭제 체크박스 전체선택 이벤트
//		삭제버튼 클릭 이벤트 (confirm 띄우기)
		if(dataType >= 1 && dataType <= 10 && dataType != 5){
			deleteFunction();
		}
	</script>
</body>
</html>
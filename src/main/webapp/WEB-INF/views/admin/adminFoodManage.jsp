<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

</head>

<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mainBox d-inline-block align-top">
		<h4 class="py-4 mb-0">식품관리</h4>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>
			
		<form id="deleteForm" action="${contextPath}/adminDeleteSelects.ad" method="post">
			<input type="hidden" name="type" value="1">
			<input type="hidden" name="url" value="adminFoodManage.ad">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 20%">이름</th>
					<th style="width: 8%">분류</th>
					<th style="width: 7%">타입</th>
					<th style="width: 8%">가격</th>
					<th style="width: 7%">할인률</th>
					<th style="width: 7%">재고</th>
					<th style="width: 7%">구매자</th>
					<th style="width: 7%">조회수</th>
					<th style="width: 7%">좋아요</th>
					<th style="width: 9%">상태</th>
					<th style="width: 6%">
						<button type="button" class="allSelect btns" style="background-color: #19A7CE; width: 45px;font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach items="${fList}" var="f" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${f.productNo}
							<input type="hidden" name="productNo" value="${f.productNo}">
						</td>
						<td>
							<a href="${contextPath}/adminFoodDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&productNo=${f.productNo}">
								${f.foodName }</a>
						</td>
						<td>
							<c:if test="${f.foodKind eq 1}">메인</c:if>
							<c:if test="${f.foodKind eq 2}">서브</c:if>
						</td>
						<td>
							<c:if test="${f.foodType eq 1}">식재료</c:if>
							<c:if test="${f.foodType eq 2}">밀키트</c:if>
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${f.productPrice}"/>원
						</td>
						<td>${f.productSale}%</td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${f.productStock}"/></td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${f.orderCount}"/></td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${f.productCount}"/></td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${f.likeCount}"/></td>
						<td>
							<c:if test="${f.productStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${f.productStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${f.productNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button onclick="location.href='${contextPath}/adminFoodWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">식품등록</button>
			</div>
		</div>

		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>
</body>
</html>
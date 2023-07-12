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
		<h4 class="py-4 mb-0">식재료관리</h4>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>
			
<%-- 		<form id="deleteForm" action="${contextPath}/adminIngredientDeletes.ad" method="post"> --%>
		<form id="deleteForm" action="${contextPath}/adminDeleteSelects.ad" method="post">
			<input type="hidden" name="type" value="3">
			<input type="hidden" name="url" value="adminIngredientManage.ad">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 20%">이름</th>
					<th style="width: 7%">분류</th>
					<th style="width: 8%">가격</th>
					<th style="width: 7%">할인률</th>
					<th style="width: 7%">재고</th>
					<th style="width: 7%">구매자</th>
					<th style="width: 7%">조회수</th>
					<th style="width: 7%">좋아요</th>
					<th style="width: 9%">공식등록</th>
					<th style="width: 9%">상태</th>
					<th style="width: 6%">
						<button type="button" class="allSelect btns" style="background-color: #19A7CE; width: 45px;font-weight: bold;">전체</button>
					</th>
				</tr>
				<c:forEach items="${igdList}" var="igd" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						
						<td>${igd.ingredientNo}
							<input type="hidden" name="ingredientNo" value="${igd.ingredientNo}">
							<input type="hidden" name="productNo" value="${igd.productNo}">
						</td>
						<td>
							<a href="${contextPath}/adminIngredientDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&ingredientNo=${igd.ingredientNo}">
								${igd.ingredientName}</a>
						</td>
						<td>${igd.ingredientType}</td>
						<td>
							<div class="priceBox" <c:if test="${igd.productStatus eq 'N' }">style="display:none;"</c:if> >
								<fmt:formatNumber pattern="###,###,###" value="${igd.productPrice}"/>원
							</div>
						</td>
						<td>
							<div class="saleBox" <c:if test="${igd.productStatus eq 'N' }">style="display:none;"</c:if> >
									${igd.productSale}%
							</div>
						</td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${igd.productStock}"/></td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${igd.orderCount}"/></td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${igd.productCount}"/></td>
						<td><fmt:formatNumber pattern="###,###,###,###" value="${igd.likeCount}"/></td>
						<td>
							<c:if test="${igd.isAccept eq 'Y'}">
								<button type="button" class="btns acceptBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns acceptBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${igd.isAccept eq 'N'}">
								<button type="button" class="btns acceptBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns acceptBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td>
							<c:if test="${igd.productStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${igd.productStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
							<c:if test="${igd.productStatus eq null}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
						</td>
<%-- 						<td><input type="checkbox" <td><input type="checkbox"="width: 16px; height: 16px;" value="${igd.ingredientNo}-${igd.productNo}"></td> --%>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${igd.ingredientNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button type="button" onclick="location.href='${contextPath}/adminIngredientWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">식재료등록</button>
			</div>
		</div>

		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
	</div>

	<script>
		window.onload = () =>{
// 			공식등록 버튼 이벤트
			const acceptBtns = document.getElementsByClassName('acceptBtn');
			const igsNos = document.getElementsByName('ingredientNo');

			
			for(const i in acceptBtns){
				if(i<acceptBtns.length){
					
					acceptBtns[i].addEventListener('click', ()=>{
						let j = Math.floor(i/2);
						$.ajax({
							url: '${contextPath}/adminIngredientUpdateIsAccept.ad',
							data: {ingredientNo:igsNos[j].value,
								   isAccept:acceptBtns[i].innerText},
							success: data =>{
								if(data == "success"){
									if(i%2 == 0){
										acceptBtns[i].style.background = "#19A7CE";
										acceptBtns[i].nextElementSibling.style.backgroundColor = "gray";
									}else if(i%2 == 1){
										acceptBtns[i].style.background = "#19A7CE";
										acceptBtns[i].previousElementSibling.style.backgroundColor = "gray";
									}
								}else{
									alert("상태 변경에 실패하였습니다.");
								}
							},
							error: data => {
								console.log(data);
							}
						})
					})
				}
			}

		}
	</script>
	
	
	
</body>
</html>
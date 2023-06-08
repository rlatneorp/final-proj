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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,0" />
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top mt-5" style="width: 900px;">
		<form id="deleteForm" action="${contextPath}/adminIngredientDeletes.ad">
			<h4 class="py-4 mb-0">식재료관리</h4>
			<div style="width: 100%; border:1px solid black; margin-bottom:1px;"></div>
			<div style="width: 100%; border:1px solid black; margin-bottom:30px;"></div>
			<div style="width: 100%; margin-bottom:1px; height: 35px;" class="d-flex justify-content-between">
				<select name="pageCount" class="d-flex" style="font-size: 14px;">
					<option value="10" <c:if test="${ab.pageCount eq 10}">selected</c:if>>10개씩 보기</option>
					<option value="20" <c:if test="${ab.pageCount eq 20}">selected</c:if>>20개씩 보기</option>
					<option value="40" <c:if test="${ab.pageCount eq 40}">selected</c:if>>40개씩 보기</option>
				</select>
				<span class="d-flex material-symbols-outlined me-2 deleteBtn" style="font-size: 36px; color: black; text-shadow: 1px 1px 2px gray; cursor:pointer;">delete</span>
			</div>
			
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
						<button type="button" class="allSelect" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 45px; height: 25px; font-size: 12px; font-weight: bold;">전체</button>
					</th>
				</tr>
				<c:forEach items="${igdList}" var="igd" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						
						<td>${igd.ingredientNo}<input type="hidden" name="ingredientNo" value="${igd.ingredientNo}"></td>
						<td>
							<a href="${contextPath}/adminIngredientDetail.ad?page=${pi.currentPage}&ingredientNo=${igd.ingredientNo}">
								${igd.ingredientName}</a>
						</td>
						<td>${igd.ingredientType}</td>
						<td>
							<c:if test="${igd.productNo ne 0 }">
								<fmt:formatNumber pattern="###,###,###" value="${igd.productPrice}"/>원
							</c:if>
							<c:if test="${igd.productNo eq 0 }">
								-
							</c:if>
						</td>
						<td>
							<c:if test="${igd.productNo ne 0 }">
								${igd.productSale}%
							</c:if>
							<c:if test="${igd.productNo eq 0 }">
								-
							</c:if>
						</td>
						<td>${igd.productStock}</td>
						<td>${igd.orderCount}</td>
						<td>${igd.viewCount}</td>
						<td>${igd.likeCount}</td>
						<td>
							<button type="button" class="acceptBtn" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;">Y</button>
							<button type="button" class="acceptBtn" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;">N</button>
						</td>
						<td>
							<button type="button" class="statusBtn" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;">Y</button>
							<button type="button" class="statusBtn" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;">N</button>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button onclick="location.href='${contextPath}/adminIngredientWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">식재료등록</button>
			</div>
		</div>
		<form id="searchForm">
			<div class="text-center">
				<input type="hidden" name="page" value="${pi.currentPage}"> 
				<select name="searchType" class="border" style="padding: 6px 7px;">
					<option value="name">이름</option>
				</select>

				<div style="width:200px" class="d-inline-block mb-4">
					<input type="text" class="form-control" name="searchText">
				</div>
				<button onclick="location.href='${contextPath}/adminIngredientManage.ad?page='" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 38px; font-size: 14px; font-weight: bold;">검색</button>
			</div>
		</form>
		
		<jsp:include page="../common/adminPaging.jsp"/>
	</div>

	<script>
		window.onload = () =>{
			
// 			리스트 갯수 이벤트
			const pageCount = document.getElementsByName('pageCount')[0];
			pageCount.addEventListener('change', ()=>{
				location.href='adminIngredientManage.ad?page=&pageCount='+pageCount.value;
			})
			
// 			삭제 체크박스 전체선택 이벤트
			const allSelect = document.getElementsByClassName('allSelect')[0];
			allSelect.addEventListener('click', ()=>{
				selectDeletes = document.getElementsByName('selectDelete');
				let count = 0;
				for(const sDel of selectDeletes){
					if(sDel.checked == true){
						count += 1;
					}
				}
				if(count == selectDeletes.length){
					for(const sDel of selectDeletes){
						sDel.checked = false;
					}
				}else{
					for(const sDel of selectDeletes){
						sDel.checked = true;
					}
				}
			})
			
// 			삭제버튼 클릭 이벤트 (confirm 띄우기)
			const deleteBtn = document.getElementsByClassName('deleteBtn')[0];
			deleteBtn.addEventListener('click', ()=>{
				const result = confirm("정말 삭제하시겠습니까?");
				if(result){
					document.getElementById('deleteForm').submit();
				}
			})
			
// 			공식등록 버튼 이벤트
			const acceptBtns = document.getElementsByClassName('acceptBtn');
			const statusBtns = document.getElementsByClassName('statusBtn');

			for(const i in acceptBtns){
				if(i%2 == 0){
					acceptBtns[i].addEventListener('click', ()=>{
						acceptBtns[i].style.background = "#19A7CE";
						acceptBtns[i].nextElementSibling.style.backgroundColor = "gray";
					});
				}else if(i%2 == 1){
					acceptBtns[i].addEventListener('click', ()=>{
						acceptBtns[i].style.background = "#19A7CE";
						acceptBtns[i].previousElementSibling.style.backgroundColor = "gray";
					});
				}
			}
			
// 			상태 버튼 이벤트
			for(const i in statusBtns){
				if(i%2 == 0){
					statusBtns[i].addEventListener('click', ()=>{
						statusBtns[i].style.background = "#19A7CE";
						statusBtns[i].nextElementSibling.style.backgroundColor = "gray";
					});
				}else if(i%2 == 1){
					statusBtns[i].addEventListener('click', ()=>{
						statusBtns[i].style.background = "#19A7CE";
						statusBtns[i].previousElementSibling.style.backgroundColor = "gray";
					});
				}
			}
		}
	</script>
	
	
	
</body>
</html>
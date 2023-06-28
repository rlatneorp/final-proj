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
<!-- <script src="http://code.jquery.com/jquery-3.6.4.min.js"></script> -->
</head>

<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mainBox d-inline-block align-top">
		<h4 class="py-4 mb-0">식단관리</h4>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>
		
		<form id="deleteForm" action="${contextPath}/adminMenuDeletes.ad" method="post">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 19%">식단이름</th>
					<th style="width: 8%">분류</th>
					<th style="width: 8%">타입</th>
					<th style="width: 9%">가격</th>
					<th style="width: 7%">할인률</th>
					<th style="width: 7%">재고</th>
					<th style="width: 7%">구매자</th>
					<th style="width: 7%">조회수</th>
					<th style="width: 7%">좋아요</th>
					<th style="width: 9%">상태</th>
					<th style="width: 6%">
						<button type="button" class="allSelect" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 45px; height: 25px; font-size: 12px; font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach items="${mList}" var="m" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${m.productNo}
							<input type="hidden" name="productNo" value="${m.productNo}">
						</td>
						<td>
							<a href="${contextPath}/adminMenuDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&productNo=${m.productNo}">${m.menuName}</a>
						</td>
						<td>
							<c:if test="${m.menuKind eq 1}">다이어트</c:if>
							<c:if test="${m.menuKind eq 2}">육류</c:if>
							<c:if test="${m.menuKind eq 3}">해산물</c:if>
						</td>
						<td>
							<c:if test="${m.menuType eq 1}">식재료</c:if>
							<c:if test="${m.menuType eq 2}">밀키트</c:if>
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${m.productPrice}"/>원
						</td>
						<td>${m.productSale}%</td>
						<td>${m.productStock}</td>
						<td>${m.orderCount}</td>
						<td>${m.viewCount}</td>
						<td>${m.likeCount}</td>
						<td>
							<c:if test="${m.productStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${m.productStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${m.productNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button type="button" onclick="location.href='${contextPath}/adminMenuWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">식단등록</button>
			</div>
		</div>

		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>

	<script>
		window.onload = () =>{
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
				let count = 0;
				selectDeletes = document.getElementsByName('selectDelete');
				for(const sDel of selectDeletes){
					if(sDel.checked == true){
						count++;
					}
				}
				if(count > 0){
					const result = confirm("정말 삭제하시겠습니까?");
					if(result){
						document.getElementById('deleteForm').submit();
					}
				}else{
					alert("삭제할 식단을 선택해주세요.");
				}
			})
			
// 			상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			const pNos = document.getElementsByName('productNo');
			
			for(const i in statusBtns){
				if(i<statusBtns.length){
					let j = Math.floor(i/2);
					if(pNos[j].value != 0){
						statusBtns[i].addEventListener('click', function(){
							$.ajax({
								url: '${contextPath}/adminUpdateStatus.ad',
								data: {dataNo:pNos[j].value,
									   dataStatus:statusBtns[i].innerText,
									   dataType:2},
								success: data =>{
									let price = "";
									let sale = "";
									if(data == "success"){
										if(i%2 == 0){
											statusBtns[i].style.background = "#19A7CE";
											statusBtns[i].nextElementSibling.style.backgroundColor = "gray";
										}else if(i%2 == 1){
											statusBtns[i].style.background = "#19A7CE";
											statusBtns[i].previousElementSibling.style.backgroundColor = "gray";
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
		}
	</script>
	
	
	
	
	
</body>
</html>
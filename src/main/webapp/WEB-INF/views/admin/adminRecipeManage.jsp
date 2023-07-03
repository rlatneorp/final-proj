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
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="mainBox d-inline-block align-top">
		<h4 class="py-4 mb-0">레시피관리</h4>
		
		<jsp:include page="../common/adminPageCountForm.jsp"/>		
		
<%-- 		<form id="deleteForm" action="${contextPath}/adminRecipeDeletes.ad" method="post"> --%>
		<form id="deleteForm" action="${contextPath}/adminDeleteSelects.ad" method="post">
			<input type="hidden" name="type" value="6">
			<input type="hidden" name="url" value="adminRecipeManage.ad">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 20%">이름</th>
					<th style="width: 8%">재료</th>
					<th style="width: 8%">상황</th>
					<th style="width: 8%">종류</th>
					<th style="width: 10%">작성자</th>
					<th style="width: 5%">조회수</th>
					<th style="width: 9%">등록일</th>
					<th style="width: 9%">수정일</th>
					<th style="width: 9%">상태</th>
					<th style="width: 7%">
						<button type="button" class="allSelect btns" style="background-color: #19A7CE; width: 45px;font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach items="${rpList}" var="rp" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${rp.foodNo}
							<input type="hidden" name="foodNo" value="${rp.foodNo}"></td>
						<td>
							<a href="${contextPath}/adminRecipeDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&foodNo=${rp.foodNo}">${rp.recipeName}</a>
						</td>
						<td>${rp.categoryIngredient}</td>
						<td>${rp.categorySituation}</td>
						<td>${rp.categoryType}</td>
						<td>${rp.usersId}</td>
						<td>${rp.recipeCount}</td>
						<td><fmt:formatDate value="${rp.recipeCreateDate}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${rp.recipeModifyDate}" pattern="yyyy-MM-dd"/></td>
						<td>
							<c:if test="${rp.recipeStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${rp.recipeStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${rp.foodNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button type="button" onclick="location.href='${contextPath}/adminRecipeWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">레시피등록</button>
			</div>
		</div>
		
		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
		
	</div>

	<script>
		window.onload = () =>{
			document.getElementsByClassName('sidebar')[0]
			
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
					alert("삭제할 레시피를 선택해주세요.");
				}
			})
			
// 			상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			const fNos = document.getElementsByName('foodNo');
			
			for(const i in statusBtns){
				if(i<statusBtns.length){
					let j = Math.floor(i/2);
					if(fNos[j].value != 0){
						statusBtns[i].addEventListener('click', function(){
							$.ajax({
								url: '${contextPath}/adminUpdateStatus.ad',
								data: {dataNo:fNos[j].value,
									   dataStatus:statusBtns[i].innerText,
									   dataType:6},
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
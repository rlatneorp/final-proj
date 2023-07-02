<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="width: 100%; border:1px solid black; margin-bottom:1px;"></div>
	<div style="width: 100%; border:1px solid black; margin-bottom:30px;"></div>
	<div style="width: 100%; margin-bottom:3px; height:35px;" class="d-flex justify-content-between">
		<div class="d-flex">
			<form id="pageCountForm">
				<input type="hidden" name="page" value="${ab.page}">
				<input type="hidden" name="searchType" value="${ab.searchType}">
				<input type="hidden" name="searchText" value="${ab.searchText}">
				<input type="hidden" name="type" value="${ab.type}">
				<input type="hidden" name="kind" value="${ab.kind}">
				<input type="hidden" name="pageCountStart" value="Y">
				<select name="pageCount" style="font-size: 14px; height:25px">
					<option value="10" <c:if test="${pageCount eq 10}">selected</c:if>>10개씩 보기</option>
					<option value="20" <c:if test="${pageCount eq 20}">selected</c:if>>20개씩 보기</option>
					<option value="40" <c:if test="${pageCount eq 40}">selected</c:if>>40개씩 보기</option>
				</select>
				<button style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 45px; height: 25px; font-size: 12px; font-weight: bold;">변경</button>
			</form>
		</div>
		<div class="deleteBtnBox">
			<span class="d-flex material-symbols-outlined me-2 deleteBtn" style="font-size: 36px; color: black; text-shadow: 1px 1px 2px gray; cursor:pointer;">delete</span>
		</div>
	</div>
	
	<script>
		if(location.pathname == "/hollosekki/adminFAQManage.ad"){
			document.getElementsByClassName('deleteBtnBox')[0].style.display="block";
		}else{
			document.getElementsByClassName('deleteBtnBox')[0].style.display="none";
// 			console.log(document.getElementsByClassName('allSelect'));
// 			console.log(document.getElementsByClassName('allSelect')[0]);
// 			document.getElementsByClassName('allSelect')[0].parentElement.style.display="none";
		}
		
// 		if(location.pathname == "/hollosekki/adminUsersManage.ad"
// 		 ||location.pathname == "/hollosekki/adminPointManage.ad"
// 		 ||location.pathname == "/hollosekki/adminIngredientManage.ad"){
// 			document.getElementsByClassName('deleteBtn')[0].remove();
// 		}
	</script>
</body>
</html>
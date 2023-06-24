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
	<form id="searchForm">
		<input type="hidden" name="page" value="${ab.page}">
		<input type="hidden" name="pageCount" value="${ab.pageCount}">
		<input type="hidden" name="searchStart" value="Y"> 
		<div class="text-center searchBox">
			<select name="searchType" class="border searchSelect" style="padding: 6px 7px;">
				<option value="name" <c:if test="${ab.searchType eq 'name'}"></c:if>>이름</option>
				<option value="id" <c:if test="${ab.searchType eq 'id'}">selected</c:if>>아이디</option>
			</select>
			<select name="searchType" class="border searchSelect" style="padding: 6px 7px;">
				<option value="number" <c:if test="${ab.searchType eq 'number'}"></c:if>>번호</option>	
			</select>
			<select name="searchType" class="border searchSelect" style="padding: 6px 7px;">
				<option value="name" <c:if test="${ab.searchType eq 'name'}"></c:if>>이름</option>
			</select>
			<div style="width:200px" class="d-inline-block mb-4">
				<input type="search" class="form-control" name="searchText" value="${ab.searchText}">
			</div>
			<button style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 38px; font-size: 14px; font-weight: bold;">검색</button>
		</div>
	</form>
	
	<script>
			let aliveType = 0;
			if(location.pathname == "/hollosekki/adminUsersManage.ad"){
				aliveType = 0;
			}else if(location.pathname == "/hollosekki/adminPointManage.ad"){
				aliveType = 1;
			}else{
				aliveType = 2;
			}
			const types = document.getElementsByClassName('searchSelect');
			document.getElementsByClassName('searchBox')[0].innerHTML 
				='<select name="searchType" class="border searchSelect" style="padding: 6px 7px;">'
				+types[aliveType].innerHTML
				+'</select>'
				+'<div style="width:200px" class="d-inline-block mb-4">'
				+'<input type="search" class="form-control" name="searchText" value="${ab.searchText}">'
				+'</div>'
				+'<button style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 38px; font-size: 14px; font-weight: bold;">검색</button>';
	</script>
</body>
</html>
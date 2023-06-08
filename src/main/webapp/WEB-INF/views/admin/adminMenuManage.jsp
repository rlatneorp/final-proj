<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,0" />
<title>admin</title>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top mt-5" style="width: 900px;">
		<form id="deleteForm">
			<h4 class="py-4 mb-0">식단관리</h4>
			<div style="width: 100%; border:1px solid black; margin-bottom:1px;"></div>
			<div style="width: 100%; border:1px solid black; margin-bottom:30px;"></div>
			<div style="width: 100%; margin-bottom:1px; text-align: right;">
				<span class="material-symbols-outlined me-2 deleteBtn" style="font-size: 36px; color: black; text-shadow: 1px 1px 2px gray; cursor:pointer;">delete</span>
			</div>
			
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 19%">식단이름</th>
					<th style="width: 9%">분류</th>
					<th style="width: 9%">가격</th>
					<th style="width: 8%">할인률</th>
					<th style="width: 8%">재고</th>
					<th style="width: 8%">구매자</th>
					<th style="width: 8%">조회수</th>
					<th style="width: 8%">좋아요</th>
					<th style="width: 10%">상태</th>
					<th style="width: 7%">
						<button type="button" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 45px; height: 25px; font-size: 12px; font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach begin="1" end="10" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${11-vs.index}</td>
						<td>
							<a href="${contextPath}/adminMenuDetail.ad?page=${pi.currentPage}&productNo=">
								이거면5키로빼지!${11-vs.index}</a>
						</td>
						<td>채소</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="20000"/>원
						</td>
						<td>20%</td>
						<td>${(11-vs.index)*15}</td>
						<td>${(11-vs.index)*9}</td>
						<td>${(11-vs.index)*8}</td>
						<td>${(11-vs.index)*32}</td>
						<td>
							<button type="button" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;">Y</button>
							<button type="button" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;">N</button>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button onclick="location.href='${contextPath}/adminMenuWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">식단등록</button>
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


	
	
	
	
</body>
</html>
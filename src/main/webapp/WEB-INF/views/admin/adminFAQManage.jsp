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
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="mainBox d-inline-block align-top">
		<h4 class="py-4 mb-0">자주묻는질문관리</h4>
		<div class="mb-3">
			<button onclick="selectFAQType(-2)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 38px; font-size: 14px; font-weight: bold;">전체</button>
			<button onclick="selectFAQType(-1)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">공지</button>
			<button onclick="selectFAQType(1)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">배송</button>
			<button onclick="selectFAQType(2)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">결제</button>
			<button onclick="selectFAQType(3)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">회원</button>
			<button onclick="selectFAQType(4)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">상품</button>
			<button onclick="selectFAQType(0)" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 55px; height: 30px; font-size: 12px; font-weight: bold;">기타</button>
		</div>
	
		<jsp:include page="../common/adminPageCountForm.jsp"/>
		
		<form id="deleteForm" action="${contextPath}/adminDeleteSelects.ad" method="post">
			<input type="hidden" name="type" value="9">
			<input type="hidden" name="url" value="adminFAQManage.ad">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 10%">카테고리</th>
					<th style="width: 20%">제목</th>
					<th style="width: 36%">내용</th>
					<th style="width: 10%">작성날짜</th>
					<th style="width: 9%">게시여부</th>
					<th style="width: 7%">
						<button type="button" class="allSelect btns" style="background-color: #19A7CE; width: 45px;font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach items="${faqList}" var="f" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${f.faqNo}
							<input type="hidden" name="faqNo" value="${f.faqNo}"></td>
						<td>
							<c:if test="${f.faqType eq -1}">공지사항</c:if>
							<c:if test="${f.faqType eq 1}">배송</c:if>
							<c:if test="${f.faqType eq 2}">결제</c:if>
							<c:if test="${f.faqType eq 3}">회원</c:if>
							<c:if test="${f.faqType eq 4}">상품</c:if>
							<c:if test="${f.faqType eq 0}">기타</c:if>
						</td>
						<td>${fn:substring(f.faqTitle, 0, 20)}</td>
						<td>
							<a href="${contextPath}/adminFAQDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&faqNo=${f.faqNo}">
							${fn:substring(f.faqContent, 0, 35)}</a>
						</td>
						<td><fmt:formatDate value="${f.faqDate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<c:if test="${f.faqStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${f.faqStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${f.faqNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button type="button" onclick="location.href='${contextPath}/adminFAQWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">글작성</button>
			</div>
		</div>
		
		<jsp:include page="../common/adminSearchForm.jsp"/>
		
		<jsp:include page="../common/adminPaging.jsp"/>
	</div>

	<script>
// 		후기 타입 선택버튼 함수
		function selectFAQType(i){
// 			location.href="${contextPath}/adminFAQManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&type="+i;
			if(i == -2){
				location.href="${contextPath}/adminFAQManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&kind=1";
			}else {
				location.href="${contextPath}/adminFAQManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&type="+i+"&kind=0";
			}
// 				location.href="${contextPath}/adminFAQManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}";
// 								+"&kind=0";
// 			}else{
// 				location.href="${contextPath}/adminFAQManage.ad?page=1&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}"
// 								+"&kind=1&type="+i;
// 			}
		}
		
		
	</script>
	
	
	
	
	
</body>
</html>
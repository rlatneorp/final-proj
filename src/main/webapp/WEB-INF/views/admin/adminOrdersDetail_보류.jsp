<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSalesDetail</title>
<style>
	span{height:25px;}
/*  	input .modifyAble{border: 1px solid rgba(0,0,0,0.3);} */
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="mainBox d-inline-block align-top p-4 ps-5 rounded" style="border: 2px solid rgba(0,0,0,0.1);">
		<h4 class="py-4 mb-0">주문정보관리</h4>
		
		<form action="${contextPath}/adminOrderUpdate.ad" method="post">
			<div class="row">
				<div class="col-12 row">
					<h5 class="my-3">- 주문자정보 -</h5>
					<span class="col-2">주문번호</span>
					<input type="text" class="col-10 pb-1 mb-2 rounded border" value="2023052317011020" readonly>
					<span class="col-2">주문일자</span>
					<input type="date" class="col-10 pb-1 mb-2 rounded border" value="2023-05-05" readonly>
					<span class="col-2">주문자</span>
					<input type="text" class="col-10 pb-1 mb-2 rounded modifyAble" value="강건강">
					<span class="col-2">전화번호</span>
					<input type="text" class="col-10 pb-1 mb-2 rounded modifyAble" value="010-9111-2222">
					<span class="col-2">주소</span>
					<input type="text" class="col-10 pb-1 mb-2 rounded modifyAble" value="서울시 중구 남대문로1 2층 KH정보교육원">
					<span class="col-2">총 결제액</span>
					<span class="col-2 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="84000"/>
					</span>
					
					<span class="col-12"></span>
					
					<h5 class="mb-3">- 주문정보 -</h5>
					
					<div class="col-12 row py-3 mb-3 rounded border">
						<h6 class="col-12 mb-2 fw-bold">- 주문 상품 1 -</h6>
						<span class="col-2">상품코드</span>
						<span class="col-10 pb-1 mb-2 rounded border">1071</span>
						<span class="col-2">상품명</span>
						<span class="col-10 pb-1 mb-2 rounded border">국자세트</span>
						<span class="col-2">옵션명</span>
						<input type="text" class="col-10 pb-1 mb-2 rounded modifyAble" value="color-white">
						<span class="col-2">수량</span>
						<input type="number" class="col-10 pb-1 mb-2 rounded modifyAble" value="3">
						
						<span class="col-2">합계</span>
						<span class="col-2 pb-1 mb-2 rounded border text-end">
							<fmt:formatNumber pattern="###,###,###" value="36000"/>
						</span>
						<span class="col-2 text-end">할인율</span>
						<span class="col-2 pb-1 mb-2 rounded border text-end">0%</span>
						<span class="col-2 text-end">단가</span>
						<span class="col-2 pb-1 mb-2 rounded border text-end">
							<fmt:formatNumber pattern="###,###,###" value="12000"/>
						</span>
						<span class="col-2">처리상태</span>
						<span class="col-2 pb-1 mb-2 rounded border">배송완료</span>
					</div>
					
					
					<div class="col-12 row py-3 mb-3 rounded border">
						<h6 class="col-12 mb-2 fw-bold">- 주문 상품 2 -</h6>
						<span class="col-2">상품코드</span>
						<span class="col-10 pb-1 mb-2 rounded border">1072</span>
						<span class="col-2">상품명</span>
						<span class="col-10 pb-1 mb-2 rounded border">도마세트</span>
						<span class="col-2">옵션명</span>
						<input type="text" class="col-10 pb-1 mb-2 rounded modifyAble" value="color-black">
						<span class="col-2">수량</span>
						<input type="number" class="col-10 pb-1 mb-2 rounded modifyAble" value="2">
						
						<span class="col-2">합계</span>
						<span class="col-2 pb-1 mb-2 rounded border text-end">
							<fmt:formatNumber pattern="###,###,###" value="48000"/>
						</span>
						<span class="col-2 text-end">할인율</span>
						<span class="col-2 pb-1 mb-2 rounded border text-end">0%</span>
						<span class="col-2 text-end">단가</span>
						<span class="col-2 pb-1 mb-2 rounded border text-end">
							<fmt:formatNumber pattern="###,###,###" value="24000"/>
						</span>
						<span class="col-2">처리상태</span>
						<span class="col-2 pb-1 mb-2 rounded border">배송완료</span>
					</div>
				</div>
				
				
				<div class="d-flex justify-content-center mb-5">
					<div class="d-flex">
						<button onclick="location.href='${contextPath}/adminOrderUpdate.ad'" class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
						<button onclick="location.href='${contextPath}/adminOrderManage.ad'" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	
</body>
</html>
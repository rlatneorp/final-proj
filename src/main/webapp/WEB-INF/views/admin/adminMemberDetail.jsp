<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMemberDetail</title>
<style>
	span{height:25px;}
</style>
</head>
<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top mt-5 p-4 ps-5 rounded" style="width: 900px; height:1000px; border: 2px solid rgba(0,0,0,0.1);">
		<h4 class="py-4 mb-0">회원정보관리</h4>
		
		<form action="${contextPath}/adminMemberUpdate.ad" method="post">
			<div class="row">
				<div class="col-6 row">
					<h5 class="my-3">- 개인정보 -</h5>
					<span class="col-4">회원번호</span>
					<input type="text" class="col-8 pb-1 mb-2 rounded border" value="1" readonly>
					<span class="col-4">아이디</span>
					<input type="text" class="col-8 pb-1 mb-2 rounded border" value="ganggangsu1" readonly>
					<span class="col-4">이름</span>
					<input type="text" class="col-8 pb-1 mb-2 rounded border" value="강건강" readonly>
					<span class="col-4">이메일</span>
					<input type="text" class="col-8 pb-1 mb-2 rounded border" value="rkd1@naver.com" readonly>
					<span class="col-4">전화번호</span>
					<input type="text" class="col-8 pb-1 mb-2 rounded border" value="010-9111-2222" readonly>
					<span class="col-4">가입일자</span>
					<input type="date" class="col-8 pb-1 mb-2 rounded border" value="2023-05-05" readonly>
					<span class="col-4">출석체크</span>
					<input type="text" class="col-8 pb-1 mb-2 rounded" style="border: 2px solid rgba(0,0,0,0.3);" value="15">
					<span class="col-4">탈퇴일자</span>
					<input type="text" class="col-8 pb-1 mb-2 rounded border" value="" readonly>
					<span class="col-4">활동여부</span>
					<button type="button" class="col-2 mb-2 rounded" style="border: 2px solid rgba(0,0,0,0.1); ">O</button>
					<span class="col-6"></span>
					<span class="col-4">관리자여부</span>
					<button type="button" class="col-2 mb-2 rounded" style="border: 2px solid rgba(0,0,0,0.1); ">X</button>
					<span class="col-6"></span>
					<span class="col-12"></span>
	
					
					<h5 class="mb-3">- 기타정보 -</h5>
					<span class="col-4">포인트</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="1000"/>
					</span>
					<span class="col-4">팔로잉</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="9703"/>
					</span>
					<span class="col-4">팔로워</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="10547"/>
					</span>
					<span class="col-4">레시피 등록 수</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="94"/>
					</span>
					<span class="col-4">총 스크랩 수</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="1202"/>
					</span>
					<span class="col-4">총 좋아요 수</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="1702"/>
					</span>
				</div>
				
				<div class="col-6">
					<div class="ms-5" style="padding-top:56px;">
						<img class="w-100 rounded border" alt="로드 실패" src="${contextPath}/resources/images/persons.png"/>
					</div>
				</div>
				<div class="mb-5"></div>
				<div class="d-flex justify-content-center mb-5">
					<div class="d-flex">
						<button onclick="location.href='${contextPath}/adminMemberUpdate.ad'" class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
						<button onclick="location.href='${contextPath}/adminMemberManage.ad'" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	
</body>
</html>
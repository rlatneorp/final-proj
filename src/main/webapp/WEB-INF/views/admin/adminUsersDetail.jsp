<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<%@ include file="../common/top.jsp" %>
	<div class="mainBox d-inline-block align-top rounded" style="width: 1200px; margin-bottom: 200px; padding: 40px 75px; border: 2px solid rgba(0,0,0,0.1);">
		<h4 class="py-4 mb-0">회원정보관리</h4>
		
		<c:set value="${u.usersPw eq '네이버로그인 회원입니다' || u.usersPw eq '카카오로그인 회원입니다'}" var="social"/>
		<form action="${contextPath}/adminUsersUpdate.ad" method="post">
			<input type="hidden" name="pointBefore" value="${u.point}">
			<input type="hidden" name="uri" value="${uri}">
			<input type="hidden" name="page" value="${ab.page}">
			<div class="row">
				<div class="col-6 row">
					<h5 class="my-3">- 개인정보 -</h5>
					<hr>
					<span class="col-4">회원번호</span>
					<input type="text" name="usersNo" class="col-8 pb-1 mb-2 rounded border" value="${u.usersNo}" readonly>
					<hr>
					<span class="col-4">이름</span>
					<input type="text" name="usersName" class="col-8 pb-1 mb-2 rounded" value="${u.usersName}">
					<hr>
					<span class="col-4">닉네임</span>
					<input type="text" name="nickName" class="col-8 pb-1 mb-2 rounded" value="${u.nickName}">
					<hr>
					
					<c:if test="${social}">
						<c:if test="${u.usersPw eq '네이버로그인 회원입니다' }">
							<span class="col-4">아이디</span>
							<input type="text" class="col-8 pb-1 mb-2 rounded border" value="-네이버회원-" readonly>
							<hr>
							<span class="col-4">이메일</span>
							<input type="text" class="col-8 pb-1 mb-2 rounded border" value="-네이버회원-" readonly>
							<hr>
							<span class="col-4">전화번호</span>
							<input type="text" class="col-8 pb-1 mb-2 rounded border" value="-네이버회원-" readonly>
							<hr>
						</c:if>
						<c:if test="${u.usersPw eq '카카오로그인 회원입니다' }">
							<span class="col-4">아이디</span>
							<input type="text" class="col-8 pb-1 mb-2 rounded border" value="-카카오회원-" readonly>
							<hr>
							<span class="col-4">이메일</span>
							<input type="text" class="col-8 pb-1 mb-2 rounded border" value="-카카오회원-" readonly>
							<hr>
							<span class="col-4">전화번호</span>
							<input type="text" class="col-8 pb-1 mb-2 rounded border" value="-카카오회원-" readonly>
							<hr>
						</c:if>
					</c:if>
					<c:if test="${!social}">
						<span class="col-4">아이디</span>
						<input type="text" name="usersId" class="col-8 pb-1 mb-2 rounded" value="${u.usersId}">
						<hr>
						<span class="col-4">이메일</span>
						<input type="text" name="email" class="col-8 pb-1 mb-2 rounded" value="${u.email}">
						<hr>
						<span class="col-4">전화번호</span>
						<input type="number" name="phone" class="col-2 pe-0 pb-1 mb-2 rounded" value="${fn:substring(u.phone,0,3)}">
						<span class="col-1">-</span>
						<input type="number" name="phone" class="col-2 pe-0 pb-1 mb-2 rounded" value="${fn:substring(u.phone,3,7)}">
						<span class="col-1">-</span>
						<input type="number" name="phone" class="col-2 pe-0 pb-1 mb-2 rounded" value="${fn:substring(u.phone,7,11)}">
						<hr>
					</c:if>
					
					<span class="col-4">가입일자</span>
					<input type="date" class="col-8 pb-1 mb-2 rounded border" value="<fmt:formatDate value="${u.enrollDate}" pattern="yyyy-MM-dd" />" readonly>
					<hr>
					<span class="col-4">탈퇴일자</span>
					<input type="text" class="col-8 pb-1 mb-2 rounded border" value="<fmt:formatDate value="${u.exitDate}" pattern="yyyy-MM-dd" />" readonly>
					<hr>
					
					<span class="col-4 mb-3">활동여부</span>
					<input type="hidden" name="status" value="${u.status}">
					<button type="button" class="col-1 status" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">Y</button>
					<button type="button" class="col-1 status" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; height: 30px; font-size: 14px;">N</button>
					<span class="col-6"></span>
					<hr>
					<span class="col-4 mb-3">관리자여부</span>
					<input type="hidden" name="isAdmin" value="${u.isAdmin}">
					<button type="button" class="col-1 isAdmin" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">Y</button>
					<button type="button" class="col-1 isAdmin" style="background-color: gray; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; height: 30px; font-size: 14px;">N</button>
					<span class="col-6"></span>
					<hr><br><br><br>
					
	
					
					<h5 class="mb-3">- 기타정보 -</h5>
					<hr>
					<span class="col-4">포인트</span>
					<input type="text" name="pointBefore" class="col-3 mb-2 rounded text-end border" value="${u.point}"readonly>
					
					<span class="col-2 text-center">-></span>
					<input type="number" name="point" class="col-3 mb-2 rounded text-end" value="${u.point}">
					
					<span class="col-8"></span>

					<button type="button" class="col-1 pointBtn p-0" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">+10</button>
					<button type="button" class="col-1 pointBtn p-0" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; height: 30px; font-size: 14px;">-10</button>
					
					<button type="button" class="col-1 pointBtn p-0" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">+100</button>
					<button type="button" class="col-1 pointBtn p-0" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; height: 30px; font-size: 14px;">-100</button>
					
					<span class="col-10"></span>
					<button type="button" class="col-2 mb-3 pointResetBtn p-0" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray;height: 30px; font-size: 14px;">초기화</button>
					<hr>
					
					<span class="col-4">팔로잉</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="${u.following}"/>
					</span>
					<hr>
					<span class="col-4">팔로워</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="${u.follower}"/>
					</span>
					<hr>
					<span class="col-4">레시피 등록 수</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="${u.enrollRecipe}"/>
					</span>
					<hr>
					<span class="col-4">총 스크랩 수</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="${u.bookmarkCount}"/>
					</span>
					<hr>
					<span class="col-4">총 좋아요 수</span>
					<span class="col-8 pb-1 mb-2 rounded border text-end">
						<fmt:formatNumber pattern="###,###,###" value="${u.likeCount}"/>
					</span>
					<hr>
				</div>
				
				<div class="col-6">
					<div class="ms-5" style="padding-top:56px;">
						<c:if test="${!empty img}">
							<img class="w-100 rounded border" alt="로드 실패" src="${contextPath}/resources/uploadFiles/${img[0].imageRenameName}"/>
						</c:if>
						<c:if test="${empty img}">
							<img class="w-100 rounded border" alt="로드 실패" src="${contextPath}/resources/images/persons.png"/>
						</c:if>
					</div>
				</div>
				<div class="mb-5"></div>
				<div class="d-flex justify-content-center mb-5">
					<div class="d-flex">
						<button class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
						<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	
	
	<script>
		window.onload =()=>{
//			공식등록 / 공개상태 버튼 - 기존 값 입력, 이벤트
			const stBtns = document.getElementsByClassName('status');
			const status = document.getElementsByName('status')[0];
			const adBtns = document.getElementsByClassName('isAdmin');
			const isAdmin = document.getElementsByName('isAdmin')[0];
		
//			기존 값 입력
			if(status.value == "Y"){
				stBtns[0].style.background = "#19A7CE";
				stBtns[1].style.background = "gray";
			}else{
				stBtns[0].style.background = "gray";
				stBtns[1].style.background = "#19A7CE";
			}
			if(isAdmin.value == "Y"){
				adBtns[0].style.background = "#19A7CE";
				adBtns[1].style.background = "gray";
			}else{
				adBtns[0].style.background = "gray";
				adBtns[1].style.background = "#19A7CE";
			}
// 			이벤트 추가
			stBtns[0].addEventListener('click', () => {
				status.value = stBtns[0].innerText;
				stBtns[0].style.background = "#19A7CE";
				stBtns[1].style.background = "gray";
			});
			stBtns[1].addEventListener('click', () => {
				status.value = stBtns[1].innerText;
				stBtns[1].style.background = "#19A7CE";
				stBtns[0].style.background = "gray";
			});
			adBtns[0].addEventListener('click', () => {
				isAdmin.value = adBtns[0].innerText;
				adBtns[0].style.background = "#19A7CE";
				adBtns[1].style.background = "gray";
			});
			adBtns[1].addEventListener('click', () => {
				isAdmin.value = adBtns[1].innerText;
				adBtns[1].style.background = "#19A7CE";
				adBtns[0].style.background = "gray";
			});
		
// 			포인트 추가/감소 함수 적용
			const pBtns = document.getElementsByClassName('pointBtn'); 
			const pResetBtn = document.getElementsByClassName('pointResetBtn')[0];
			const point = document.getElementsByName('point')[0];
			
			pBtns[0].addEventListener('click', ()=>{
				cal(10);
			})
			pBtns[1].addEventListener('click', ()=>{
				cal(-10);
			})
			pBtns[2].addEventListener('click', ()=>{
				cal(100);
			})
			pBtns[3].addEventListener('click', ()=>{
				cal(-100);
			})
			pResetBtn.addEventListener('click', ()=>{
				point.value = ${u.point};
			})
		}
		
		function cal(i){
			const point = document.getElementsByName('point')[0];
			point.value = Number(point.value) + i;
			if(point.value < 0){
				point.value = 0;
			}
		}
		
		
		
	</script>
</body>
</html>
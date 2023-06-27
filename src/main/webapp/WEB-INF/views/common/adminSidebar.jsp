<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
<link href="${pageContext.servletContext.contextPath}/resources/css/sidebars.css" rel="stylesheet">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
<%-- <c:if test="${location.pathname}"></c:if> --%>
<style>
	.sidebar{width: 230px; z-index: 2000; top: 40px;}
	.mainBox{margin: 0px 270px; width: 1450px;}
	.mainBox tr{height: 40px;}
	.mainBox th{font-size: 14px;}
	.mainBox td{font-size: 14px;}
	.mainBox tr th{border: 1px solid rgba(0,0,0,0.2);}
	.mainBox tr td{border: 1px solid rgba(0,0,0,0.2);}
	.mainBox span{height:25px; font-size:14px;}
	.mainBox input{font-size:14px;}
	.mainBox .btns{color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;}
	.sidebar .folderBtn:hover{cursor: pointer;}
</style>
</head>

<body>
<%-- 	<%@ include file="../common/top.jsp" %> --%>
<%-- 	<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/> --%>
<!-- 	<div class="d-flex position-fixed sidebar" style="width: 230px; z-index: 2000;"> -->
	<div class="d-flex position-fixed sidebar">
		<div class="d-flex flex-column p-3 bg-white">
			<a href="${contextPath}/adminMain.ad" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<span class="fs-5 fw-semibold">관리자페이지</span>
			</a>
			<p class="fs-7 fw-semibold mb-0 text-center folderBtn">sidebar 접기</p>
			<hr>
			<div class="folder">
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#collapse-one" aria-expanded="true">
							매출관리
						</button>
						<div class="collapse show" id="collapse-one">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="${contextPath}/adminSalesManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">매출관리</a></li>
								<li><a href="${contextPath}/adminOrderManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">주문관리</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#collapse-two" aria-expanded="true">
							회원관리
						</button>
						<div class="collapse show" id="collapse-two">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="${contextPath}/adminUsersManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">회원관리</a></li>
	<!-- 							<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">출석체크관리</a></li> -->
								<li><a href="${contextPath}/adminPointManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">포인트관리</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#collapse-three" aria-expanded="true">
							상품관리
						</button>
						<div class="collapse show" id="collapse-three">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="${contextPath}/adminMenuManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">식단관리(일주일단위)</a></li>
								<li><a href="${contextPath}/adminIngredientManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">식재료관리(소량구매)</a></li>
								<li><a href="${contextPath}/adminFoodManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">식품관리(식재료,밀키트)</a></li>
								<li><a href="${contextPath}/adminToolManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">상품관리(도구)</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#collapse-four" aria-expanded="true">
							게시글관리
						</button>
						<div class="collapse show" id="collapse-four">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="${contextPath}/adminRecipeManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">레시피관리</a></li>
								<li><a href="${contextPath}/adminRecipeReviewManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">레시피후기관리</a></li>
								<li><a href="${contextPath}/adminMenuReviewManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">식단구독후기관리</a></li>
								<li><a href="${contextPath}/adminProductReviewManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">상품구매후기관리</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#collapse-five" aria-expanded="true">
							고객센터
						</button>
						<div class="collapse show" id="collapse-five">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="${contextPath}/adminFAQManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">자주묻는질문관리</a></li>
								<li><a href="${contextPath}/adminQNAManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">1:1문의관리</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<script>
		document.getElementsByClassName('folderBtn')[0].addEventListener('click', ()=>{
			const folder = document.getElementsByClassName('folder')[0];
			const folderBtn = document.getElementsByClassName('folderBtn')[0];
			if(folder.style.display == 'none'){
				folder.style.display = 'block';
				folderBtn.innerText = 'sidebar 접기';
			}else{
				folder.style.display = 'none';
				folderBtn.innerText = 'sidebar 열기';
			}
		})
	</script>
</body>
</html>
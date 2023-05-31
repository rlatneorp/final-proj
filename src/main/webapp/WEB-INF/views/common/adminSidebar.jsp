<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="${pageContext.servletContext.contextPath}/resources/css/sidebars.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>

<body>
	<c:set value="${pageContext.servletContext.contextPath}" var="contextPath" scope="application"/>
	<div class="d-inline-block flex-shrink-0 p-3 pt-5 bg-white" style="width: 280px; height: 100%;">
		<a href="${contextPath}/adminMain.ad" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
<!-- 			<svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg> -->
			<span class="fs-5 fw-semibold">관리자페이지</span>
		</a>
		
		<ul class="list-unstyled ps-0">
			<li class="mb-1">
				<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
					매출관리
				</button>
				<div class="collapse show" id="home-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="${contextPath}/adminSalesManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">매출관리</a></li>
					</ul>
				</div>
			</li>
			<li class="mb-1">
				<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
					회원관리
				</button>
				<div class="collapse show" id="home-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="${contextPath}/adminMemberManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">회원관리</a></li>
						<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">출석체크관리</a></li>
						<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">포인트관리</a></li>
					</ul>
				</div>
			</li>
			<li class="mb-1">
				<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="true">
					상품관리
				</button>
				<div class="collapse show" id="dashboard-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="${contextPath}/adminMenuManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">식단관리(일주일단위)</a></li>
						<li><a href="${contextPath}/adminIngredientManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">식재료관리(소량구매)</a></li>
						<li><a href="${contextPath}/adminFoodManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">상품관리(식재료,밀키트)</a></li>
						<li><a href="${contextPath}/adminProductManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">상품관리(주방도구)</a></li>
					</ul>
				</div>
			</li>
			<li class="mb-1">
				<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="true">
					게시글관리
				</button>
				<div class="collapse show" id="orders-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="${contextPath}/adminRecipeManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">레시피관리</a></li>
						<li><a href="${contextPath}/adminRecipeReviewManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">레시피후기관리</a></li>
						<li><a href="${contextPath}/adminSubscribeReviewManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">구독후기관리</a></li>
						<li><a href="${contextPath}/adminPaymentReviewManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">상품구매후기관리</a></li>
					</ul>
				</div>
			</li>
			<li class="mb-1">
				<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="true">
					고객센터
				</button>
				<div class="collapse show" id="account-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="${contextPath}/adminFAQManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">자주묻는질문관리</a></li>
						<li><a href="${contextPath}/adminQNAManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">1:1문의관리</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>
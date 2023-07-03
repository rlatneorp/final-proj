<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain</title>
<link href="${pageContext.servletContext.contextPath}/resources/css/sidebars.css" rel="stylesheet">
<style>
	.sidebar{width: 230px; z-index: 10; top: 40px;}
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
	.sidebar_hr{width:220px;}
</style>
</head>

<body>
	<div class="d-flex position-fixed sidebar">
		<div class="d-flex flex-column p-3 bg-white">
			<hr class="sidebar_hr">
			<p class="fs-5 fw-bold mb-0 text-center folderBtn">sidebar 접기</p>
			<hr class="sidebar_hr">
			<div class="folder">
				<a href="${contextPath}/adminMain.ad" class="d-flex text-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
					<span class="fs-5 fw-semibold w-100">관리자페이지</span>
				</a>
				<div class="d-flex justify-content-center ">
					<div class="d-flex">
						<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 60px; height: 30px; font-size: 12px; font-weight: bold;">뒤로</button>
						<button onclick="history.forward()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 60px; height: 30px; font-size: 12px; font-weight: bold;">앞으로</button>
					</div>
				</div>
				<hr class="sidebar_hr">
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#collapse-one" aria-expanded="true">
							매출관리
						</button>
						<div class="collapse show" id="collapse-one">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="${contextPath}/adminSalesManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">매출관리</a></li>
								<li><a href="${contextPath}/adminOrdersManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">주문관리</a></li>
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
								<li><a href="${contextPath}/adminBoardManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">게시판관리</a></li>
								<li><a href="${contextPath}/adminReviewManage.ad" class="link-dark d-inline-flex text-decoration-none rounded">후기관리 (레시피,<br/>식단,식품,식재료,기타)</a></li>
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
		document.getElementsByClassName('folder')[0].style.display = localStorage.getItem('sidebar');
		
		document.getElementsByClassName('folderBtn')[0].addEventListener('click', ()=>{
			const folder = document.getElementsByClassName('folder')[0];
			const folderBtn = document.getElementsByClassName('folderBtn')[0];
			if(folder.style.display == 'none'){
				folder.style.display = 'block';
				folderBtn.innerText = 'sidebar 접기';
				localStorage.setItem('sidebar', "block");
			}else{
				folder.style.display = 'none';
				folderBtn.innerText = 'sidebar 열기';
				localStorage.setItem('sidebar', "none");
			}
		})
	</script>
</body>
</html>
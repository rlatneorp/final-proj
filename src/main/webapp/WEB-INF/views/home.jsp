<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<style>
*{
font-family: 'Noto Sans KR', sans-serif;
}

.carousel-control-next{
	opacity: 1.0;
}

.carousel-control-next:hover{
	opacity: 1.0;
}

.mainAd{
	border: 2px solid black;
	box-shadow: 0px 15px black;
}
.mainTitle{
	font-size: 36px;
	font-weight: 700;
	text-decoration: none;
	color:black;
}
.mainAd .position-absolute{
	border: none;
	width: 50px;
	border-radius: 20px;
	background-color: lightgray;
	opacity: 0.5;
	color: black;
}

.foodRank{
    font-size: 28px;
    border: none;
    width: 60px;
    height: 60px;
    margin-top: 10px;
    padding-top: 8px;
    border-radius: 100px;
    background-color: lightgray;
}

.mainFood .position-relative{
	padding: 20px;
}


.mainFood2 .position-relative{
	padding: 10px;
	height: 100%
}
.reci .position-relative{
	padding: 22px;
}

.star{
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}

.nextBtn{
  font-variation-settings:
  'FILL' 0,
  'wght' 700,
  'GRAD' 0,
  'opsz' 48;
  font-size: 40px;
  vertical-align: text-bottom;
}

.recipe-name{ 
	text-align: center; font-size: 20px; font-weight: bold;
 	white-space: nowrap; overflow:hidden; text-overflow: ellipsis;
 	margin-top: 10px;
}

.foodPrice{
	text-align: center; 
}

.img-div{width: 230px; height: 250px; overflow: hidden;}
.recipe-img{width: 100%; height: 100%; object-fit: cover; object-position: center;}

.healther-img-div{
	width: 100px; height: 100px; overflow: hidden; border-radius: 50%; border: 2px solid gray;
	margin: 0 auto; }
.healther-img{width: 100%; height: 100%; object-fit: cover; object-position: center;}
.healther-name{font-size: 17px; font-weight: bold; margin: 8px;}
.healther-title{font-size: 14px; margin-bottom: 5px;}



.foodCategory{
	font-size: 20px;
	font-weight: 700;
	margin-left: 20px;
}

.semiReci{
	width: 1100px; height: 550px;
	border: 3px solid black;
	border-radius: 20px;
	box-shadow: 0px 10px black;
}

.foodBtn{
	width: 60px; height: 33px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 20px;
}
.foodCategoryBtn{
	width: 80px; height: 33px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 15px;
}

.discount {
	font-size:25px;
	font-weight:bold;
	color:red;
	letter-spacing: 2px; 
}
.personBtn{
	width: 80px; height: 33px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	background-color: #B0DAFF;
	margin: 15px;
}

.oneCooker{
	text-align: center;
	align-content: center;
	width: 1120px;
}


</style>
<body>
<%@ include file="common/top.jsp" %>
<br><br>
<div class="container-xxl" align="center">
	<div id="carouselExampleInterval" class="carousel slide position-relative mainAd" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-bs-interval="10000">
	      <img src="resources/images/ad1.jpg" style="width:1200px; height:290px;" class="d-block w-100" alt="...">
	    	<div class="position-absolute bottom-0 end-0" style="margin-bottom: 50px; margin-right: 200px; z-index: 9999;">1 / 3</div>
	    </div>
	    <div class="carousel-item" data-bs-interval="2000">
	      <img src="resources/images/ad2.png"  style="width:1200px; height:290px;" class="d-block w-100" alt="...">
	    	<div class="position-absolute bottom-0 end-0" style="margin-bottom: 50px; margin-right: 200px; z-index: 9999;">2 / 3</div>
	    </div>
	    <div class="carousel-item">
	      <img src="resources/images/ad3.png"  style="width:1200px; height:290px;" class="d-block w-100" alt="...">
	     	<div class="position-absolute bottom-0 end-0" style="margin-bottom: 50px; margin-right: 200px; z-index: 9999;">3 / 3</div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	
	</div>
	<br><br><br><br><br><br>
	<div>
		<p class="mainTitle">잘 나가는 <b style="color:#4485d7">상품</b>들</p>
	</div>
	<br>
	<div id="carousel" class="carousel slide position-relative"  data-bs-touch="false">
		<div id="carousel" class="carousel slide position-relative"  data-bs-touch="false">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="mainFood2"  style="display: flex; justify-content: center;">
						<c:forEach items="${ likeOrderByOne }" var="li" end="3">
									<div style="cursor:pointer; margin: 7px; width: 230px; height: 380px;" onclick="window.location.href='${contextPath}/market_detail.ma?productNo=${li.PRODUCT_NO }'" >
										<div class="img-div"> 
											<img src="${ contextPath }/resources/uploadFiles/${ li.IMAGE_RENAMENAME }" class="rounded recipe-img">
										</div>
										<c:if test="${li.FOOD_NAME ne null }">
											<div class="recipe-name">${ li.FOOD_NAME }</div>
										</c:if>
										<c:if test="${li.TOOL_NAME ne null }">
											<div class="recipe-name">${ li.TOOL_NAME }</div>
										</c:if>
										<c:if test="${li.INGREDIENT_NAME ne null }">
											<div class="recipe-name">${ li.INGREDIENT_NAME }</div>
										</c:if>
										<c:if test="${li.PRODUCT_SALE ne 0 }">
											<div class="foodPrice" style="text-decoration: line-through;">
												<fmt:formatNumber value="${ li.PRODUCT_PRICE }" pattern="###,###,###"/>원
											</div>
										</c:if>
										<c:if test="${li.PRODUCT_SALE eq 0 }">
											<div style="font-size:25px; ">
												<fmt:formatNumber value="${ li.PRODUCT_PRICE }" pattern="###,###,###"/>원
											</div>
										</c:if>
										<div class="discount"></div>
										<input type="hidden" class="likeOrders" value="${li.PRODUCT_SALE }">
									</div>
						</c:forEach>
					</div>
				</div>
				
				<div class="carousel-item">
					<div class="mainFood2" style="display: flex; justify-content: center;">
						<c:forEach items="${ likeOrderByOne }" var="li" begin="4" end="8">
									<div style="cursor:pointer; margin: 7px; width: 230px; height: 380px;" onclick="window.location.href='${contextPath}/market_detail.ma?productNo=${li.PRODUCT_NO }'">
										<div class="img-div"> 
											<img src="${ contextPath }/resources/uploadFiles/${ li.IMAGE_RENAMENAME }" class="rounded recipe-img">
										</div>
										<c:if test="${li.FOOD_NAME ne null }">
											<div class="recipe-name">${ li.FOOD_NAME }</div>
										</c:if>
										<c:if test="${li.TOOL_NAME ne null }">
											<div class="recipe-name">${ li.TOOL_NAME }</div>
										</c:if>
										<c:if test="${li.INGREDIENT_NAME ne null }">
											<div class="recipe-name">${ li.INGREDIENT_NAME }</div>
										</c:if>
										<c:if test="${li.PRODUCT_SALE ne 0 }">
											<div class="foodPrice" style="text-decoration: line-through;">
												<fmt:formatNumber value="${ li.PRODUCT_PRICE }" pattern="###,###,###"/>원
											</div>
										</c:if>
										<c:if test="${li.PRODUCT_SALE eq 0 }">
											<div style="font-size:25px; ">
												<fmt:formatNumber value="${ li.PRODUCT_PRICE }" pattern="###,###,###"/>원
											</div>
										</c:if>
										<div class="discount"></div>
										<input type="hidden" class="likeOrders" value="${li.PRODUCT_SALE }">
									</div>
						</c:forEach>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
					<div class="position-absolute bottom-50 start-0" style="padding-top: 8px; margin-left: 10px; margin-bottom: 40px; z-index: 9999;">
		 				<img src="resources/images/leftBtn.png">
					</div>	    
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next"  style="width: 0%">
					<div class="position-absolute bottom-50 end-0" style="padding-top: 8px; margin-right: 10px; margin-bottom: 40px; z-index: 9999;">
		 				<img src="resources/images/rightBtn.png">
					</div>
				</button>	
			</div>	
		</div>
	
	<br><br><br>
	
	
	
	<div>
		<p class="mainTitle">잘 나가는 <b style="color:#4485d7">밀키트</b></p>
	</div>
	
	<div id="carousel2" class="carousel slide position-relative"  data-bs-touch="false">
		<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="mainFood2" style="display: flex; justify-content: center;">
						<c:forEach items="${ mealKit }" var="mk" end="3">
								<div style="cursor:pointer; margin: 7px; width: 230px; height: 380px;" onclick="goMilkit(this)">
									<input type="hidden" value="${mk.FOOD_NAME }">
									<input type="hidden" value="${mk.MENU_NAME }">
									<input type="hidden" value="${mk.PRODUCT_NO }">
									<div class="img-div"> 
										<img src="${ contextPath }/resources/uploadFiles/${ mk.IMAGE_RENAMENAME }" class="rounded recipe-img">
									</div>
									<c:if test="${mk.FOOD_NAME ne null }">
										<div class="recipe-name">${ mk.FOOD_NAME }</div>
									</c:if>
									<c:if test="${mk.MENU_NAME ne null }">
										<div class="recipe-name">${ mk.MENU_NAME }</div>
									</c:if>
									<c:if test="${mk.PRODUCT_SALE ne 0 }">
										<div class="foodPrice" style="text-decoration: line-through;">
											<fmt:formatNumber value="${ mk.PRODUCT_PRICE }" pattern="###,###,###"/>원
										</div>
									</c:if>
									<c:if test="${mk.PRODUCT_SALE eq 0 }">
										<div style="font-size:25px; ">
											<fmt:formatNumber value="${ mk.PRODUCT_PRICE }" pattern="###,###,###"/>원
										</div>
									</c:if>
									<div class="discount"></div>
									<input type="hidden" class="likeOrders" value="${mk.PRODUCT_SALE }">
								</div>
						</c:forEach>
					</div>
				</div>
				
				<div class="carousel-item">
					<div class="mainFood2" style="display: flex; justify-content: center;">
						<c:forEach items="${ mealKit }" var="mk" begin="4" end="8">
									<div style="cursor:pointer; margin: 7px; width: 230px; height: 380px;" onclick="goMilkit(this)">
										<input type="hidden" value="${mk.FOOD_NAME }">
										<input type="hidden" value="${mk.MENU_NAME }">
										<input type="hidden" value="${mk.PRODUCT_NO }">
										<div class="img-div"> 
											<img src="${ contextPath }/resources/uploadFiles/${ mk.IMAGE_RENAMENAME }" class="rounded recipe-img">
										</div>
										<c:if test="${mk.FOOD_NAME ne null }">
											<div class="recipe-name">${ mk.FOOD_NAME }</div>
										</c:if>
										<c:if test="${mk.MENU_NAME ne null }">
											<div class="recipe-name">${ mk.MENU_NAME }</div>
										</c:if>
										<c:if test="${mk.PRODUCT_SALE ne 0 }">
											<div class="foodPrice" style="text-decoration: line-through;">
												<fmt:formatNumber value="${ mk.PRODUCT_PRICE }" pattern="###,###,###"/>원
											</div>
										</c:if>
										<c:if test="${mk.PRODUCT_SALE eq 0 }">
											<div style="font-size:25px; ">
												<fmt:formatNumber value="${ mk.PRODUCT_PRICE }" pattern="###,###,###"/>원
											</div>
										</c:if>
										<div class="discount"></div>
										<input type="hidden" class="likeOrders" value="${mk.PRODUCT_SALE }">
									</div>
						</c:forEach>
					</div>
				</div>
			</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carousel2" data-bs-slide="prev">
			<div class="position-absolute bottom-50 start-0" style="padding-top: 8px; margin-left: 76px; margin-bottom: 40px; z-index: 9999;">
 				<img src="resources/images/leftBtn.png">
			</div>	    
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carousel2" data-bs-slide="next" style="width: 0% ">
			<div class="position-absolute bottom-50 end-0" style="padding-top: 8px; margin-right: 80px; margin-bottom: 40px; z-index: 9999;">
 				<img src="resources/images/rightBtn.png">
			</div>
		</button>	
	</div>
	<br><br><br><br>
	
	
	<div class="semiReci">
		<div>
			<br><br>
			<p class="mainTitle">새로 등록된 <b style="color:#4485d7">레시피</b></p>
		</div>
		<br>
		<div id="carousel3" class="carousel slide position-relative"  data-bs-touch="false">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="mainFood2" style="display: flex; justify-content: center;">
						<c:forEach items="${ mrList }" var="mr" end="3">
							<div style="margin: 7px; width: 230px; height: 380px; cursor: pointer;" onclick="location.href='${contextPath}/recipeDetail.rc?rId=' + '${ mr.USERS_ID }' + '&rNo=' + ${ mr.FOOD_NO } + '&page='">
								<div class="img-div"> 
									<img src="${ contextPath }/resources/uploadFiles/${ mr.IMAGE_RENAMENAME }" class="rounded recipe-img">
								</div>
								<div class="recipe-name">${ mr.RECIPE_NAME }</div>
								<div class="foodPrice">${ mr.CATEGORY_INGREDIENT } ∣ ${ mr.CATEGORY_SITUATION } ∣ ${ mr.CATEGORY_TYPE }</div>
								<div><i class="bi bi-eye"></i> ${ mr.RECIPE_COUNT }</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="carousel-item">
					<div class="mainFood2" style="display: flex; justify-content: center;">
						<c:forEach items="${ mrList }" var="mr" begin="4" end="7">
							<div style="margin: 7px; width: 230px; height: 380px; cursor: pointer;" onclick="location.href='${contextPath}/recipeDetail.rc?rId=' + '${ mr.USERS_ID }' + '&rNo=' + ${ mr.FOOD_NO } + '&page='">
								<div class="img-div"> 
									<img src="${ contextPath }/resources/uploadFiles/${ mr.IMAGE_RENAMENAME }" class="rounded recipe-img">
								</div>
								<div class="recipe-name">${ mr.RECIPE_NAME }</div>
								<div class="foodPrice">${ mr.CATEGORY_INGREDIENT } ∣ ${ mr.CATEGORY_SITUATION } ∣ ${ mr.CATEGORY_TYPE }</div>
								<div><i class="bi bi-eye"></i> ${ mr.RECIPE_COUNT }</div>
							</div>
						</c:forEach>
					</div>
				</div>	
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carousel3" data-bs-slide="prev">
				<div class="position-absolute bottom-50 start-0" style="padding-top: 8px; margin-left: 10px; margin-bottom: 40px; z-index: 9999;">
	 				<img src="resources/images/leftBtn.png">
				</div>	    
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carousel3" data-bs-slide="next"  style="width: 0%">
				<div class="position-absolute bottom-50 end-0" style="padding-top: 8px; margin-right: 10px; margin-bottom: 40px; z-index: 9999;">
	 				<img src="resources/images/rightBtn.png">
				</div>
			</button>	
		</div>
	</div>	
					
	<br><br><br><br><br>
	
	<div>
		<p class="mainTitle">홀로세끼 영양사 소개</p>
		<br><br>
		<div class="oneCooker" style="display: flex; justify-content: center;"> 
				<c:forEach items="${ hList }" var="h">
					<div style="margin: 10px; width: 180px;">
						<div class="healther-img-div">
							<img class="healther-img" src="${ contextPath }/resources/uploadFiles/${ h.IMAGE_RENAMENAME }"/>
						</div>
						<div class="healther-name">${ h.NAME }</div>
						<div class="healther-title">${ h.TITLE }</div>
						<c:forEach items="${fn:split(h.CAREER, ',')}" var="career">
							<div class="healther-title">
								• ${career}
							</div>
						</c:forEach>
<%-- 						<c:forEach items="${ mList }" var="m" end="0"> --%>
<%-- 							<c:if test="${ m.usersNo eq h.USERS_NO }"> --%>
							여기
<%-- 							</c:if> --%>
<%-- 						</c:forEach> --%>
					</div>
				
				</c:forEach>
				
<!-- 				<tr> -->
<!-- 					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td> -->
<!-- 					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td> -->
<!-- 					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td> -->
<!-- 					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td> -->
<!-- 					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td> -->
<!-- 				</tr> -->
<!-- 				<tr style="text-align: center;"> -->
<!-- 					<td><button class="personBtn d-inline">강건강</button></td> -->
<!-- 					<td><button class="foodCategoryBtn d-inline">비건</button></td> -->
<!-- 					<td><button class="personBtn">남나눔</button></td> -->
<!-- 					<td><button class="foodCategoryBtn">양식</button></td> -->
<!-- 					<td><button class="personBtn">도대담</button></td> -->
<!-- 					<td><button class="foodCategoryBtn">중식</button></td> -->
<!-- 					<td><button class="personBtn">라라라</button></td> -->
<!-- 					<td><button class="foodCategoryBtn">비건</button></td> -->
<!-- 					<td><button class="personBtn">마라라</button></td> -->
<!-- 					<td><button class="foodCategoryBtn">케토식</button></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food1.jpg"></td> -->
<!-- 					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food2.jpg"></td> -->
<!-- 					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food3.jpg"></td> -->
<!-- 					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food4.jpg"></td> -->
<!-- 					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food4.jpg"></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="2"><h5>자세히보기</h5></td> -->
<!-- 					<td colspan="2"><h5>자세히보기</h5></td> -->
<!-- 					<td colspan="2"><h5>자세히보기</h5></td> -->
<!-- 					<td colspan="2"><h5>자세히보기</h5></td> -->
<!-- 					<td colspan="2"><h5>자세히보기</h5></td> -->
<!-- 				</tr> -->
		</div>
	</div>
	<br><br><br><br><br>
	
	<br><br><br><br><br>












</div>
<br><br><br><br><br>
<%@ include file="common/footer.jsp" %>



<script>
	const foodBtn = document.querySelectorAll('.foodBtn');
	for(const fb of foodBtn){
		fb.addEventListener('click', ()=>{
			fb.style.background = 'rgb(176, 218, 255)';
		})
		
	};
	
	//추천 상품
	const likeOrders = document.getElementsByClassName('likeOrders');
	for(lo of likeOrders) {
		if(lo.value != '0') {
			const originPrice = parseInt(lo.previousElementSibling.previousElementSibling.innerText.replace(/원/g, '').replace(/,/g, ''));
			const sale = parseInt(lo.value);
			const discount = (originPrice * (1- sale/100)).toLocaleString();
			lo.previousElementSibling.innerText = discount + '원'
		}	
	}
	
	//식단-food인지에 따라 링크 구분 
	function goMilkit(element) {
		console.log(element);
		const productNo = element.children[2].value;
		  if(element.children[1].value != '' && element.children[0].value == '') {
			  //식단으로 
			   location.href = '${contextPath}/menuDetail.mn?mNo=' + productNo;
		  } else {
			  //마켓으로
			  location.href = '${contextPath}/market_detail.ma?productNo=' + productNo
		  }
	}
	
	
	
</script>

</body>
</html>

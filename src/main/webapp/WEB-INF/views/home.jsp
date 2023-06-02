<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.foodName{
	font-size: 20px;
}

.foodPrice{
	font-weight: 500;
}

.foodCategory{
	font-size: 20px;
	font-weight: 700;
	margin-left: 20px;
}

.semiReci{
	width: 1100px; height: 707px;
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
		<p class="mainTitle">잘 나가는 상품들</p>
	</div>
	<br><br>
	<div id="carousel" class="carousel slide position-relative"  data-bs-touch="false">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="mainFood" style="width:1200px; height:500px; margin-top: 50px;">
					<div class="position-relative d-inline"> 
						<img src="resources/images/food1.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(255, 217, 102);">1위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food2.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(238, 238, 238);">2위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food3.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(215, 192, 174);">3위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food4.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank">4위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<br><br>
					<div class="container row row-cols-4" style="width: 1120px; margin-left: 10px;">
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">갈비탕 500g<td>
							</tr>
							<tr>
								<td colspan="2" class="foodPrice">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">달걀 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">감자탕 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">쭈꾸미 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
					</div>
				</div>	
			</div>
			   <div class="carousel-item">
				<div class="mainFood" style="width:1200px; height:500px; margin-top: 50px;">
					<div class="position-relative d-inline"> 
						<img src="resources/images/food2.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(255, 217, 102);">1위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food4.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(238, 238, 238);">2위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food1.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(215, 192, 174);">3위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food3.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank">4위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<br><br>
					<div class="container row row-cols-4" style="width: 1120px; margin-left: 10px;">
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">갈비탕 500g<td>
							</tr>
							<tr>
								<td colspan="2" class="foodPrice">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">달걀 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">감자탕 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">쭈꾸미 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
					</div>
				</div>	
			</div>		
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
			<div class="position-absolute bottom-50 start-0" style="padding-top: 8px; margin-left: 76px; margin-bottom: 40px; z-index: 9999;">
 				<img src="resources/images/leftBtn.png">
			</div>	    
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next"  style="width: 0%">
			<div class="position-absolute bottom-50 end-0" style="padding-top: 8px; margin-right: 80px; margin-bottom: 40px; z-index: 9999;">
 				<img src="resources/images/rightBtn.png">
			</div>
		</button>	
	</div>
	<br><br><br><br><br>
	<div>
		<p class="mainTitle">잘 나가는 밀키트</p>
	</div>
	<br><br>
	<div id="carousel2" class="carousel slide position-relative"  data-bs-touch="false">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="mainFood" style="width:1200px; height:500px; margin-top: 50px;">
					<div class="position-relative d-inline"> 
						<img src="resources/images/food1.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(255, 217, 102);">1위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food2.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(238, 238, 238);">2위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food3.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(215, 192, 174);">3위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food4.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank">4위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<br><br>
					<div class="container row row-cols-4" style="width: 1120px; margin-left: 10px;">
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">갈비탕 500g<td>
							</tr>
							<tr>
								<td colspan="2" class="foodPrice">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">달걀 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">감자탕 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">쭈꾸미 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
					</div>
				</div>	
			</div>
			   <div class="carousel-item">
				<div class="mainFood" style="width:1200px; height:500px; margin-top: 50px;">
					<div class="position-relative d-inline"> 
						<img src="resources/images/food2.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(255, 217, 102);">1위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food4.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(238, 238, 238);">2위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food1.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank" style="background: rgb(215, 192, 174);">3위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<div class="position-relative d-inline">
						<img src="resources/images/food3.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
						<div class="position-absolute top-0 start-0" style="margin-top: -150px;" z-index: 9999;">
							<div class="foodRank">4위</div>
						</div>
						<div class="position-absolute bottom-0 end-0" z-index: 9999;">
							<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
						</div>
					</div>
					<br><br>
					<div class="container row row-cols-4" style="width: 1120px; margin-left: 10px;">
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">갈비탕 500g<td>
							</tr>
							<tr>
								<td colspan="2" class="foodPrice">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">달걀 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">감자탕 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
						<table class="d-inline col">
							<tr>
								<td colspan="2" class="foodName">쭈꾸미 500g<td>
							</tr>
							<tr>
								<td colspan="2">1000원<td>
							</tr>
							<tr>
								<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
								<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
							</tr>
						</table>
					</div>
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
	<br><br><br><br><br>
	<div>
		<table class="mainTitle d-inline">
			<tr>
				<td>ㅎㄹ</td>
			</tr>
			<tr>
				<td>ㅅㄲ</td>
			</tr>
		</table>
		<p class="mainTitle d-inline" style="vertical-align: middle;">구독을 원한다면?</p>
	</div>
	<br><br>
	<p class="mainTitle d-inline">레시피 구독</p><span class="material-symbols-outlined nextBtn">navigate_next</span>
	<br><br><br>
	<div class="mainTitle reci">
		<div class="position-relative d-inline"> 
			<img src="resources/images/reci1.jpg" class="rounded" style="width:320px; height: 180px;" alt="...">
		</div>
		<div class="position-relative d-inline">
			<img src="resources/images/reci2.jpg" class="rounded" style="width:320px; height: 180px;" alt="...">
		</div>
		<div class="position-relative d-inline">
			<img src="resources/images/reci3.jpg" class="rounded" style="width:320px; height: 180px;" alt="...">
		</div>
	</div>
	<br><br><br><br><br>
	<div>
		<p class="mainTitle d-inline">식재료 구독</p><span class="material-symbols-outlined nextBtn">navigate_next</span>
		<br><br><br>
		<div class="mainFood">
			<div class="position-relative d-inline">
				<img src="resources/images/food1.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
			</div>
			<div class="position-relative d-inline">
				<img src="resources/images/food3.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
			</div>
			<div class="position-relative d-inline">
				<img src="resources/images/food2.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
			</div>
			<div class="position-relative d-inline">
				<img src="resources/images/food4.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
			</div>
		</div>
		<br>
		<div class="container row row-cols-4" style="width: 1120px; margin-left: 10px;">
			<table class="d-inline col">
				<tr>
					<td class="foodName">갈비탕 500g<td>
				</tr>
			</table>
			<table class="d-inline col">
				<tr>
					<td class="foodName">감자탕 500g<td>
				</tr>
			</table>
			<table class="d-inline col">
				<tr>
					<td class="foodName">갈비탕 500g<td>
				</tr>
			</table>
			<table class="d-inline col">
				<tr>
					<td class="foodName">쭈꾸미볶음 500g<td>
				</tr>
			</table>
		</div>
	</div>
	<br><br><br><br><br>
	<div class="semiReci">
		<div>
			<br><br>
			<p class="mainTitle">간단 레시피 보기</p>
			<button class="foodBtn">한식</button>
			<button class="foodBtn">양식</button>
			<button class="foodBtn">중식</button>
			<button class="foodBtn">일식</button>
			<button class="foodBtn">카페</button>
			<button class="foodBtn">기타</button>
		</div>
		<br>
		<div id="carousel3" class="carousel slide position-relative"  data-bs-touch="false">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="mainFood2">
						<div class="position-relative d-inline"> 
							<img src="resources/images/food1.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
							<div class="position-absolute bottom-0 end-0" z-index: 9999;">
								<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
							</div>
						</div>
						<div class="position-relative d-inline">
							<img src="resources/images/food2.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
							<div class="position-absolute bottom-0 end-0" z-index: 9999;">
								<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
							</div>
						</div>
						<div class="position-relative d-inline">
							<img src="resources/images/food3.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
							<div class="position-absolute bottom-0 end-0" z-index: 9999;">
								<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
							</div>
						</div>
						<div class="position-relative d-inline">
							<img src="resources/images/food4.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
							<div class="position-absolute bottom-0 end-0" z-index: 9999;">
								<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
							</div>
						</div>
						<br><br>
						<div class="container row row-cols-4" style="width: 1050px; margin-left: 10px;">
							<table class="d-inline col">
								<tr>
									<td colspan="2" class="foodName">갈비탕 500g<td>
								</tr>
								<tr>
									<td colspan="2" class="foodPrice">1000원<td>
								</tr>
								<tr>
									<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
									<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
								</tr>
							</table>
							<table class="d-inline col">
								<tr>
									<td colspan="2" class="foodName">달걀 500g<td>
								</tr>
								<tr>
									<td colspan="2" class="foodPrice">1000원<td>
								</tr>
								<tr>
									<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
									<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
								</tr>
							</table>
							<table class="d-inline col">
								<tr>
									<td colspan="2" class="foodName">감자탕 500g<td>
								</tr>
								<tr>
									<td colspan="2" class="foodPrice">1000원<td>
								</tr>
								<tr>
									<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
									<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
								</tr>
							</table>
							<table class="d-inline col">
								<tr>
									<td colspan="2" class="foodName">쭈꾸미 500g<td>
								</tr>
								<tr>
									<td colspan="2" class="foodPrice">1000원<td>
								</tr>
								<tr>
									<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
									<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
								</tr>
							</table>
						</div>
					</div>	
				</div>
				   <div class="carousel-item">
					<div class="mainFood2"">
						<div class="position-relative d-inline"> 
							<img src="resources/images/food2.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
							<div class="position-absolute bottom-0 end-0" z-index: 9999;">
								<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
							</div>
						</div>
						<div class="position-relative d-inline">
							<img src="resources/images/food4.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
							<div class="position-absolute bottom-0 end-0" z-index: 9999;">
								<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
							</div>
						</div>
						<div class="position-relative d-inline">
							<img src="resources/images/food1.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
							<div class="position-absolute bottom-0 end-0" z-index: 9999;">
								<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
							</div>
						</div>
						<div class="position-relative d-inline">
							<img src="resources/images/food3.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
							<div class="position-absolute bottom-0 end-0" z-index: 9999;">
								<div style="margin-bottom: -150px; padding-top: 8px; margin-right: 20px;"><img src="resources/images/bas.png"></div>
							</div>
						</div>
						<br><br>
						<div class="container row row-cols-4" style="width: 1050px; margin-left: 10px;">
							<table class="d-inline col">
								<tr>
									<td colspan="2" class="foodName">갈비탕 500g<td>
								</tr>
								<tr>
									<td colspan="2" class="foodPrice">1000원<td>
								</tr>
								<tr>
									<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
									<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
								</tr>
							</table>
							<table class="d-inline col">
								<tr>
									<td colspan="2" class="foodName">달걀 500g<td>
								</tr>
								<tr>
									<td colspan="2" class="foodPrice">1000원<td>
								</tr>
								<tr>
									<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
									<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
								</tr>
							</table>
							<table class="d-inline col">
								<tr>
									<td colspan="2" class="foodName">감자탕 500g<td>
								</tr>
								<tr>
									<td colspan="2" class="foodPrice">1000원<td>
								</tr>
								<tr>
									<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
									<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
								</tr>
							</table>
							<table class="d-inline col">
								<tr>
									<td colspan="2" class="foodName">쭈꾸미 500g<td>
								</tr>
								<tr>
									<td colspan="2" class="foodPrice">1000원<td>
								</tr>
								<tr>
									<td><span class="material-symbols-outlined star" style="vertical-align: text-bottom;">grade</span> 4.9<td>
									<td><span class="material-symbols-outlined" style="vertical-align: text-bottom;">article</span> 9999+<td>
								</tr>
							</table>
						</div>
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
		<p class="mainTitle">1인 요리사 소개</p>
		<p>매주 업데이트 됩니다</p>
		<br><br>
		<div class="oneCooker"> 
			<table>
				<tr>
					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td>
					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td>
					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td>
					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td>
					<td colspan="2"><img style="width:70%;" src="resources/images/persons.png"/></td>
				</tr>
				<tr style="text-align: center;">
					<td><button class="personBtn d-inline">강건강</button></td>
					<td><button class="foodCategoryBtn d-inline">비건</button></td>
					<td><button class="personBtn">남나눔</button></td>
					<td><button class="foodCategoryBtn">양식</button></td>
					<td><button class="personBtn">도대담</button></td>
					<td><button class="foodCategoryBtn">중식</button></td>
					<td><button class="personBtn">라라라</button></td>
					<td><button class="foodCategoryBtn">비건</button></td>
					<td><button class="personBtn">마라라</button></td>
					<td><button class="foodCategoryBtn">케토식</button></td>
				</tr>
				<tr>
					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food1.jpg"></td>
					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food2.jpg"></td>
					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food3.jpg"></td>
					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food4.jpg"></td>
					<td colspan="2"><img class="rounded" style="width:140px; height: 170px;" src="resources/images/food4.jpg"></td>
				</tr>
				<tr>
					<td colspan="2"><h5>자세히보기</h5></td>
					<td colspan="2"><h5>자세히보기</h5></td>
					<td colspan="2"><h5>자세히보기</h5></td>
					<td colspan="2"><h5>자세히보기</h5></td>
					<td colspan="2"><h5>자세히보기</h5></td>
				</tr>
			</table>
		</div>
	</div>
	<br><br><br><br><br>
	<div>
		<p class="mainTitle">1인 가구를 위한 음식들</p>
		<br><br>
		<div class="mainFood">
			<div class="position-relative d-inline">
				<img src="resources/images/food1.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
			</div>
			<div class="position-relative d-inline">
				<img src="resources/images/food3.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
			</div>
			<div class="position-relative d-inline">
				<img src="resources/images/food2.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
			</div>
			<div class="position-relative d-inline">
				<img src="resources/images/food4.jpg" class="rounded" style="width:230px; height: 300px;" alt="...">
			</div>
		</div>
		<br>
		<div class="container" style="width: 1120px;">
			<div class="row">
				<div class="col">
					<p class="foodName d-inline">갈비탕 500g</p>
					<p class="foodCategory d-inline">혼밥</p>
				</div>
				<div class="col">
					<p class="foodName d-inline">감자탕 500g</p>
					<p class="foodCategory d-inline">에너지</p>
				</div>	
				<div class="col">
					<p class="foodName d-inline">갈비탕 500g</p>
					<p class="foodCategory d-inline">특별식</p>
				</div>
				<div class="col">	
					<p class="foodName d-inline">쭈꾸미볶음 500g</p>
					<p class="foodCategory d-inline">비건</p>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>












</div>
<br><br><br><br><br>
<%@ include file="common/footer.jsp" %>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
	const foodBtn = document.querySelectorAll('.foodBtn');
	for(const fb of foodBtn){
		fb.addEventListener('click', ()=>{
			fb.style.background = 'rgb(176, 218, 255)';
		})
		
	};
	
	
	
</script>
</body>
</html>

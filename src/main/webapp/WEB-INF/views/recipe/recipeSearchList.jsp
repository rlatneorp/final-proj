<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<!-- 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" type="text/javascript"></script>
<style>
	#search{width: 1200px; height: 250px; border-top: 1px solid black; border-bottom: 1px solid black; background-color: #B0DAFF; margin: auto;}
	#searchBar{position: relative;}
	#inputText{border-radius: 8px; border: 1px solid black; box-shadow: 0px 5px 0px 0px black; width: 300px; height: 40px; margin-left: 450px; margin-right: 450px; margin-top: 40px;}
	#searchIcon{position: absolute; right: 455px; top: 46px;}
	#searchBtn{border-radius: 50%; width: 30px; height: 30px; border: none; background-color: #B0DAFF}
	#category{width: 450px; margin-left: 375px; margin-right: 375px; margin-top: 30px;}
	
	.title{font-weight: bold;}
	.group-button1, .group-button2, .group-button3{padding: 10px; background-color: #B0DAFF; border: none; cursor: pointer;}
	
	#side{width: 200px; height: 100px; margin-top: 25px; margin-left: 1300px;}
	#recipeWrite{box-shadow: 0px 5px 0px 0px black; border-radius: 8px; border: 1px solid black; background-color: #B0DAFF; color: white; height: 35px; margin-left: 100px; cursor: pointer;}
	.group-button{padding: 10px 10px 10px 30px; background-color: white; border: none; cursor: pointer; font-weight: bold;}
	
	.name-cut{white-space: nowrap; overflow:hidden; text-overflow: ellipsis; font-weight: bold; text-align: center;}
	.card-text{text-align: center; margin-bottom: 5px;}
	
	.card{width: 260px; margin-bottom: 10px;}
	.cardImg{width: 260px; height: 260px; overflow: hidden; border-top-right-radius: 3px; border-top-left-radius: 3px;}
 	.image{width: 100%; height: 100%; object-fit: cover; object-position: center;}
 	.image:hover{cursor: pointer; transform: scale(1.05);  object-fit: cover; object-position: center; transition: all 0.2s ease 0s;}
	
/* 	.height{height: 245px;} */
	
/* 	페이지 */
	.page_wrap {
		text-align:center;
		font-size:0;
	}
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		margin-top: 8px;
	}
	.page_nation .prev {
		background:white;
	}
	.page_nation .next {
		background:white;
	}
	.page_nation a.active {
		background-color:#B0DAFF;
		color:white;
		border:1px solid #B0DAFF;
		border-radius: 100%;
	}
	
	#recipeMenu{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}
	
</style>
	
</head>
<body>

<%@ include file="../common/top.jsp" %>

<br><br>

<div id="search">
	<form role="search" id="searchBar">
		<div id="searchBar">
			<input type="text" id="inputText" name="input" placeholder=" 내용을 입력해 주세요." onsubmit="return false;">
			<div id="searchIcon"><button type="button" id="searchBtn"><i class="bi bi-search"></i></button></div>
		</div>
	</form>
	<div id="category">
		<div>
			<span class="title">재료별 | </span>
			<button class="group-button1" data-value="고기">고기</button>
			<button class="group-button1" data-value="해물">해물</button>
			<button class="group-button1" data-value="과일">과일</button>
			<button class="group-button1" data-value="채소">채소</button>
		</div>
		<div>
			<span class="title">상황별 | </span>
			<button class="group-button2" data-value="다이어트">다이어트</button>
			<button class="group-button2" data-value="술안주">술안주</button>
			<button class="group-button2" data-value="도시락">도시락</button>
			<button class="group-button2" data-value="아침식사">아침식사</button>
			<button class="group-button2" data-value="비건">비건</button>
		</div>
		<div>
			<span class="title">종류별 | </span>
			<button class="group-button3" data-value="메인반찬">메인반찬</button>
			<button class="group-button3" data-value="국">국</button>
			<button class="group-button3" data-value="간식">간식</button>
			<button class="group-button3" data-value="면">면</button>
			<button class="group-button3" data-value="반찬">반찬</button>
		</div>
	</div>
</div>

<div id="side">
	<c:if test="${loginUser != null }">
		<button type="button" id="recipeWrite" onclick="location.href='recipeWrite.rc'">레시피 등록</button>
	</c:if>
	<br><br>
	
	<div id="align">
		<button class="group-button" id="recent" data-value="최신" onclick="recentAl()">최신순</button>
		<button class="group-button" id="most" data-value="조회" onclick="mostAl()">조회순</button>
	</div>
</div>

<c:if test="${empty rList }">
	<div style="text-align: center;">
		<h2>${str}</h2>	
	</div>
</c:if>

<div class="album p-5 bg-white">
	<div class="container px-5" style="width: 1200px;">
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-4 g-2" id="listBox">
			<c:forEach items="${ rList }" var="r">
				<c:forEach items="${ iList }" var="i">
					<c:if test="${ r.foodNo eq i.imageDivideNo }">
						<div class="col height">
							<div class="card shadow-sm">
							<div class="cardImg">
								<img src="${ contextPath }/resources/uploadFiles/${i.imageRenameName }" class="image">
							</div>
								<div class="card-body">
									<h5 class="name-cut">${ r.recipeName }</h5>
									<p class="card-text">${ r.nickName }</p>
									<p class="card-text">${ r.categoryIngredient } ∣ ${ r.categorySituation } ∣ ${ r.categoryType }</p>
								</div>
								<input type="hidden" value="${ r.usersId }">
								<input type="hidden" value="${ r.foodNo }">
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
</div>

<div class="page_wrap">
	<div class="page_nation">
	
<!-- 		이전 페이지로	 -->
		<c:url var="goBack" value="${loc }">
			<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
		</c:url>
		<c:if test="${pi.currentPage > 1 }">
			<a class="arrow prev" href="${goBack }"><i class="bi bi-chevron-left"></i></a>
		</c:if>
		
<!-- 		페이지 -->
		<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			<c:url var="goNum" value="${loc }">
				<c:param name="page" value="${p }"></c:param>
			</c:url>
			<c:if test="${ pi.currentPage eq p }">
				<a class="active">${p }</a>
			</c:if>
			<c:if test="${ !(pi.currentPage eq p) }">
				<a href="${goNum }">${p }</a>
			</c:if>
		</c:forEach>
		
		<c:url var="goNext" value="${loc }">
			<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
		</c:url>
		<c:if test="${pi.currentPage < pi.endPage }">
			<a class="arrow next" href="${goNext }"><i class="bi bi-chevron-right"></i></a>
		</c:if>
	</div>
</div>

<br><br><br><br>
<%@ include file="../common/footer.jsp" %>

<script>
	
	const search = document.getElementById('searchBtn');
	const searchBar = document.getElementById('searchBar');
// 	action="recipeList.rc" 
	
	search.addEventListener('click', function(){
		if(document.getElementById('inputText').value.trim() == ""){
			alert('검색어를 입력해주세요.');
		} else{
			const text = document.getElementById('inputText').value;
			searchBar.action="searchRecipe.rc";
			searchBar.submit();
			location.href="${contextPath}/searchRecipe.rc?word="+text;
		}
	})
	

	window.onload = () =>{
		const recipes = document.getElementsByClassName('card');
		for(const recipe of recipes){
			recipe.addEventListener('click', function(){
				const chi = this.children;
				const rId = chi[2].value;
				const rNo = chi[3].value;
				console.log("rId : " + rId); 
				console.log("rNo : " + rNo); 
				location.href="${contextPath}/recipeDetail.rc?rId=" + rId + "&rNo=" + rNo + "&page=" + ${pi.currentPage}; 
			})
		}
	}
	
	const groupBtn1s = document.getElementsByClassName("group-button1");
	for(groupBtn1 of groupBtn1s){
		const ingredient = groupBtn1.innerText;
		groupBtn1.addEventListener('click', function(){
			$.ajax({
				url:"recipeIngredient.rc",
				data: {"ingredient" : ingredient},
				success: data=>{
					console.log(data);
					const listBox = document.getElementById('listBox');
					listBox.innerHTML ="";
					
					data.forEach(post =>{
						
						console.log(post);
						
						const col = document.createElement('div');
						col.classList.add('col');
						
						const card = document.createElement('div');
						card.classList.add('card');
						card.classList.add('shadow-sm');
						card.onclick=function(){
							location.href="${contextPath}/recipeDetail.rc?rId="+post.usersId+"&rNo="+post.foodNo+"&page="+${pi.currentPage};
						}
						
						const cardImg = document.createElement('div');
						cardImg.classList.add('cardImg');
						
						const img = document.createElement('img');
						img.src="${ contextPath }/resources/uploadFiles/" + post.imageRenameName;
						img.classList.add('image');
						
						const cardBody = document.createElement('div');
						cardBody.classList.add('card-body');
						
						const h5 = document.createElement('h5');
						h5.innerText = post.recipeName;
						h5.classList.add('name-cut');
						
						const p = document.createElement('p');
						p.innerText = post.nickName;
						p.classList.add('card-text');
						
						const p2 = document.createElement('p');
						p2.innerText = post.categoryIngredient +' ∣ '+ post.categorySituation +' ∣ '+ post.categoryType;
						p2.classList.add('card-text');
						
						const uId = document.createElement('input');
						uId.setAttribute("type", "hidden");
						uId.value= post.usersId;

						const fNo = document.createElement('input');
						fNo.setAttribute("type", "hidden");
						fNo.value= post.foodNo;
						
						cardBody.appendChild(h5);
						cardBody.appendChild(p);
						cardBody.appendChild(p2);
						
						cardImg.appendChild(img);
						
						card.appendChild(cardImg);
						card.appendChild(cardBody);
						card.appendChild(uId);
						card.appendChild(fNo);
						
						col.appendChild(card);
						
						listBox.appendChild(col);
					});
				},
				error: data =>{
					console.log("실패");
				}
			})
		})
	}
	const groupBtn2s = document.getElementsByClassName("group-button2");
	for(groupBtn2 of groupBtn2s){
		const situation = groupBtn2.innerText;
		groupBtn2.addEventListener('click', function(){
			$.ajax({
				url:"recipeSituation.rc",
				data: {"situation" : situation},
				success: data=>{
					console.log(data);
					const listBox = document.getElementById('listBox');
					listBox.innerHTML ="";
					
					data.forEach(post =>{
						
						console.log(post);
						
						const col = document.createElement('div');
						col.classList.add('col');
						
						const card = document.createElement('div');
						card.classList.add('card');
						card.classList.add('shadow-sm');
						card.onclick=function(){
							location.href="${contextPath}/recipeDetail.rc?rId="+post.usersId+"&rNo="+post.foodNo+"&page="+${pi.currentPage};
						}
						
						const cardImg = document.createElement('div');
						cardImg.classList.add('cardImg');
						
						const img = document.createElement('img');
						img.src="${ contextPath }/resources/uploadFiles/" + post.imageRenameName;
						img.classList.add('image');
						
						const cardBody = document.createElement('div');
						cardBody.classList.add('card-body');
						
						const h5 = document.createElement('h5');
						h5.classList.add('name-cut');
						h5.innerText = post.recipeName;
						
						const p = document.createElement('p');
						p.innerText = post.nickName;
						p.classList.add('card-text');
						
						const p2 = document.createElement('p');
						p2.innerText = post.categoryIngredient +' ∣ '+ post.categorySituation +' ∣ '+ post.categoryType;
						p2.classList.add('card-text');
						
						const uId = document.createElement('input');
						uId.setAttribute("type", "hidden");
						uId.value= post.usersId;

						const fNo = document.createElement('input');
						fNo.setAttribute("type", "hidden");
						fNo.value= post.foodNo;
						
						cardBody.appendChild(h5);
						cardBody.appendChild(p);
						cardBody.appendChild(p2);
						
						cardImg.appendChild(img);
						
						card.appendChild(cardImg);
						card.appendChild(cardBody);
						card.appendChild(uId);
						card.appendChild(fNo);
						
						col.appendChild(card);
						
						listBox.appendChild(col);
					});
				},
				error: data =>{
					console.log("실패");
				}
			})
		})
	}
	const groupBtn3s = document.getElementsByClassName("group-button3");
	for(groupBtn3 of groupBtn3s){
		const type = groupBtn3.innerText;
		groupBtn3.addEventListener('click', function(){
			$.ajax({
				url:"recipeType.rc",
				data: {"type" : type},
				success: data=>{
					console.log(data);
					const listBox = document.getElementById('listBox');
					listBox.innerHTML ="";
					
					data.forEach(post =>{
						
						console.log(post);
						
						const col = document.createElement('div');
						col.classList.add('col');
						
						const card = document.createElement('div');
						card.classList.add('card');
						card.classList.add('shadow-sm');
						card.onclick=function(){
							location.href="${contextPath}/recipeDetail.rc?rId="+post.usersId+"&rNo="+post.foodNo+"&page="+${pi.currentPage};
						}
						
						const cardImg = document.createElement('div');
						cardImg.classList.add('cardImg');
						
						const img = document.createElement('img');
						img.src="${ contextPath }/resources/uploadFiles/" + post.imageRenameName;
						img.classList.add('image');
						
						const cardBody = document.createElement('div');
						cardBody.classList.add('card-body');
						
						const h5 = document.createElement('h5');
						h5.classList.add('name-cut');
						h5.innerText = post.recipeName;
						
						const p = document.createElement('p');
						p.innerText = post.nickName;
						p.classList.add('card-text');
						
						const p2 = document.createElement('p');
						p2.innerText = post.categoryIngredient +' ∣ '+ post.categorySituation +' ∣ '+ post.categoryType;
						p2.classList.add('card-text');
						
						const uId = document.createElement('input');
						uId.setAttribute("type", "hidden");
						uId.value= post.usersId;

						const fNo = document.createElement('input');
						fNo.setAttribute("type", "hidden");
						fNo.value= post.foodNo;
						
						cardBody.appendChild(h5);
						cardBody.appendChild(p);
						cardBody.appendChild(p2);
						
						cardImg.appendChild(img);
						
						card.appendChild(cardImg);
						card.appendChild(cardBody);
						card.appendChild(uId);
						card.appendChild(fNo);
						
						col.appendChild(card);
						
						listBox.appendChild(col);
					});
				},
				error: data =>{
					console.log("실패");
				}
			})
		})
	}
	
	
	const recent = document.getElementById('recent');
	const most = document.getElementById('most');
	function recentAl(){
// 		console.log(1);
		$.ajax({
			url:"recentRecipe.rc",
			success: data => {
				console.log(data);
				const listBox = document.getElementById('listBox');
				listBox.innerHTML ="";
				
				data.forEach(post =>{
					
					console.log(post);
					
					const col = document.createElement('div');
					col.classList.add('col');
					
					const card = document.createElement('div');
					card.classList.add('card');
					card.classList.add('shadow-sm');
					card.onclick=function(){
						location.href="${contextPath}/recipeDetail.rc?rId="+post.usersId+"&rNo="+post.foodNo+"&page="+${pi.currentPage};
					}
					
					const cardImg = document.createElement('div');
					cardImg.classList.add('cardImg');
					
					const img = document.createElement('img');
					img.src="${ contextPath }/resources/uploadFiles/" + post.imageRenameName;
					img.classList.add('image');
					
					const cardBody = document.createElement('div');
					cardBody.classList.add('card-body');
					
					const h5 = document.createElement('h5');
					h5.classList.add('name-cut');
					h5.innerText = post.recipeName;
					
					const p = document.createElement('p');
					p.innerText = post.nickName;
					p.classList.add('card-text');
					
					const p2 = document.createElement('p');
					p2.innerText = post.categoryIngredient +' ∣ '+ post.categorySituation +' ∣ '+ post.categoryType;
					p2.classList.add('card-text');
					
					const uId = document.createElement('input');
					uId.setAttribute("type", "hidden");
					uId.value= post.usersId;

					const fNo = document.createElement('input');
					fNo.setAttribute("type", "hidden");
					fNo.value= post.foodNo;
					
					cardBody.appendChild(h5);
					cardBody.appendChild(p);
					cardBody.appendChild(p2);
					
					cardImg.appendChild(img);
					
					card.appendChild(cardImg);
					card.appendChild(cardBody);
					card.appendChild(uId);
					card.appendChild(fNo);
					
					col.appendChild(card);
					
					listBox.appendChild(col);
				});
			},
			error: data =>{
				console.log("실패");
			}
		})
	}
	
	function mostAl(){
		console.log(2);
		$.ajax({
			url:"mostRecipe.rc",
			success: data => {
				console.log(data);
				const listBox = document.getElementById('listBox');
				listBox.innerHTML ="";
				
				data.forEach(post =>{
					
					console.log(post);
					
					const col = document.createElement('div');
					col.classList.add('col');
					
					const card = document.createElement('div');
					card.classList.add('card');
					card.classList.add('shadow-sm');
					card.onclick=function(){
						location.href="${contextPath}/recipeDetail.rc?rId="+post.usersId+"&rNo="+post.foodNo+"&page="+${pi.currentPage};
					}
					
					const cardImg = document.createElement('div');
					cardImg.classList.add('cardImg');
					
					const img = document.createElement('img');
					img.src="${ contextPath }/resources/uploadFiles/" + post.imageRenameName;
					img.classList.add('image');
					
					const cardBody = document.createElement('div');
					cardBody.classList.add('card-body');
					
					const h5 = document.createElement('h5');
					h5.classList.add('name-cut');
					h5.innerText = post.recipeName;
					
					const p = document.createElement('p');
					p.innerText = post.nickName;
					p.classList.add('card-text');
					
					const p2 = document.createElement('p');
					p2.innerText = post.categoryIngredient +' ∣ '+ post.categorySituation +' ∣ '+ post.categoryType;
					p2.classList.add('card-text');
					
					const uId = document.createElement('input');
					uId.setAttribute("type", "hidden");
					uId.value= post.usersId;

					const fNo = document.createElement('input');
					fNo.setAttribute("type", "hidden");
					fNo.value= post.foodNo;
					
					cardBody.appendChild(h5);
					cardBody.appendChild(p);
					cardBody.appendChild(p2);
					
					cardImg.appendChild(img);
					
					card.appendChild(cardImg);
					card.appendChild(cardBody);
					card.appendChild(uId);
					card.appendChild(fNo);
					
					col.appendChild(card);
					
					listBox.appendChild(col);
				});
			},
			error: data =>{
				console.log("실패");
			}
		})
	}
		
</script>

<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
</body>
</html>

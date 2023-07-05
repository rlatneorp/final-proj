<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
<style>

/* 	검색 창 부분 */
	#search{width: 1200px; height: 250px; border-top: 1px solid black; border-bottom: 1px solid black; background-color: #B0DAFF; margin: auto;}
	#searchBar{position: relative;}
	#inputText{border-radius: 8px; border: 1px solid black; box-shadow: 0px 5px 0px 0px black; width: 300px; height: 40px; margin-left: 450px; margin-right: 450px; margin-top: 40px;}
	#searchIcon{position: absolute; right: 455px; top: 46px;}
	#searchBtn{border-radius: 50%; width: 30px; height: 30px; border: none; background-color: #B0DAFF}
	
	#category{width: 550px; margin-left: 350px; margin-top: 30px;}
	.categoryIcon{width: 100px; height: 150px; text-align: center;}
	.circle{width: 50px; height: 50px; border-radius: 50%; background-color: white; margin-left: 25px;}
	.size{font-size: 32px; color: black; margin-top: 3px;}
	.categoryBtn:hover{cursor: pointer;}
	
	.title{font-weight: bold;}
	.group-button1, .group-button2, .group-button3{padding: 10px; background-color: #B0DAFF; border: none; cursor: pointer;}
	
/* 	이번주 인기 식단 */
	#weekend{width: 1200px; height: 470px; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black; background-color: #edf8FF;}
	#hotWeekend{width: 1200px; height: 35px; background-color: black; color: white; text-align: center; border-radius: 10px 10px 0 0; padding-top: 6px;}
	#weekendBox{width: 1200px; height: 100%; margin: 50px 50px;}
	
	.foodRank{
	    font-size: 25px;
	    border: none;
	    width: 60px;
	    height: 60px;
	    margin-top: 10px;
	    padding-top: 10px;
	    border-radius: 100px;
	    background-color: lightgray;
	    text-align: center;
	    font-weight: bold;
	}
	
	.wkalbum{position: relative;}
	.albumTitle{position: absolute; width: 300px; height: 40px; top: 310px; left: 30px; text-align: center; font-weight: bold; font-size: 22px;}
	.albumTitle2{position: absolute; width: 300px; height: 40px; top: 340px; left: 30px; text-align: center; font-size: 18px;}
	.weekendPic-div{overflow: hidden; width: 300px; height: 300px; margin: 0 30px;}
	.weekendPic{width: 100%; height: 100%; object-fit: cover; object-position: center;}
	.weekendPic:hover{ transform: scale(1.1);  object-fit: cover; object-position: center; transition: all 0.2s ease 0s;}
	
/* 	최신 식단 */
	#middle{width: 1250px; height: 50px; font-weight: bold; font-size: 20px; border-bottom: 1px solid black; margin: auto;}
	.cardColor{background-color: ; text-align: center;}
	.likeBtn{color: black;}
	
	.card{width: 260px;}
 	.cardImg{width: 260px; height: 260px; overflow: hidden; border-top-right-radius: 3px; border-top-left-radius: 3px;}
 	.image{width: 100%; height: 100%; object-fit: cover; object-position: center;}
	
	.h5-text-align{text-align: center; font-weight: bold;}
	.menuKind{font-size: 17px; margin-left:50px; margin-right: 30px; text-decoration: none; color: black;}
	
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
		margin-top: 0;
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
</style>

</head>
<body>

<%@ include file="../common/top.jsp" %>
<br><br>

<div id="search">
	<form role="search" action="menuList.mn">
		<div id="searchBar">
			<input type="text" id="inputText" name="input" placeholder=" 내용을 입력해 주세요.">
			<div id="searchIcon"><button id="searchBtn"><i class="bi bi-search"></i></button></div>
		</div>
	</form>
	<br>
	<div id="category">
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a id="diet" class="categoryBtn">
					<input type="hidden" value="1">
					<span class="material-symbols-outlined size">
<!-- 					fitness_center -->🥗
					</span>
				</a>
			</div>
			<b>다이어트</b>
		</div>
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a id="sick" class="categoryBtn">
					<input type="hidden" value="2">
					<span class="material-symbols-outlined size">
<!-- 					sick -->🤒
					</span>
				</a>
			</div>
			<b>몸보신</b>
		</div>
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a id="meal" class="categoryBtn">
					<input type="hidden" value="3">
					<span class="material-symbols-outlined size">
<!-- 					restaurant_menu -->💪
					</span>
				</a>
			</div>
			<b>든든밥상</b>
		</div>
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a id="egg" class="categoryBtn">
					<input type="hidden" value="4">
					<span class="material-symbols-outlined size">
<!-- 					egg_alt -->🥩
					</span>
				</a>
			</div>
			<b>고단백</b>
		</div>
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a id="vage" class="categoryBtn">
					<input type="hidden" value="5">
					<span class="material-symbols-outlined size">
<!-- 					spa -->🥬
					</span>
				</a>
			</div>
			<b>채식</b>
		</div>
	</div>
</div>

<br><br><br>

<div id="weekend">
	<div id="hotWeekend"><i class="bi bi-fire"></i> 홀로세끼의 인기 식단 <i class="bi bi-fire"></i></div>
	
	<div id="weekendBox">
		<c:forEach items="${ menuScore }" var="score" end="2" varStatus="status">
			<div class="d-inline-block wkalbum" style="cursor: pointer;">
				<input type="hidden" value="${score.PRODUCT_NO}">
				<c:if test="${ status.count == 1 }">
					<div class="position-absolute top-0 start-0" style="margin-top: -40px; z-index: 9999;">
						<div class="foodRank" style="background: rgb(255, 217, 102);">1위</div>
					</div>
				</c:if>
				<c:if test="${ status.count == 2 }">
					<div class="position-absolute top-0 start-0" style="margin-top: -40px; z-index: 9999;">
						<div class="foodRank" style="background: rgb(238, 238, 238);">2위</div>
					</div>
				</c:if>
				<c:if test="${ status.count == 3 }">
					<div class="position-absolute top-0 start-0" style="margin-top: -40px; z-index: 9999;">
						<div class="foodRank" style="background: rgb(215, 192, 174);">3위</div>
					</div>
				</c:if>
				<c:forEach items="${ iList }" var="i">
					<c:if test="${ i.imageDivideNo eq score.PRODUCT_NO }">
						<div class="weekendPic-div">
							<img src="${ contextPath }/resources/uploadFiles/${i.imageRenameName}" class="weekendPic">
						</div>
					</c:if>
					
				</c:forEach>
				<div class="albumTitle">${ score.MENU_NAME }</div>
				<div class="albumTitle2">
					<c:if test="${ score.MENU_KIND == 1 }">다이어트</c:if>
					<c:if test="${ score.MENU_KIND == 2 }">몸보신</c:if>
					<c:if test="${ score.MENU_KIND == 3 }">든든밥상</c:if>
					<c:if test="${ score.MENU_KIND == 4 }">고단백</c:if>
					<c:if test="${ score.MENU_KIND == 5 }">채식</c:if>
					<i class="bi bi-dot lightgray"></i>
					<c:forEach items="${ uList }" var="u">
						<c:if test="${ u.usersNo eq score.USERS_NO }">
							${ u.usersName }
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
		
<!-- 		<div class="d-inline-block wkalbum"> -->
<!-- 			<div class="position-absolute top-0 start-0" style="margin-top: -40px;" z-index: 9999;"> -->
<!-- 				<div class="foodRank" style="background: rgb(255, 217, 102);">1위</div> -->
<!-- 			</div> -->
<!-- 			<img src="#" width="300px" height="300px" class="weekendPic"> -->
<!-- 			<div class="albumTitle">고단백 / 영양사B</div> -->
<!-- 		</div> -->

	</div>
</div>

<br><br><br><br>

<div id="middle">최신 식단 목록</div>
<div class="album p-5 bg-white">
	<div class="container px-5" style="width: 1200px;">
	
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-4 g-2" id="menuBox">
			
			<c:forEach items="${mList}" var="m">
				<c:forEach items="${iList}" var="i">
					<c:if test="${m.foodProductNo eq i.imageDivideNo}">
						<div class="col">
							<div class="card shadow-sm">
								<div class="cardImg">
									<input type="hidden" id="foodProductNo" value="${m.foodProductNo}">
									<img src="${contextPath }/resources/uploadFiles/${i.imageRenameName}" class="image">
								</div>
								<div class="card-body cardColor">
									<h5 class="h5-text-align">${ m.menuName }</h5>
									<c:if test="${ m.menuKind == 1 }"><a class="menuKind">🥗 다이어트</a></c:if>
									<c:if test="${ m.menuKind == 2 }"><a class="menuKind">🤒 몸보신</a></c:if>
									<c:if test="${ m.menuKind == 3 }"><a class="menuKind">💪 든든밥상</a></c:if>
									<c:if test="${ m.menuKind == 4 }"><a class="menuKind">🥩 고단백</a></c:if>
									<c:if test="${ m.menuKind == 5 }"><a class="menuKind">🥬 채식</a></c:if>
									
									 <c:choose>
			                            <c:when test="${loginUser == null}">
			                                <span class="likeBtn" role="button">♡</span>
			                            </c:when>
			                            <c:otherwise>
			                                <c:set var="isLiked" value="false" />
			                                <c:forEach items="${loginUserLikeList}" var="lLike" varStatus="loop">
			                                    <c:if test="${lLike.divisionNo eq m.foodProductNo}">
			                                        <c:set var="isLiked" value="true" />
			                                    </c:if>
			                                    <c:if test="${loop.last}"> <!-- 마지막 반복인 경우에만 실행 -->
			                                        <c:set var="loopFinished" value="true" />
			                                    </c:if>
			                                </c:forEach>
			                                <c:choose>
			                                    <c:when test="${isLiked eq 'true'}">
			                                        <span class="likeBtn" role="button">♥</span>
			                                    </c:when>
			                                    <c:otherwise>
			                                        <span class="likeBtn" role="button">♡</span>
			                                    </c:otherwise>
			                                </c:choose>
			                            </c:otherwise>
			                        </c:choose>
			                        <c:forEach items="${menuScore}" var="score">
			                            <c:if test="${score.PRODUCT_NO eq m.foodProductNo}">
			                                <c:choose>
			                                    <c:when test="${empty lList}">
			                                        <p class="d-inline-block likeNum">0</p>
			                                    </c:when>
			                                    <c:otherwise>
			                                        <c:set var="found" value="false" />
			                                        <c:forEach items="${lList}" var="l">
			                                            <c:if test="${score.PRODUCT_NO eq l.PRODUCT_NO}">
			                                                <p class="d-inline-block likeNum">${l.COUNT}</p>
			                                                <c:set var="found" value="true" />
			                                            </c:if>
			                                        </c:forEach>
			                                        <c:if test="${found eq false}">
			                                            <p class="d-inline-block likeNum">0</p>
			                                        </c:if>
			                                    </c:otherwise>
			                                </c:choose>
			                            </c:if>
			                        </c:forEach>
			                    </div>
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
		
		<!-- 페이지 -->
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

<br>
<%@ include file="../common/footer.jsp" %>

<script>
	const search = document.getElementById('searchBtn');
	search.addEventListener('click', function(){
		const text = document.getElementById('inputText').value;
		location.href="${contextPath}/searchMenu.mn?word="+text;
	})

	const likeBtns = document.getElementsByClassName('likeBtn');
	const usersNo = '${loginUser.usersNo}';
	
	for(const likeBtn of likeBtns){
		likeBtn.addEventListener('click', function(){
// 			const hidden = likeBtn.firstElementChild;
			const productNo = this.parentElement.previousElementSibling.firstElementChild.value;
			const num = parseInt(this.nextElementSibling.innerText);
			if(likeBtn.innerText === '♡'){
				$.ajax({
					url: "insertLike.ma",
					data:{
		        		usersNo:usersNo,
		        		divisionNo:productNo
		        	},
		        	success: data=> {
		        		if(data == 'success') {
		        			likeBtn.innerHTML = '♥';
		        			this.nextElementSibling.innerText = num + 1;
		        		} else { //실패 시 
		        		}
		        	},
		        	error:data=>{
		        	}
		        })
			} else {
				$.ajax({
		    		url:"deleteLike.ma",
		    		data:{
		    			usersNo:usersNo,
		        		divisionNo:productNo
		    		},
		    		success: data => {
		    			console.log(data);
		    			if(data == 'success') {
		    				likeBtn.innerHTML = '♡';
		    				this.nextElementSibling.innerText = num - 1;
		        		} else { //실패 시 
		        		}
		    		},
		    		error: data=>{
		    		}
		    	})
			}
			
// 			const num = parseInt(this.nextElementSibling.innerText);
// 			if(this.querySelector('input').value == "off"){
// 				this.querySelector('input').value = "on";
// 				this.querySelector('i').classList.replace("bi-heart", "bi-heart-fill");
// 				this.nextElementSibling.innerText = num + 1;
// 			} else if(this.querySelector('input').value == "on"){
// 				this.querySelector('input').value = "off";
// 				this.querySelector('i').classList.replace("bi-heart-fill", "bi-heart");
// 				this.nextElementSibling.innerText = num - 1;
// 			}
		})
	}
// 	const cols = document.querySelectorAll('.col');
// 	for(const col of cols){
// 		col.addEventListener('click', function(){
// 			const mNo = this.childNodes[1].value;
// // 			location.href="${contextPath}/menuDetail.mn?mNo=" + mNo + "&page=" + ${pi.currentPage};
// // 			console.log(this.childNodes[1]);
// 		})
// 	}
	const images = document.querySelectorAll('.cardImg');
	
	for(const image of images){
		image.addEventListener('click', function(){
			console.log(112343);
			const mNo = this.childNodes[1].value;
			location.href="${contextPath}/menuDetail.mn?mNo=" + mNo + "&page=" + ${pi.currentPage};
// 			console.log(this.childNodes[1]);
		})
	}
	
	
	
	const hots = document.querySelectorAll('.wkalbum');
	for(const hot of hots){
		hot.addEventListener('click', function(){
		const mNo = this.childNodes[1].value;
		location.href="${contextPath}/menuDetail.mn?mNo=" + mNo + "&page=" + ${pi.currentPage};
		})
	}
	
	const categoryBtns = document.getElementsByClassName('categoryBtn');
	for(const categoryBtn of categoryBtns){
		const cate = categoryBtn.childNodes[1].value;
		categoryBtn.addEventListener('click', function(){
			$.ajax({
				url: "menuCategory.mn",
				data: {"cate": cate},
				success: data=>{
					console.log(data);
					const menuBox = document.getElementById('menuBox');
					menuBox.innerHTML = "";
					
					data.forEach(post =>{
						const col = document.createElement('div');
						col.classList.add('col');
						
// 						const fPNo = document.createElement('input');
// 						fPNo.setAttribute("type", "hidden");
// 						fPNo.value = post.foodProductNo;
						
						const card = document.createElement('div');
						card.classList.add('card');
						card.classList.add('shadow-sm');
						
						const cardImg = document.createElement('div');
						cardImg.classList.add('cardImg');
						
						const fPNo = document.createElement('input');
						fPNo.setAttribute("type", "hidden");
						fPNo.value = post.foodProductNo;
						
						const image = document.createElement('img');
						image.src = '${contextPath}/resources/uploadFiles/' + post.imageRenameName;
						image.classList.add('image');
						
						const cardBody = document.createElement('div');
						cardBody.classList.add('card-body');
						cardBody.classList.add('cardColor');						
						
						const h5 = document.createElement('h5');
						h5.innerText = post.menuName;
						
						const a2 = document.createElement('a');
						a2.classList.add('menuKind');
						
						let menuKindIcon = null;
						if(post.menuKind == 1){
							menuKindIcon = '🥗 다이어트';
						}  else if(post.menuKind == 2){
							menuKindIcon = '🤒 몸보신';
						}  else if(post.menuKind == 3){
							menuKindIcon = '💪 든든밥상';
						}  else if(post.menuKind == 4){
							menuKindIcon = '🥩 고단백';
						}  else if(post.menuKind == 5){
							menuKindIcon = '🥬 채식';
						}
						a2.innerText = menuKindIcon;
						
						const a = document.createElement('span');
						a.classList.add('likeBtn');
						a.setAttribute("role", "button");
// 						a.innerText = 
						
// 						const off = document.createElement("input");
// 						off.setAttribute("type", "hidden");
// 						off.value="off";
						
// 						const i = document.createElement('i');
// 						i.classList.add('bi');
// 						i.classList.add('bi-heart');
// 						i.classList.add('iconMar');
						
						const p = document.createElement('p');
						p.classList.add('d-inline-block');
						p.classList.add('likeNum');
						p.innerText = "1000";
						
// 						a.appendChild(off);
// 						a.appendChild(i);
						
						cardBody.appendChild(h5);
						cardBody.appendChild(a2);
						cardBody.appendChild(a);
						cardBody.appendChild(p);
						
						cardImg.appendChild(fPNo);
						cardImg.appendChild(image);
						
						card.appendChild(cardImg);
						card.appendChild(cardBody);
						
						col.appendChild(card);
						
						menuBox.appendChild(col);
					});
					
					const images = document.querySelectorAll('.cardImg');
					
					for(const image of images){
						image.addEventListener('click', function(){
							const mNo = this.childNodes[0].value;
							location.href="${contextPath}/menuDetail.mn?mNo=" + mNo + "&page=" + ${pi.currentPage};
						})
					}
				},
				error: data=>{
					console.log(data);
				}
			})
		})
	}
	
</script>

<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
</body>
</html>
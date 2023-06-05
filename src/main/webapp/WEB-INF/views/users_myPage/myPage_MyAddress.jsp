<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 배송지 관리</title>
<style>

.search {
	position: relative;
	width: 300px;
}

input, select {
	box-shadow:0px 5px 0px black;
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

select {
	-webkit-appearance: none;
	/* Safari, Chrome 등의 웹킷 기반 브라우저에서 기본 스타일링 제거 */
	-moz-appearance: none; /* Firefox에서 기본 스타일링 제거 */
	appearance: none; /* 일반적인 브라우저에서 기본 스타일링 제거 */
	padding-right: 30px; /* 화살표를 오른쪽으로 옮기기 위한 우측 패딩 설정 */
	background:
		url("https://img.icons8.com/fluency-systems-filled/48/sort-down.png")
		no-repeat right center; /* 화살표 이미지 설정 */
	background-size: 12px; /* 화살표 이미지의 크기 설정 */
/* 	border-bottom-right-radius: 0; */
/* 	border-top-right-radius: 0; */
	background-position: right 10px center;
}

#search {
	width: 300px;
}

#searchIcon {
	position: absolute;
	width: 20px;
	top: 12px;
	right: 12px;
	margin-left: 30px;
}

#searchElement{
	width:1200px;
	right:1200;
}
table {
   text-align: center;
   margin: 0 auto;
   width: 900px;
   border-top: 2px solid #444444;
   border-bottom: 2px solid #444444;
   border-collapse: collapse;
}

th, td {
   border-top: 1px solid #444444;
   border-left: 1px solid #444444;
   padding: 10px;
}

th:first-child, td:first-child {
   border-left: none;
}
.delete{
	box-shadow: none;
	width: 20px; height: 20px;
}
#trash{
	font-size: 30px;
}
#delete{ 
	font-size: 18px;
	margin-left: 802px;
}
#tbody tr {height: 70px;}
.edit{
	border: none; border-radius: 5px;
	font-weight: bold; font-size: 12px;
	width: 50px; height: 30px;
	background: #B0DAFF;
	box-shadow: none; padding: 0;
	text-align: center;
}
.btn-3d {
	text-decoration: none;
	width: 100px;
	height: 35px;
	position: relative;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
	padding: 5px;
	/*   padding: 20px 60px; */
	color: white;
	margin: 20px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
	cursor: pointer;
	margin-left: 450px;
}

.btn-3d.blue:hover {
	color: white;
	background-color: #699DD1;
}

.btn-3d:active {
	top: 9px;
}

.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 8px 0 0 rgba(110, 164, 219, .7), 0 8px 0 1px
		rgba(0, 0, 0, .4), 0 8px 8px 1px rgba(0, 0, 0, 0.5);
}

.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 0 0 1px rgba(0, 0, 0, 0.4);
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">배송지 관리</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<label id="delete">선택삭제</label><i class="bi bi-trash" id="trash"></i>
				<br>
				<div id="tableDiv">
					<table>
						<thead>
							<tr style="background-color: #B0DAFF; opacity: 90%">
								<th>배송지명</th>
								<th>수령인</th>
								<th>휴대전화</th>
								<th>주소</th>
								<th>수정</th>
								<th><input type="checkbox" class="delete" id="selectAllCheckBox"></th>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr>
								<td>집</td>
								<td>강건강</td>
								<td>010-1111-2222</td>
								<td>서울시 남대문로 머시기</td>
								<td><input type="button" value="수정" class="edit" onclick="location.href='${contextPath}/myPage_UpdateAddress.me'"></td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td>집</td>
								<td>강건강</td>
								<td>010-1111-2222</td>
								<td>서울시 남대문로 머시기</td>
								<td><input type="button" value="수정" class="edit"></td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td>집</td>
								<td>강건강</td>
								<td>010-1111-2222</td>
								<td>서울시 남대문로 머시기</td>
								<td><input type="button" value="수정" class="edit"></td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td>집</td>
								<td>강건강</td>
								<td>010-1111-2222</td>
								<td>서울시 남대문로 머시기</td>
								<td><input type="button" value="수정" class="edit"></td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td>집</td>
								<td>강건강</td>
								<td>010-1111-2222</td>
								<td>서울시 남대문로 머시기</td>
								<td><input type="button" value="수정" class="edit"></td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
							<tr>
								<td>집</td>
								<td>강건강</td>
								<td>010-1111-2222</td>
								<td>서울시 남대문로 머시기</td>
								<td><input type="button" value="수정" class="edit"></td>
								<td><input type="checkbox" class="delete"></td>
							</tr>
						</tbody>
					</table>
					<br>
					<a class="btn-3d blue" href="${ contextPath }/myPage_InsertAddress.me">추가하기</a>
				</div>
				<br><br>
			</div>
		</div>
	</div>
	
	<script>
	   //테이블에 마우스 올렸을 때 css
	   const tbody = document.getElementById('tbody');
	   const trs = tbody.children;
	   
	   for(tr of trs) {
	       tr.addEventListener('mouseenter', function() {
	             this.style.backgroundColor = 'rgba(176, 218, 255, 0.3)'; // 마우스를 올렸을 때의 스타일
	           });
	
	        tr.addEventListener('mouseleave', function() {
	          this.style.backgroundColor = ''; // 마우스를 뗐을 때의 스타일 (기존 스타일로 복구)
	        }); 
	   }
	   
	   //검색 img 클릭했을 때
	   const searchInput = document.getElementById('search');
	   document.getElementById('searchIcon').addEventListener('click', function() {
	      //여기에 ajax
	      searchInput.value = '';
	      
	   })
	   
	   //검색어 입력 엔터 기능 
	   
	
	   searchInput.addEventListener('keyup', function(event) {
	     if (event.key === 'Enter') {
	       const searchText = searchInput.value
	       //여기에 ajax로 searchText 넘기기 
	       
	       console.log('검색어:', searchText);
	       searchInput.value = '';
	     }
	   });
	   
	 //전체 선택 체크 
		const selAllChec = document.getElementById('selectAllCheckBox');
		selAllChec.addEventListener('change', function() { //속성이 변할 때마다 이벤트 발생 
			const checkboxes = document.querySelectorAll('input[type="checkbox"]');
			checkboxes.forEach(function(checkbox) { //모든 checkbox를 순회 
			      checkbox.checked = selAllChec.checked; //selAllChec의 체크 속성을 대입 (항상 같이 움직이게)
			    });
			
		})
	</script>
	
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
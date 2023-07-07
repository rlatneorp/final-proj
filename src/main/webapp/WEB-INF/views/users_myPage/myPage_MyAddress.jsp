<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 배송지 관리</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>

#dropdownMenu2{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

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
#selectAllCheckBox{
	box-shadow: none;
	width: 20px; height: 20px;
}
#trash{
	font-size: 30px;
}
#trash:hover{cursor: pointer;}
#delete{ 
	font-size: 18px;
	margin-left: 806px;
}
#tbody tr {height: 70px;}
.edit{
	border-radius: 5px;
	font-weight: bold; font-size: 14px;
	width: 55px; height: 35px;
	background: #F3F3F3;
	box-shadow: none; padding: 0;
	text-align: center;
	border: 1px #DADADA solid;
    outline: none;
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
								<th><input type="checkbox" id="selectAllCheckBox"></th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:if test="${ empty list }">
								<tr>
									<td colspan="6" height="330">
										<i class="fa-regular fa-face-grin-beam-sweat" style="color: skyblue; font-size: 80px;"></i><br><br>
										등록한 배송지가 없습니다.
									</td>
								</tr>
							</c:if>
							<c:forEach items="${ list }" var="s">
								<tr data-shippingNo-no="${ s.shippingNo }">
									<td>${ s.shippingName }</td>
									<td>${ s.recipient }</td>
									<td>${ s.phone }</td>
									<td>${ fn:replace(fn:replace(s.address, '[', ''), ']', '') }</td>
									<td><input type="button" value="수정" class="edit" onclick="location.href='${contextPath}/myPage_editAddress.me?shippingNo=' + ${ s.shippingNo }"></td>
									<td><input type="checkbox" class="delete"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<a class="btn-3d blue" id="add">추가하기</a>
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
	   
	 	//전체 체크박스
		let allCheck = document.getElementsByClassName('delete');
		//체크 된 체크박스 
		let checked = document.querySelectorAll('input.delete:checked');
		//select all 체크박스 
		let selectAll = document.getElementById('selectAllCheckBox');
		
		//전체 선택 해제 및 적용
		changeCheckBox = (checkbox) => {
			if(allCheck.length === checked.length) {
				selectAll.checked = true;
			} else if(selectAll.checked) {
				selectAll.checked = false;
			}
		}
		
		// 전체 선택 클릭시 전체 선택
		const selAllChec = document.getElementById('selectAllCheckBox');
		
		selAllChec.addEventListener('change', function() { //속성이 변할 때마다 이벤트 발생 
			const checkboxes = document.querySelectorAll('input[type="checkbox"]');
			checkboxes.forEach(function(checkbox) { //모든 checkbox를 순회 
			      checkbox.checked = selAllChec.checked; //selAllChec의 체크 속성을 대입 (항상 같이 움직이게)
			});
		});
		
		// 쓰레기통 클릭했을 때 해당 정보 지우기 - ajax
		const trash = document.getElementById('trash');
		
		trash.addEventListener('click', () => {
			let checked = document.querySelectorAll('input.delete:checked');
			const selectedShippingNos = [];
			let bookmarkNo = 0;
			checked.forEach((checkbox) => {
				shippingNo = checkbox.closest('tr').getAttribute('data-shippingNo-no');
				selectedShippingNos.push(shippingNo);
			});
			swal({
			    text: '정말 삭제하시겠습니까?',
			    icon: 'warning',
			    buttons: ["취소", "삭제하기"]
			}).then((YES) => {
			    if (YES) {
			      	$.ajax({
						url : '${contextPath}/myPage_deleteAddress.me',
						data : {shippingNo : JSON.stringify(selectedShippingNos)},
						success : data => {
							console.log(data);
							if(data == 'yes'){
								location.reload();
							} else {
								swal('', '삭제를 실패하였습니다.', 'error');
							}
						},
						error : data => {
							console.log(data);
						}
					});
			    }
			});
		});
		
		// 배송지 추가 창 열기 버튼 클릭 이벤트 처리
		const addBtn = document.getElementById('add');
		
		addBtn.addEventListener("click", function() {
			if(document.getElementById('tbody').children.length >= 5) {
				  swal({
						 text: "배송지는 최대 5개만 등록 가능합니다.",
						 icon: "error",
						 button: "확인",
						});
				  return;
			  } else {
				  location.href = '${ contextPath }/myPage_InsertAddress.me';
			  }
		});
	</script>
	
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
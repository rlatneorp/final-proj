<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
*{
font-family: 'Noto Sans KR', sans-serif;
}
.Qtitle .ddd{
	display: inline-block;
    height: 40px;
    padding: 0 7px;
    border: 1px solid #dddddd;
    color: #999999;
}

.customerQ #floatingInput{
	width: 900px;
	height: 85px;
}

.customerQ #floatingText{
	width: 900px;
	height: 500px;
}
.customerQ .form-floating{
	width: 900px;
}
.qaaCategoryBtn:active{
	background-color: #B0DAFF;
	color:black;
}



#add{
	width: 200px;
	height: 50px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	font-size: 20px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 7px; 
	margin-top: 30px;
}
</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>
<br><br>
	<div class="container-xxl" align="center">
		<h1 style="text-align: left; margin-left: 100px;">1:1 문의하기</h1>
		<br>
		<hr>
		<br>
		<form action="${contextPath }/personalQuestion.cs" method="POST"> 
		<div>
			<h2>문의 작성</h2>
			<p>카테고리를 지정해주세요</p>
			<br><br>
			<div class="customerQ">
				<div class="Qtitle row justify-content-evenly">
					<div class="col-1" >
						<select name="qnaCategory" class="ddd qaaCategoryBtn text-center" id="categoryBtn" required>
							<option>카테고리</option>
							<option value="user" <c:if test="${ category == 'user'}">selected</c:if>>회원</option>
							<option <c:if test="${ category == 'delivery'}">selected</c:if> value="delivery">배송</option>
							<option <c:if test="${ category == 'pay'}">selected</c:if> value="pay">결제</option>
							<option <c:if test="${ category == 'etc'}">selected</c:if> value="etc">기타</option>
						</select>
					</div>
				</div>
				<br><br>
				<div class="form-floating mb-3">
				  <input required type="text" class="form-control" id="floatingInput" placeholder="문의사항의 제목을 적어주세요.">
				  <label for="floatingInput">제목</label>
				</div>
				<div class="form-floating">
				  <input name="qnaContent" required type="text" class="form-control" id="floatingText" placeholder="문의사항을 적어주세요.">
				  <label for="floatingText">내용</label>
				</div>
				<br>
			</div>
			<div>
				<button type="submit" id="add">작성완료</button>
			</div>
		</div>
	</form>
	</div>
	<br><br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>
<script>
window.onload=()=>{
	const floatingInput = document.querySelector('#floatingInput');
	const categoryBtn = document.querySelector('#categoryBtn');
	const options = document.getElementsByTagName('option');
	let category = '';
	let titlePlusCategory = '';
	let qnaTitle = '';
	
		$.ajax({
			for(let j = 1; j < options.length; j++){
				categoryBtn.addEventListener('change', ()=>{
					if(options[j].value == categoryBtn.value){
						category = options[j].innerText;
						qnaTitle = floatingInput.value;
						titlePlusCategory =  qnaTitle + '[' + category + '] ';
						
					}
				})	
			type: 'post',
			url:'${contextPath}/personalQuestion.cs',
			data: {
				qnaTitle: titlePlusCategory
			},
			success: function(data){
				console.log(data);
				floatingInput.focus();
			}
		})
	};
	
}
</script>
</body>
</html>
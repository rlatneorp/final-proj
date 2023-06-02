<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.follow{
		font-size: 20px; font-weight: bold;
		margin-left: 100px;
	}
	.followDiv{display: flex; justify-content: center;}
	table{margin-left: 10px; margin-right: 10px; text-align: center;}
	table img{
		width: 100%;
	}
	.slideBtn{
		font-size: 45px; background: none;
		border: none; color: gray; 
	}
	.hidden{
		display: none;
	}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
			<%@ include file="../common/memberSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">마이페이지</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br>
				<label class="profile">팔로잉 / 팔로워 관리</label><br><br><br>
				<label class="follow">팔로잉</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>내가 팔로우한 사람들을 볼 수 있습니다.</label><br><br>
				<div class="followDiv">
					<button class="slideBtn prevBtn"><i class="bi bi-arrow-left-circle"></i></button>
					<table>
						<tr>
							<td>
								<img src="resources/images/persons.png"/>
							</td>
							<td>
								<img src="resources/images/persons.png"/><br>
							</td>
							<td>
								<img src="resources/images/persons.png"/><br>
							</td>
							<td>
								<img src="resources/images/persons.png"/><br>
							</td>
							<td>
								<img src="resources/images/persons.png"/><br>
							</td>
							<td>
								<img src="resources/images/persons.png"/><br>
							</td>
						</tr>
						<tr class="fName">
							<td>강건강</td>
							<td>박보배</td>
							<td>문미미</td>
							<td>도대담</td>
							<td>류라라</td>
							<td>남나눔</td>
						</tr>
						<tr class="fName hidden">
							<td>김긴자</td>
							<td>이롱롱</td>
							<td>조종자</td>
							<td>홍홍홍</td>
							<td>테스트</td>
							<td>예시</td>
						</tr>
					</table>
					<button class="slideBtn nextBtn"><i class="bi bi-arrow-right-circle"></i></button>
				</div>
			</div>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const prevBtn = document.querySelector('.prevBtn');
			const nextBtn = document.querySelector('.nextBtn');
			const tableRows = document.querySelectorAll('.followDiv table tr.fName');

			let currentIndex = 0;
			let nextIndex = 1;

			nextBtn.addEventListener('click', function() {
				tableRows[currentIndex].classList.add('hidden');
				tableRows[nextIndex].classList.remove('hidden');

				currentIndex = nextIndex;
				nextIndex = (nextIndex + 1) % tableRows.length;
			});

			prevBtn.addEventListener('click', function() {
				tableRows[currentIndex].classList.add('hidden');
				nextIndex = currentIndex;
				currentIndex = (currentIndex === 0) ? tableRows.length - 1 : currentIndex - 1;
				tableRows[currentIndex].classList.remove('hidden');
			});
		});
	</script>
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>

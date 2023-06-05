<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 회원정보 수정</title>
<style>
	#btn{
		width: 85px; height: 40px;
		border: 2px solid black;
		border-radius: 20px;
		box-shadow: 0px 5px black;
		margin-left: 425px;
		font-weight: bold;
		background: white;
	}
	#btn:active{
		box-shadow: 0px 1px 0px black; transform: translateY(5px);
		background: #B0DAFF;
	}
	table {
	   text-align: left;
	   margin: 0 auto;
	   width: 940px;
	   border-top: 2px solid #444444;
	   border-bottom: 2px solid #444444;
	   border-collapse: collapse;
	}
	
	td {
	   border-top: 1px solid #444444;
	   border-left: 1px solid #444444;
	   padding: 10px;
	}
	.orderInfo{font-size: 17px; font-weight: bold;}
	.detail{
		width: 200px; background: #B0DAFF;
	}
	table tr{height: 70px; border-bottom: 1px solid lightgray;}
	input[type="text"] {height: 35px;}
	input[type="button"] {
		background: lightgray; border: none;
		border-radius: 5px; font-weight: bold;
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
				<label class="profile">회원정보 수정</label><br><br><br>
				<table>
					<tr>
						<td class="detail">아이디</td>
						<td><input type="text" style="width: 300px; margin-left: 15px" name="payName"></td>
					</tr>
					<tr>
						<td class="detail">현재 비밀번호</td>
						<td>
							<input type="text" style="width: 300px; margin-left: 15px" name="payName" placeholder="현재 비밀번호를 입력해주세요">
						</td>
					</tr>
					<tr>
						<td class="detail">새 비밀번호</td>
						<td>
							<input type="text" style="width: 300px; margin-left: 15px;" placeholder="새로운 비밀번호를 입력해주세요">
						</td>
					</tr>
					<tr>
						<td class="detail">새 비밀번호 확인</td>
						<td><input type="text" style="width: 300px; margin-left: 15px;" placeholder="한번 더 입력해주세요"></td>
					</tr>
					<tr>
						<td class="detail">이름</td>
						<td><input type="text" style="width: 300px; margin-left: 15px" name="payName"></td>
					</tr>
					<tr>
						<td class="detail">이메일</td>
						<td style="vertical-align: middle;">
							<div style="display: flex; align-items: center;">
								<input type="email" style="width: 190px; margin-left: 15px; margin-right: 10px; height: 35px;" name="payName" placeholder="이메일을 입력해주세요">
								<input type="button" style="width: 100px; height: 35px;" value="중복확인">
							</div>
						</td>
					</tr>
					<tr>
						<td class="detail">휴대전화</td>
						<td>
							<div style="display: flex; align-items: center;">
								<input type="text" style="width: 190px; margin-left: 15px; margin-right: 10px; height: 35px;" name="payName" placeholder="번호를 입력해주세요">
								<input type="button" style="width: 100px; height: 35px;" value="중복확인">
							</div>
						</td>
					</tr>
					<tr>
						<td class="detail">생년월일</td>
						<td><input type="date" style="width: 300px; margin-left: 15px;" name="payName"></td>
					</tr>
				</table>
				<br><br>
				<button id="btn">수정하기</button>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
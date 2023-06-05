<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 포인트 관리</title>
<style>
	#point{
		width: 940px; height: 200px;
		text-align: center;
		display: flex; justify-content: center; align-items: center;
	}
	#pointTable1{width: 500px;}
	#pointTable1 tr{height: 70px;}
	#pointTable2 {
	   text-align: center;
	   margin: 0 auto;
	   width: 900px;
	   border-top: 2px solid #444444;
	   border-bottom: 2px solid #444444;
	   border-collapse: collapse;
	}
	
	#pointTable2 th, td {
	   border-top: 1px solid #444444;
	   padding: 10px;
	}
	
	#pointTable2 th:first-child, td:first-child {
	   border-left: none;
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
				<p id="pmyPage">포인트 관리</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<div id="point">
					<table id="pointTable1">
						<tr>
							<th colspan="2" style="font-size: 25px;"><label style="margin-right: 30px;">현재 포인트</label></th>
							<th rowspan="2" style="border: 1px solid gray; background: lightgray;"></th>
							<th style="font-size: 25px;">소멸 예정 포인트</th>
						</tr>
						<tr>
							<td><i class="bi bi-currency-dollar dollars" style="text-align: right;"></i></td>
							<td style="font-size: 18px; color: rgb(52, 152, 219); text-align: left;"><b>1000 포인트</b></td>
							<td style="font-size: 18px;">0 포인트</td>
						</tr>
					</table>
				</div>
				<br>
				<table id="pointTable2">
					<tr style="background-color: #B0DAFF; opacity: 90%">
						<th>날짜</th>
						<th>내용</th>
						<th>유효기간</th>
						<th>금액</th>
					</tr>
					<tr>
						<td>2023-06-05</td>
						<td>출석체크 포인트 소멸</td>
						<td></td>
						<td>-10</td>
					</tr>
					<tr>
						<td>2023-06-05</td>
						<td>구매시 사용한 적립금</td>
						<td></td>
						<td>-930</td>
					</tr>
					<tr>
						<td>2023-06-05</td>
						<td>출석체크 포인트 소멸</td>
						<td></td>
						<td>-330</td>
					</tr>
					<tr>
						<td>2023-06-05</td>
						<td>출석체크 포인트 적립</td>
						<td>2023-09-01</td>
						<td>+10</td>
					</tr>
					<tr>
						<td>2023-06-05</td>
						<td>회원가입 축하 적립금</td>
						<td>무제한</td>
						<td>+1000</td>
					</tr>
				</table>
				<br><br>
				<div>
					<nav aria-label="Standard pagination example" style="float: center; margin-left: 420px;">
						<ul class="pagination">
							<li class="page-item">
								<c:url var="goBack" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
								</c:url>
								<a class="page-link" href="${ goBack }" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var="goNum" value="${ loc }">
									<c:param name="page" value="${ p }"></c:param>
								</c:url>
								<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
							</c:forEach>
							<li class="page-item">
								<c:url var="goNext" value="${ loc }">
									<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
								</c:url>
								<a class="page-link" href="${ goNext }" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 주문 상세조회</title>
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
	.detail{
		width: 200px; background: #B0DAFF;
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
	table tr img {width: 100%;}
	.order{width: 200px;}
	#delivery{
		border: none;; height: 100px;
		background: rgba(224, 224, 224, 0.74);
	}
	tr{height: 70px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br><br><br><br><br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/memberSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">주문 상세조회</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<div>
					<p class="orderInfo">주문정보</p>
					<table>
						<tr>
							<td class="detail">주문번호</td>
							<td>20230604-00000094</td>
						</tr>
						<tr>
							<td class="detail">주문날짜</td>
							<td>2023-06-04 21:23:55</td>
						</tr>
						<tr>
							<td class="detail">주문자</td>
							<td>강건강</td>
						</tr>
						<tr>
							<td class="detail">주문상태</td>
							<td>결제확인중</td>
						</tr>
					</table>
					<br><br>
					<p class="orderInfo">결제정보</p>
					<table>
						<tr>
							<td class="detail">총 결제금액</td>
							<td>₩25,000</td>
						</tr>
						<tr>
							<td class="detail">결제수단</td>
							<td>카드 결제</td>
						</tr>
					</table>
					<br><br>
					<label class="orderInfo">주문 상품 정보</label>&nbsp;<label>(총 1개 / ₩25,000)</label>
					<br><br>
					<table>
						<tr style="border-bottom: 1px solid lightgray;">
							<td class="order"><img src="resources/images/food3.jpg"/></td>
							<td>
								다이어트 식단<br>
								₩25,000 (1개)<br><br>
								[옵션: 1주일]
							</td>
						</tr>
						<tr>
							<td class="order">결제수단</td>
							<td>카드 결제</td>
						</tr>
					</table>
					<div id="delivery">
						<p style="margin-left: 20px;">
							<br>
							상품구매금액 25,000 + 배송비 0<br>합계 : <b>₩25,000</b>
						</p>
					</div>
					<br><br>
					<p class="orderInfo">배송지 정보</p>
					<table>
						<tr>
							<td class="detail">받으시는분</td>
							<td>강건강</td>
						</tr>
						<tr>
							<td class="detail">우편번호</td>
							<td>12544</td>
						</tr>
						<tr>
							<td class="detail">주소</td>
							<td>서울시 남대문로 머시기</td>
						</tr>
						<tr>
							<td class="detail">일반전화</td>
							<td></td>
						</tr>
						<tr>
							<td class="detail">휴대전화</td>
							<td>010-7841-4511</td>
						</tr>
						<tr>
							<td class="detail">배송 요청 사항</td>
							<td></td>
						</tr>
					</table>
				</div>
				<br><br>
				<button id="btn" onclick="javascript:history.back()">목록</button>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
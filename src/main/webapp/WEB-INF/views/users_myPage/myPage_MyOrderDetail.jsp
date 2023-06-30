<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">주문 상세조회</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<div>
					<p class="orderInfo">주문정보</p>
					<table>
						<tr>
							<td class="detail">주문번호</td>
							<td>${orders.orderNo}</td>
						</tr>
						<tr>
							<td class="detail">주문날짜</td>
							<td>${orders.orderDate }</td>
						</tr>
						<tr>
							<td class="detail">주문자</td>
							<td>${loginUser.usersName }</td>
						</tr>
					</table>
					<br><br>
					<p class="orderInfo">결제정보</p>
					<table>
						<tr>
							<td class="detail">배송비</td>
							<td>${orders.shipPrice }원</td>
						</tr>
						<tr>
							<td class="detail">원 금액</td>
							<td id="originPrice">
								<input type="hidden" id="price" value="${fn:split(orders.orderInfo, ',')[0]}">
							</td>
						</tr>
						<tr>
							<td class="detail">할인</td>
							<td id="sale">
								<input type="hidden" id="sal" value="${fn:split(orders.orderInfo, ',')[1]}">
							</td>
						</tr>
						<tr>
							<td class="detail">총 결제금액</td>
							<td><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${orders.totalPrice }"/>원</b></td>
						</tr>
					</table>
					<br><br>
					<label class="orderInfo">주문 상품 정보</label>&nbsp;<label>(총 ${orders.orderCount }개 / <fmt:formatNumber type="number" maxFractionDigits="3" pattern="'\ '#,###" value="${orders.totalPrice }"/>)</label>
					<br><br>
					<table>
						<tr style="border-bottom: 1px solid black;">
							<td class="order"><img src="${contextPath }/resources/uploadFiles/${orders.imgName}"/></td>
							<td>
								${orders.productName }<br>
								<fmt:formatNumber type="number" maxFractionDigits="3" pattern="'\ '#,###" value="${orders.totalPrice }"/> (${orders.orderCount }개)<br><br>
								[옵션]<br>
								<c:if test="${fn:contains(orders.options, ',')}">
									<c:forEach var="option" items="${fn:split(orders.options, ',')}">
		    							${option}<br>
		  							</c:forEach>
	  							</c:if>
	  							<c:if test="${not fn:contains(orders.options, ',')}">
								    ${orders.options}<br>
								</c:if>
							</td>
						</tr>
					</table>
<!-- 					<div id="delivery"> -->
<!-- 						<p style="margin-left: 20px;"> -->
<!-- 							<br> -->
<!-- 							상품구매금액 25,000 + 배송비 0<br>합계 : <b>₩25,000</b> -->
<!-- 						</p> -->
<!-- 					</div> -->
					<br><br>
					<p class="orderInfo">배송지 정보</p>
					<table>
						<tr>
							<td class="detail">
								받으시는분
								<input type="hidden" id="addresses" value="${orders.orderAddress }">
							</td>
							<td id="recipient"></td>
							
						</tr>
						<tr>
							<td class="detail">우편번호</td>
							<td id="postCode"></td>
						</tr>
						<tr>
							<td class="detail">주소</td>
							<td id="address"></td>
						</tr>
						<tr>
							<td class="detail">상세주소</td>
							<td id="detailAddress"></td>
						</tr>
						<tr>
							<td class="detail">전화번호</td>
							<td id="phone"></td>
						</tr>
						<tr>
							<td class="detail">배송 요청 사항</td>
							<td id="detailAsk">${orders.orderDeliveryComment }</td>
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
	
	<script>
		window.onload = () => {
			
			//결제 정보 - 원금액/할인
			const originPrice = document.getElementById('originPrice');
			const sale = document.getElementById('sale');
			const price = parseInt(document.getElementById('price').value.split(':')[1]).toLocaleString();
			const sal = document.getElementById('sal').value.split(':')[1];
			
			originPrice.innerText = price + '원';
			sale.innerText = sal;
			
			//배송지 정보 
			const recipient = document.getElementById('addresses').value.split(',')[0];
			const phone = document.getElementById('addresses').value.split(',')[1];
			const post = document.getElementById('addresses').value.split(',')[2];
			const address = document.getElementById('addresses').value.split(',')[3];
			const detail = document.getElementById('addresses').value.split(',')[4];
			
			document.getElementById('recipient').innerText = recipient;
			document.getElementById('postCode').innerText = post;
			document.getElementById('address').innerText = address;
			document.getElementById('phone').innerText = phone;
			document.getElementById('detailAddress').innerText = detail;
			
			console.log(addresses);
			addresses.split
		}
	</script>
</body>
</html>
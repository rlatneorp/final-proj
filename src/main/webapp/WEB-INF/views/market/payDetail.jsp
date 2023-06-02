<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

.carrier {
	/* 		border:2px solid #dee2e6; */
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

/* 테이블 관련 */
table {
	position: relative;
	text-align: center;
	border: 2px solid #dee2e6;
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

tr {
	border: 2px solid #dee2e6;
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

/* 상단 바 위 텍스트 요소 */
.barSpan {
	font-weight: bold;
	font-size: 17px;
	left: 630px;
	position: relative
}


hr {
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}


/* checkbox */
.check {
	width: 16px;
	height: 16px;
	border: 2px solid #000;
	border-radius: 4px;
	outline: none;
	cursor: pointer;
	justify-content: center;
}

.vertical-line {
	width: 1px;
	background-color: black;
	height: 100%;
	margin-left: 20%; /* 필요에 따라 간격 조정 */
}

.tableBorder1 {
	border-right: 2px solid #dee2e6;
	border-bottom: 2px solid #dee2e6
}

.imgTab {
	height: 300px;
}

.aHover {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 상위 요소의 색상 상속 */
}

.aHover:hover {
	color: #0055FF;
}

.chBox {
	width: 20px;
	height: 20px;
}

input[type="radio"] {
	transform: scale(1.5); /* 원하는 크기로 스케일 조정 */
}

input[type="text"] {
	height: 35px;
}

/* 상단 바 */
#allChec{
	height: 50px; margin: 0 auto; width: 1200px; background-color: #B0DAFF; 
	border-bottom: 2px solid #dee2e6; border-left: none; border-right: none; border-top: 2px solid #dee2e6; 
	display: flex; align-items: center
}

/* 주소 */
.address {
	width: 150px;
	height: 60px;
	border: 2px solid #dee2e6;
	background-color: #B0DAFF;
	border-right: none;
	text-align: left;
	padding: 20px;
}

/* 결제 div */
.payElement{
	padding-top: 40px; text-align: center; margin: 0 10px; border: 2px solid black; 
	width: 250px; height: 150px; border-radius: 2em
}

.payElement:hover{
	cursor:pointer;
}
</style>
</head>
<body>



	<%@include file="../common/top.jsp"%><br><br><br><br><br><br>
	

	<!-- 장바구니 상단 표 부분 -->
	<div class="carrier" style="margin-bottom: 10px;">
		<span style="font-size: 30px;"><b>주문상세내역</b></span> 
		<span class="barSpan">
			<a class="aHover" id="basketHover" style="color:lightgray; cursor:pointer" onclick="location.href='${contextPath}/basket.ma'">01 ㅈㅂㄱㄴ > </a>
			<a class="aHover" style="color: #0055FF">02 주문서작성/결제</a> 
			<a class="aHover" id="paySuccess" style="color:lightgray"> > 03 ㅈㅁㅇㄹ</a>
		</span>
	</div>
	<div id="allChec"></div><br><br>


	<!-- 장바구니 테이블 -->
	<table>
		<tr style="border: 2px solid #dee2e6; background-color: #B0DAFF;">
			<th class="tableBorder1" colspan="2" style="height: 40px"><b>상품/옵션정보</b></th>
			<th class="tableBorder1"><b>수량</b></th>
			<th class="tableBorder1"><b>상품가격</b></th>
			<th class="tableBorder1"><b>적립/할인</b></th>
			<th class="tableBorder1"><b>합계금액</b></th>
			<th style="border-bottom: 2px solid #dee2e6">배송비</th>
		</tr>
		<tbody>
			<tr style="border-top: 2px solid #dee2e6;">
				<td class="imgTab">
					<img src="" style="border: 1px solid black; width: 200px; height: 200px;">
				</td>
				<td style="border-right: 2px solid #dee2e6; text-align: left">접이식밥상<br><br>옵션 : 
				<select>
						<option>Brown</option>
						<option>Pink</option>
						<option>Yellow</option>
						<option>Black</option>
				</select>
				</td>
				<td style="border-right: 2px solid #dee2e6; width:130px">
					<i class="bi bi-dash-square-fill" id="minus" style="color: #00AAFF; font-size: 15px;"></i>&nbsp;
					<span id="size">1</span>개&nbsp;
					<i class="bi bi-plus-square-fill" id="plus" style="color: #00AAFF; font-size: 15px"></i>
				</td>
				<td style="border-right: 2px solid #dee2e6;"><span id="price">46,500</span>원</td>
				<td style="border-right: 2px solid #dee2e6;"><span>2,325</span>P적립</td>
				<td style="border-right: 2px solid #dee2e6; width:160px"><span id="sum">46,500</span>원</td>
				<td>무료배송</td>
			</tr>

		</tbody>
	</table>
	<br>
	<br>
	<div style="width: 1200px; margin: 0 auto; font-align: right">
		<i class="bi bi-caret-left-fill"></i><i class="bi bi-caret-left-fill"></i><i
			class="bi bi-caret-left-fill"><b>쇼핑 계속하기</b></i>
	</div>
	<br>


	<table>
		<tbody>
			<tr style="height: 130px; font-size: 20px;">
				<td style="width: 800px; text-align: right"><b>총 1개의 상품 금액<br>
					<br>
					<span style="color: #00AAFF">46,500</span>원
				</b></td>
				<td>&nbsp;&nbsp;&nbsp;<i class="bi bi-plus-circle-fill"
					style="color: #00AAFF; font-size: 30px"></i></td>
				<td style=""><b>배송비<br>
					<br>
					<span style="color: #00AAFF">0</span>원
				</b></td>
				<td><span class="material-symbols-outlined"
					style="color: #00AAFF">equal</span></td>
				<td style=""><b>합계<br>
					<br>
					<span style="color: #00AAFF">46,500</span>원
				</b></td>
			</tr>
		</tbody>
	</table>
	<br>

	<!-- 배송 정보 -->
	<div
		style="width: 1200px; margin: 0 auto; margin-bottom: 10px; text-align: left; font-weight: bold; font-size: 30">
		배송정보</div>
	<table>
		<tr>
			<td class="address"><b>배송지 확인</b></td>
			<td style="width: 400px; text-align: left; padding-left: 13px">
				<div>
					<input type="radio" name="payment" style="margin-left: 10px; font-size: 70px; margin-right: 10px;">&nbsp;직접입력&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="radio" name="payment" style="font-size: 70px; margin-right: 10px;">&nbsp;주문자정보와 동일
				</div>
			</td>
		</tr>
		<tr>
			<td class="address"><b>받으실 분</b></td>
			<td
				style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" style="width: 400px; margin-left: 15px"
						name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address" style="height: 167"><b>받으실 곳</b></td>
			<td style="text-align: left; height: 30px"><input type="text"
				style="width: 150px; margin-bottom: 10px; margin-left: 15px;"
				id="sample6_postcode" placeholder="우편번호"> <input
				type="button" style="border-radius: 10; height: 35px;"
				onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address"
				style="margin-bottom: 10px; width: 400px; margin-left: 15px;"
				placeholder="주소"><br> <input type="text"
				id="sample6_detailAddress"
				style="margin-bottom: 10px; width: 400px; margin-left: 15px;"
				placeholder="상세주소"><br>
		</tr>
		<tr>
			<td class="address"><b>전화번호</b></td>
			<td
				style="width: 400px; text-align: left; height: 50px; border-top: 2px solid #dee2e6"><input
				type="text" style="width: 200px; margin-left: 15px;" name="payName"></td>
		</tr>
		<tr>
			<td class="address"><b>휴대폰 번호</b></td>
			<td
				style="width: 400px; text-align: left; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6"><input
				type="text" style="width: 200px; margin-left: 15px;" name="payName"></td>
		</tr>
		<tr>
			<td class="address"><b>배송 요청사항</b></td>
			<td style="text-align: left">
				<div>
					<input type="text" style="margin-left: 15px; width: 400px" name="payName" maxlength="50" placeholder="공백 포함 50글자까지 작성 가능합니다.">
				</div>
			</td>
		</tr>
	</table>

	<br>
	<br>
	<!-- 주문자 정보 -->
	<div
		style="width: 1200px; margin: 0 auto; margin-bottom: 10px; text-align: left; font-weight: bold; font-size: 30">
		주문자 정보</div>
	<table>
		<tr>
			<td class="address"><b>주문자 명</b></td>
			<td
				style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" style="width: 200px; margin-left: 15px"
						name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address"><b>전화번호</b></td>
			<td
				style="width: 400px; text-align: left; height: 50px; border-top: 2px solid #dee2e6"><input
				type="text" style="width: 200px; margin-left: 15px;" name="payName"></td>
		</tr>
		<tr>
			<td class="address"><b>휴대폰 번호</b></td>
			<td
				style="width: 400px; text-align: left; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6">
				<input type="text" style="width: 200px; margin-left: 15px;"
				oninput="phoneNumber(this)" maxlength="14" name="phone">
			</td>
		</tr>
		<tr>
			<td class="address"><b>이메일</b></td>
			<td
				style="width: 400px; text-align: left; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6">
				<input type="email"
				style="width: 200px; height: 35px; margin-left: 15px;"
				name="payName">
			</td>
	</table>

	<br>
	<br>
	<!-- 결제 정보 -->
	<div
		style="width: 1200px; margin: 0 auto; text-align: left; margin-bottom: 10px; font-weight: bold; font-size: 30">
		결제 정보</div>
	<table>
		<tr>
			<td class="address"><b>상품합계</b></td>
			<td
				style="width: 420px; text-align: left; padding: 15px; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6"><span>46,500</span>원</td>
		</tr>
		<tr>
			<td class="address"><b>배송비</b></td>
			<td
				style="width: 420px; text-align: left; padding: 15px; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6"><span>0</span>원</td>
		</tr>
		<tr>
			<td class="address"><b>최종 결제금액</b></td>
			<td
				style="width: 420px; text-align: left; padding: 15px; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6"><span>46,500</span>원</td>
		</tr>
	</table>

	<br>
	<br>
	<br>
	<br>
	<div style="display: flex; justify-content: center;">
  <div class="payElement">
    <img style="border-radius:2em; width:45; height:45px"src="${contextPath }/resources/images/naverPay.jpg">
    <div>네이버페이 결제</div>
  </div>
  <div class="payElement">
    <div style="margin-left:40%; background:#B0DAFF; padding-top:8px; border-radius:2em; width:45px; height:45px; "><i class="bi bi-credit-card" style="font-size: 30px;"></i></div>
    <div>신용카드 결제</div>
  </div>
  <div class="payElement">
    <img style="border-radius:2em; width:45; height:45px"src="${contextPath }/resources/images/kakaoPay.jpg">
    <div>카카오페이 결제</div>
  </div>
</div>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<%@include file="../common/footer.jsp"%>


</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소 찾기 
    function sample6_execDaumPostcode() { //우편번호 찾기 클릭 시
        new daum.Postcode({ //다음에서 제공하는 Postcode 메서드 
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<script>
	window.onload = () => {
		
		//수량에 따른 가격 변화 : ajax로 변환 
		let price = parseInt(document.getElementById('price').innerText);
		let size = parseInt(document.getElementById('size').innerText);
		document.getElementById('plus').addEventListener('click', function() {
			 size++;
			 document.getElementById('size').innerText = size;
			 
			 let priceString = document.getElementById('price').innerText;
			 console.log(priceString);
			    
		    // 쉼표 제거
		    let price = parseFloat(priceString.replace(/,/g, ''));
		    console.log(price);
		    
		    let total = price*size;
		    let formattedTotal = total.toLocaleString();
		    document.getElementById('sum').innerText = formattedTotal
			 
		})
		
		document.getElementById('minus').addEventListener('click', function() {
			if(size >= 1) {
				size--;
				document.getElementById('size').innerText = size;
			}
		})
		
		
		//마우스 올렸을 때 글자 변화 
		document.getElementById('basketHover').addEventListener('mouseover', function() {
			this.innerHTML = '01 장바구니 >';
		})
		document.getElementById('basketHover').addEventListener('mouseleave', function() {
			this.innerHTML = '01 ㅈㅂㄱㄴ >';
		})
		document.getElementById('paySuccess').addEventListener('mouseover', function() {
			this.innerHTML = '> 03 주문완료 &nbsp;';
		})
		document.getElementById('paySuccess').addEventListener('mouseleave', function() {
			this.innerHTML = '> 03 ㅈㅁㅇㄹ &nbsp;';
		})
		
	
		
		
		
	}
</script>

</html>

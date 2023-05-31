<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<style>
	
	
	.search {
	  position: relative;
	  width: 300px;
	  height:40px;
	  left:65%;
	  color:#808080;
	}
	
	.searchIcon {
 	  position : absolute; 
 	  width: 17px; 
	  top: 10px;
 	  right: 12px; 
	  margin: 0; 
 	} 
 	
 	#searchInput {
	  border: 2px solid #dee2e6;
	  border-radius: 50px;
	  width: 100%;
	  height: 100%;
	  
	}

	
	.carrier{
/* 		border:2px solid #dee2e6; */
		margin:0 auto;
		width:1200px;
		justify-content: center;
	}
	
	
	table {
		position:relative;
		text-align:center;
 		border:2px solid #dee2e6; 
		margin:0 auto;
		width:1200px;
		justify-content: center;
	}
	
	tr{
 		border:2px solid #dee2e6; 
		margin:0 auto;
		width:1200px;
		justify-content: center;
	}
	
	.barSpan{
		font-weight:bold;
		font-size:17px;
		left:625px; position:relative
	}
	
	.check {
	  width: 16px;
	  height: 16px;
	  border: 2px solid #000;
	  border-radius: 4px;
	  outline: none;
	  cursor: pointer;
	  justify-content:center;
	  
	}
	
	hr{
		margin:0 auto;
		width:1200px; 
		justify-content: center;
	}
	
	.vertical-line {
	  width: 1px;
	  background-color: black;
	  height: 100%;
	  margin-left: 20%; /* 필요에 따라 간격 조정 */
	}
		
	.tableBorder1{
		border-right: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6
	}
	
	.imgTab {
		height:300px;
	}
	
	.aHover {
		
		text-decoration: none; /* 밑줄 제거 */
		color: inherit; /* 상위 요소의 색상 상속 */
	}
	.aHover:hover {
		cursor:pointer;
		color:#0055FF;
	}
	
	.chBox {
		width: 20px; height: 20px;
	}
	
	input[type="checkbox"] {
  		transform: scale(1.5); /* 원하는 크기로 스케일 조정 */
	}
	
	input[type="text"] {
  		height:35px
	}
	
	.address{
		width:150px; height:60px; border:2px solid #dee2e6;
		background-color:#B0DAFF;
		border-right:none; text-align:left; padding:20px;
	}
	
	
</style>
</head>
<body>



<%@include file="../common/top.jsp" %>
<br><br><br>


<!-- 검색창  -->
<div class="search">
  <input type="text" id="searchInput" placeholder=" 검색어 입력">
  <img class="searchIcon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
</div>
<br><br><br>

<!-- 장바구니 표 부분 -->
<div class="carrier" style="margin-bottom:10px; ">
	<span style="font-size:30px;"><b>주문상세내역</b></span>
 	<span class="barSpan"><a class="aHover">01 장바구니 > </a><a class="aHover">02 ㅈㅁㅅㅈㅅ/ㄱㅈ</a> <a class="aHover"> > 03 ㅈㅁㅇㄹ</a> </span>
</div>

<div style="height:50px; margin:0 auto; width:1200px; background-color:#B0DAFF; border-bottom:2px solid #dee2e6; border-left:none; border-right:none; border-top:2px solid #dee2e6"></div><br><br>


<!-- 장바구니 테이블 -->
	<table>
	    <tbody>
	        <tr style="border: 2px solid #dee2e6; background-color:#B0DAFF;">
	            <th class="tableBorder1" colspan="2" style="height:40px"><b>상품/옵션정보</b></th>
	            <th class="tableBorder1"><b>수량</b></th>
	            <th class="tableBorder1"><b>상품가격</b></th>
	            <th class="tableBorder1"><b>적립/할인</b></th>
	            <th class="tableBorder1"><b>합계금액</b></th>
	            <th style="border-bottom: 2px solid #dee2e6">배송비</th>
	        </tr>
	        <tr style="border-top: 2px solid #dee2e6;">
	            <td class="imgTab"><img src="" style="border: 2px solid #dee2e6; width: 200px; height: 200px;"></td>
	            <td style="border-right:2px solid #dee2e6; text-align:left">접이식 밥상<br>옵션 : Brown</td>
	            <td style="border-right:2px solid #dee2e6;"><span>1</span>개<br><br><br><button>옵션/수량변경</button></td>
	            <td style="border-right:2px solid #dee2e6;"><span>46,500</span>원</td>
	            <td style="border-right:2px solid #dee2e6;"><span>2,325</span>P적립</td>
	            <td style="border-right:2px solid #dee2e6;">46,500원</td>
	            <td>무료배송</td>
	        </tr>
	        
	    </tbody>
	 </table><br><br>
	 <div style="width:1200px; margin:0 auto; font-align:right"><i class="bi bi-caret-left-fill"></i><i class="bi bi-caret-left-fill"></i><i class="bi bi-caret-left-fill"><b>쇼핑 계속하기</b></i></div><br>
	 
	 
	 <table >
	 	<tbody>
		 	<tr style="height:130px; font-size:20px;">
	            <td style="width:800px; text-align:right"><b>총 1개의 상품 금액<br><br><span style="color:#00AAFF">46,500</span>원</b></td>
	            <td>&nbsp;&nbsp;&nbsp;<i class="bi bi-plus-circle-fill" style="color:#00AAFF; font-size:30px"></i></td>
	            <td style=""><b>배송비<br><br><span style="color:#00AAFF">0</span>원</b></td>
	            <td><span class="material-symbols-outlined" style="color:#00AAFF">equal</span></td>
	            <td style=""><b>합계<br><br><span style="color:#00AAFF">46,500</span>원</b></td>
	        </tr>
        </tbody>
	 </table>
   <br>
   
   <!-- 배송 정보 -->
   <div style="width:1200px; margin:0 auto; margin-bottom:10px; text-align:left; font-weight:bold; font-size:30">
		배송정보   
   </div>
   	<table>
   		<tr>
   			<td class="address"><b>배송지 확인</b></td>
   			<td style="width:400px; text-align:left; padding-left:13px">
   				<div>
   				<input type="checkbox" name="payment" style="margin-left:10px; font-size: 70px; margin-right: 10px;">&nbsp;직접 입력&nbsp;&nbsp;&nbsp;&nbsp;
   				<input type="checkbox" name="payment" style="font-size: 70px; margin-right: 10px;">&nbsp;주문자정보와 동일
   				</div>
   			</td>
   		</tr>
   		<tr>
   			 <td class="address"><b>받으실 분</b></td>
   			 <td style="text-align:left; border-top:2px solid #dee2e6; border-bottom:2px solid #dee2e6">
   			 	<div>
   			 		<input type="text" style="width:400px; margin-left:15px"name="payName">
   			 	</div>
   			 </td>
   		</tr>
		<tr>
			<td class="address" style="height:110" rowspan="2"><b>받으실 곳</b></td>
			<td style="text-align:left">
				<input type="text" style="margin-left:15px; width:300px"name="payName">
			</td>
		</tr>
		<tr>
			<td style="text-align:left">
				<input type="text" style="margin-left:15px; width:200px"name="payName">
				<input type="text" style="margin-left:15px; width:200px"name="payName">
			</td>
		</tr>
   		<tr>
   			<td class="address"><b>전화번호</b></td>
   			<td style="width:400px; text-align:left; height:50px; border-top:2px solid #dee2e6" ><input type="text" style="width:200px; margin-left:15px;"name="payName"></td>
   		</tr>
   		<tr>
   			<td class="address"><b>휴대폰 번호</b></td>
   			<td style="width:400px; text-align:left; height:50px; border-bottom:2px solid #dee2e6; border-top:2px solid #dee2e6" ><input type="text" style="width:200px; margin-left:15px;"name="payName"></td>
   		</tr>
   		<tr>
   			 <td class="address"><b>배송 요청사항</b></td>
   			 <td style="text-align:left">
   			 	<div>
   			 		<input type="text" style="margin-left:15px; width:400px"name="payName">
   			 	</div>
   			 </td>
   		</tr>
   	</table>
   	
   	<br><br>
   	<!-- 주문자 정보 -->
   	<div style="width:1200px; margin:0 auto; margin-bottom:10px; text-align:left; font-weight:bold; font-size:30">
		주문자 정보   
    </div>
   	<table>
   		<tr>
   			 <td class="address"><b>주문자 명</b></td>
   			 <td style="text-align:left; border-top:2px solid #dee2e6; border-bottom:2px solid #dee2e6">
   			 	<div>
   			 		<input type="text" style="width:200px; margin-left:15px"name="payName">
   			 	</div>
   			 </td>
   		</tr>
   		<tr>
   			<td class="address"><b>전화번호</b></td>
   			<td style="width:400px; text-align:left; height:50px; border-top:2px solid #dee2e6" ><input type="text" style="width:200px; margin-left:15px;"name="payName"></td>
   		</tr>
   		<tr>
   			<td class="address"><b>휴대폰 번호</b></td>
   			<td style="width:400px; text-align:left; height:50px; border-bottom:2px solid #dee2e6; border-top:2px solid #dee2e6" ><input type="text" style="width:200px; margin-left:15px;"name="payName"></td>
   		</tr>
   		<tr>
   			<td class="address"><b>이메일</b></td>
   			<td style="width:400px; text-align:left; height:50px; border-bottom:2px solid #dee2e6; border-top:2px solid #dee2e6" >
   				<input type="email" style="width:200px; height:35px; margin-left:15px;"name="payName">
   			</td>
   		</tr>
   	</table>
   	
   	<br><br>
   	<!-- 결제 정보 -->
   	<div style="width:1200px; margin:0 auto; text-align:left; margin-bottom:10px;  font-weight:bold; font-size:30">
		결제 정보   
    </div>
   	<table>
   		<tr>
   			<td class="address"><b>상품합계</b></td>
   			<td style="width:420px; text-align:left; padding:15px; height:50px; border-bottom:2px solid #dee2e6; border-top:2px solid #dee2e6"><span>46,500</span>원</td>
   		</tr>
   		<tr>
   			<td class="address"><b>배송비</b></td>
   			<td style="width:420px; text-align:left; padding:15px; height:50px; border-bottom:2px solid #dee2e6; border-top:2px solid #dee2e6"><span>0</span>원</td>
   		</tr>
   		<tr>
   			<td class="address"><b>최종 결제금액</b></td>
   			<td style="width:420px; text-align:left; padding:15px;height:50px; border-bottom:2px solid #dee2e6; border-top:2px solid #dee2e6"><span>46,500</span>원</td>
   		</tr>
   	</table>
	   
	<br><br><br><br>
	<div style="padding-top:40px; text-align:center; margin:0 auto; border:2px solid black; width:250px; height:150px; border-radius:2em">
		<i class="bi bi-credit-card" style="font-size:45px;"></i><div>신용카드 결제</div>
	</div>
	
	
<br><br><br><br><br><br>


<%@include file="../common/footer.jsp" %>






</body>

<script>

</script>


</html>

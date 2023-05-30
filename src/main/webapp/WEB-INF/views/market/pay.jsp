<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
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


	input {
	  border: 1px solid #F1F1F1;
	  border-radius: 50px;
	  width: 100%;
	  height: 100%;
	  
	}
	
	.carrier{
/* 		border:1px solid black; */
		margin:0 auto;
		width:1200px;
		justify-content: center;
	}
	
	
	table {
		text-align:center;
 		border:1px solid black; 
		margin:0 auto;
		width:1200px;
		justify-content: center;
	}
	
	tr{
 		border:1px solid black; 
		margin:0 auto;
		width:1200px;
		justify-content: center;
	}
	
	.barSpan{
		left:715px; position:relative
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
		border-right: 1px solid black; border-bottom: 1px solid black
	}
	
	.imgTab {
		height:300px;
	}
</style>
</head>
<body>



<%-- <%@include file="top.jsp" %> --%>
<br><br><br>


<!-- 검색창  -->
<div class="search">
  <input type="text" placeholder=" 검색어 입력">
  <img class="searchIcon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
</div>
<br><br><br>

<!-- 장바구니 표 부분 -->
<div class="carrier">
	<span style="font-size:30px;"><b>장바구니</b></span>
 	<span class="barSpan">01 장바구니 > <a>02 ㅈㅁㅅㅈㅅ/ㄱㅈ</a><a> > 03 ㅈㅁㅇㄹ</a></span>
</div>
<br>

<hr style="height:50px; background-color:#B0DAFF; border-bottom:1px solid black; border-left:none; border-right:none; border-top:1px solid black"><br><br>


<!-- 테이블 -->
<table>
    <tbody>
        <tr style="border: 1px solid black; background-color:#B0DAFF;">
            <td class="tableBorder1" colspan="2" style="height:40px">상품/옵션정보</td>
            <td class="tableBorder1">수량</td>
            <td class="tableBorder1">상품가격</td>
            <td class="tableBorder1">적립/할인</td>
            <td class="tableBorder1">합계금액</td>
            <td style="border-bottom: 1px solid black">배송비</td>
        </tr>
        <tr style="border-top: 1px solid black;">
            <td class="imgTab"><img src="" style="border: 1px solid black; width: 200px; height: 200px;"></td>
            <td style="border-right:1px solid black; text-align:left">접이식 밥상<br>옵션 : Brown</td>
            <td style="border-right:1px solid black;"><span>1</span>개<br><br><br><button>옵션/수량변경</button></td>
            <td style="border-right:1px solid black;"><span>46,500</span>원</td>
            <td style="border-right:1px solid black;"><span>2,325</span>P적립</td>
            <td style="border-right:1px solid black;">46,500원</td>
            <td>무료배송</td>
        </tr>
        <tr>
            <td colspan="7" style="border-top:1px solid black; border-bottom: 1px solid black; text-align:left">((( 쇼핑 계속하기</td>
        </tr>
        <tr>
            <td colspan="2" style=""></td>
            <td>총 1개의 상품 금액<br><span>46,500</span>원</td>
            <td>+</td>
            <td>배송비<br><span>0</span>원</td>
            <td>=</td>
            <td >합계<br><span>46,500</span>원</td>
        </tr>
        <tr>
            <td colspan="7" style="border-top:1px solid black">배송정보</td>
        </tr> 
    </tbody>
</table>



	
<!-- 	<hr> -->
<!-- 	<div class="carrier" style="height: 50px; display: flex; align-items: center;"> -->
<!-- 		<label style="margin-right:89%"> -->
<!-- 		  <input type="checkbox" class="check"> 전체 선택 -->
<!-- 		</label> -->
<!-- 	</div> -->
<!-- 	<hr> -->
<!-- 	<div class="carrier" style="height:20px;"></div> -->
<!-- 	<hr> -->
<!-- 	<div class="carrier" style="height: 40px; display: flex; justify-content: space-between; align-items:center"> -->
<!-- 		<span style="margin-left:8%;">상품/옵션 정보</span> -->
<!-- 		<span>수량</span> -->
<!-- 		<span>상품가격</span> -->
<!-- 		<span>적립/할인</span> -->
<!-- 		<span style="margin-right:10%;">합계 금액</span> -->
<!-- 	</div> -->
<!-- 	<hr> -->
<!-- 	<div class="carrier" style="height: 210px; display: flex; justify-content: space-between; align-items: center;"> -->
<!--     <span style="position:absolute; padding:12px"><input type="checkBox" class="check"></span> -->
<!--     <span style="position:absolute; padding:50px"><img alt="" src="" style="border:1px solid black; width:150px; height:150px;"></span> -->
<!--     <span class="vertical-line" style="margin-left:26%; text-align: center;"><a>1</a>개</span> -->
<!--     <span class="vertical-line" style="margin-left:6%"></span> -->
<!--     <span class="vertical-line"></span> -->
<!--     <span class="vertical-line" style="margin-left:8%"></span> -->
<!--     <span class="vertical-line"></span> -->
<!-- </div> -->
<!-- 	<hr> -->
<!-- 	<div class="carrier" style="height: 210px; display: flex; justify-content: space-between; align-items: center;"> -->
<!-- 		<span style="position:absolute; padding:12px"><input type="checkBox" class="check"></span> -->
<!-- 		<span style="position:absolute; padding:50px"><img alt="" src="" style="border:1px solid black; width:150px; height:150px;"></span> -->
<!-- 		<span class="vertical-line" style="margin-left:26%"></span> -->
<!-- 		<span class="vertical-line" style="margin-left:6%"></span> -->
<!-- 		<span class="vertical-line" ></span> -->
<!-- 		<span class="vertical-line" style="margin-left:8%"></span> -->
<!-- 		<span class="vertical-line"></span> -->
<!-- 	</div> -->
<!-- 	<hr> -->
<!-- 	<div class="carrier" style="height: 210px; display: flex; justify-content: space-between; align-items: center;"> -->
<!-- 		<span style="position:absolute; padding:12px"><input type="checkBox" class="check"></span> -->
<!-- 		<span style="position:absolute; padding:50px"><img alt="" src="" style="border:1px solid black; width:150px; height:150px;"></span> -->
<!-- 		<span class="vertical-line" style="margin-left:26%"></span> -->
<!-- 		<span class="vertical-line" style="margin-left:6%"></span> -->
<!-- 		<span class="vertical-line" ></span> -->
<!-- 		<span class="vertical-line" style="margin-left:8%"></span> -->
<!-- 		<span class="vertical-line"></span> -->
<!-- 	</div> -->
<!-- 	<hr> -->
<!-- 	<div class="carrier" style="height: 210px; display: flex; justify-content: space-between; align-items: center;"> -->
<!-- 		<span style="position:absolute; padding:12px"><input type="checkBox" class="check"></span> -->
<!-- 		<span style="position:absolute; padding:50px"><img alt="" src="" style="border:1px solid black; width:150px; height:150px;"></span> -->
<!-- 		<span class="vertical-line" style="margin-left:26%"></span> -->
<!-- 		<span class="vertical-line" style="margin-left:6%"></span> -->
<!-- 		<span class="vertical-line" ></span> -->
<!-- 		<span class="vertical-line" style="margin-left:8%"></span> -->
<!-- 		<span class="vertical-line"></span> -->
<!-- 	</div> -->
<!-- 	<div class="carrier"><a> ((( 쇼핑 계속하기</a></div> -->
<!-- 	<br> -->
<!-- 	<div class="carrier" style="height:120px; border:1px solid black"> -->
<!-- 		<div style="padding:20px; text-align:right; font-size:25px"> -->
<!-- 			<span>총 1개의 상품 금액</span> -->
<!-- 			<span>+</span> -->
<!-- 			<span>배송비</span> -->
<!-- 			<span>=</span> -->
<!-- 			<span>합계</span> -->
<!-- 			<div style="padding:20px; text-align:right; font-size:20px"> -->
<!-- 				<span>5000</span>&nbsp;&nbsp; -->
<!-- 				<span>+</span>&nbsp; -->
<!-- 				<span>2500</span>&nbsp; -->
<!-- 				<span>=</span> -->
<!-- 				<span>15031</span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div style="margin-left:83%"> -->
<!-- 			<button>선택 상품 주문</button>&nbsp;<button>선택 상품 주문</button> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	
	
	
	
</div>
	








</body>
</html>

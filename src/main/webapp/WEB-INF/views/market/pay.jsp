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
		position:relative;
		text-align:center;
 		border:2px solid gray; 
		margin:0 auto;
		width:1200px;
		justify-content: center;
	}
	
	tr{
 		border:2px solid gray; 
		margin:0 auto;
		width:1200px;
		justify-content: center;
	}
	
	.barSpan{
		font-weight:bold;
		font-size:17px;
		left:690px; position:relative
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
		border-right: 2px solid gray; border-bottom: 2px solid gray
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
	
</style>
</head>
<body>



<%@include file="../common/top.jsp" %>
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
 	<span class="barSpan"><a class="aHover">01 장바구니 > </a><a class="aHover">02 ㅈㅁㅅㅈㅅ/ㄱㅈ</a> <a class="aHover"> > 03 ㅈㅁㅇㄹ</a> </span>
</div>
<br>

<div style="height:50px; margin:0 auto; width:1200px; background-color:#B0DAFF; border-bottom:2px solid gray; border-left:none; border-right:none; border-top:2px solid gray"></div><br><br>


<!-- 장바구니 테이블 -->
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
	            <td style="border-right:2px solid gray; text-align:left">접이식 밥상<br>옵션 : Brown</td>
	            <td style="border-right:2px solid gray;"><span>1</span>개<br><br><br><button>옵션/수량변경</button></td>
	            <td style="border-right:2px solid gray;"><span>46,500</span>원</td>
	            <td style="border-right:2px solid gray;"><span>2,325</span>P적립</td>
	            <td style="border-right:2px solid gray;">46,500원</td>
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
	 <br><br><div style="width:1200px; margin:0 auto; text-align:right"><button>전체 상품 주문</button>&nbsp;&nbsp;<button>전체 상품 주문</button></div>
   
   
   
	   

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>









</body>

<script>
	
</script>


</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#successPage{
		width:700px;
		height:500px;
		border:4px dashed gray;
		border-radius:2em;
		margin:0 auto;
		margin-top:250px;
		text-align:center;
		padding:70px;
	}

	.button {
	  display: block;
	  position: relative;
	  float: left;
	  width: 120px;
	  padding: 0;
	  margin: 10px 20px 10px 0;
	  font-weight: 600;
	  text-align: center;
	  line-height: 50px;
	  color: #00AAFF;
	  border-radius: 5px;
	  transition: all 0.2s ;
	   color: #333;
	   font-size: 20px;
  	background: #ececec;
	}
	
	.btnPush:hover {
	  margin-top: 15px;
	  margin-bottom: 5px;
	}
	
	.btnLightBlue.btnPush {
	  box-shadow: 0px 5px 0px 0px #1E8185;
	}
	
		
</style>
</head>
<body>
	
	<%@include file="../common/top.jsp" %>
<div>
	<div id="successPage">
		<i class="bi bi-bag-heart-fill" style=" font-size:120px;  text-shadow: 3px 2px 2px gray;color:#B0DAFF"></i>
		<h3>박보서 고객님,</h3>
		<h3><span style="color:#2962FF"><b>결제</b></span>가 <span style="color:#2962FF"><b>완료</b></span>되었습니다.</h3>
		<br><button class="Btn">메인으로</button>&nbsp;&nbsp;&nbsp;<button class="Btn">구매내역 확인</button>
		<button class="button btnPush btnLightBlue">메인으로</button>
	</div>
</div>

	<br><br><br><br><br><br>
	<%@include file="../common/footer.jsp" %>

</body>
</html>
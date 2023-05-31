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
	
	.btn.green {background: #B0DAFF; box-shadow: 0px 4px 0px #87a86f;}
	.btn.green:active {box-shadow: 0 0 #311B92; background-color: #0067A3;}
	.rounded {
	  border-radius: 10px;
	}
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	
	<%@include file="../common/top.jsp" %>
<div>
	<div id="successPage">
		<i class="bi bi-bag-heart-fill" style=" font-size:120px;  text-shadow: 3px 2px 2px gray;color:#B0DAFF"></i>
		<h3>박보서 고객님,</h3>
		<h3><span style="color:#2962FF"><b>결제</b></span>가 <span style="color:#2962FF"><b>완료</b></span>되었습니다.</h3>
		<br><button class="Btn">메인으로</button>&nbsp;&nbsp;&nbsp;<button class="Btn">구매내역 확인</button>
		<a class="btn green rounded">Button</a>
	</div>
</div>

	<br><br><br><br><br><br>
	<%@include file="../common/footer.jsp" %>

</body>
<script>
	$('a').click(function(event) {
		event.preventDefault();
	})
</script>
</html>
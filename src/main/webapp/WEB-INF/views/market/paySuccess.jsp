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

	/* 3D Button */
.btn-3d {
  text-decoration:none;
  width:100px; height:35px;
  position: relative;
  display: inline-block;
  font-weight:bold;
  font-size: 15px;
  padding:5px;
/*   padding: 20px 60px; */
  color: white;
  margin: 20px 10px 10px;
  border-radius: 6px;
  text-align: center;
  transition: top .01s linear;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
.btn-3d.blue:hover   {color:white; background-color: #699DD1;}
.btn-3d:active {
  top: 9px;
}
.btn-3d.blue {
  background-color: #6DA2D9;
  box-shadow: 0 0 0 1px #6698cb inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(110, 164, 219, .7),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.blue:active {
  box-shadow: 0 0 0 1px #6191C2 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 0 0 1px rgba(0,0,0,0.4);
}


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
		
		<div class="btn-container">
  			<a href="#" class="btn-3d blue">메인으로</a>
  			<a href="#" class="btn-3d blue" style="width:120px;">구매내역 확인</a>
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
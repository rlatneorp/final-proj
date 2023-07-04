<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<style>
	span, input{height:30px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mainBox d-inline-block align-top rounded" style="width: 1200px; margin-bottom: 200px; padding: 40px 75px; border: 2px solid rgba(0,0,0,0.1);">
		<h4 class="py-4 mb-0">영양사 정보관리</h4>
		
		<c:if test="${h eq null}">
			<form action="${contextPath}/adminHealtherInsert.ad" id="healtherForm" method="post" enctype="multipart/form-data">
		</c:if>
		<c:if test="${h ne null}">
			<form action="${contextPath}/adminHealtherUpdate.ad" id="healtherForm" method="post" enctype="multipart/form-data">
		</c:if>
				<input type="hidden" name="usersNo" value="${loginUser.usersNo}">
				<input type="hidden" name="imageChange" value="N">
				<div class="row">
					<div class="col-6 row">
						<h5 class="my-3">- 소개 -</h5>
						<hr>
						<span class="col-4">이름</span>
						<input type="text" name="name" class="col-8 pb-1 mb-2 rounded" value="${h.name}">
						<hr>
						<span class="col-4">프로필 제목</span>
						<input type="text" name="title" class="col-8 pb-1 mb-2 rounded" value="${h.title}">
						<hr>
						<span class="col-4">경력사항</span>
						<textarea rows="6" name="career" class="col-12 rounded">${h.career}</textarea>
						<hr>
						<br><br>
					</div>
					
					<div class="col-6">
						<div class="ms-5">
							<div class="border" style="width: 450px; height: 450px;">
								<c:if test="${!empty img}">
									<img class="previewImage" width="450px" height="450px" src="${contextPath}/resources/uploadFiles/${img.imageRenameName}">
								</c:if>
								<c:if test="${empty img}">
									<img class="previewImage" width="450px" height="450px">
								</c:if>
							</div>
							<input name="imageFile" type="file" accept=".png, .jpg, .jpeg">
							<p style="font-size: 12px; color: gray">최적 이미지 비율은 1:1입니다.</p>
							
						</div>
					</div>
					<div class="mb-5"></div>
					<div class="d-flex justify-content-center mb-5">
						<div class="d-flex">
							<button onclick="submitForm()" type="button" class="me-4" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">수정하기</button>
							<button onclick="history.back()" type="button" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">취소하기</button>
						</div>
					</div>
				</div>
			</form>
		
	</div>
	
	
	<script>
		window.onload =()=>{
// 			이미지 미리보기 함수, 이벤트
			const imageFile = document.getElementsByName('imageFile')[0];
			const previewImage = document.getElementsByClassName('previewImage')[0];
			
			function readImage(imageFile) {
			    // 인풋 태그에 파일이 있는 경우
			    if(imageFile.files && imageFile.files[0]) {
			        // 이미지 파일인지 검사 (생략)
			        // FileReader 인스턴스 생성
			        const reader = new FileReader()
			        // 이미지가 로드가 된 경우
			        reader.onload = e => {
			            previewImage.src = e.target.result
			        }
			        // reader가 이미지 읽도록 하기
			        reader.readAsDataURL(imageFile.files[0])
			    }
			}
			// input file에 change 이벤트 부여
			imageFile.addEventListener("change", e => {
			    readImage(e.target);
			    document.getElementsByName('imageChange')[0].value="Y";
			})
		}
		function submitForm(){
			const name = document.getElementsByName('name')[0];
			const title = document.getElementsByName('title')[0];
			const career = document.getElementsByName('career')[0];
			const previewImage = document.getElementsByClassName('previewImage')[0];
			const imageFile = document.getElementsByName('imageFile')[0];
			const healtherForm = document.getElementById('healtherForm');
			
			if(name.value.trim() == ''){
				alert("이름을 작성해주세요.");
				name.focus;
			}else if(title.value.trim() == ''){
				alert("프로필 제목을 작성해주세요.");
				title.focus;
			}else if(career.value.trim() == ''){
				alert("경력사항을 작성해주세요.");
				career.focus;
			}else if(previewImage.src.trim() == ''){
				alert("이미지를 등록해주세요.");
				imageFile.focus;
			}else{
				healtherForm.submit();
			}
		}
		
		
		
	</script>
</body>
</html>
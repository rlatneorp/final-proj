<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 포인트 관리</title>
<style>
	#dropdownMenu2{color: black; font-weight: bold; background: linear-gradient(to top, #B0DAFF 35%, transparent 5%);}

	#point{
		width: 940px; height: 200px;
		text-align: center;
		display: flex; justify-content: center; align-items: center;
	}
	#pointTable1{width: 500px;}
	#pointTable1 tr{height: 70px;}
	#pointTable2 {
	   text-align: center;
	   margin: 0 auto;
	   width: 900px;
	   border-top: 2px solid #444444;
	   border-bottom: 2px solid #444444;
	   border-collapse: collapse;
	}
	
	#pointTable2 th, td {
	   border-top: 1px solid #444444;
	   padding: 10px;
	}
	
	#pointTable2 th:first-child, td:first-child {
	   border-left: none;
	}
	.page-link.disabled{color: lightgray;}
	.page-link.disabled:hover{background: white; color: lightgray;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br><br>
	
	<div id="Div">
		<div class="myPageDiv">
		<%@ include file="../common/usersSideBar.jsp" %>
			<div class="content">
				<p id="pmyPage">포인트 관리</p>
				<div style="border: 1px solid black; background: black; height: 1px;"></div>
				<br><br>
				<div id="point">
					<table id="pointTable1">
						<tr>
							<th colspan="2" style="font-size: 25px;"><label style="margin-right: 30px;">현재 포인트</label></th>
							<th rowspan="2" style="border: 1px solid gray; background: lightgray;"></th>
							<th style="font-size: 25px;">소멸 예정 포인트</th>
						</tr>
						<tr>
							<td><i class="bi bi-currency-dollar dollars" style="text-align: right;"></i></td>
							<td style="font-size: 18px; color: rgb(52, 152, 219); text-align: left;"><b><fmt:formatNumber pattern="###,###,###">${ loginUser.point }</fmt:formatNumber> P</b></td>
							<td style="font-size: 18px;">0 P</td>
						</tr>
					</table>
				</div>
				<br>
				<table id="pointTable2">
					<thead>
						<tr style="background-color: #B0DAFF; opacity: 90%">
							<th>날짜</th>
							<th>내용</th>
							<th>소멸 예정일</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${ list }" var="p">
							<c:if test="${ p.USERS_NO != null }">
								<tr>
									<c:if test="${ p.POINT_TYPE == 2 }">
										<script>
					                        var modifyDate = new Date("${p.MODIFY_DATE}");
					                        modifyDate.setMonth(modifyDate.getMonth() + 6);
					                        var formattedDate = modifyDate.toISOString().split('T')[0];
					                    </script>
										<td>${ fn:split(p.MODIFY_DATE, ' ')[0] }</td>
										<td>회원가입 축하 적립금</td>
										<td class="extinction"><script>document.write(formattedDate);</script></td>
										<td>+<fmt:formatNumber pattern="###,###,###">${ p.POINT_CHANGE - p.POINT_BEFORE }</fmt:formatNumber></td>
									</c:if>
									<c:if test="${ p.POINT_TYPE == 3 }">
										 <script>
					                        var modifyDate = new Date("${p.MODIFY_DATE}");
					                        modifyDate.setMonth(modifyDate.getMonth() + 12);
					                        var formattedDate = modifyDate.toISOString().split('T')[0];
					                    </script>
										<td>${ fn:split(p.MODIFY_DATE, ' ')[0] }</td>
										<td>구매 포인트 적립</td>
										<td class="extinction"><script>document.write(formattedDate);</script></td>
										<td>+<fmt:formatNumber pattern="###,###,###">${ p.POINT_CHANGE - p.POINT_BEFORE }</fmt:formatNumber></td>
									</c:if>
									<c:if test="${ p.POINT_TYPE == 11 }">
										<td>${ fn:split(p.MODIFY_DATE, ' ')[0] }</td>
										<td>구매 포인트 차감</td>
										<td>-</td>
										<td><fmt:formatNumber pattern="###,###,###">${ p.POINT_CHANGE - p.POINT_BEFORE }</fmt:formatNumber></td>
									</c:if>
									<c:if test="${ p.POINT_TYPE == 12 }">
										<td>${ fn:split(p.MODIFY_DATE, ' ')[0] }</td>
										<c:if test="${ p.POINT_CHANGE - p.POINT_BEFORE > -10 }">
											<td>구매 포인트 소멸</td>
										</c:if>
										<c:if test="${ p.POINT_CHANGE - p.POINT_BEFORE <= -10 }">
											<td>출석 포인트 소멸</td>
										</c:if>
										<td>-</td>
										<td>${ p.POINT_CHANGE - p.POINT_BEFORE }</td>
									</c:if>
								</tr>
							</c:if>
							<c:if test="${ p.USERS_NO == null }">
								<tr>
									<script>
					                    var checkedDate = new Date("${p.CHECKED}");
					                    checkedDate.setMonth(checkedDate.getMonth() + 2);
					                    var formattedDate = checkedDate.toISOString().split('T')[0];
					                </script>
									<td>${ p.CHECKED }</td>
									<td>출석체크 적립</td>
									<td class="extinction"><script>document.write(formattedDate);</script></td>
									<td>+10</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<br><br>
				<div>
					<nav aria-label="Standard pagination example" style="float: center; margin-left: 420px;">
						<ul class="pagination">
							<li class="page-item">
								<c:if test="${ pi.currentPage <= 1 }">
									<a class="page-link disabled" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="goBack" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage - 1 }"></c:param>
									</c:url>
									<a class="page-link" href="${ goBack }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</c:if>
							</li>
							<c:if test="${ pi.endPage == 0 }">
								<li class="page-item"><a class="page-link">1</a></li>
							</c:if>
							<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								<c:url var="goNum" value="${ loc }">
									<c:param name="page" value="${ p }"></c:param>
								</c:url>
								<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
							</c:forEach>
							<li class="page-item">
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									<a class="page-link disabled" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="goNext" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
									</c:url>
									<a class="page-link" href="${ goNext }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</c:if>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		//테이블에 마우스 올렸을 때 css
		const tbody = document.getElementById('tbody');
		const trs = tbody.children;
		
		for(tr of trs) {
		    tr.addEventListener('mouseenter', function() {
		          this.style.backgroundColor = 'rgba(176, 218, 255, 0.3)'; // 마우스를 올렸을 때의 스타일
		        });
		
		     tr.addEventListener('mouseleave', function() {
		       this.style.backgroundColor = ''; // 마우스를 뗐을 때의 스타일 (기존 스타일로 복구)
		     }); 
		}
		
		// 날짜
		function formatDate(date) {
	        var year = date.getFullYear();
	        var month = (date.getMonth() + 1).toString().padStart(2, '0');
	        var day = date.getDate().toString().padStart(2, '0');
	        return year + '-' + month + '-' + day;
	    }
		
// 		// 포인트 소멸
// 		const today = new Date();
// 		const year = today.getFullYear().toString().padStart(4, '0');
// 		const month = (today.getMonth() + 1).toString().padStart(2, '0');
// 		const day = today.getDate().toString().padStart(2, '0');
// 		const date = year + '-' + month + '-' + day;
// 		const tds = document.querySelectorAll('.extinction');
// 		const usersNo = '${loginUser.usersNo}';
		
// 		for(const td of tds){
// 			if(td.innerText == date){
// 				console.log('ㅎㅇ');
// 				const point = td.nextElementSibling.innerText.split('+')[1];
// 				$.ajax({
// 					url : '${contextPath}/myPage_deletePoint.me',
// 					data : {usersNo : usersNo, dePoint : point},
// 					success : data => {
// 						if(data == 'yes'){
// 							console.log('멈ㅇ');
// 							location.href = '${contextPath}/myPage_Point.me';
// 						}
// 					},
// 					error : data => {
// 						console.log(data);
// 					}
// 				});
// 			}
// 		}
	</script>
</body>
</html>
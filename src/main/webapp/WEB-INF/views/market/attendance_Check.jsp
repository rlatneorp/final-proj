<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석 체크</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.8/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.8/index.global.min.js'></script>
</head>
<style>

*{
font-family: 'Noto Sans KR', sans-serif;
}
.eventTr{
	width: 1000px;
	height: 1276px;
	border-radius: 20px;
	box-shadow: 4px 4px 0px black; 
	border: 3px solid black;
	backgroud-color: rgb(236, 248, 248);
}
.customCheck{
	border: 3px solid black;

}
#calendar {
  margin: 0;
  padding: 0;
  font-size: 20px;
  
}
.fc .fc-daygrid-day-number{
	font-size: 25px;
	margin-right:32px;
	margin-top: 35px;
	text-decoration: none;
	color: black;
	text-align: center;
	
}
#calendar {
  max-width: 870px;
  max-height: 1100px;
  margin: 10px auto;
  padding: 30px;
  
}
.fc .fc-col-header-cell-cushion {
  display: none;
  padding: 2px 4px;

}

#top{

	display: none;
}

.fc td:active{
	background-image: url("resources/images/checked.png") !important;
	z-index:12 !important;
	background-position: center !important;
	background-size: 110% !important;
	
}

:root{
	--fc-border-color: white;
}
.fc-day-today {
    background: #FFF !important;
    border: none !important;
  	background-image: url("resources/images/checkCircle.png") !important;
	background-position: center !important;
	background-size: 110% !important;
	z-index: 10 !important;
} 



.fc .fc-scrollgrid-liquid{
		border: none !important;
	border-bottom-width: 0px !important;
	border-left-width: 0px !important;
	border-right-width: 0px !important;
	border-top-width: 0px !important;

}


.fc td{

    background: #FFF !important;
    border: none !important;
  	background-image: url("resources/images/checkCircle.png") !important;
	background-position: center !important;
	background-size: 110% !important;
	z-index: 10 !important;
	
}

.fc td{
	width: 100px;
	height: 100px;
	border: none;
	border-bottom-width: 0px !important;
	border-left-width: 0px !important;
	border-right-width: 0px !important;
	border-top-width: 0px !important;
	
}
.fc .fc-scroller-liquid-absolute{
	position: inherit;
}

.eventTitle{
	font-size: 80px;
	font-weight: 700;
}

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48;
  font-size: 40px;
  color: rgb(192, 57, 43);
}

.event1{
	font-size: 24px;
	font-weight: 500;
	vertical-align: top;
}

.eventTr button{
	width: 200px; height: 46px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	margin: 10px;
	font-size: 24px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 5px; 
}
</style>
<body>
<br><br>
<%@ include file="../common/top.jsp" %>
<br><br>
	<div class="container-xxl" align="center">
		<div class="eventTr">
			<br><br>
				<h1 class="eventTitle">출 석 체 크 이 벤 트</h1><br>
				<span class="material-symbols-outlined">done</span><p class="event1 d-inline">매일 1회 출석체크 시</p><p class="event1 d-inline"> 포인트 1000원 지급 </p><br>
				<span class="material-symbols-outlined">done</span><p class="event1 d-inline">총 30일 연속 출석체크 시</p><p class="event1 d-inline"> 추가 포인트 2,000원 지급 </p>
				<br>
				<br><br> 
				<div  class="customCheck" id='calendar'><br><br><br><br></div>
			<div> 
			<h3 class="d-inline">출석체크 방법 : TODAY 출석체크 버튼 클릭! </h3>
			<button>TODAY출석체크</button>
			<br><br><br>
			</div>
		</div>
	</div>
	<br><br><br>
<%@ include file="../common/footer.jsp" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	 
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	
	    headerToolbar: {
	      left: '',
	      center: 'title',
	      right: ''
	    },
	    locale: 'ko',
	    dateClick: function(info) {
	      alert('[출석확인 날짜 : ' + info.dateStr + ']');
	      var todayDate = this.$moment().format("YYYY-MM-DD")			
	      var clickDate = this.$moment(arg.date).format("YYYY-MM-DD")	

	      if (todayDate != clickDate) return alert("접근할 수 없음");	

	      var todayDone = this.attendanceDates.some(date => date.attendanceDate == todayDate);
	      if(todayDone) {		
	      	return alert("이미 출석되었습니다");
	      } else {			
	      	alert("출석되었습니다");
	      	var newDate = {
	      		attendanceDate: clickDate,
	      		isChecked : true
	      	}
	      	this.attendanceDates.push(newDate);
	      }
	    }
	  });

	  calendar.render();
	});
 
</script>
</body>
</html>
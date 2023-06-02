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
</head>
<style>
#calendar {
  margin: 0;
  padding: 0;
  font-size: 20px;
}
.fc .fc-daygrid-day-number{
	font-size: 25px;
}
#calendar {
  max-width: 1200px;
  margin: 10px auto;
}

.fc .fc-col-header-cell-cushion {
 
  padding: 2px 4px;
  display: none;
}

#top{
	display: none;
}
:root{
--fc-today-bg-color: white;



}
:root:active{
	--fc-today-bg-color: white;
	--fc-today-border-color: #B0DAFF;
	--fc-today-border-size: 3px;
}
.fc .fc-scrollgrid-liquid{
	border: none;
}


.fc-theme-standard td, .fc-theme-standard th{
	border: none;
	
}

.fc td{
	border-radius: 100%;
	width: 160px;
	height: 160px;
	
}

.fc .fc-highlight{
	border-radius: 100%;
}
</style>
<body>
<br><br>
<%@ include file="../common/top.jsp" %>
	<div class="container-xxl" align="center">
		<div>
			<h1>출석체크</h1>
			<div class="customCheck" id='calendar'></div>
		</div>
	</div>
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
	    }
	  });

	  calendar.render();
	});
</script>
</body>
</html>
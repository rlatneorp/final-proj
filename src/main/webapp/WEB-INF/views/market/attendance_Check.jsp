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
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.8/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.8/index.global.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>

*{
font-family: 'Noto Sans KR', sans-serif;
}

/* .fc-h-event .fc-event-title-container{ */
/*    background-image: url("resources/images/checked.png") !important; */
/*    z-index: 999 !important; */
/*  } */
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
			<button id="checkAttendanceBtn">TODAY출석체크</button>
			<br><br><br>
			</div>
		</div>
	</div>
	<br><br><br>
<%@ include file="../common/footer.jsp" %>

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script>
// 	let isAttendanceChecked = false;
// 	let checkedDates = [];
	
	document.addEventListener('DOMContentLoaded', function() {
	  const calendarEl = document.getElementById('calendar');
// 	  const checkAttendanceBtn = document.getElementById('checkAttendanceBtn'); 
// 	  const clickedDate = moment(info.date).format('yyyy-MM-DD');
      const todayDate = moment().format('yyyy-MM-DD');
	  const calendar = new FullCalendar.Calendar(calendarEl, {
	    headerToolbar: {
	      left: '',
	      center: 'title',
	      right: ''
	    },
	    locale: 'ko',
	    dateClick: function(arg) {
	        
	        console.log(arg);

	        var title = alert('출석을 완료하였습니다! \n출석일 : ' +todayDate +'\n포인트를 10원 적립하였습니다!');
	     
	        if (title) {
	          calendar.addEvent({
	            title: ' 출석 완료',
	            start: arg.dateStr,
	            attendanceDate: arg.dateStr
	          })
	        }
	        calendar.unselect()
	      },
	      
	      dayMaxEvents: false,
	      events: function(info, successCallback, failureCallback){
	       	  $.ajax({
	     		 type:'get',
	     		 url:'${contextPath}/attendance_Check.ma',
	     		dataType:'json'  
	     	  });
	    	  
	      }
	  });
	    calendar.render();
	});
// 	        if (clickedDate === todayDate && !isAttendanceChecked) {
// 	          // 출석체크 Ajax 호출
// 	          $.ajax({
// 	            url: '${contextPath}/attendance_Check.ma',
// 	            data: { attendanceDate: attendanceDate, attendanceDay: attendanceDay },
// 	            success: function(info) {
// 	              alert('출석체크가 완료되었습니다. 날짜: ' + info.dateStr);
// 	              checkAttendanceBtn.disabled = true;
// 	              isAttendanceChecked = true;
// 	              checkedDates.push(clickedDate);

// 	              disableScreen();
// 	            },
// 	            error: function(error) {
// 	              console.error(error);
// 	            }
// 	          });
// 	        } else if (clickedDate === todayDate && isAttendanceChecked) {
// 	          alert('오늘은 이미 출석체크를 하셨습니다.');
// 	        } else {
// 	          alert('오늘 날짜만 출석체크가 가능합니다.');
// 	        }
// 	      },
// 	    events:function(info, successCallback, failureCallback){
	   		
// 	    }
	    
// 	    });
	  
// 		events: function(info, successCallback, failureCallback) {
// 			const clickedDate = moment(info.date).format('yyyy-MM-DD');
//  	        const todayDate = moment().format('yyyy-MM-DD');
//  	  	    const attendanceDay = moment(info.date).format('yyyy-MM-DD');
// //  	  	    dateClick: function(info) {
// //  	  	      const clickedDate = moment(info.date).format('yyyy-MM-DD');
// //  	  	      const todayDate = moment().format('yyyy-MM-DD');

// //  	  	      if (clickedDate === todayDate && !isAttendanceChecked) {
 	  	        
// //  	  	        console.log(clickedDate);

// //  	  	        // 출석체크 Ajax 호출
// //  	  	        $.ajax({
// //  	  	          url: '${contextPath}/attendance_Check.ma',
// //  	  	          data: { attendanceDate: clickedDate, attendanceDay: clickedDate },
// //  	  	          success: function(data) {
// //  	  	            alert('출석체크가 완료되었습니다. 날짜: ' + info.dateStr);
// //  	  	            checkAttendanceBtn.disabled = true;
// //  	  	            isAttendanceChecked = true;
// //  	  	            checkedDates.push(clickedDate);
 	  	        
// //  	  	            disableScreen();
// //  	  	          },
// //  	  	          error: function(error) {
// //  	  	            console.error(error);
// //  	  	          }
// //  	  	        });
// //  	  	      } else if (clickedDate === todayDate && isAttendanceChecked) {
// //  	  	        alert('오늘은 이미 출석체크를 하셨습니다.');
// //  	  	      } else {
// //  	  	        alert('오늘 날짜만 출석체크가 가능합니다.');
// //  	  	      }
// //  	  	    }
// //  	  	  });

// 			title : ' 출석완료',
// 			start : clickedDate,
// 			end : attendanceDay,
// 			allDay: true
// 		}
		  
// 	  });	  
// 	calendar.render();
// 	})
//   checkAttendanceBtn.addEventListener('click', function() {
//     if (!isAttendanceChecked) {
//       const todayDate = moment().format('yyyy-MM-DD');
//       const todayDD = moment().format('DD'); 
//       if (currentDate === todayDate) {
        
//     	  return await $.ajax({
//           url: '${contextPath}/attendance_Check.ma',
//           data: { attendanceDate: todayDate,  attendanceDay: todayDD},
//           success: function(data) {
//             alert('출석체크가 완료되었습니다. 날짜: ' + todayDate);
//             checkAttendanceBtn.disabled = true;
//             isAttendanceChecked = true;
//             checkedDates.push(todayDate);

//             calendar.addEvent(event);

//             disableScreen();
//           },
//           error: function(error) {
//             console.error(error);
//           }
//         });
//       } else {
//         alert('오늘 날짜만 출석체크가 가능합니다.');
//       }
//     } else {
//       alert('오늘은 이미 출석체크를 하셨습니다.');
//     }
//   });

// 	  function checkAttendanceStatus() {
// 	    const todayDate = moment().format('yyyy-MM-DD');
// 	    const currentDate = moment().format('yyyy-MM-DD');
	
// 	    if (isAttendanceChecked) {
// 	      disableScreen();
// 	    }
// 	    else if (checkedDates.indexOf(todayDate) === -1 && currentDate === todayDate) {
// 	      checkAttendanceBtn.disabled = false;
// 	    }
// 	  }
	
// 	  function disableScreen() {
// 	    const calendarContainer = document.getElementById('calendar');
// 	    calendarContainer.style.opacity = '0.5';
// 	    calendarContainer.style.pointerEvents = 'none';
// 	  }
	
// 	  window.addEventListener('load', function() {
// 	    checkAttendanceStatus();
// 	  });


 
</script>
</body>
</html>
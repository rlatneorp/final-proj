//	상태버튼 이벤트
function adminUpdateStatus(dataType){
	const statusBtns = document.getElementsByClassName('statusBtn');
	let Nos = null;
	switch(dataType){
		case 1: Nos = document.getElementsByName('productNo'); break;
		case 2: Nos = document.getElementsByName('productNo'); break;
		case 3: Nos = document.getElementsByName('productNo'); break;
		case 4: Nos = document.getElementsByName('productNo'); break;
		case 5: Nos = document.getElementsByName('usersNo'); break;
		case 6: Nos = document.getElementsByName('foodNo'); break;
		case 7: Nos = document.getElementsByName('reviewNo'); break;
		case 8: Nos = document.getElementsByName('boardNo'); break;
		case 9: Nos = document.getElementsByName('faqNo'); break;
		case 10: Nos = document.getElementsByName('qnaNo'); break;
	}

	for(const i in statusBtns){
		if(i<statusBtns.length){
			let j = Math.floor(i/2);
			if(Nos[j].value != 0){
				statusBtns[i].addEventListener('click', function(){
					$.ajax({
						url: '/hollosekki/adminUpdateStatus.ad',
						data: {dataNo:Nos[j].value,
							   dataStatus:statusBtns[i].innerText,
							   dataType:dataType},
						success: data =>{
							if(data == "success"){
								if(dataType == 3 && statusBtns[i].innerText == 'N'){
									document.getElementsByClassName('priceBox')[Math.floor(i/2)].style.display="none";
									document.getElementsByClassName('saleBox')[Math.floor(i/2)].style.display="none";
								}else if(dataType == 3 && statusBtns[i].innerText == 'Y'){
									document.getElementsByClassName('priceBox')[Math.floor(i/2)].style.display="block";
									document.getElementsByClassName('saleBox')[Math.floor(i/2)].style.display="block";
								}
								if(i%2 == 0){
									statusBtns[i].style.background = "#19A7CE";
									statusBtns[i].nextElementSibling.style.background = "gray";
								}else if(i%2 == 1){
									statusBtns[i].style.background = "#19A7CE";
									statusBtns[i].previousElementSibling.style.background = "gray";
								}
							}else{
								alert("상태 변경에 실패하였습니다.");
							}
						},
						error: data => {
							console.log(data);
						}
					})
				})
			}else{
				statusBtns[i].style.background = "gray";
				statusBtns[i].addEventListener('click', ()=>{
					alert("상품 등록을 해야 상태 변경이 가능합니다.");
				})
			}
		}
	}
}

//	삭제관련 함수 모음 ( checkDelete(), confirmDelete() )
function deleteFunction(){
	checkDelete();
	confirmDelete();
}

//	삭제 체크박스 함수
function checkDelete(){
	const allSelect = document.getElementsByClassName('allSelect')[0];
	allSelect.addEventListener('click', ()=>{
		selectDeletes = document.getElementsByName('selectDelete');
		let count = 0;
		for(const sDel of selectDeletes){
			if(sDel.checked == true){
				count += 1;
			}
		}
		if(count == selectDeletes.length){
			for(const sDel of selectDeletes){
				sDel.checked = false;
			}
		}else{
			for(const sDel of selectDeletes){
				sDel.checked = true;
			}
		}
	})
}

//	삭제버튼 클릭 이벤트 함수 (confirm 띄우기)
function confirmDelete(){
	const deleteBtn = document.getElementsByClassName('deleteBtn')[0];
	deleteBtn.addEventListener('click', ()=>{
		let count = 0;
		selectDeletes = document.getElementsByName('selectDelete');
		for(const sDel of selectDeletes){
			if(sDel.checked == true){
				count++;
			}
		}
		if(count > 0){
			const result = confirm("정말 삭제하시겠습니까?");
			if(result){
				document.getElementById('deleteForm').submit();
			}
		}else{
			alert("삭제할 항목을 선택해주세요.");
		}
	})
}
							
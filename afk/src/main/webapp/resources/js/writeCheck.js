

function writeCheck(){ //글 저장 버튼 클릭시 유효성검사
	var maplist = new Array();
	maplist = $('#xy').val().split('/');
	
	if(document.frm.info_title.value == ""){
		alert("제목을 입력하세요")
		return false;
	}else if(document.frm.info_loc_l.value == ""){
		alert("지역을 선택해 주세요")
		return false;
	}else if(document.frm.info_loc_m.value == ""){
		alert("국가를 선택해 주세요")
		return false;
	}else if(document.frm.info_loc_s.value == ""){
		alert("도시를 선택해 주세요")
		return false;
	}else if(document.frm.info_price.value == ""){
		alert("가격을 지정해 주세요")
		return false;
	}else if(document.frm.info_content.value == "<p>&nbsp;</p>"){
		alert("내용을 입력하세요")
		return false;
	}else if(document.frm.info_map.value == ""){
		alert("장소를 1개 이상 선택해 주세요")
		return false;
	}else if(!(maplist.length-1 <= 3)){
		alert("장소를 3개 이하로 선택해 주세요")
		return false;
	}
}
/**
 * 
 */

function updateCheck(){
	var check = updateform.mb_id.value;
	var msg = "";
	
	 if(document.updateform.mb_pwd.value==""){
		alert("비밀번호를 입력하세요")
		document.updateform.mb_pwd.focus()
		return false;
	}
	else if(document.updateform.mb_pwd1.value==""){
		alert("비밀번호 확인을 입력하세요")
		document.updateform.mb_pwd1.focus()
		return false;
	}

	else if(document.updateform.mb_email.value==""){
		alert("email을 입력하세요")
		document.updateform.mb_email.focus()
		return false;
	}
	else if(document.updateform.mb_phone.value==""){

		alert("전화번호를 입력하세요")
		document.updateform.mb_phone.focus()
	
	}else{
		updateDBCheck();
	}
	updateform.chekId.value = msg;
	

}
function updateCheck1(){
	var check = updateform.mb_id.value;
	var msg = "";
	
	 if(document.updateform.mb_pwd.value==""){
		alert("비밀번호를 입력하세요")
		document.updateform.mb_pwd.focus()
		return false;
	}
	else if(document.updateform.mb_pwd1.value==""){
		alert("비밀번호 확인을 입력하세요")
		document.updateform.mb_pwd1.focus()
		return false;
	}

	else if(document.updateform.mb_email.value==""){
		alert("email을 입력하세요")
		document.updateform.mb_email.focus()
		return false;
	}
	else if(document.updateform.mb_phone.value==""){

		alert("전화번호를 입력하세요" )
		document.updateform.mb_phone.focus()
	
	}
	else if(document.updateform.mb_bank.value==""){
		
		alert("계좌번호를 입력하세요")
		document.updateform.mb_bank.focus()
	}
	else if(document.updateform.mb_loc_phone.value==""){
			
		alert("현지 전화번호를 입력하세요")
		document.updateform.mb_loc_phone.focus()
	}
	else if(document.updateform.mb_address.value==""){
			
		alert("현지 주소를 입력하세요")
		document.updateform.mb_address.focus()	
	}else{
		updateDBCheck1();
	}
	updateform.chekId.value = msg;
}

function updateDBCheck(){
	var params = "mb_id=" + updateform.mb_id.value
		    	+"&mb_pwd=" +updateform.mb_pwd.value
		    	+"&mb_email=" +updateform.mb_email.value
		    	+"&mb_phone=" +updateform.mb_phone.value;
	request = new Request(updateResult, "joinUpdate", "GET", params);
	request.sendRequest();	
	
}
function updateDBCheck1(){
	var params = "mb_id=" + updateform.mb_id.value
		    	+"&mb_pwd=" +updateform.mb_pwd.value
		    	+"&mb_email=" +updateform.mb_email.value
		    	+"&mb_phone=" +updateform.mb_phone.value
		    	+"&mb_bank=" +updateform.mb_bank.value
		    	+"&mb_loc_phone=" +updateform.mb_loc_phone.value
		    	+"&mb_address=" +updateform.mb_address.value;
	request = new Request(updateResult, "joinUpdate1", "GET", params);
	request.sendRequest();	
	
}

function updateResult(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200 ){
			var xmldoc = request.httpRequest.responseText;
			var msg = "";
			console.log(xmldoc);
			
			if( xmldoc > 0){
				alert("회원정보수정이 성공했습니다.")
				location.replace("/afk/mypage");   
			} else {
				alert("회원정보 수정이 실패했습니다.")
			}
			
		}
	} 
	
	
}
function pwdCheck(){
	var check = updateform.mb_pwd.value;
	var msg = "";
	var pattern = /^[A-Za-z0-9]{8,12}$/;
	if(  check.indexOf(" ") > -1 ){
		$('#chekPwd').css("color","red")
		msg ="공백없이 써주세요";
	}else if(!pattern.test(check)){
		$('#chekPwd').css("color","red")
		msg ="영문대소문자,숫자 8~12자리로 입력해주세요"
	}else{
		$('#chekPwd').css("color","blue")
		msg ="사용하실수 있습니다."
	}
	updateform.chekPwd.value = msg;
}
function pwdCheck1(){
	var check = updateform.mb_pwd.value;
	var check1 = updateform.mb_pwd1.value;
	var msg = "";
	if(check != check1){
		$('#chekPwd1').css("color","red")
		msg = "비밀번호가 다릅니다"
	}else{
		$('#chekPwd1').css("color","blue")
		msg = "사용하실수 있습니다."
	}
	updateform.chekPwd1.value = msg;	
}
function realDelete(){
	if(confirm("정말로 탈퇴하시겠습니까?") == true){
		location.replace("/afk/memberDelete");   
	}
}
function NDelete(notice_no, currentPage){
	console.log(currentPage);
	var url = "/afk/noticeDelete?notice_no="+notice_no+"&currentPage="+currentPage;
	if(confirm("이글을 삭제하시겠습니까?") == true){
		
		location.replace(url);
	/*}else{
		location.replace("history.go(-1)");*/
	}
} 
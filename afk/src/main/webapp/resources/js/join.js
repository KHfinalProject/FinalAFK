/**
 * 
 */

function idCheck(){
	var check = inputform.mb_id.value;
	var msg = "";
	var pattern = /^[A-Za-z0-9]{4,12}$/;
	if( check.indexOf(" ") > -1 ){
		$('#chekId').css("color","red")
		msg = " 공백없이 써주세요 !!";
	}else if(! pattern.test(check)){
		$('#chekId').css("color","red")
		msg="영문대,소문자 , 숫자 4 ~12 자리로 입력해 주세요.";	
	}else{
		idDBCheck();
	}
	inputform.chekId.value = msg;
	

}


function idDBCheck(){
	var params = "mb_id=" + inputform.mb_id.value;
	request = new Request(useridResult, "confirmUserId", "GET", params);
	request.sendRequest();	
}
function useridResult(){
	if(request.httpRequest.readyState == 4){
		if(request.httpRequest.status == 200 ){
			var xmldoc = request.httpRequest.responseText;
			var msg = "";
			console.log(xmldoc);
			
			if( xmldoc > 0){
				$('#chekId').css("color","red")
				msg = "이미사용중인 아이디입니다.!!";
			} else {
				$('#chekId').css("color","blue")
				msg = "사용할수있는 아이디 입니다.!!";
			}
			inputform.chekId.value = msg;
		}
	} 
	
	
}
function pwdCheck(){
	var check = inputform.mb_pwd.value;
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
	inputform.chekPwd.value = msg;
}
function pwdCheck1(){
	var check = inputform.mb_pwd.value;
	var check1 = inputform.mb_pwd1.value;
	var msg = "";
	if(check != check1){
		$('#chekPwd1').css("color","red")
		msg = "비밀번호가 다릅니다"
	}else{
		$('#chekPwd1').css("color","blue")
		msg = "사용하실수 있습니다."
	}
	inputform.chekPwd1.value = msg;	
}
function checking(){
	if(document.inputform.mb_id.value==""){
		alert("아이디를 입력하세요")
		document.inputform.mb_id.focus()
		return false;
	}
	else if(document.inputform.mb_pwd.value==""){
		alert("비밀번호를 입력하세요")
		document.inputform.mb_pwd.focus()
		return false;
	}
	else if(document.inputform.mb_pwd1.value==""){
		alert("비밀번호 확인을 입력하세요")
		document.inputform.mb_pwd1.focus()
		return false;
	}
	else if(document.inputform.mb_name.value==""){
		alert("이름을 입력하세요")
		document.inputform.mb_name.focus()
		return false;
	}
	else if(document.inputform.mb_email.value==""){
		alert("email을 입력하세요")
		document.inputform.mb_email.focus()
		return false;
	}
	else if(document.inputform.mb_phone.value==""){

		alert("전화번호를 입력하세요")
		document.inputform.mb_phone.focus()
	}
	
	
}
/**
 * 
 */

function idCheck(){
	var check = inputform.mb_id.value;
	var msg = "";
	var pattern = /^[A-Za-z0-9]{4,12}$/;
	if( check == " "){
		$('#chekId').css("color","red")
		msg = " 공백없이 써주세요 !!";
		
		
	}else if(check == (!pattern.test())){
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
	var pattern = /^[A-Za-z0-9_-]{4,12}$/;
	if( check ==" "){
		msg ="공백없이 써주세요";
	}else if(check ){
		
	}
	inputform.chekPwd.value = msg;
}
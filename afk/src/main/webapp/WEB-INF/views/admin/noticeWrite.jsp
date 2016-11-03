<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">
	.container{
		margin: 0 auto;
		width: 1100px;
	}
</style>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- smarteditor 불러오기-->
<script type="text/javascript" src="/sample/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</script>
</head>
<body>
<div class="container">	
<hr style="border: solid 2px red">
<form id="frm" action="" method="">
	<div class="input-group">
		<span class="input-group-addon" id="sizing-addon2"><b>제 목</b>&nbsp;&nbsp;&nbsp;</span>
		<input name="title" type="text" class="form-control" aria-describedby="sizing-addon2">
	</div>
	<br><br>
	 <textarea name="smarteditor" id="smarteditor" style="width:100%; height:500px;"></textarea>
	<br><br><br>	
</form>
	<div align="right">
		<input class="btn btn-default btn-lg " type="button" value="취소">&nbsp;&nbsp;&nbsp;
		<input class="btn btn-default btn-lg" type="button" value="저장" id="save">
	</div>
<hr style="border: solid 2px red">
</div>
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/sample/resources/smarteditor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //저장 버튼을 클릭시 전송버튼 이벤트
    $("#save").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
        
        //폼 submit
        $("#frm").submit();
    })
})
</body>
</html>
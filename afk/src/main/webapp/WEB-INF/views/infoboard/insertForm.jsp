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
	#map{
		width: 0 auto;
		height: 400px;
		border: 1px solid #ffffff;
		transition: border 0.2s;
	}
	#map:hover{
		border: solid #6699cc 2px;
	}
</style>
<!-- 유효성검사를 위한 js -->
<script src="/afk/resources/js/writeCheck.js"></script>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- smarteditor 불러오기-->
<script type="text/javascript" src="/afk/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</script>
</head>
<body>
<div class="container">	
<hr style="border: solid 2px red">
<form id="frm" name="frm" action="/afk/infoboard/insertBoard" method="post" onsubmit="return writeCheck()">
	<input type="hidden" id="xy" name="info_map" size="300" /> <br>
	<input type="hidden" id="userid" name="info_writer" value="${loginUser.mb_id}">
	<div class="input-group">
		<span class="input-group-addon" id="sizing-addon2"><b>제 목</b>&nbsp;&nbsp;&nbsp;</span>
		<input name="info_title" type="text" class="form-control" aria-describedby="sizing-addon2">
	</div>
	<br>
	<select name="info_loc_l" id="loc_l" onchange="load_country()">
		<option value="" selected>지역선택</option>
		<option value="A" >아메리카</option>
		<option value="B">유럽</option>
		<option value="C">아시아</option>
		<option value="D">오세아니아</option>
		<option value="E">아프리카</option>
	</select>
	&nbsp;
	<select name="info_loc_m" id="loc_m" onchange="load_city()">
		<option value="" selected>국가선택</option>
	</select>
	&nbsp;
	<select name="info_loc_s" id="loc_s">
		<option value="" selected>도시선택</option>
	</select>
	<br><br>
	<div class="input-group">
		<span class="input-group-addon" id="sizing-addon2"><b>가 격</b>&nbsp;&nbsp;&nbsp;</span>
		<input id="price" name="info_price" type="number" class="form-control" aria-describedby="sizing-addon2">
	</div>
	<br><br>
	 <textarea name="info_content" id="smarteditor" style="width:100%; height:500px;"></textarea>
	<br><br><br>	
</form>
	<div>
		<input id="address" type="text" size="80px" placeholder="지역을 검색하세요, 최대 3개 지역까지 저장가능합니다."> 
		<input class="btn btn-success" type="button" value="검색" onclick="codeAddress()">&nbsp;
		<input class="btn btn-success" onclick="deleteMarkers();" type=button value="삭제">
	</div>
	<div id="r"></div>
	<div id="map"></div>
	<br><br>
	<div align="right">
		<input class="btn btn-default btn-lg " type="button" value="취소" onclick="history.go(-1)">&nbsp;&nbsp;&nbsp;
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
        sSkinURI: "/afk/resources/smarteditor/SmartEditor2Skin.html", 
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
    });
})

//국가선택 select박스 ajax 처리로 불러오기 
function load_country(){
	var code = loc_l.value; //지역선택의 밸류값
	
	if(code == ""){//code의 밸류값이 ""(지역선택) 이라면
		$('#loc_m option').each(function(){ //loc_m의 option 요소를
			$('#loc_m option:eq(1)').remove();//loc_m의 option의 1번째를 계속 삭제(0번만 남게됨)
		})
		$('#loc_s option').each(function(){ //loc_s의 option 요소를
			$('#loc_s option:eq(1)').remove();//loc_s의 option의 1번째를 계속 삭제(0번만 남게됨)
		})
	}
	
	$.ajax({
		url : "/afk/location/loadCounrty",
		data : { code : code},
		type : "post",
		dataType : "json",
		success : function(data){
			if(data != null){ //받아온 data가 null이 아니라면
				$('#loc_m option').each(function(){ //loc_m의 option 요소를
					$('#loc_m option:eq(0)').remove();//loc_m의 option의 0번째를 반복삭제(option 항목이 전부 삭제됨)
				})
				$('#loc_s option').each(function(){ //loc_s의 option 요소를
					$('#loc_s option:eq(0)').remove();//loc_s의 option의 0번째를 반복삭제(option 항목이 전부 삭제됨)
				})
				
				$('#loc_m').append('<option value="">국가선택</option>'); //loc_m이라는 id를 가진 selectbox에 국가선택을 붙임
				$('#loc_s').append('<option value="">도시선택</option>'); //loc_s이라는 id를 가진 selectbox에 도시선택을 붙임
				
				for(var i=0; i<data.list.length; i++){//받아온 data배열을 for문을 이용해 option태그로 뿌려줌
					$('#loc_m').append('<option value="' + data.list[i].country_no + '">' + data.list[i].country_name + '</option>');
				}
			}
			
		}
	});
}

//도시선택 selectbox ajax로 불러오기
function load_city(){
	var code = loc_m.value; //지역선택의 밸류값
	
	if(code == ""){//code의 밸류값이 ""(지역선택) 이라면
		$('#loc_s option').each(function(){ //loc_s의 option 요소를
			$('#loc_s option:eq(1)').remove();//loc_s의 option의 1번째를 계속 삭제(0번만 남게됨)
		})
	}
	
	$.ajax({
		url : "/afk/location/loadCity",
		data : { code : code},
		type : "post",
		dataType : "json",
		success : function(data){
			if(data != null){ //받아온 data가 null이 아니라면
				$('#loc_s option').each(function(){ //loc_s의 option 요소를
					$('#loc_s option:eq(0)').remove();//loc_s의 option의 0번째를 반복삭제(option 항목이 전부 삭제됨)
				})
				
				$('#loc_s').append('<option value="">도시선택</option>'); //loc_m이라는 id를 가진 selectbox에 국가선택을 붙임
				
				for(var i=0; i<data.list.length; i++){//받아온 data배열을 for문을 이용해 option태그로 뿌려줌
					$('#loc_s').append('<option value="' + data.list[i].city_no + '">' + data.list[i].city_name + '</option>');
				}
			}
			
		}
	});
}
</script>
<script>
// 구글맵 관련 스크립트(임시)
// In the following example, markers appear when the user clicks on the map.
// The markers are stored in an array.
// The user can then click an option to hide, show or delete the markers.
var map;
var markers = [];
var xy = [];

var geocoder;
var positions = "";

function initMap() {
  geocoder = new google.maps.Geocoder(); 
  var haightAshbury = {lat: 37.5, lng: 127.0124};

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: haightAshbury,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  // This event listener will call addMarker() when the map is clicked.
  map.addListener('click', function(event) {
    addMarker(event.latLng);
  });
}

// Adds a marker to the map and push to the array.
function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
 
  info();
  
}
function clearMarkers() {
	  setMapOnAll(null);
	}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map); 
  }
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
	clearMarkers();
  	markers = [];
  	$('#xy').val(null);
  	positions = "";

}

function info(){
	for(var i = 0; i < markers.length; i++) {
		
		positions += markers[i].getPosition() + "/";
			
		$("#xy").val(positions);
		$(".xyz").val(markers.length);
	}
	positions = "";
}

function codeAddress(){  
    var address = document.getElementById("address").value;  
    var r = document.getElementById("r");  
      
    r.innerHTML = '';  
      
    geocoder.geocode({  
        'address': address  
    }, function(results, status){
        if (status == google.maps.GeocoderStatus.OK) {  
            map.setCenter(results[0].geometry.location);  
            //addMark(results[0].geometry.location.lat(), results[0].geometry.location.lng());  
                          
            for(var i in  results){  
                //r.innerHTML += results[i].formatted_address+',';  
                var li = document.createElement('li');  
                var a = document.createElement('a');  
                //a.href = "javascript:addMark(" + marker.position.lat() + ", " + marker.position.lng() + ");";  
                a.innerHTML = results[i].formatted_address;  
   
                li.appendChild(a);  
                r.appendChild(li);  
            }             
        } else {  
            r.innerHTML = "검색 결과가 없습니다."+status;              
        }  
    });  
}  
</script>
<!-- 구글 아이디로 받아온 구글맵 API 인증키 -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmEzr7dLdGc9EOPrEgBKFkcbT04TLZtSU&callback=initMap"></script>
</body>
</html>
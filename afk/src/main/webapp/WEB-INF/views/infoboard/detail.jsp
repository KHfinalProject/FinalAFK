<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#commentContent{
	width: 980px;
	background-color: #99cccc;
	margin: 0 auto;
	border-top: 1px solid #ccc;
}
#commentContent th{
	padding: 10px;
}
#commentContent td{
	text-align: left;
	border-bottom: 1px solid #ccc;
}
img { max-width:100%; } 
</style>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/afk/resources/css/boarddetail.css" />
<title>detail</title>
<!-- 유효성검사를 위한 js -->
<script src="/afk/resources/js/writeCheck.js"></script>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 셀렉트박스를 위한 부트스트랩 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- 셀렉트 박스를 위한 부트스트랩 JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- starpoint -->
<script src="/afk/resources/flag/raty-2.7.0/vendor/jquery.js"></script>
<script src="/afk/resources/flag/raty-2.7.0/lib/jquery.raty.js"></script>
<script src="/afk/resources/flag/raty-2.7.0/demo/javascripts/labs.js"
	type="text/javascript"></script>

<!-- scr -->
<meta name="author" content="www.mattvarone.com">
<link rel="stylesheet" media="screen,projection"
	href="/afk/resources/flag/sksmatt-UItoTop-jQuery-Plugin-14d6f09/css/ui.totop.css" />
	
	<script>
//아이콘 클릭 시 해당 글 신고 또는 신고 취소

$(function(){
$("#notify").on('click', function(){
	console.log("버튼클릭 되나?")
	
	var info_no = ${board.info_no};
	var user = "${loginUser.mb_id}";
	
	if(user == ""){
		 var check = confirm("로그인이 필요한 기능입니다. 로그인 화면으로 이동하시겠습니까?");
		  if(check){
			  location.href = "../loginView";
		  }
	}else{
		var notified = $('#notify').hasClass('notified');
		
		if(notified == false){
			var check = confirm("이 글을 신고하시겠습니까?");
			console.log("버튼클릭 되나?")
			if(check){
				$.ajax({
					url : "notify",
					type : "post",
					data : {info_no : info_no, user : user},
					success : function(data){
						var count = $('#print_notify').html();
						console.log("notify success");
						alert("신고 처리되었습니다.");
						console.log("신고");
						count++;
						$('#print_notify').html(count);
						$('#notify').removeClass('notify_default');
						$('#notify').addClass('notified');
					},
					error : function(e){
						alert("에러에러에러에러에러에러에러");
					}
				});
			}			
		}else{
			var check = confirm("이 글에 대한 신고를 취소하시겠습니까?");
			if(check){
				$.ajax({
					url : "notifyCencel",
					type : "post",
					data : {info_no : info_no, user : user},
					success : function(data){
						var count = $('#print_notify').html();
						console.log("cancel notify success");
						alert("신고 취소 >.ㅇ");
						count--;
						$('#print_notify').html(count);
						$('#notify').removeClass('notified');
						$('#notify').addClass('notify_default');
					},
					error : function(e){
						alert("신고취소에러에러에러에러에러에러에러");
					}
				});	
			}	
		}	
	}	
});
});
</script>
</head>

<body>
	<!-- header start -->
	<div>header</div>
	<!-- header end -->

	<div class="main1">
		<div class="header-container">
			<div class="bg-blur bg-img">
				<img src="/afk/resources/images/infoboard/img1.PNG" />
			</div>
			<div class="content10">
				<div class="title-box">
					<div class="text-xs">
						<div class="score1 rating-box">
							<!-- <span class="icon">별</span>
						<span class="icon">별</span>
						<span class="icon">별</span>
						<span class="icon">별</span>
						<span class="icon">별</span> -->
						</div>
					</div>
					<div class="text-lg item-inline">${board.info_title }</div>
				</div>
				<div class="info-box">
					<div id="loc_m" class="text-xs label"></div>
					<div id="loc_s" class="text-xs label"></div>
				</div>
			</div>
		</div>
		<div class="boo-bar">
			<div class="boo-center item-inline">
				<div class="report">하트</div>
				<div class="pay">가격</div>
			</div>
		</div>
		<!-- 카운트 -->
		<!-- 카운트 -->
		<div id="notifyCount">
		조회수: ${board.info_count }, &nbsp;&nbsp;&nbsp; 작성자: ${board.info_writer} &nbsp;&nbsp;&nbsp;
		<c:choose>
		<c:when test="${empty loginUser}">
							<button id="notify" class="notify_default" title="로그인 후 신고해주세요">
							<span class="glyphicon glyphicon-thumbs-down"></span>
							</button>
							&nbsp;<span id="print_notify">${board.info_notify}</span>
						</c:when>
						<c:otherwise>	
							<c:if test="${!empty notify}">
							<c:forEach var="n" items="${notify}">
								<c:choose>
								<c:when test="${n.mb_id eq loginUser.mb_id}">
									<button id="notify" class="notified">
									<span class="glyphicon glyphicon-thumbs-down"></span>
									</button>
									&nbsp;<span id="print_notify">${board.info_notify}</span>
								</c:when>
								<c:otherwise>
									<button id="notify" class="notify_default">
									<span class="glyphicon glyphicon-thumbs-down"></span>
									</button>
									&nbsp;<span id="print_notify">${board.info_notify}</span>
								</c:otherwise>
								</c:choose>	
							</c:forEach>
							</c:if>
								
							<c:if test="${empty notify}">
								<button id="notify" class="notify_default">
								<span class="glyphicon glyphicon-thumbs-down"></span>
								</button>
								&nbsp;<span id="print_notify">${board.info_notify}</span>
							</c:if>	
						</c:otherwise>
					</c:choose>	
		</div>
		<div class="detail-board">
			<div class="detail-content">
				${board.info_content}
			</div>
			<div id="map" class="detail-view">지도</div>
			<div class="detail-star">별점주기</div>
			<div class="detail-review">
				<textarea class="comment" name="cm_content"
					style="width: 700px; height: 80px; display: inline-block;"></textarea>
				<input type="button" style="float: right" value="등록" onclick="cmInsert()">
			</div><br>
				<table id="commentContent"></table>
			<br>
			<br>
			<br>
			<div class="debutton">
				<button type="button" class="btn btn-default" style="float: left;" onclick="location.href='/afk/infoboard'">목록보기</button>
				<c:if test="${loginUser.mb_id == board.info_writer}">
				<button class="btn btn-danger" style="float: right;" type="button" onclick="infoDelete(${board.info_no})">삭제하기</button>
				<button type="button" class="btn btn-default" onclick="location.href='/afk/infoboard/updateInfoBoardForm?info_no=${board.info_no}'"
					 style="float: right;" margin-left:"7px;">수정하기</button>
				</c:if>
			</div>
		</div>

	</div>
	<br>
	<script>
		$.fn.raty.defaults.path = '/afk/resources/flag/raty-2.7.0/lib/images';
		$('.score1').raty({readOnly:true, score:5 });
	</script>
	<script
		src="/afk/resources/flag/sksmatt-UItoTop-jQuery-Plugin-14d6f09/js/easing.js"
		type="text/javascript"></script>
	<script
		src="/afk/resources/flag/sksmatt-UItoTop-jQuery-Plugin-14d6f09/js/jquery.ui.totop.js"
		type="text/javascript"></script>
	<script>
        $(document).ready(function() {
            /* var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear'
            }; */
				favselect(); //페이지 로딩되자마자 즐겨찾기 상태 불러오기
            	cmList(); //페이지 로딩되자마자 댓글 목록 불러오기
            	loadCountry(); //페이지 메인에있는 국가명 불러오기
			
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
        
        //댓글 목록을 불러옴
        function cmList(){
        	$.ajax({
        		url:"/afk/infoboard/selectBoardComment",
        		data:{bno: "${board.info_no}"},
        		type:"post",
        		dataType:"json",
        		success: function(data){
        			var user = "${loginUser.mb_id}"; //로그인유저 아이디를 뽑아 변수로만듬
        			var result = "";
        			if(data.length > 0){       				
        				for(var i in data){
        					result += "<tr><td width='10%'>" + data[i].cm_writer + "</td>";
        					result += "<td width='75%'>"+ data[i].cm_content + "</td>";
        					result += "<td width='15%'>" + data[i].cm_date;
        					if(data[i].cm_writer == user){
        					result += "&nbsp;&nbsp;&nbsp;<input type='button' value='X' onclick='cmDelete("+ data[i].cm_no +")'>";
        					}
        					result += "</td></tr>";
        				}
        				$('#commentContent').append(result);
        			}
        		}
        	})
        }
        
        //댓글 삽입 ajax
        function cmInsert(){
        	var content = $('.comment').val(); //textarea의 값 가져오기
    
        	$.ajax({
        		url:"/afk/infoboard/insertBoardComment",
        		data:{cm_writer:"${loginUser.mb_id}",
        			  cm_board_no:"${board.info_no}",
        			  cm_content: content},
        		type:"post",
        		dataType:"json",
        		success: function(data){
        			if(data > 0){
        				$("#commentContent").empty();
        				cmList();
        			}
        		}
        	})
        }
        
        //댓글 삭제 ajax
        function cmDelete(cno){
        	var content = $('.comment').val(); //textarea의 값 가져오기
    		if(confirm("정말로 댓글을 삭제하시겠습니까?")==true){
	        	$.ajax({
	        		url:"/afk/infoboard/deleteBoardComment",
	        		data:{cno: cno},
	        		type:"post",
	        		dataType:"json",
	        		success: function(data){
	        			if(data > 0){
	        				$("#commentContent").empty();
	        				cmList();
	        			}
	        		}
	        	})
    		}
        }
        
        //즐겨찾기 상태 확인 ajax
        //사용자가 페이지에 들어가는순간 즐겨찾기를 했는지 안했는지를 판단해 즐겨찾기 아이콘 상태를 변경해줌
        function favselect(){
        	$.ajax({
        		url : "/afk/infoboard/selectBoardReport",
        		data : {fa_bd_no :"${board.info_no}", 
        				fa_mb_id : "${loginUser.mb_id}"},
       			type : "post",
       			dataType : "json",
       			success : function(data){
       				//값이 null이 아닐 시
       				$(".report").html("<img src='/afk/resources/images/favorite_check.png' onclick='favDelete(" + data.fa_id + ")'>");
        		},error : function(data){
        			//값이 null일 시
       				$(".report").html("<img src='/afk/resources/images/favorite_none.png' onclick='favInsert()'>");
        		}		
        	})
        }
        
        //즐겨찾기 아이콘을 클릭시 즐겨찾기 추가 ajax발동
        function favInsert(){
        	if(confirm("이 글을 찜목록에 추가하시겠습니까?")== true){	
	        	$.ajax({
	        		url : "/afk/infoboard/insertBoardReport",
	        		data : {fa_bd_no :"${board.info_no}", 
	        				fa_mb_id : "${loginUser.mb_id}"},
	        		type : "post",
	        		dataType : "json",
	        		success : function(data){
	        			if(data > 0){
	        				$(".report").empty();
	        				favselect();
	        			}
	        		}
	        	})
        	}
        }
        
      //즐겨찾기 아이콘을 클릭시 즐겨찾기 삭제 ajax발동
        function favDelete(no){
        	if(confirm("이 글을 찜목록에서 삭제하시겠습니까?")== true){
	        	$.ajax({
	        		url : "/afk/infoboard/deleteBoardReport",
	        		data : {no: no},
	        		type : "post",
	        		dataType : "json",
	        		success : function(data){
	        			if(data > 0){
	        				$(".report").empty();
	        				favselect();
	        			}
	        		}
	        	})
        	}
        }
      //페이지열때 국가명 갖고오기
        function loadCountry(){
      	  $.ajax({
      		  url : "/afk/location/city",
      		  data : {loc : '${board.info_loc_s}'},
      	  	  type : "post",
      	  	  dataType : "json",
      	  	  success : function(data){
      	  		  console.log(data);
      	  		  $('#loc_m').html(data.mName);
      	  		  $('#loc_s').html(data.sName);
      	  	  }
      	  })
        }
    </script>
<script>

// In the following example, markers appear when the user clicks on the map.
// The markers are stored in an array.
// The user can then click an option to hide, show or delete the markers.

//map에서 문자열 추출
var loadMap = "${board.info_map}"; //불러온 map 정보 변수에 삽입
var maplist = loadMap.split('/');	//map '/'을 기준으로 분할해 배열에 삽입
var mapX = new Array;
var mapY = new Array;	//x, y 좌표들을 집어넣을 빈 배열 변수 생성

for(var i = 0 ; i<maplist.length-1; i++){ //x좌표 y좌표 분리해서 각 배열에 삽입
	mapX.push(maplist[i].substring(maplist[i].indexOf("(") + 1, maplist[i].indexOf(",")));
	mapY.push(maplist[i].substring(maplist[i].indexOf(",") + 1, maplist[i].indexOf(")")));
};

var map;
var markers = [];
var xy = [];

var positions = "";

function initMap() {
  //Number타입으로 형변환 후 가장 첫번째 x,y좌표를 이용해  지도생성
  var haightAshbury = {lat: Number(mapX[0]), lng: Number(mapY[0])}; 

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: haightAshbury,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  for(var i = 0 ; i<maplist.length-1; i++){ //불러온 좌표들 마커 찍어주기
	  	addMarker({lat: Number(mapX[i]) , lng: Number(mapY[i])});
	};
}

// Adds a marker to the map and push to the array.
function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}

</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmEzr7dLdGc9EOPrEgBKFkcbT04TLZtSU&callback=initMap"></script>
</body>
</html>
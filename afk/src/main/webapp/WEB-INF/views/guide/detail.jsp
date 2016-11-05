<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>가이드 상세 상품 보기</title>
     
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
     
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	

  <!--jQuery ui css파일-->
  <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
  
   <!--jQuery ui js파일(달력용)-->
  <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

  <script>
 
  /*별 클릭 시 찜하기 추가, 다시 클릭하면 삭제*/
  function add_favorite(obj){
	  var check = $(obj).children('span').hasClass('glyphicon glyphicon-star');
	  if(check === false){
		$(obj).children('span').attr('class', 'glyphicon glyphicon-star');
	  }else{
		$(obj).children('span').attr('class', 'glyphicon glyphicon-star-empty');
	  }
  }

  $(function(){

	/*메뉴 고정*/
	var nav = $('#sub_nav');
	$(window).scroll(function(){
		if($(this).scrollTop() > 500){
			nav.addClass('fixing');
		}else{
			nav.removeClass('fixing');
		}
	});

	/*별점용*/
	$(".star_point a").click(function() {
		$(this).nextAll(this).removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
			
		return false;			
	});

	$(".star_point a").click(function(){
		$("#selected_point").text();
			var star_num = $(".star_point .on").length;
			var point = "";

			if(star_num == 1){
				point = 1;
			}else if(star_num == 2){
				point = 2;
			}else if(star_num == 3){
				point = 3;
			}else if(star_num == 4){
				point = 4;
			}else if(star_num == 5){
				point = 5;
			}
		$("#selected_point").text(point);
	});
	
	//아이콘 클릭 시 해당 글 신고
	$("#notify").on('click', function(){
		var gui_no = ${guideItem.gui_no};
		var check = confirm("이 글을 신고하시겠습니까?");
		if(check){
			$.ajax({
				url : "notifyGuideItem",
				type : "post",
				data : {itemNo : gui_no},
				success : function(data){
					var count = $('#print_notify').val();
					console.log("success");
					alert("신고 처리되었습니다.");
					console.log("신고");
					$('#print_notify').val(count + 1);
				}
			});
		}
	})


	/*달력용*/
	$('#datepicker').datepicker({
		dateFormat : 'yy-mm-dd',
		showAnim : "slide",
		showMonthAfterYear : true,
		yearRange : 'c-0:c+2',
		yearSuffix : '년 ',
		changeYear : true,
		changeMonth : true,
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
	});
  });
  
  </script>

  <style type="text/css">

	div { 
		margin : 0 auto;
		vertical-align:middle;
		text-align : center;
		
	}

	#guide_detail_main {
		background-color : #04378c;
		height : 300px;
		margin-bottom : 3%;
	}

	#writer {
		position : absolute;
		top : 70%;
		right : 10%;
		z-index : 1;
	}

	#guide_detail_top {
		width : 100%;
		height : auto;
	}

	/*별점 부분*/
	.star_point {
		font-size: 30px;
		letter-spacing: -4px;
	}

	.star_point a {
		font-size : 30px;
		letter-spacing: 0;
		display : inline-block;
		margin-left: 5px;
		color : #ccc;
		text-decoration : none;
	}

	.star_point a : first-child {
		margin-left : 0;
	}

	.star_point a.on {
		color : #ffcc00; 
	}

	#guide_profile {
		text-align : left; 
		margin-top : 2%;
		float : left;
	}

	#select_num_people {
		width : 100px;
		height : 30px;
		border : 1px solid #ccc;
		border-radius : 5px;
		overflow: hidden;
		background-color : #fff;
		background: #fff;
		margin-bottom : 3%;
	}


	#intro {
	
		font-size : 16pt;
		height : 400px;
	}

	#intro table {
		margin : 0 auto;
		margin-top : 8%;
		margin-left : 8%;
		text-align : left;
		width : 100%;
		height : 80%;
	}

	#intro td {
		border-spacing : 5px;
	}

	#sub_nav {
		display : inline-block;
		clear : both;
		width : 100%;
		margin-top : 2%;
	}

	.fixing {
		display : inline-block;
		z-index: 9999;
		position : fixed;
		left : 0;
		top : 0;
		width : 100%;
	}
	
	#add_favorite {
		width : 150px;
		height : 40px;
		font-size : 14pt;
		color : white;
		background-color :#317d59;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
	}

	#add_favorite span{
		color : yellow;
	}

	#buy_btn {
		width : 150px;
		height : 40px;
		color : white;
		font-size : 14pt;
		background-color : #04378c;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
	}

	#guide_comment {
		width : 100%;
		height : 300px;
	}

	#guide_comment p {
		padding-top : 10%;
		margin : 0 auto;
		width : 70%;
		vertical-align : middle;
		text-align : center;
		font-size : 18pt;
	}

	#item_detail {
		border-top : 1px solid gray;
	}

	#item_pics{
		display : inline-block;
		margin-top : 2%;
		margin-bottom : 3%;
	}

	#item_pics img {
		margin : 0.1%;		
	}

	#item_reviews, #item_reply{
		width : 100%;
		margin-top : 5%;
		padding-top : 5%;
		border-top : 1px solid gray;
	}

	#user_review, #user_rep{
		padding : 1%;
		width : 80%;
		margin-left : 5%;
		text-align : left;
		display : inline-block;	
	}

	#user_rep p {
		width : 100%;
	}

	#write_rep {
		display : block;
	}

	#write_rep textarea{
		width : 70%;
	}

	#revise_remove{
		right : -70%;
		text-align : right;
		z-index: 1;
		visibility : hidden;
	}

	#user_rep:hover #revise_remove{
		visibility : visible;
	}
	

	/*달력용*/
	.ui-datepicker {
		width : 300px;
	}

	.ui-datepicker-header {
		background : #04378c;
	}
 
	.ui-datepicker-calendar {
		background : white;
		color : #000066;
	}

	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a, .ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a
	{ color: red; }

	.ui-datepicker select.ui-datepicker-month, 
	.ui-datepicker select.ui-datepicker-year {
		width : 30%;
		font-size : 13px;
		color : black;
	}


  </style>
 </head>
 <body>
   
  <div class="container">
	<div class="row">
		<div class="col-md-12" id="guide_detail_main">
			guide_detail_main 이미지
			<div id="writer">
				<button id="revise_btn" class="btn btn-default btn-lg">
					수정하기
				</button>
				&nbsp;
				<button id="delete_btn" class="btn btn-default btn-lg">
					삭제하기
				</button>
			</div><!--end of writer-->
		</div><!--guide_detail_main-->
	</div>

	<div id="guide_detail_top">
		<div class="row">
		<div class="col-md-4">
			<div>
				<img src="#" width="100%" height="250px" border="1" alt="">
			</div>

			<div id="guide_profile">
				<table width="100%">
				<tr>
					<td style="font-size:22pt">
						${guide.mb_name}
					</td>
					<td>&nbsp;&nbsp;
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-envelope">쪽지보내기</span>
						</button>
					</td>
				</tr>
			
				<tr style="font-size:12pt">
					<td>
						이메일 
					</td>
					<td>
						${guide.mb_email}
					</td>
				</tr>
				<tr style="font-size:12pt">
					<td>
						현지 연락처
					</td>
					<td>
						${guide.mb_loc_phone}
					</td>
				</tr>	
				</table>	
				
				</div>
			</div>	<!--end of guide_profile-->
			
			<div class="row">
			<div id="intro" class="col-md-6 col-sm-offset-1">
				<table cellpadding="2" border="0">
				<tr>
					<td>지역</td>
					<td colspan="2">${guideItem.area_name}</td>
				</tr>
				<tr>
					<td>국가</td>
					<td colspan="2">${guideItem.country_name }</td>
				</tr>
				<tr>
					<td>주요 장소</td>
					<td colspan="2">${guideItem.city_name }</td>
				</tr>
			
				<tr>
					<td>가격대</td>
					<td colspan="2">${guideItem.gui_price }</td>
				</tr>
				<tr>
					<td>
					<span class="glyphicon glyphicon-eye-open"></span> ${guideItem.gui_count}
					</td>
					<td>
					<span class="glyphicon glyphicon-star" style="color:#ffcc33"></span> ${guideItem.gui_point}
					</td>
					<td>
					<button class="btn btn-default" style="border:none" id="notify"><span class="glyphicon glyphicon-thumbs-down"></span></button> <span id="print_notify">${guideItem.gui_notify}</span>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="margin-left:10%">
						<span class="star_point">
							<a href="#" class="on">★</a>
							<a href="#" class="on">★</a>
							<a href="#" class="on">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
						</span>
						<span style="font-size:12pt; margin-left:5%"><span id="selected_point">3</span>점</span>&nbsp;
						<button class="btn btn-default">별점 주기</button>
					</td>
				</tr>
				</table>
			</div><!--end of intro-->
			</div>
	</div><!--end of guide_detail_top-->
	<div id="sub_nav">
	<div class="row">
		<div class="col-md-6">
			<select name="select_num_people" id="select_num_people">
				<option value="default" selected>인원 선택
				<option value="1">1명
				<option value="2">2명
				<option value="3">3명
				<option value="4">4명
			</select>
			&nbsp;&nbsp;
			<input type="text" name="" id="datepicker" value="날짜 선택">
		</div>
		<div class="col-md-6">
			<button id="add_favorite" onclick="add_favorite(this);" class="btn btn-default"><span class="glyphicon glyphicon-star-empty"></span> 찜하기</button>
	
			<button id="buy_btn" class="btn btn-default">구매하기</button>
		</div>
		
	</div>
	</div><!--end of sub_nav-->

	<div id="item_detail">
		<div id="guide_comment">
			<p>"난 지금 서울인데 서울이 아닌 느낌을 가지고 싶다면 선택하세요 랄라라라라라랄라라랄 예스터데이 얼마트러블 씸소 파어웨이 슈슈슈슈슈나ㅏㅏㅏ다깁ㄱ바ㅣㅏ긩ㅁ르ㅏㅣㅢㅏㅣㅁ"</p>
		</div>
		<div id="item_pics">
			<img src="images/n.jpg" alt="..." class="img-rounded" width="300px" height="200px">
			
			<img src="images/n.jpg" alt="..." class="img-rounded" width="300px" height="200px">
	
			
			<img src="images/n.jpg" alt="..." class="img-rounded" width="300px" height="200px">
			
			<img src="images/n.jpg" alt="..." class="img-rounded" width="300px" height="200px">

			<img src="images/n.jpg" alt="..." class="img-rounded" width="300px" height="200px">

			<img src="images/n.jpg" alt="..." class="img-rounded" width="300px" height="200px">
			
		</div><!--end of item_pics-->

		<div id="item_maps" align="center">
			<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1930.5432756838056!2d129.31058764132314!3d35.534586152691354!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35662d66cf9ecfaf%3A0x2d8f16207dd9335b!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1477440467383" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
			</div>
		</div><!--end of item_maps-->

		<div id="item_reviews">
		<h3>후기</h3>
			<div id="user_review">
				<p><img src="/images/n.jpg" alt="..." class="img-circle" width="50px" height="80px">
				좋았어요 ㅑㅋ캬
				</p>
			</div><!--end of user_review-->

			<div id="user_review">
				<a>
					<img src="images/k.jpg" alt="..." class="img-circle" width="100px" height="100px">
				</a>
				<a>
				좋았어요 ㅑㅋ캬캬ㅑ캬캬캬컄캬캬캬캬캬캬캬캬캬캬캬캬컄캬캬캬컄캬컄캬컄컄캬컄컄캬컄캬캬컄캬<!--후기 보드의 타이틀 불러옴-->	</a>			
			</div><!--end of user_review-->

			<div id="user_review">
				<img src="..." alt="..." class="img-circle" width="100px" height="100px">
				좋았어요 ㅑㅋ캬캬ㅑ캬캬캬컄캬캬캬캬캬캬캬캬캬캬캬캬컄캬캬캬컄캬컄캬컄컄캬컄컄캬컄캬캬컄캬<!--후기 보드의 타이틀 불러옴-->				
			</div><!--end of user_review-->
		</div><!--end of item_reviews-->

		<div id="item_reply">
			
			<div id="write_rep">
				<textarea name="" rows="" cols="" placeholder="이 상품 또는 담당 가이드에 대해 적어주세요"></textarea> 
				<button class="btn btn-primary" style="position:relative; top:-20px; height: 40px">등록</button>
			</div>

			<c:forEach var="comment" items="commentList">
			<div id="user_rep">
				<table width="100%">
					<tr>
						<td width="auto">
							<img src="images/k.jpg" alt="..." class="img-circle" width="50px" height="50px">
						</td>
						<td width="70%">
							${commentList.mb_rename_pic}
						</td>
				
						<td>
							<span id="revise_remove">
								<button class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span></button>
								<button class="btn btn-default"><span class="glyphicon glyphicon-trash"></span></button>
							</span>
						</td>
					</tr>
				</table>				
			</div>
			</c:forEach>
			
		</div><!--end of item_reply-->

	</div><!--end of item_detail-->
	

  </div><!--end of container-->
  
 </body>
</html>

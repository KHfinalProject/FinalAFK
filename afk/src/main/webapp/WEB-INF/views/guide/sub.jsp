<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>가이드 페이지 서브화면</title>
     
    
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

  function abspos(e){
	this.x = e.clientX + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
    this.y = e.clientY + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
    return this;
  }


  $(function(){

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
	body {
		min-width : 350px;
		position : relative;
	}

	div { 
		margin : 0 auto;
		vertical-align:middle;
		text-align : center;
		/*border : 1px solid red;*/
	}

	#guide_sub_main {
		background-color : #04378c;
		height : 300px;
		margin-bottom : 30px;
	}

	#writer {
		position : absolute;
		top : 70%;
		right : 10%;
		z-index : 1;
	}

	#guide_profile {
		text-align : left; 
		margin-top : 20px
	}

	#select {
		float : left;
		/*position : fixed;*/
		margin : 0 auto;
		margin-top : 30px;
		text-align : center;
		transition : top 0.2s ease-in-out;
	}

	#guide_option {
		width : 100%;
		height : 35px;
		border : 1px solid #ccc;
		border-radius : 5px;
		overflow: hidden;
		background-color : #fff;
		background: #fff;
		margin-bottom : 30px;
	}

	#item_box {
		margin : 0.5%;
		padding : 0.5%;
		display : inline-block;
	}

	#item_info td button {
		border : none;
		font-size : 20px;
	}

	#items a {
		text-decoration : none;
		color : #000066;
	}

	#search_box {
		border : none;
		border-bottom : 1px solid #000066;
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
		<div class="col-md-12" id="guide_sub_main">
			guide_sub_main 이미지
			<div id="writer">
				<button id="revise_btn" class="btn btn-default btn-lg">
					글쓰기
				</button>				
			</div><!--end of writer-->
		</div>
	</div>

	<div class="col-md-4">
		<div style="margin-top:50px">
			<img src="#" width="100%" height="250px" border="1" alt="">
		</div>
		<div id="guide_profile">
			<table>
				<tr>
					<td style="font-size:22pt">
						가이드 이름
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
						메일 주소소소ㅗ
					</td>
				</tr>
				<tr style="font-size:12pt">
					<td>
						현지 연락처
					</td>
					<td>
						+82-10-1111-2222
					</td>
				</tr>				
			</table>			
		</div><!--guide_profile-->
		
		<div id="select">
		<div>
			<select name="guide_option" id="guide_option">
				<option value="default" selected>상품 종류
				<option value="가이드투어">가이드투어
				<option value="현지체험">현지체험
				<option value="액티비티">액티비티
				<option value="입장권/티켓">입장권
			</select>
		</div>

		<div>
			<div id="datepicker">
				<!--달력 출력되는 부분-->
			</div>
		</div>
		</div><!--end of select-->
	</div>

	<div class="col-md-8">
		<form>
			<p id="sort_search">
				<input type="text" id="search_box" placeholder="검색어 입력">
				<button id="search_icon"class="btn btn-default" type="submit">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>&nbsp;&nbsp;
				<a href="#">인기순</a> &nbsp;&nbsp;
				<a href="#">조회수순</a> &nbsp;&nbsp;
				<a href="#">별점순</a> &nbsp;&nbsp;
				<a href="#">가격순</a>&nbsp;&nbsp;
			</p>
		 </form>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>

		<section id="item_box">
			<table id="item_info">
				<tr>
					<td colspan="2">
					<div style="width: 200px; height:250px; background: #04378c">여행상품이미지</div>
						<!--<a href="#"><img src="..." alt="..."></a>-->
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품명</td>
					<td rowspan="2" align="right">
					<button id="wish" class="btn btn-default" style="color: #ffcc66" onclick="add_favorite(this)">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</button>
					</td>
				</tr>
				<tr>
					<td align="left"> 여행상품가격</td>
				</tr>
			</table>
		</section>
		<br>
		<button id="read_more" class="btn btn-default btn-block">더보기</button>
	</div>

  </div><!--end of container-->
  
  </body>
</html>

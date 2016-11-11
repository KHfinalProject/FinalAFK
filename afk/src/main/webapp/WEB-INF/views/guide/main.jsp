<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>가이드 페이지 메인화면</title>
     
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
  /*달력용*/
    /*별 클릭 시 찜하기 추가, 다시 클릭하면 삭제*/
  function add_favorite(obj){
	  var check = $(obj).children('span').hasClass('glyphicon glyphicon-star');
	  if(check === false){
		$(obj).children('span').attr('class', 'glyphicon glyphicon-star');
		
		$.ajax({
			url : "addFavorite",
			type : "post",
			data : {user : user, itemNo : itemNo},
			success : function(data){
				alert("즐겨찾기에 보관되었습니다!");
			}
		});
		
	  }else{
		$(obj).children('span').attr('class', 'glyphicon glyphicon-star-empty');
		
		$.ajax({
			url : "removeFavorite",
			type : "post",
			data : {user : user, itemNo : itemNo},
			success : function(data){
				alert("즐겨찾기에서 삭제되었습니다!");
			}
		});
	  }
  }
  
  var code = "gui_no";
  function load_select(cmd){
	  var code = cmd;
	  
	  $.ajax({
			url : "guideMore",
			type : "post",
			data : {code : code},
			dataType : "json",
			success : function(data){
				console.log("success");
				var result = "";
				//var old = $("#loaded_item_list").html();
				
				if(data.length > 0){
					for(var i in data){
						result += "<section id='item_box'>";
						result += "<table id='item_info' style='width:100% table-layout:fixed;'>";
						result += "<tr><td colspan='2'>";
						result += "<a href='guideDetail?itemNo=" + data[i].gui_no + "&writer=" + data[i].gui_writer + "'>";
						result += "<img src='" + data[i].gui_image+ "' width='400px' height='450px' class='img-rounded'>";
						result += "</a></td></tr><tr><td align='left' style='text-overflow:ellipsis; overflow:hidden'>";
						result += "<nobr>" + data[i].gui_title + "</nobr></td><td rowspan='2' align='right'>";
						result += "<button id='wish' onclick='add_favorite(this)'>";
						result += "<span class='glyphicon glyphicon-star-empty' aria-hidden='true'></span>";
						result += "</button></td></tr><tr><td align='left'>";
						result += "<a href='guideSub?writer=" + data[i].gui_writer + "'>" + data[i].gui_writer;
						result += "</a></td></tr><tr><td align='left'>" + data[i].gui_price + "</td>";
						result += "</tr></table></section>";
					}
					$('#loaded_item_list').html(result);
					
				}else{
					result = "<h3>더 이상 불러올 글이 없습니다!</h3>";
					$('#read_more').remove();
				}
								
			},
			error : function(e){
				console.log("error");
			}
  	});
  }

  $(function(){
	/*더보기 클릭 시 다음 리스트 불러오기 기능*/
	var count = Number($('#paging_count').val());
	$('#read_more').click(function(){
		
		count += 5;
		console.log("count : " + count);
		var code = $('#paging_code').val();
		var keyword = $('#paging_keyword').val();
		
		$.ajax({
			url : "/afk/guide/guideMore",
			type : "post",
			data : {page : count, code : code, keyword : keyword},
			dataType : "json",
			success : function(data){
				console.log("success");
				var result = "";
				var old = $("#loaded_item_list").html();
				
				if(data.length > 0){
					for(var i in data){
						result += "<section id='item_box'>";
						result += "<table id='item_info' style='width:100% table-layout:fixed;'>";
						result += "<tr><td colspan='2'>";
						result += "<a href='guideDetail?itemNo=" + data[i].gui_no + "&writer=" + data[i].gui_writer + "'>";
						result += "<img src='" + data[i].gui_image+ "' width='400px' height='450px' class='img-rounded'>";
						result += "</a></td></tr><tr><td align='left' style='text-overflow:ellipsis; overflow:hidden'>";
						result += "<nobr>" + data[i].gui_title + "</nobr></td><td rowspan='2' align='right'>";
						result += "<button id='wish' onclick='add_favorite(this)'>";
						result += "<span class='glyphicon glyphicon-star-empty' aria-hidden='true'></span>";
						result += "</button></td></tr><tr><td align='left'>";
						result += "<a href='guideSub?writer=" + data[i].gui_writer + "'>" + data[i].gui_writer;
						result += "</a></td></tr><tr><td align='left'>" + data[i].gui_price + "</td>";
						result += "</tr></table></section>";
					}
					$('#loaded_item_list').html(old + result);
					
				}else{
					result = "<h3>더 이상 불러올 글이 없습니다!</h3>";
					$('#read_more').remove();
				}
								
			},
			error : function(e){
				console.log("error");
			}
			
		});
	});
	
  });
	  var dates = new Array();
  	  //테스트용 
  	  dates.push("2016-11-16");
  	  dates.push("2016-11-17");
	
	  function addDate(date) {
	      if (jQuery.inArray(date, dates) < 0) 
	          dates.push(date);
	  }
	
	  function removeDate(index) {
	      dates.splice(index, 1);
	  }
	
	  function printArray(){
	  	var printArr = new String;
	  	dates.forEach(function(val){
	  		printArr += val + ", ";
	  	});
	  	$('#print_date').html(printArr);
	  }
	
	  //이미 선택된 날짜면 배열에서 제거
	  function addOrRemoveDate(date) {
	      var index = jQuery.inArray(date, dates); //날짜 배열(dates)에 선택한 날짜(date)가 있는지 확인
	      if (index >= 0) //있다면 배열에서 제거
	          removeDate(index);
	      else 
	          addDate(date);
	      printArray();
	  }
	
	  // Takes a 1-digit number and inserts a zero before it
	  function padNumber(number) {
	      var ret = new String(number);
	      if (ret.length == 1) 
	          ret = "0" + ret;
	      return ret;
	  }
	
	  jQuery(function () {
	      jQuery("#datepicker").datepicker({
	      	minDate : "+2d",
	      	dateFormat : "yy-mm-dd",
	      	showAnim : "slide",
	      	showMonthAfterYear : true,
	      	yearRange : 'c-0:c+2',
	      	yearSuffix : '년 ',
	      	changeYear : true,
	      	changeMonth : true,
	      	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	          onSelect: function (dateText, inst) {
	              addOrRemoveDate(dateText);
	          },
	          beforeShowDay: function (date) {
	        	  
	        	  if(date.length > 0){
	        		  for (var i in dates)
		        		  selected += dates[i] + ", ";
		        	  
		        	  $('#print_date').html(selected);
	        	  }
	        	  
	              var year = date.getFullYear();
	              var month = padNumber(date.getMonth() + 1);
	              var day = padNumber(date.getDate());
	            
	              var dateString = year + "-" + month + "-" + day;
	              
	              var gotDate = jQuery.inArray(dateString, dates);
	              if (gotDate >= 0) {
	                return [true, "ui-state-highlight"];
	              }
	              return [true, ""];
	          }
	      });
	  });
  
	  jQuery(function () {
	      jQuery("#hidden_picker").datepicker({
	      	minDate : "+2d",
	      	dateFormat : "yy-mm-dd",
	      	showAnim : "slide",
	      	showMonthAfterYear : true,
	      	yearRange : 'c-0:c+2',
	      	yearSuffix : '년 ',
	      	changeYear : true,
	      	changeMonth : true,
	      	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	          onSelect: function (dateText, inst) {
	              addOrRemoveDate(dateText);
	          },
	          beforeShowDay: function (date) {
	        	  
	        	  if(date.length > 0){
	        		  for (var i in dates)
		        		  selected += dates[i] + ", ";
		        	  
		        	  $('#print_date').html(selected);
	        	  }
	        	  
	              var year = date.getFullYear();
	              var month = padNumber(date.getMonth() + 1);
	              var day = padNumber(date.getDate());
	            
	              var dateString = year + "-" + month + "-" + day;
	              
	              var gotDate = jQuery.inArray(dateString, dates);
	              if (gotDate >= 0) {
	                return [true, "ui-state-highlight"];
	              }
	              return [true, ""];
	          }
	      });
	  });
	  
  
  </script>

  <style type="text/css">

	div { 
		margin : 0 auto;
		vertical-align:middle;
		text-align : center;
	}

	#main_img {
		position : relative;
		width : 100%;
		margin-bottom : 50px;
	}

	/*main_img 반응형*/
	@media all and (max-width : 450px){
		#main_img{
			position : relative;
			width : 100%;
			height : 100px;
		}
	}
	
	#img_text{
		position : absolute;
		top : 5%;
		left : 5%;
		color : white;
	}
	
	#write_new {
		position : absolute;
		top : 80%;
		right : 5%;
		z-index : 1;
	}
	
	#write_btn {
		width : 150px;
		height : 50px;
		font-size : 15pt;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
		background-color : white;
	}
	
	#write_btn:hover {
		background-color : #e64928;
		color : white;
	}
	
	#write_btn a {
		text-decoration : none;
	}

	#inner {
		text-align: center;
		margin : 0 auto;
	}

	#select {
		float : left;
		position : fixed;
		margin : 0 auto;
		padding : 1%;
		margin-top : 30px;
		text-align : center;
		transition : top 0.2s ease-in-out;
	}
	
	#hidden_select {
		display : none;
	}
	
	@media all and (max-width : 1000px){
		#select table {
			display : none;
		}
		
		#hidden_select {
			display : block;
			clear : both;
			width : 100%;
			height : auto;
		}
	} 

	.select_top {
		position : absolute;
		bottom : 3000px;
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
	
	#items {
		max-width : 1000px;
		padding : 1%;
		margin-left : auto;
	}

	#sort_search {
		position : relative;
		text-align : right;
	}
	
	#item_box {
		width : 400px;
		margin : 2%;
		padding : 0.5%;
		display : inline-block;
	}

	#item_info td button {
		border : none;
		font-size : 20px;
	}
	
	#wish{
		background-color: Transparent;
	    background-repeat:no-repeat;
	    border: none;
	    cursor:pointer;
	    overflow: hidden;
	    outline:none;
	    color: #ffcc66
	}
	
	#wish .glyphicon {
		font-size : 30px;
	}

	#items a {
		text-decoration : none;
		color : #000066;
	}
	
	#item_title{
		display : inline-block;
		width : 300px;
		overflow : hidden;
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
  <div id="container">
  <jsp:include page="../header.jsp"/>
	<div id="main_img">
		<img src="../resources/images/guide/guideMain.jpg" width="100%" height="450px" style="opacity:0.7">
		<div id="img_text">
			<h1><b>가이드와 함께 떠나는 여행</b></h1>
		</div><!-- end of img_text -->
		<c:if test="${loginUser.mb_grade eq 2}">
		<div id="write_new">
			<a href="/afk/guide/insertGuideForm">
			<button id="write_btn">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 글쓰기
			</button>
			</a>
		</div><!-- end of write_new -->
		</c:if>
		
	</div><!--end of div main_img-->
	<div id="inner">
		<div id="hidden_select">
				날짜 선택 : <input type="text" id="hidden_picker">
			<br>
		</div> 
		<div id="select">
			<table>
				<tr>
					<td>
						<div id="datepicker">
							 <!--달력 출력되는 부분-->
						</div>
					</td>
				</tr>
				<tr>
					<td><span>출발일 기준 최소 2일 전까지만 선택 가능합니다.</span></td>
				</tr>
				<tr>
					<td><div id="print_date"></div></td>
				</tr>
			</table>
		</div><!--end of div select-->
		<div id="items">
			<div id="sort_search">
				<form action="guideMain" method="post" >
				<input type="text" id="search_box" name="keyword" placeholder="검색어 입력">
				<button id="search_icon" class="btn btn-default" type="submit">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
				</form>
				<div id="select_order" class="btn-group" role="group">						
					<button type="button" class="btn btn-default" onclick="load_select('gui_point')">별점순</button>	
					<button type="button" class="btn btn-default" onclick="load_select('gui_count')">조회순</button>
					<button type="button" class="btn btn-default" onclick="load_select('gui_enrolldate')">최신순</button>	
					<button type="button" class="btn btn-default" onclick="load_select('gui_price')">가격순</button>
				</div>
			</div>
			
			<div id="loaded_item_list">
			<c:forEach var="firstList" items="${list}">
										
			<section id="item_box">
				<table id="item_info" style="width : 100%; table-layout: fixed;">
					<tr>
						<td colspan="2">
						<a href="guideDetail?itemNo=${firstList.gui_no}&writer=${firstList.gui_writer}">
							<img src="${firstList.gui_image}" width="400px" height="450px" class="img-rounded">
						</a>
						</td>
					</tr>
					<tr>
						<td align="left" style="text-overflow:ellipsis; overflow:hidden">
						<nobr>${firstList.gui_title}</nobr>
						
						</td>
						<td rowspan="2" align="right">
							<button id="wish" onclick="add_favorite(this)">
								<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
							</button>
						</td>
					</tr>
					<tr>
						<td align="left"><a href="guideSub?writer=${firstList.gui_writer}">${firstList.gui_writer}</a></td>
					</tr>
					<tr>
						<td align="left">${firstList.gui_price}</td>
					</tr>
				</table>
			</section>
			</c:forEach>
			</div><!-- end of loaded_item_list -->
			
			<c:if test="${fn:length(list) > 4}">
			<br>
			<button id="read_more" class="btn btn-default btn-block">더보기</button>
			</c:if>

		</div><!--end of div items-->
	</div><!--end of div inner-->
  </div> <!--end of div container-->
<input type="hidden" id="paging_count">
<input type="hidden" id="paging_code">
<input type="hidden" id="paging_keyword">
  
 </body>
</html>

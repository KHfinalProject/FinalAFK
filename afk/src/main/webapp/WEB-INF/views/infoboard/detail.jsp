<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
						<span>후기 한 개</span>
					</div>
					<div class="text-lg item-inline">${boardDetail.info_title }</div>
				</div>
				<div class="info-box">
					<div class="text-xs label">지역</div>
					<div class="text-xs label">세부지역</div>
				</div>
			</div>
		</div>
		<div class="boo-bar">
			<div class="boo-center item-inline">
				<div class="report">하트</div>
				<div class="pay">가격</div>
			</div>
		</div>
		<div class="detail-board">
			<div class="detail-content">
				내용<br> 내용<br> 내용<br>
				<br> 내용<br> 내용<br> 내용<br> 내용<br> 내용<br>
				내용<br> 내용<br> 내용<br> 내용<br> 내용<br>
			</div>
			<div class="detail-view">지도</div>
			<div class="detail-star">별점주기</div>
			<div class="detail-review">
				<textarea class="comment" name="cm_content"
					style="width: 700px; height: 80px; display: inline-block;"></textarea>
				<input type="button" style="float: right" value="등록">
			</div>
			<table id="commentContent">

			</table>
			<br>
			<br>
			<br>
			<div class="debutton">
				<input type="button" value="수정하기"
					onclick="location.href='/afk/infoboard/updateInfoBoardForm?info_no=${boardDetail.info_no}'"
					style="float: right; margin-left: 7px;"> <input
					type="button" value="삭제하기"
					onclick="infoDelete(${boardDetail.info_no})" style="float: right">
			</div>
		</div>

	</div>
	<br>
	<div class="ff">
		<h1>foot</h1>
	</div>
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
			favselect();
			
            $().UItoTop({ easingType: 'easeOutQuart' });

        });
        
        //댓글 삽입 ajax
        /* function cmInsert(){
        	var content = $('.comment').val();
        	
        	$.ajax({
        		url:"",
        		data:{cm_writer:"${loginUser.mb_id}",
        			  cm_board_no:"${boardDetail.info_no}",
        			  cm_content: content},
        		type:"post",
        		
        		
        		
        	})
        } */
        
        //즐겨찾기 상태 확인 ajax
        //사용자가 페이지에 들어가는순간 즐겨찾기를 했는지 안했는지를 판단해 즐겨찾기 아이콘 상태를 변경해줌
        function favselect(){
        	$.ajax({
        		url : "/afk/infoboard/selectBoardReport",
        		data : {fa_bd_no :"${boardDetail.info_no}", 
        				fa_mb_id : "${loginUser.mb_id}"},
       			type : "post",
       			dataType : "json",
       			success : function(data){
       				if(data != null){
       					$(".report").html("<img src='/afk/resources/images/favorite_check.png' onclick='favDelete(" + data.fa_id + ")'>");
       				}else{
       					$(".report").html("<img src='/afk/resources/images/favorite_none.png' onclick='favInsert()'>");
       				}
        		}		
        	})
        }
        
        //즐겨찾기 아이콘을 클릭시 이 자바스크립트가 발동
        function favInsert(){
        	$.ajax({
        		url : "/afk/infoboard/insertBoardReport",
        		data : {fa_bd_no :"${boardDetail.info_no}", fa_mb_id : "${loginUser.mb_id}"},
        		type : "post",
        		dataType : "json",
        		success : function(data){
        			console.log(data);
        			if(data > 0){
        				$(".report").empty();
        				favselect();
        			}
        		}
        	})
        }
        
        function favDelete(no){
        	$.ajax({
        		url : "/afk/infoboard/deleteBoardReport",
        		data : {no: no},
        		type : "post",
        		dataType : "json",
        		success : function(data){
        			console.log(data);
        			if(data > 0){
        				$(".report").empty();
        				favselect();
        			}
        		}
        	})
        }
    </script>
</body>
</html>
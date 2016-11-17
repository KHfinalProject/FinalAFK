<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="/afk/resources/css/jquery.fullPage.css" />
<link rel="stylesheet" type="text/css" href="/afk/resources/css/examples.css" />
<style>
	@font-face{font-family:'typo'; src:url('/afk/resources/fonts/Typo_PapyrusB.ttf') format('truetype');}
	
	/* Fixed header and footer.
	* --------------------------------------- */
	#header, #footer{
		position:fixed;
		z-index:9;
	}

	#header{
		top:0px;
	}
	
	/* Style for our header texts
	* --------------------------------------- */
	h1{
		font-size: 5em;
		font-family: typo;
		color: #fff;
		margin:0;
		padding:0;
	}
	h2{
		font-size: 2em;
		font-family: typo;
		color: #fff;
		margin: 0;
		padding: 0;
	}
	/* Centered texts in each section
	* --------------------------------------- */
	.section{
		text-align:center;
		overflow: hidden;
	}
	#myVideo{
		position: absolute;
		right: 0;
		bottom: 0;
		top:0;
		right:0;
		width: 100%;
		height: 100%;
		background-size: 100% 100%;
 		background-color: black; /* in case the video doesn't fit the whole page*/
  		background-image: /* our video */;
  		background-position: center center;
  		background-size: contain;
   		object-fit: cover; /*cover video background */
		opacity: 0.5;
   		z-index:3;
	}
	/* Layer with position absolute in order to have it over the video
	* --------------------------------------- */
	#section0 .layer{
		position: absolute;
		z-index: 4;
		width: 100%;
		left: 0;
		top: 30%;
	}
	/*solves problem with overflowing video in Mac with Chrome */
	#section0{
		overflow: hidden;
	}
	#slide1{
		background-image: url(/afk/resources/images/bg1.jpg);
	}
	#slide2{
		background-image: url(/afk/resources/images/bg2.jpg);
	}

	#section2{
		background-image: url(/afk/resources/images/db6.jpg);
	}
	.inputbutton {
		display: inline-block;
		font-family: typo;
		padding: 10px 20px;
		margin: 10px 20px;
		border: 2px solid #ffffff;
		color: #ffffff;
		transition:background-color 0.2s, color 0.2s;
	}
	.inputbutton:hover{
		background-color: #ffffff;
		color: black;
	}
	#controll{
		opacity: 0.2;
	}
	#controll:hover{
		opacity: 0.7;
	}
	.header{
		top:0px;
	}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/afk/resources/js/scrolloverflow.js"></script>
	<script type="text/javascript" src="/afk/resources/js/jquery.fullPage.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#fullpage').fullpage({
				verticalCentered: true,
				sectionsColor: ['#000', '#4BBFC3', '#7BAABE', '#9900cc'],
				afterRender: function(){
					//비디오 실행
					$('video').get(0).play();
				}
			});
		});
	</script>
 </head>
 <body>
  <div id="header"></div>
  <div id="fullpage">
	<div class="section " id="section0">
		<video autoplay loop muted id="myVideo">
			<source src="/afk/resources/video/main.mp4" type="video/mp4">
		</video>
		<div class="layer">
                <h1>Away From Keybord</h1>
                <br>
                <h2>수천명의 가이드와 회원들이 제공하는 여행정보들을 확인하세요</h2>
                <br><br>
                <p>
                    <a class="inputbutton" href="/afk/infoboard">여행정보</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="inputbutton" href="/afk/guide/guideMain">가이드정보</a>
                </p>
                <img src="/afk/resources/images/pause.png" id="controll" onclick="playPause()">
		</div>
	</div>
<!--<div class="section" id="section1">
	    <div class="slide" id="slide1"><h1>Slide Backgrounds</h1></div>
	    <div class="slide" id="slide2"><h1>Totally customizable</h1></div>
	</div>
	<div class="section" id="section2"><h1>Lovely images <br />for a lovely page</h1></div>
	<div class="section" id="section3"><h1>One Image = One thousand words</h1></div> -->
</div>
<script type="text/javascript">
	var myVideo = document.getElementById('myVideo');
	var controll = document.getElementById('controll');
	

	function playPause(){
		if(myVideo.paused){
			myVideo.play();
			controll.src="/afk/resources/images/pause.png";
		}else{
			myVideo.pause();
			controll.src="/afk/resources/images/play.png";
		}
	}
</script>
 </body>
</html>
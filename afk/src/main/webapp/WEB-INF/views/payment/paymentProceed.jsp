<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>상품 결제</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
 
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	

  <!-- 아임포트 라이브러리 --> 
<script type="text/javascript"
   src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>
   
</head>
<script type="text/javascript">

function button1_click() {
	var IMP = window.IMP;
	IMP.init('imp77726192'); // 'iamport' 대신 부여받은 "가맹점 식별코드"
	var msg = '';
	
	IMP.request_pay({
		pg : 'html5_inicis', // version 1.1.0부터 지원.
		pay_method : $("#pay_method option:selected").val(), // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
		merchant_uid : 'merchant_'
		+ new Date().getTime(),
		name : '주문번호 : 결제테스트',
		amount : $(".price").val(),
		buyer_email : $("#email").val(),
		buyer_name : $("#userName").val(),
		buyer_tel : $("#phone").val(),
		}, function(rsp) {
			if (rsp.success) {
				msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				
				//alert('결제가 성공하였습니다.');
				
				//location.replace("/afk/paymentComplete");
				
				var form = document.createElement('form');
				form.method = 'post';
				form.action = '/afk/insertPayment';
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'userId';
				input.value = "${loginUser.mb_id}";
				$(form).append(input);
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'userName';
				input.value = "${loginUser.mb_name}";
				$(form).append(input);
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'email';
				input.value = $('#email').val();
				$(form).append(input);
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'phone';
				input.value = $('#phone').val();
				$(form).append(input);
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'depart_date';
				input.value = $('#dDate').val();
				$(form).append(input);
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'travel_num';
				input.value = $('#num').val();
				$(form).append(input);
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'itemNo';
				input.value = ${item.gui_no};
				$(form).append(input);
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'price';
				input.value = ${item.gui_price};
				$(form).append(input);
				
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'guideId';
				input.value = "${guideId}";
				$(form).append(input);
				
				$('#body').append(form);
				form.submit();
				
			} else {
				msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
	});

	window.alert(msg);
}
</script>

<style type="text/css">
	div {
		/*border : 1px solid red;*/
	}
	
	#img {
		float : left;
		margin-top : 50px;
		margin-bottom : 50px;
	}

	#info {
		padding-left : 30px;
		margin-top : 50px;
		margin-bottom : 50px;
	}

	#info table{
		height : 300px;
	}

	#amount {
		margin-top : 30px;
		padding-top : 20px;
		border-top : 1px solid #c1c1c1;
		margin-bottom : 40px;
		font-size : 18pt;
	}

	#buy_btn {
		width : 150px;
		height : 40px;
		color : white; 
		font-size : 18pt;
		background-color : #04378c;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
	}

	#cancel_btn {
		width : 150px;
		height : 40px;
		font-size : 18pt;
		background-color : white;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
	}

	#btns {
		text-align : center;
		margin-bottom : 50px;
	}

	#btns button:hover {
		background-color : #e64928;
		color : white;
	}
	
	.pay {
		
		border-spacing : 20px;
		border-collapse : separate;
		font-size : 13pt;
	}
	
	input {
		border : none;
		border-bottom : 1px solid #000066;
	}
	
</style>

<body>
<jsp:include page="../header.jsp"/>
<div class="container">
	<div class="jumbotron">
		<h1>상품 결제</h1>
	</div><!--end of jumbotron-->

	<div id="detail">
		<div class="row" style="padding-left:5%">
			<div id="img" class="col-md-4" style="width=350px; height=400px;">
				<a href="/afk/guide/guideDetail?itemNo=${item.gui_no}&writer=${guideId}">
				<img src="${item.gui_image }" width=350px; height=400px; />
				</a>
			</div><!--end of img-->
			<div id="info" class="col-md-8">
				<table class="pay">
				<tr>
					<td>상품명: </td>
					<td><h4><b>${item.gui_title}</b></h4></td>
				</tr>
				<tr>
					<td width="50%">출발일</td>
					<td>${date}
					<input type="hidden" id="dDate" value="${date }">
					</td>
				</tr>
				<tr>
					<td>회원 이름</td>
					<td>
						${loginUser.mb_name}
						<input type="hidden" id="userName" value="${loginUser.mb_name }">
					</td>
				</tr>
				<tr>
					<td>회원 이메일</td>
					<td><input type="text" id="email" value="${loginUser.mb_email}" required/></td>
				</tr>
				<tr>
					<td>회원 연락처</td>
					<td><input type="text" id="phone" value="${loginUser.mb_phone}" required/></td>
				</tr>	
				<tr>
					<td>담당 가이드</td>
					<td><a href="/afk/guide/guideSub?writer=${guideId}">${guideName}</a></td>
				</tr>
				<tr>
					<td>인원수</td>
					<td><input type="number" id="num" value="${num}" required/></td>
				</tr>
				<tr>
					<td>결제방식</td>
					<td><select id="pay_method">
						<option value="card">카드결제</option>
						<option value="trans">실시간계좌이체</option>
						<option value="vbank">가상계좌</option>
						<option value="phone">휴대폰소액결제</option>
					
					</select>
					</td>
				</tr>
				</table>
			</div><!--end of info-->
		</div>
		
		<div id="amount">
			<div class="row">
				<div class="col-md-3 col-sm-offset-1" style="float:left"><span>결제금액 : <span></div>
				<div class="col-md-3 col-md-offset-2" style="float:right"><span id="total_amount">${item.gui_price}</span><span>원</span></div>
			</div>
		</div>

			<div id="btns">
				<button type="button" id="cancel_btn" onclick="location='guide/guideMain'">취소</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="buy_btn" onclick="button1_click();">결제</button>
			</div><!--end of btns-->

	</div><!--end of detail-->

</div><!--end of container-->
<input type="hidden" class="price" value="${item.gui_price}">
<jsp:include page="../footer.jsp"/>


</body>
</html>


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

<script type="text/javascript" src="/arm/js/jquery-3.1.0.min.js"></script>
	

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
		name : '주문번호 : 결제테스트' ,
		amount : 14000,
		buyer_email : 'kmgibong@naver.com',
		buyer_name : '강명규',
		buyer_tel : '010-3038-9466',
		}, function(rsp) {
			if (rsp.success) {
				msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				
			} else {
				msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
	});

	window.alert(msg);
}

/* $('.pay_btn').on('click', function() {			
	var IMP = window.IMP;
	IMP.init('imp77726192'); // 'iamport' 대신 부여받은 "가맹점 식별코드"
	var msg = '';
	IMP.request_pay({
		pg : 'html5_inicis', // version 1.1.0부터 지원.
		pay_method : $("#pay_method option:selected").val(), // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
		merchant_uid : 'merchant_'
		+ new Date().getTime(),
		name : '주문번호 : ' + $(".pNo").val(),
		amount : $(".pPrice").val(),
		buyer_email : $(".mEmail").val(),
		buyer_name : $(".mName").val(),
		buyer_tel : $(".mTel").val(),
		}, function(rsp) {
			if (rsp.success) {
				msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;

				var form = document.createElement("form");
				form.method = 'post';
				form.action = '/arm/PurchaseUpdate';
				
				var input = document.createElement("input");
				input.type = "hidden";
				input.name = 'purchaseNo';
				input.value = $(".pNo").val();
				$(form).append(input);
				
				$('#body').append(form);
				form.submit();
			} else {
				msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
	});

	window.alert(msg);
}); */
</script>

<style type="text/css">
	div {
		/*border : 1px solid red;*/
	}
	
	#img {
		float : left;
	}

	#info {
		padding-left : 30px;
	}

	#info table{
		height : 200px;
	}

	#amount {
		margin-top : 30px;
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
	}

	#btns button:hover {
		background-color : #e64928;
		color : white;
	}

</style>

<body>

<div class="container">
	<div class="jumbotron">
		<h1>상품 결제</h1>
	</div><!--end of jumbotron-->

	<div id="detail">
		<div class="row" style="padding-left:5%">
			<div id="img" class="col-md-4" style="width:200px; height:200px; background-color:#333399">
				이미지 넣기
			</div><!--end of img-->
			<div id="info" class="col-md-8">
				<table class="pay">
				<tr>
					<td colspan="2"><h3>상품명</h3></td>
				</tr>
				<tr>
					<td width="70%">출발일</td>
					<td>2016-10-23</td>
				</tr>
				<tr>
					<td>담당 가이드</td>
					<td>ㅋㅋㅋ</td>
				</tr>
				<tr>
					<td>인원수</td>
					<td>1</td>
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
				<div class="col-md-3 col-sm-offset-1"><span>결제금액 : <span></div>
				<div class="col-md-3 col-md-offset-2"><span id="total_amount">10000</span><span>원</span></div>
			</div>
		</div>

			<div id="button">
				<button type="button" id="cancel_btn">취소</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="buy_btn" onclick="button1_click();">결제</button>
			</div><!--end of btns-->
			
<%-- 				<input type="hidden" class="pNo" value="1">
				<input type="hidden" class="pPrice" value="14000">
				<input type="hidden" class="mEmail" value="god9467">
				<input type="hidden" class="mName" value="${loginUser.mb_name}">
				<input type="hidden" class="mTel" value="${loginUser.mb_phone}"> --%>

	</div><!--end of detail-->

</div><!--end of container-->

</body>
</html>


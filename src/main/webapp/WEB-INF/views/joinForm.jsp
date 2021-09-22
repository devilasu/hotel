<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="/resources/hotelRoom.css">
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<br><br><br><br>
	<div class="row">
		<span class="col-md-3"></span>
		<h1 class="col-md-6">회원가입</h1>
	</div>
	<div class="row jumbotron">
	<span class="col-md-3"></span>
		<form class="col-md-12" action="/join" id="joinForm" method="get">
			<div class="row">
				<p class="col-md-2">이름 :</p>
				<input class="col-md-4" type="text" name="name" required>
			</div>
			<div class="row">
				<p class="col-md-2">아이디:</p>
				<input class="col-md-4" type="text" name="id" required>
			</div>
			<div class="row">
				<p class="col-md-2">비밀번호 :</p>
				<input class="col-md-4" type="password" id="password" name="password" required>
			</div>
			<div class="row">
				<p class="col-md-2">비밀번호 확인 :</p>
				<input class="col-md-4" type="password" id="confirm_password" required>
			</div>
			<div class="row">
				<a class="col-md-3 btn btn-danger" href="/">돌아가기</a>
				<input class=" col-md-3 btn btn-success" type="submit" value="가입">
			</div>
		</form>
	</div>
</div>
</body>
<script>
	$("#joinForm").submit(function(){
		if($("#password").val() == $("#confirm_password").val())
			$("#joinForm").submit();
		return false;
	})
</script>
</html>
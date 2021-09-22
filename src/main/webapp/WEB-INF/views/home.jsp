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
	<title>Home</title>
</head>
<body>
<div class = "container">
	<br><br><br><br>
	<form class="jumbotron" action="/login" method="post">
		<div class="row">
			<p class="col-md-2 col-md-offset-3">USER ID:</p>
			<input class="col-md-3" type="text" name="id">
		</div>
		<div class="row">
			<p class="col-md-2 col-md-offset-3">PASSWORD:</p>
			<input class="col-md-3" type="password" name="password">
		</div>
		<div class="row">
			<input class= "col-md-2 btn btn-primary col-md-offset-3" type="submit" value="로그인">
			<a class="btn col-md-2 btn-success" href="/joinForm">회원가입</a>
		</div>
	</form>
</div>
</body>
</html>

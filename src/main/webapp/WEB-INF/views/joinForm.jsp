<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join Form</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<form action="/join" id="joinForm" method="get">
	<p>이름 : <input type="text" name="name"></p>
	<p>아이디	: <input type="text" name="uid"></p>
	<p>비밀번호 : <input type="password" id="password" name="password"></p>
	<p>비밀번호 확인 : <input type="password" id="confirm_password"></p>
	<input type="submit" value="가입">
	<a href="/">돌아가기</a>
	<a href="/loginForm">로그인</a>
</form>
</body>
<script>
	$("#joinForm").submit(function(){
		if($("#password").val() == $("#confirm_password").val())
			$("#joinForm").submit();
		return false;
	})
</script>
</html>
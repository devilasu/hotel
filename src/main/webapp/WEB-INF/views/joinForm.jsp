<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join Form</title>
</head>
<body>
<form action="/join" method="get">
	<p>이름 : <input type="text" name="name"></p>
	<p>아이디	: <input type="text" name="uid"></p>
	<p>비밀번호 : <input type="password" name="password"></p>
	<p>비밀번호 확인 : <input type="password" name="confirm-password"></p>
	<p>모바일: <input type="tel" name="mobile"></p>
	<input type="submit" value="가입">
	<a href="/">돌아가기</a>
	<a href="/loginForm">로그인</a>
</form>
</body>
</html>
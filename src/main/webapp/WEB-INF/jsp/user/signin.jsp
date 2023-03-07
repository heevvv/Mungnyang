<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
		<!-- 큰 박스-->
		<div id="wrap">
		<header class="bg-danger text-center">
			<h1>𝑀𝑢𝑛𝑔𝑛𝑦𝑎𝑛𝑔𝑃𝑙𝑎𝑐𝑒</h1>
		</header>
		<section class="contents bg-success d-flex justify-content-center">
			<div class="join-box bg-warning pt-3">
				<h2 class="text-center mt-5">𝐿𝑜𝑔𝑖𝑛</h2>
				<h6>아이디</h6>
				<input type="text" placeholder="*아이디를 입력하세요." id="loginIdInput" class="form-control">
				<h6>비밀번호</h6>
				<input type="password" placeholder="*비밀번호를 입력하세요." id="passwordInput" class="form-control">


				<button id="loginBtn" type="submit" class="btn btn-primary btn-block mt-3">로그인</button>
	
					<div class="p-3 d-flex justify-content-center align-items-start  border rounded mt-5 p-3">
						계정이 없으신가요? <a href="/user/signup/view">가입하기</a>
					</div>			
			
			</div>
		</section>
		
		<footer class="bg-info">
			<div class="text-center">Copyright 2021. All rights reserved.</div>
		</footer>
	</div>

</body>
</html>
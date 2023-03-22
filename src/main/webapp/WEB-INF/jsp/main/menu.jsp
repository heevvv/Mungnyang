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
			<c:if test="${not empty userId }">
				<div class="d-flex justify-content-end">${userName }님 <a href="/user/signout">로그아웃</a></div>
			</c:if>
		</header>
		
		
		<section class="contents bg-success d-flex justify-content-center">
			<div class="main-box bg-warning pt-2">
				<h2 class="text-center mt-5">𝑀𝑎𝑖𝑛</h2>

			<div class="mt-3 p-4 text-center">
				<img src="https://cdn.pixabay.com/photo/2018/05/26/18/06/dog-3431913_960_720.jpg" width="300">
				<img src="https://cdn.pixabay.com/photo/2018/05/26/18/06/dog-3431913_960_720.jpg" width="300">
				
				</div>
				<div class="main-menu ml-3 d-flex justify-content-center">
					<div class="mr-5 pr-5">
						<a href="/post/timeline/view"><h4>멍냥정보공유</h4></a>
					</div>
					<div class="ml-5 pl-5">
						<a href="/search/list/view"><h4>멍냥병원찾기</h4></a>
					</div>
				</div>

			</div>
		</section>
		
		
		<footer class="bg-info">
			<div class="text-center">Copyright 2023. All rights reserved.</div>
		</footer>
		
	</div>
	<!--  큰 박스 -->


</body>
</html>
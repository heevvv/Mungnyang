<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<header class="bg-danger text-center">
			<h1>𝑀𝑢𝑛𝑔𝑛𝑦𝑎𝑛𝑔𝑃𝑙𝑎𝑐𝑒</h1>
		</header>
		<section class="contents bg-success d-flex justify-content-center">
			<div class="join-box bg-warning">
				<h2 class="text-center">𝑠𝑖𝑔𝑛 𝑢𝑝</h2>
				<h6>아이디</h6>
				<input type="text" placeholder="*아이디를 입력하세요." id="idInput" class="form-control">
				<h6>비밀번호</h6>
				<input type="password" placeholder="*비밀번호를 입력하세요." id="passwordInput" class="form-control">
				<h6>비밀번호 확인</h6>
				<input type="password" placeholder="*비밀번호를 다시 한번 입력하세요." id="passwordConfirmInput" class="form-control">
				<h6>이름</h6>
				<input type="text" placeholder="*이름을 입력하세요." id="nameInput" class="form-control">
				<h6>이메일</h6>
				<input type="text" placeholder="*이메일을 입력하세요." id="emailInput" class="form-control">
				<h6>반려동물 이름</h6>
				<input type="text" placeholder="*반려동물 이름을 입력하세요." id="petnameInput" class="form-control">
				<button type="button" id="joinBtn" class="btn btn-primary btn-block mt-2">회원가입</button>
				
				<div class="mt-4 p-3 d-flex justify-content-center align-items-start  border rounded">
					계정이 있으신가요? <a href="/user/signin/view">로그인</a>
				</div>
			</div>
		</section>
		
		<footer class="bg-info">
			<div class="text-center">Copyright 2021. All rights reserved.</div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			$("#joinBtn").on("click", function() {
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				let petname = $("#petnameInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return ;
				}
				
				if(passwordConfirm == "") {
					alert("비밀번호를 다시 한번 입력하세요.");
					return ;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다.");
					return ;
				}
				
				if(name == "") {
					alert("이름을 입력하세요.");
					return ;
				}
				
				if(email == "") {
					alert("이메일을 입력하세요.")
					return ;
				}
				
				if(petname == "") {
					alert("반려동물 이름을 입력하세요.")
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId":id, "password":password, "name":name, "email":email, "petname":petname}
					, success:function(data) {
						if(data.result == "success") {
							alert("성공적으로 회원가입 되었습니다.");
							location.href = "/user/signin/view";
						} else {
							alert("회원가입 실패");
						}
					}
					
					
					, error:function() {
						alert("회원가입 에러");
					}
					
					
					
					
					
				});
				
				
			});
		});
	
	
	</script>


</body>
</html>
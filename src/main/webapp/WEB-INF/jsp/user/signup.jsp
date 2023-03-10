<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>νμκ°μ</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<header class="bg-danger text-center">
			<h1>ππ’ππππ¦ππππππππ</h1>
		</header>
		<section class="contents bg-success d-flex justify-content-center">
			<div class="join-box bg-warning">
				<h2 class="text-center">π πππ π’π</h2>
				<h6>μμ΄λ</h6>
				<div class="d-flex mt-3">
					<input type="text" placeholder="*μμ΄λλ₯Ό μλ ₯νμΈμ." id="loginIdInput" class="form-control">
					<button type="button" class="btn btn-info btn-sm ml-2" id="isDuplicateBtn">μ€λ³΅νμΈ</button>
				</div>
					<div class="small text-success d-none" id="availableText">μ¬μ©κ°λ₯ν μμ΄λ μλλ€.</div>
					<div class="small text-danger d-none" id="duplicateText">μ€λ³΅λ μμ΄λ μλλ€.</div>

				<h6>λΉλ°λ²νΈ</h6>
				<input type="password" placeholder="*λΉλ°λ²νΈλ₯Ό μλ ₯νμΈμ." id="passwordInput" class="form-control">
				<h6>λΉλ°λ²νΈ νμΈ</h6>
				<input type="password" placeholder="*λΉλ°λ²νΈλ₯Ό λ€μ νλ² μλ ₯νμΈμ." id="passwordConfirmInput" class="form-control">
				<h6>μ΄λ¦</h6>
				<input type="text" placeholder="*μ΄λ¦μ μλ ₯νμΈμ." id="nameInput" class="form-control">
				<h6>μ΄λ©μΌ</h6>
				<input type="text" placeholder="*μ΄λ©μΌμ μλ ₯νμΈμ." id="emailInput" class="form-control">
				<h6>λ°λ €λλ¬Ό μ΄λ¦</h6>
				<input type="text" placeholder="*λ°λ €λλ¬Ό μ΄λ¦μ μλ ₯νμΈμ." id="petnameInput" class="form-control">
				<button type="button" id="joinBtn" class="btn btn-primary btn-block mt-2">νμκ°μ</button>
				
				<div class="mt-4 p-3 d-flex justify-content-center align-items-start  border rounded">
					κ³μ μ΄ μμΌμ κ°μ? <a href="/user/signin/view">λ‘κ·ΈμΈ</a>
				</div>
			</div>
		</section>
		
		<footer class="bg-info">
			<div class="text-center">Copyright 2021. All rights reserved.</div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			
			var isDuplicateCheck = false;
			var isDuplicateId = true;
			
			$("#isDuplicateBtn").on("click", function() {
				let id = $("#loginIdInput").val();
				
				if(id == "") {
					alert("μμ΄λλ₯Ό μλ ₯νμΈμ");
					return ;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate_id"
					, data:{"loginId":id}
					, success:function(data) {
						isDuplicateCheck = true;
						
						if(data.is_duplicate) { // μ€λ³΅λ μν
							
							isDuplicateId = true;
							$("#duplicateText").removeClass("d-none");
							$("#availableText").addClass("d-none");
						} else { //μ€λ³΅ μλ μν
							
							isDuplicateId = false;
							$("#availableText").removeClass("d-none");
							$("#duplicateText").addClass("d-none");
						}
						
					}
					, error:function() {
						alert("μ€λ³΅νμΈ μλ¬");
					}
				});
				
			});
			
			$("#joinBtn").on("click", function() {
				let id = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				let petname = $("#petnameInput").val();
				
				if(id == "") {
					alert("μμ΄λλ₯Ό μλ ₯νμΈμ.");
					return ;
				}
				
					if(!isDuplicateCheck) {
						alert("μμ΄λ μ€λ³΅ νμΈμ ν΄μ£ΌμΈμ.");
					return ;
				}

				if(isDuplicateId) {
					alert("μ‘΄μ¬νλ μμ΄λ μλλ€.");
					return ;
				}
				
				if(password == "") {
					alert("λΉλ°λ²νΈλ₯Ό μλ ₯νμΈμ.");
					return ;
				}
				
				if(passwordConfirm == "") {
					alert("λΉλ°λ²νΈλ₯Ό λ€μ νλ² μλ ₯νμΈμ.");
					return ;
				}
				
				if(password != passwordConfirm) {
					alert("λΉλ°λ²νΈκ° μΌμΉνμ§ μμ΅λλ€.");
					return ;
				}
				
				if(name == "") {
					alert("μ΄λ¦μ μλ ₯νμΈμ.");
					return ;
				}
				
				if(email == "") {
					alert("μ΄λ©μΌμ μλ ₯νμΈμ.")
					return ;
				}
				
				if(petname == "") {
					alert("λ°λ €λλ¬Ό μ΄λ¦μ μλ ₯νμΈμ.")
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId":id, "password":password, "name":name, "email":email, "petname":petname}
					, success:function(data) {
						if(data.result == "success") {
							alert("μ±κ³΅μ μΌλ‘ νμκ°μ λμμ΅λλ€.");
							location.href = "/user/signin/view";
						} else {
							alert("νμκ°μ μ€ν¨");
						}
					}
					
					
					, error:function() {
						alert("νμκ°μ μλ¬");
					}
					
					
					
					
					
				});
				
				
			});
		});
	
	
	</script>


</body>
</html>
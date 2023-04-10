<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 예약</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<body>

		<div id="wrap">
		
		<header class="text-center">
			<h1><a href="/main/menu/view">𝑀𝑢𝑛𝑔𝑛𝑦𝑎𝑛𝑔𝑃𝑙𝑎𝑐𝑒</a></h1>
			<c:if test="${not empty userId }">
				<div class="d-flex justify-content-end">${userName }님 <a href="/user/signout">로그아웃</a></div>
			</c:if>
		</header>
		
		
		<section class="contents d-flex justify-content-center">
			<div class="reservation-box pt-2">
				<h2 class="text-center mt-5">𝑅𝑒𝑠𝑒𝑟𝑣𝑎𝑡𝑖𝑜𝑛</h2>
				<h6>반려동물 이름</h6>
				<input type="text" placeholder="*반려동물 이름을 입력하세요." id="petNameInput" class="form-control">
				<h6>연락처</h6>
				<input type="text" placeholder="*연락처를 입력하세요." id="PhoneNumberInput" class="form-control">
				<h6>예약 날짜</h6>
				<input type="date" name="reservationDate">
				<h6>예약 시간</h6>
					<select name="reservationTime">
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
            			<option value="12:00">12:00</option>
            			<option value="13:00">13:00</option>
           				<option value="14:00">14:00</option>
            			<option value="15:00">15:00</option>
            			<option value="16:00">16:00</option>
            			<option value="17:00">17:00</option>
            			<option value="17:00">18:00</option>
          			</select>
          			
          		<br>
          		
				<button type="button" id="reservationBtn" class="btn btn-primary mt-3">예약하기</button>
				
			
			</div>
			
		</section>
		
		


		<footer>
			<div class="text-center">Copyright 2023. All rights reserved.</div>
		</footer>
		
		
	</div>
	<script>
		$(document).ready(function() {
		
			$("#reservationBtn").on("click", function() {
				

				let petName = $("#petNameInput").val();
				let PhoneNumber = $("#PhoneNumberInput").val();
				let reservationDate = $('input[name="reservationDate"]').val();

		
				if(petName == "") {
					alert("반려동물 이름을 입력하세요.");
					return ;
				}
	
				if(PhoneNumber == "") {
					alert("연락처를 입력하세요.");
					return ;
				}
				
				if(reservationDate == "") {
				    alert("예약 날짜를 선택하세요");
				    return;
				}
				
				alert("예약이 완료되었습니다.");
				
			});
		})
	
	</script>
</body>
</html>
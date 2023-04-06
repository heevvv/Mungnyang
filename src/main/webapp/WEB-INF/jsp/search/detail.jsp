<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 목록</title>
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
		
		
		<section class="d-flex justify-content-center">
		
			<div class="timeline-box my-5">
				<h1 class="text-center"><b>${hospital.office}</b></h1>

				<br>
				<br>
                            <tr>
                                <td><h4><b><i class="bi bi-geo-alt-fill"></i></b> ${hospital.address}</h4></td>
                                <td><h4><b><i class="bi bi-telephone"></i></b> ${hospital.phoneNumber}</h4></td>
                            </tr>
                           
				<div class="d-flex justify-content-between mt-5">
						<a href="/search/list/view" class="btn btn-info">목록으로</a>
				<button type="button" class="btn btn-danger">예약하기</button>
				
				</div>
				
					<br>
					<br>
				
			<div class="d-flex">
				<input type="text" class="form-control" id="reviewInput${hospital.id }">
				<button type="button" class="btn btn-success upload-btn" data-hospital-id="${hospital.id }">후기 작성</button>					
			</div>
			
			
				<table class="table text-center mt-4">
					<thead>
						<tr>
							<th>작성자</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="review" items="${reviewList}" >
						<tr>
							<td> ${review.userId } </td>
							<td> ${review.content } </td>
						</tr>
					</c:forEach>
					
					

				</tbody>
			</table>
				
			</div>
			
		</section>
		
		


		<footer>
			<div class="text-center">Copyright 2023. All rights reserved.</div>
		</footer>
		
		
	</div>
	


	<script>
	
	
	$(document).ready(function() {
	
		$(".upload-btn").on("click", function() {
				
			let hospitalId = $(this).data("hospital-id");
				
			let review = $("#reviewInput" + hospitalId).val();
			

			if(review == "") {
				alert("내용을 입력하세요.");
				return ;
			}
			

			
 			$.ajax({
				type:"post"
				, url:"/search/review/create"
				, data:{"hospitalId":hospitalId, "content":review}
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("리뷰 작성 실패");
					}
				}
				, error:function() {
					alert("리뷰 작성 에러");
				}
			}); 
			
			
		});
			
	})
	
	</script>
	
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>νμλΌμΈ</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<body>

		<div id="wrap">
		
		<header class="bg-danger text-center">
			<h1>ππ’ππππ¦ππππππππ</h1>
			<c:if test="${not empty userId }">
				<div class="d-flex justify-content-end">${userName }λ <a href="/user/signout">λ‘κ·Έμμ</a></div>
			</c:if>
		</header>
		
		<section class="d-flex justify-content-center">
			<div class="timeline-box">
				<div class="input-box border rounded">
					<textarea class="form-control border-0" rows="5"></textarea>
					
					<div class="d-flex justify-content-between">
						<input type="file" id="fileInput">
						<div class="upload-icon text-info" id="imageUploadBtn"><i class="bi bi-card-image"></i> </div>
						<button type="button" class="btn btn-info">μλ‘λ</button>
					</div>
				</div>
				
				<div class="card-list">
				
				
					<div class="card mt-4">
						<div class="d-flex justify-content-between p-2 mt-3">
							<div><b>μ ν¬κ²½</b></div>
							<div><i class="bi bi-three-dots"></i></div>
						</div>
						<div>
							<img width="100%" src="https://cdn.pixabay.com/photo/2016/01/05/17/51/maltese-1123016_960_720.jpg">
						</div>

						<div class="p-2">
							μ ν¬ μ§ κ°μμ§ λ―Έμ©νμ΄μ!!
							<br>
							μ§μ§ λλ¬΄λλ¬΄ κ·μ¬μμ!!!
							<br>
							κ°μμ§ λ―Έμ© μνλκ³³ #λ©λ₯λ―Έμ©μ€ μΆμ²λλ €μ!!
						</div>
					
						<!--  λκΈλ€ -->
						<div class="comment-box p-2">
							<div>λκΈ</div>
							<hr>
							<div><b>μ₯μμ</b> κΊ λλ¬΄ κ·μ¬μμ!!</div>
							<div><b>μμ μ§</b> μ°μ!!!</div>	
							
							<div class="d-flex">
								<input type="text" class="form-control">
								<button type="button" class="btn btn-primary">κ²μ</button>
							</div>
							
						</div>
						<!--  /λκΈλ€ -->
						
					</div>
					<!-- /μΉ΄λ -->
				
				
					<div class="card mt-4">
						<div class="d-flex justify-content-between p-2 mt-3">
							<div><b>μ ν¬κ²½</b></div>
							<div><i class="bi bi-three-dots"></i></div>
						</div>
						<div>
							<img width="100%" src="https://cdn.pixabay.com/photo/2016/01/05/17/51/maltese-1123016_960_720.jpg">
						</div>

						<div class="p-2">
							μ ν¬ μ§ κ°μμ§ λ―Έμ©νμ΄μ!!
							<br>
							μ§μ§ λλ¬΄λλ¬΄ κ·μ¬μμ!!!
							<br>
							κ°μμ§ λ―Έμ© μνλκ³³ #λ©λ₯λ―Έμ©μ€ μΆμ²λλ €μ!!
						</div>
					
						<!--  λκΈλ€ -->
						<div class="comment-box p-2">
							<div>λκΈ</div>
							<hr>
							<div><b>μ₯μμ</b> κΊ λλ¬΄ κ·μ¬μμ!!</div>
							<div><b>μμ μ§</b> μ°μ!!!</div>	
							
							<div class="d-flex">
								<input type="text" class="form-control">
								<button type="button" class="btn btn-primary">κ²μ</button>
							</div>
							
						</div>
						<!--  λκΈλ€ -->
						
					</div>
					<!-- /μΉ΄λ -->
					
					
					
					
					
					
					
				</div>
				<!-- /μΉ΄λλ€ -->
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			</div>
			<!-- /νμλΌμΈ -->
		</section>

		<footer class="bg-info">
			<div class="text-center">Copyright 2021. All rights reserved.</div>
		</footer>
		
	</div>

</body>
</html>
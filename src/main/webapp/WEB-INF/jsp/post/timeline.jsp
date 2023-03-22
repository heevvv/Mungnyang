<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<body>

		<div id="wrap">
		
		<header class="bg-danger text-center">
			<h1>𝑀𝑢𝑛𝑔𝑛𝑦𝑎𝑛𝑔𝑃𝑙𝑎𝑐𝑒</h1>
			<c:if test="${not empty userId }">
				<div class="d-flex justify-content-end">${userName }님 <a href="/user/signout">로그아웃</a></div>
			</c:if>
		</header>
		
		<section class="d-flex justify-content-center">
			<div class="timeline-box">
				<div class="input-box border rounded">
					<textarea class="form-control border-0" rows="5" id="contentInput"></textarea>
					
					<div class="d-flex justify-content-between">
						<input type="file" id="fileInput" class="d-none" id="fileInput">
						<div class="upload-icon text-info ml-2" id="imageUploadBtn"><i class="bi bi-card-image"></i> </div>
						<button type="button" class="btn btn-info" id="uploadBtn">업로드</button>
					</div>
				</div>
				
				<!--  카드들 -->
				<div class="card-list">
					<c:forEach var="post" items="${postList }">

					<!--  카드 -->
					<div class="card mt-4">
						<div class="d-flex justify-content-between p-2 mt-3">
							<div><b>${post.userName }</b></div>
							<div><i class="bi bi-three-dots"></i></div>
						</div>
						
						<div>
							<img width="100%" src="${post.imagePath }">
						</div>

						<div class="p-2">
							${post.content }
						</div>
						
						
					
						<!--  댓글들 -->
						<div class="comment-box p-2">
							<div>댓글</div>
							<hr>
							<c:forEach var="comment" items="${post.commentList }" >
							<div><b>${comment.userName }</b> ${comment.content }</div>
							</c:forEach>
							
							<div class="d-flex">
								<input type="text" class="form-control" id="commentInput${post.id }">
								<button type="button" class="btn btn-primary comment-btn" data-post-id="${post.id }">게시</button>
							</div>

							
						</div>
						<!--  /댓글들 -->
						
					</div>
					<!-- /카드 -->
				
				</c:forEach>
				</div>
				<!-- /카드들 -->
				

	
			</div>
			<!-- /타임라인 -->
		</section>

		<footer class="bg-info">
			<div class="text-center">Copyright 2023. All rights reserved.</div>
		</footer>
		
	</div>
	
	<script>
	$(document).ready(function() {
		
		// 댓글 작성
		$(".comment-btn").on("click", function() {
			
			let postId = $(this).data("post-id");
			let comment = $("#commentInput" + postId).val();
			
			$.ajax({
				type:"post"
				, url:"/post/comment/create"
				, data:{"postId":postId, "content":comment}
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						
						alert("댓글 작성 실패");
					}
				}
				, error:function() {
					alert("댓글 작성 에러");
				}
			});
			
			
		});
		
		// 글 업로드
		$("#uploadBtn").on("click", function() {
			
			let content = $("#contentInput").val();
			if(content == "") {
				
				alert("내용을 입력하세요");
				return;
			}
			
			if($("#fileInput")[0].files.length == 0) {
				alert("파일을 선택해주세요.");
				return;
			}
		
			var formData = new FormData();
			formData.append("content", content);
			formData.append("file", $("#fileInput")[0].files[0]);
			
			$.ajax({
				type:"post"
				, url:"/post/create"
				, data:formData
				, enctype:"multipart/form-data"
				, processData:false
				, contentType:false
				, success:function(data) {
					if(data.result = "success") {
						location.reload();
					} else {
						alert("업로드 실패");
					}
					
				}
				, error:function() {
					alert("업로드 에러");
				}
			});
			
		});
	
	
		// 이미지 아이콘 눌렀을 때 파일 선택
		$("#imageUploadBtn").on("click", function() {
			$("#fileInput").click();
		});
	
	
	})
	
	</script>

</body>
</html>
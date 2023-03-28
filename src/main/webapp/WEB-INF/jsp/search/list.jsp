<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 검색</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<body>

		<div id="wrap">
		
		<header class="text-center">
			<h1>𝑀𝑢𝑛𝑔𝑛𝑦𝑎𝑛𝑔𝑃𝑙𝑎𝑐𝑒</h1>
			<c:if test="${not empty userId }">
				<div class="d-flex justify-content-end">${userName }님 <a href="/user/signout">로그아웃</a></div>
			</c:if>
		</header>
		
		<section class="contents d-flex justify-content-center">
			<div class="main-box pt-2">



            <div class="panel panel-default">
                <div class="panel-heading">병원 목록</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>이름</th>
                                <th>주소</th>
                                <th>전화번호</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="search" items="${searchList }" >
                            <tr>
                                <td>${search.id}</td>
                                <td>${search.office}</td>
                                <td>${search.address}</td>
                                <td>${search.phoneNumber}</td>
                            </tr>
                           </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


		</section>

		<footer>
			<div class="text-center">Copyright 2023. All rights reserved.</div>
		</footer>
		
	</div>
	
	
	
	
	
</body>

</html>
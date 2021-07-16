<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
<script>
	$(function() {
		$("#smbtn1").click(function() {
			var userid = $("#userid").val();
			var userpw = $("#userpw").val();
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return;
			}
			if (userpw == "") {
				alert("비밀번호를 입력하세요.");
				$("#userpw").focus();
				return;
			}

		});
	});
</script>
</head>
<body>
	<div class="container">
		<nb:navbar></nb:navbar>
		<br>
		<br>
		<br>
		<br>
		<form action="${appRoot }/user/login" method="post">
		
			<div class="form-group">
				<label for="exampleInputEmail1">ID</label> 
				<input class="form-control" id="userid" />
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label>
				<input type="password" class="form-control" id="userpw">
			</div>
			<div class="form-group form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Remember</label>
			</div>
			
			<button type="submit" class="btn btn-outline-secondary" id="smbtn1">로그인</button>
		</form>
	</div>
</body>
</html>
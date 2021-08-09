<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>옮겨야됨</title>

<style>
#pills-home-tab, #pills-profile-tab {background-color:transparent;}
#pills-home-tab, #pills-profile-tab {color: #6d0d27;}
</style>

</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	$('#pills-home-tab').click(function(){
		$(".sct2").prop("checked", false);
		$(".selectAll2").prop("checked", false);
		$("#desub2").hide();
		$("#desub").show();
	})
	$('#pills-profile-tab').click(function(){
		$(".sct1").prop("checked", false);
		$(".selectAll1").prop("checked", false);
		$("#desub").hide();
		$("#desub2").show();
	})
	$("#desub2").hide();
})
</script>
	<a href="${appRoot}/main/home">잠시 뒤로가기</a>
	<button onclick="history.back()" class="btn btn-warning">Back</button>
	<div class="container" >

		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="pills-home-tab" data-toggle="pill"
				href="#pills-cm" role="tab" aria-controls="pills-cm"
				aria-selected="true">자유게시판</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="pills-profile-tab" data-toggle="pill" href="#pills-market"
				role="tab" aria-controls="pills-market" aria-selected="false">중고마켓</a>
			</li>
		</ul>
			<ul class="nav justify-content-end">
			
			<form id="removeAllForm1" action="${appRoot }/mypage/removeAll" method="post">
				<input id="desub" class="btn btn-outline-danger" type="submit" value="삭제">
			</form>
			
			<form id="removeAllForm2" action="${appRoot }/mypage/removeAll2" method="post">
				<input id="desub2" class="btn btn-outline-danger" type="submit" value="삭제">
			</form>
			</ul>
			

		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="pills-cm" role="tabpanel" aria-labelledby="pills-cm-tab">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" class="selectAll1" /> #</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="cboard" varStatus="status">
							<tr>
								<td><input type="checkbox" name="removeBnoList"
								value="${cboard.bno }" class="sct1" id="${cboard.bno }"
								form="removeAllForm1"></input> ${cboard.bno },${status.count }</td>
								<td>
								<c:url value="/community/cbreading" var="getUrl">
									<c:param name="bno" value="${cboard.bno }" />								
								</c:url> 
								<a href="${getUrl}"> ${cboard.title } </a>
								</td>
								<td>${cboard.writer }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${cboard.regdate }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${cboard.updateDate }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<script>
				var selectAll = document.querySelector(".selectAll1");
				selectAll.addEventListener('click', function() {
					var objs = document.querySelectorAll(".sct1");
					for (var i = 0; i < objs.length; i++) {
						objs[i].checked = selectAll.checked;
					}
					;
				}, false);
				var objs = document.querySelectorAll(".sct1");
				for (var i = 0; i < objs.length; i++) {
					objs[i].addEventListener('click', function() {
						var selectAll = document
								.querySelector(".selectAll1");
						for (var j = 0; j < objs.length; j++) {
							if (objs[j].checked === false) {
								selectAll.checked = false;
								return;
							}
							;
						}
						;
						selectAll.checked = true;
					}, false);
				}
			</script>			
			<div class="tab-pane fade show" id="pills-market" role="tabpanel" aria-labelledby="pills-market-tab">
			<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" class="selectAll2"/> #</th>
							<th>판매</th>
							<th>제목</th>
							<th>작성자</th>
							<th>게시 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${jlist}" var="jmarket" varStatus="status">
							<tr>
								<td><input type="checkbox" name="removeMnoList"
								value="${jmarket.mno }" class="sct2" id="${jmarket.mno }"
								form="removeAllForm2"></input> ${jmarket.mno },${status.count }
								</td>
								
								
								<td>${jmarket.msold }</td>
								<td>
								<c:url value="/market/detail" var="getUrl">
									<c:param name="mno" value="${jmarket.mno }" />								
								</c:url> 
								<a href="${getUrl}"> ${jmarket.mtitle } </a>
								</td>
								<td>${jmarket.mwriter }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${jmarket.mregdate }" /></td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		<script>
				var selectAll2 = document.querySelector(".selectAll2");
				selectAll2.addEventListener('click', function() {
					var objs2 = document.querySelectorAll(".sct2");
					for (var i = 0; i < objs2.length; i++) {
						objs2[i].checked = selectAll2.checked;
					}
					;
				}, false);
				var objs2 = document.querySelectorAll(".sct2");
				for (var i = 0; i < objs2.length; i++) {
					objs2[i].addEventListener('click', function() {
						var selectAll2 = document
								.querySelector(".selectAll2");
						for (var j = 0; j < objs2.length; j++) {
							if (objs2[j].checked === false) {
								selectAll2.checked = false;
								return;
							}
							;
						}
						;
						selectAll2.checked = true;
					}, false);
				}
			</script>
		</div>
	</div>

</body>
</html>
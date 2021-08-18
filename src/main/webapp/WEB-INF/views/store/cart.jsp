<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>장바구니</title>
</head>
<body>
	<div class="container">
		<nb:navbar></nb:navbar>			

		<!-- jumbotron 
		<div class="jumbotron">
			<h1 class="display-4">Index Carts</h1>
			<p class="lead">views/carts/index.jsp</p>
			<hr class="my-4">
			<p>장바구니 페이지</p>
		</div> -->
		<br>
		<h2>장바구니</h2>
		<br>
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>#</th>
					<th>제품명</th>
					<th>상세설명</th>
					<th>가격</th>
					<th>수량</th>
					<th>합계</th>
					<th>취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cart" items="${cart}" varStatus="status">
			<script>
			$(document).ready(function(){
				$("#cu${status.count }").click(function() {
					var cno = '${cart.cno}';
					var cartstock = $("#cartstock${status.count}").val();
					var data = {cno: cno, cartstock: cartstock}; 
					$.ajax({
						type:"get",
						url:"./cartupdate",
						data:data
					})
				})
			})
			</script>
					<tr>
						<th>${ status.count }</th>
						<th>${cart.title }</th>
						<td>${cart.detail }</td>
						<td>${cart.price}</td>
						<td><input id="cartstock${status.count }" type="number" value="${cart.cartstock }" min="1" step="1" max="99"/>
						<button type="button" class="btn btn-outline-secondary" id = "cu${status.count }">변경</button></td>
						<td>${cart.money}</td>
						<td>
							<form action="${appRoot }/store/cartdelete" method="post">
								<input name="cno" type="hidden" value="${cart.cno }" />
								<button type="submit" class="btn btn-outline-secondary">삭제</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>

			<tfoot>
				<tr>
					<td colspan="4"></td>
					<td>주 문 금 액 :</td>
					<td>${sumMoney}</td>
					<td></td>
				</tr>
			</tfoot>
		</table>

		<form action="#" method="post">
			<!--${appRoot}/store/order  -->
			<%-- 	<input name = "cno" type = "hidden" value = "${cart.cno }"/> --%>
			<button type="submit" class="btn btn-lg btn-block btn-primary">주문하기</button>
		</form>

		<button onclick="history.back()" class="btn btn-warning">Back</button>
		<footer>
			<nb:footer></nb:footer>
		</footer>
	</div>
</body>
</html>
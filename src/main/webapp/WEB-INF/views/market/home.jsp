<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>


<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<style type="text/css">
hr {
	margin: 0px;
}

a {
	color: black;
}

a:hover {
	color: black;
	text-decoration: none;
}

#imgsize {
	max-width: 100%;
	height: 180px;
}

.card-img-top {
	width: 100%;
	height: 180px;
}

.card-body {
	padding: 10px;
}

.card-title {
	font-size: 22px;
	margin: 0;
}

.card {
	max-width: 95%;
}

</style>



<!-- timeago -->
<script src="${appRoot }/resources/js/date.js"></script>

<script>
	$(document).ready(function() {
		$("#list-pagenation1 a").click(function(e) {
			e.preventDefault();

			var actionForm = $("#actionForm");

			actionForm.find("[name=pageNum]").val($(this).attr("href"));

			actionForm.submit();
		});
		/* for문 대신에 each 함수 사용해서 timeBefore js에 값 보내주는 스크립트 */
		$(".card-time-before").each(function(i, e) {
			timeBefore(e);
		})

	});
</script>


<title>중고마켓</title>

</head>
<body>
	<div class="container">
		<nb:navbar />
		<nb:scroll />

		<!-- 배너 : 슬라이드 -->
		<div id="carouselExampleInterval" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-interval="3000">
					<a href="${appRoot }/market/home"><img
						src="${appRoot }/resources/img/market_01.png"
						class="d-block w-100" id="carousel-size"></a>
				</div>
			</div>
		</div>





		<!-- 상품 목록 -->
		<div class="d-flex justify-content-between p-2 m-3">

			<h4>오늘의 상품 추천</h4>

			<sec:authorize access="isAuthenticated()">
				<a class="btn  btn-info" href="${appRoot }/market/write"><i
					class="fas fa-pen"></i>글쓰기 </a>
			</sec:authorize>
		</div>

		<div class="container m-1 row  row-cols-4">
			<!-- 상품 -->
			<c:forEach items="${list }" var="market">
				<c:url value="/market/detail" var="getUrl">
					<c:param name="mno" value="${market.mno }" />
					<c:param name="pageNum" value="${pageMaker.cri.pageNum }" />
					<c:param name="amount" value="${pageMaker.cri.amount }" />
				</c:url>

				<a href="${getUrl}">
					<div class="card col m-2 p-2">
						<div id="imgsize" class="text-center">
							<img src="${imgRoot}market/${market.mno }/${market.fileName[0]}"
								class="card-img-top">
						</div>
						<div id="textsize" class="card-body m-0">
							<input type="hidden" class="card-text" value="${market.mno }" />
							<div class="card-title">${market.mtitle }</div>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><span class="card-text"><fmt:formatNumber
										pattern="#,###원" value="${market.mprice }" /></span> <span
								class="card-time-before" style="float: right;">${market.mregdate.time }</span></li>
							<li class="list-group-item"><div class="card-add">${market.maddress }</div></li>
						</ul>
					</div>
				</a>
			</c:forEach>
		</div>

		<!--  pagenation -->
		<div>
			<nav aria-label="Page navigation example">
				<ul id="list-pagenation1" class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.startPage - 1 }">Previous</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="num">

						<li class="page-item"><a class="page-link" href="${num }">${num }</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</nav>

			<div style="display: none;">
				<form id="actionForm" action="${appRoot }/market/main" method="get">
					<input name="pageNum" value="${pageMaker.cri.pageNum }" /> <input
						name="amount" value="${pageMaker.cri.amount }" />
				</form>
			</div>
		</div>
	</div>

</body>
</html>
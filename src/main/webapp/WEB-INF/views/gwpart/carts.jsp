<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>

<%@ include  file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>장바구니</title>
</head>
<body>
<nb:navbar/>
<div class= "container">
<div class="jumbotron">
    <h1 class="display-4">Carts</h1>
    <p class="lead">views/gwpart/carts.jsp</p>
    <hr class="my-4">
    <p>장바구니 페이지</p>
</div>
<h2>장바구니<span class="badge badge-warning">쇼핑중</span></h2>
<hr>
<table class="table">
    <thead class="thead-light">
    <tr>
      <th>#</th>
      <th>제품명</th>
      <th>가격</th>
      <th>수량</th>
      <th>합계</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${ items }" varStatus="status">
        <tr>
            <th>${ status.count }</th>
            <td>${ item.title }</td>
            <td>${ item.price }</td>
            <td>${ item.amount }</td>
            <td>${ item.price * item.amount }</td>
        </tr>
    </c:forEach>
  </tbody>
  <tfoot>
    <tr>
        <td colspan="4"></td>
        <td>${ cart.totalPrice }</td>
    </tr>
  </tfoot>
</table>
<form action="${appRoot }/gwpart/carts" method="post">
    <input name="id" type="hidden" value="${ cart.id }" type="hidden" />
    <button type="submit" class="btn btn-lg btn-block btn-primary">주문하기</button>
</form>

</div>
</body>
</html>
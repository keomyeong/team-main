<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>

<!DOCTYPE html>
<html>
<head>

<%@ include  file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>주문/결제하기 페이지</title>
</head>
<body>
<div class= "container">
<!-- jumbotron -->
<div class="jumbotron">
    <h1 class="display-4">Index Order</h1>
    <p class="lead">views/Order.jsp</p>
    <hr class="my-4">
    <p>주문/결제하기 페이지</p>
</div>
<h2>주문/결제하기 페이지</h2>
<hr>
<table class="table">
    <thead class="thead-light">
    <tr>
      <th>#</th>
      <th>제품명</th>
      <th>상세설명</th>
      <th>가격</th>
      <th>수량</th>
    </tr>
  </thead>
  <tbody>
  <%--   <c:forEach var="cart" items="${cart}" varStatus="status">
        <tr>
            <th>${ status.count }</th>
            <th>${cart.title }</th>
            <td>${cart.detail }</td>
            <td>${cart.price}</td>
            <td>${cart.cartstock }</td>
        </tr>      
    </c:forEach> --%>
  </tbody>
  
   <tfoot>
    <tr>
        <td></td> 
		<td>주문금액 : </td>		
		<td> <%-- ${sumMoney} --%></td>
		<td>내 보유 포인트 : </td>
		<td></td>
    </tr>
  </tfoot>
</table>
<hr>
<form>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputid">수령인</label>
      <input type="text" class="form-control" id="inputid">
    </div>
  </div>
  <div class="form-group">
    <label for="inputphone">연락처</label>
    <input type="text" class="form-control" id="inputphone" placeholder="010-0000-0000">
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address 2</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address 3</label>
    <input type="text" class="form-control" id="inputAddress3" placeholder="Apartment, studio, or floor">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control">
        <option selected>Choose...</option>
        <option>...</option>
      </select>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" id="inputZip">
    </div>
  </div>
</form>
<button type="submit" class="btn btn-lg btn-block btn-primary">주문완료</button>
<button onclick="history.back()" class="btn btn-warning">Back</button>

</div>
</body>
</html>
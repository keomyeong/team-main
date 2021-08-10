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

<title>Insert title here</title>
</head>
<body>
<div class= "container">

<!-- jumbotron -->
<div class="jumbotron">
    <h1 class="display-4">Index Carts</h1>
    <p class="lead">views/carts/index.jsp</p>
    <hr class="my-4">
    <p>장바구니 페이지</p>
</div>
<h2>장바구니</h2>
<hr>
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
        <tr>
            <th>${ status.count }</th>
            <th>${cart.title }</th>
            <td>${cart.detail }</td>
            <td>${cart.price}</td>
            <td>${cart.cartstock }</td>
            <td>${cart.money}</td>
            <td>
            <form action="${appRoot }/store/cartdelet" method="post">
            	<input name = "cno" type = "hidden" value = "${cart.cno }"/>
				<button type = "submit" class="btn btn-outline-secondary" >삭제</button>	
			</form>
            </td>
        </tr>      
    </c:forEach>
  </tbody>
  
   <tfoot>
    <tr>
        <td colspan="5"></td> 
		<td>주문금액 : </td>		
		<td> ${sumMoney}</td>
    </tr>
  </tfoot>
</table>

<form action="#" method="post">
<!--${appRoot}/store/order  -->
	<input name = "cno" type = "hidden" value = "${cart.cno }"/>
	<button type="submit" class="btn btn-lg btn-block btn-primary">주문하기</button>
</form>

</div>
</body>
</html>
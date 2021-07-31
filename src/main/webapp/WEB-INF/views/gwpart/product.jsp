<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include  file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class= "container">
<div class="jumbotron">
    <h1 class="display-4">Show product</h1>
    <p class="lead">views/gwpart/product.jsp</p>
    <hr class="my-4">
    <p>제품 상세 페이지</p>
</div>
<div class="row">
    <div class="col-md-4">
       <%--  width="150" --%>
        <img alt="Card image cap" class="card-img-top" src="${appRoot }/resources/img/gohomelogo.png">
    </div>
    <div class="col-md-8">
        <h3>${ product.title }</h3>
        <p>작성자: ${ board.userid }</p>
        <p>가격: ${ product.price }원</p>
        <hr class="my-4">
        <form action="<!-- <c:url value='/carts/add' /> -->" method="post">
            <div class="form-group">
                <label>수량</label>
                <input name="amount" class="form-control" type="number" value="1" />
            </div>
            <input name="product_id" type="hidden" value="${ product.id }">
            <button type="submit" class="btn btn-primary">장바구니에 담기</button>
        </form>
    </div>
</div>
</div>
</body>
</html>
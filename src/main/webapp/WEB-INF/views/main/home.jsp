<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>메인 페이지</title>
</head>
<body>

	<div class="container">
		<nb:navbar></nb:navbar>			
		<h1>메인페이지입니다 </h1>
		
		
		
		
		<a href ="${appRoot}/store/cart">cart 실험하기</a>		
		<a href ="${appRoot}/store/order">order 실험하기</a>		
		
		<a href="${appRoot}/mypage/exjsp">exjsp 실험하기</a>		
		
		
	<div class="embed-responsive embed-responsive-16by9">
	<iframe width="560" height="315" src="https://www.youtube.com/embed/HuOkVn-SR_c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>	
	</div>
		
		
		
		
		
		
		
		<footer>
			<nb:footer></nb:footer>
		</footer>
	</div>
	
	
	

	 
	<c:if test="${not empty qweasd}">
		<script type="text/javascript">
			alert("${qweasd}");
		</script>
	</c:if>		
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<nb:navbar></nb:navbar>
	
<div class="d-flex justify-content-center p-0">
	<nav class="navbar navbar-expand-sm navbar-light">
		<ul  class="navbar-nav mr-auto text-center"> 
			<li class="nav-item">
	       			 <font size="4px">
		       			 <a class="nav-link" href="${appRoot }/main/mgreceive">받은쪽지함 </a>
	       			 </font>
	     	</li>
	     	<li class="nav-item">
	     			<font size="4px">
	       			 	<a class="nav-link" href="${appRoot }/main/mgsend">보낸쪽지함 </a>	     			
	     			</font>
	     	</li>	
		</ul>
	</nav>
</div>
<body>

    <h2>보낸 쪽지함</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>번호</th>
                <th>내용</th>
                <th>받는사람</th>
                <th>작성일</th>
  
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list }" var="message">
                <tr>
                    <td>${message.mno }</td>
                    <td>${message.content }</td> 
                    <td>${message.reader }</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${message.regdate }"/></td>                 
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
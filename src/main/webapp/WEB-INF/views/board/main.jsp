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

<div style = "text-align: right;">
    <a href = "${appRoot }/user/login">로그인</a>
     <%--login.do로 이동하는 링크를 만듬  --%>  
    <a href = "${appRoot }/user/logout">로그아웃</a>
   	<%-- logout.do로 이동하는 링크를 만듬--%>
</div>

</div>
</body>
</html>
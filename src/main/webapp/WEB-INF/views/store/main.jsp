<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>


<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<style type="text/css">
hr {
margin : 0px;
}
 
a { 
color : black;
} 
a:hover { 
color : black;
text-decoration:none ;
} 
.card-body {
padding : 10px;
}

.card-title{
font-size : 22px;
}

#card-detail, #card-address{
padding : 10px;

}

.card-img-top {
width: 300px;


}

.card-img-top img{
	max-width :100%;

}



</style> 



<!-- timeago -->
<script src="${appRoot }/resources/js/date.js"></script>
     
<script>
$(document).ready(function() {
	$("#list-pagenation1 a").click(function(e) {
		// 기본 액션 중지 (hyperlink 역할 안함)
		e.preventDefault();
		
		//console.log("a요소 클릭됨");
		
		var actionForm = $("#actionForm");
		
		// form의 pageNum input의 값을 a 요소의 href값으로 변경
		actionForm.find("[name=pageNum]").val($(this).attr("href"));
		
		// submit
		actionForm.submit();
	});
	
});
</script>        


<title>스토어 </title>

</head>
<body>
<div class="container">	
<nb:navbar/>
<nb:scroll />			  

<!-- <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
    <img src="..." class="rounded mr-2" alt="...">
    <strong class="mr-auto">Bootstrap</strong>
    <small>11 mins ago</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
    프로젝트 진행 목적이므로 모든 이미지에 대한 저작권은 블라블라~~ 
    
  </div>
</div> -->


		  
<!-- 배너 : 슬라이드 -->
<!-- 배너 링크 고정이 아닌 이벤트 페이지 번호로 이동할 수 있게끔 수정할 것 -->		
<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-interval="3000">
      <a href="${appRoot }/main/home"><img src="${appRoot }/resources/img/ba01.jpg" class="d-block w-100"  id="carousel-size"></a>
    </div>
    <div class="carousel-item" data-interval="3000">
      <a href="${appRoot }/main/login"><img src="${appRoot }/resources/img/ba02.jpg" class="d-block w-100"  id="carousel-size"></a>
    </div>
    <div class="carousel-item" data-interval="3000">
      <a href="${appRoot }/main/signup"><img src="${appRoot }/resources/img/ba03.jpg" class="d-block w-100"  id="carousel-size"></a>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>	
	
	
<div>
	<c:url value="/store/register" var="registerUrl">	
			<c:param name="pageNum" value="${cri.pageNum }"></c:param>
			<c:param name="amount" value="${cri.amount }"></c:param>
	</c:url>
			
</div>		


<!-- 키워드 -->
<ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link active" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">#침실</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">#서재</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>
	
	
		
<!-- 상품 목록 -->	
<h4>오늘의 상품 추천 </h4>


<a class="btn  btn-info" href="${appRoot }/store/register"><i class="fas fa-pen"></i>글쓰기 </a>
	 



<div class="row row-cols-md-4">		  	
<!-- 상품 -->
<c:forEach items="${list }" var="store">
 <c:url value="/store/detail" var="getUrl">
<c:param name="pno" value="${store.pno }" />
<c:param name="pageNum" value="${pageMaker.cri.pageNum }" />
<c:param name="amount" value="${pageMaker.cri.amount }" />
</c:url>	   



<a href="${getUrl}">	
  <div class="col mb-4">
    <div class="card">

	    	<img src="${imgRoot}store/${store.pno }/${store_file[0]}" class="card-img-top" >
	     	<div class="card-body">	
	     		<input type="hidden" class="card-text" value="${store.pno }"/>
	 	     	<div class="card-title" >${store.title }</div>     
	       	</div>

	       <div class="form-group" id="card-detail">
		        <div class="card-text"><fmt:formatNumber pattern="#,###원" value="${store.price }"/></div>
		   </div>     
	      		<hr>
	       <div id="card-address">
	       		<div class="card-add">${store.delivery }</div>
	       </div>  
    </div>
  </div>
 </a> 
 </c:forEach>
</div>

<!--  pagenation -->
<div>
<nav aria-label="Page navigation example">
  <ul id="list-pagenation1" class="pagination justify-content-center">
    <c:if test="${pageMaker.prev }">
	    <li class="page-item">
	      <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
	    </li>
  	</c:if>
	
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
	   <%-- href value 	
	   href="${appRoot }/board/list?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"	 
	   --%>
	    <li class="page-item"><a class="page-link"  href="${num }">${num }</a></li>
	</c:forEach>

	<c:if test="${pageMaker.next }">
	    <li class="page-item">
	      <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
	    </li>
	</c:if>
  </ul>
</nav>

<div style="display: none;">
	<form id="actionForm" action="${appRoot }/store/main" method="get">
		<input name="pageNum" value="${pageMaker.cri.pageNum }" /> 
		<input name="amount" value="${pageMaker.cri.amount }" />
	</form>
</div>


</div>

		<footer>
			<nb:footer/>
		</footer>
</div>

</body>
</html>
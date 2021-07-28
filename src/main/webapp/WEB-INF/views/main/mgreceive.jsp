<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<style>
    #td { vertical-align : middle; }
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<nb:navbar></nb:navbar>
<sec:authentication property="principal.user" var="user" />
<!-- 이걸 안쓰면 최신화가 안되고 쓰면 url 이뜬다  
확인은 쪽지함을 눌러보거라 쪽지를 넣고서도 최신화가 되지 않는다 controller 에도 헛점이 있다-->
	
<div class="d-flex justify-content-center p-0">
	<nav class="navbar navbar-expand-sm navbar-light">
		<ul  class="navbar-nav mr-auto text-center"> 
			<li class="nav-item">
	       			 <font size="4px">
		       			 <a class="nav-link" href="${appRoot }/main/mgreceive?writer=${user.userid}">받은쪽지함 </a>
	       			 </font>
	     	</li>
	     	<li class="nav-item">
	     			<font size="4px">
	       			 	<a class="nav-link" href="${appRoot }/main/mgsend?writer=${user.userid}">보낸쪽지함 </a>	     			
	     			</font>
	     	</li>	
		</ul>
	</nav>
</div>
<body>

    <h3>받는 쪽지함</h3>
    <table class="table table-striped">
        <thead>
            <tr style="text-align :center">
                <th style="width: 8%">번호</th>
                <th style="width: 65%">내용</th>
                <th style="width: 15%">보낸사람</th>
                <th style="width: 12%">작성일</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listReceive }" var="message" varStatus="status">
                <tr>
                    <td id="td"style="text-align :center"><!-- ${message.mno} 확인용 mno -->  ${status.count }</td>
                    <td id="td">
                    <!-- a 링크로 버튼을 대신하여 쓰고 싶다 모달을 버튼으로 만들어야하는가 버튼은 class 가 있어서 이쁘지 아니하니 고민하자 -->
                    <button type="button" class="btn" id="cnbtn1" data-toggle="modal" data-target="#call1">
					${message.content }
					</button>
                    </td> 
                    <td id="td"style="text-align :center">${message.writer }</td>
                    <td id="td"style="text-align :center"><fmt:formatDate pattern="yyyy-MM-dd [hh:mm]" value="${message.regdate }"/></td>
                </tr>
                <div class="modal fade" id="call1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">보낸 쪽지함</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
						</div>
						<div class="modal-body">
							<form>
								<div class="form-group">
									<label for="writer" class="col-form-label">보내는 사람</label>
									<input type="text" readonly class="form-control" id="writer" value="${message.reader}" name="writer">
								</div>

								<div class="form-group">
									<label for="reader" class="col-form-label">받는 사람</label>
									<input type="text" readonly class="form-control" id="reader" name="reader" value="${uservo.userid}">
								</div>

								<div class="form-group">
									<label for="content" class="col-form-label">내용</label>
									<textarea class="form-control" readonly id="content" name="content">${message.content}</textarea>
								</div>
						 
								<div class="modal-footer">
									<button type="button" class="btn btn-light" data-dismiss="modal" id="close1">Close</button>
									<button id="sendbtn" type="button" class="btn btn-secondary" data-toggle="modal" data-target="#call2">답장하기</button>
								</div>
	
							</form>					
						</div>
						</div>
					</div>
				</div>
                <script>
					$(document).ready(function(){
						$("#sendbtn").click(function() {
							$('#close1').click();
						})
					})
				</script>
					<div class="modal fade" id="call2" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">쪽지 전송하기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="${appRoot }/main/mgreceive" method="post">
										<div class="form-group">
											<label for="writer" class="col-form-label">보내는 사람</label>
											<input type="text" readonly class="form-control" id="writer" value="${uservo.userid}" name="writer">
										</div>

										<div class="form-group">
											<label for="reader" class="col-form-label">받는 사람</label>
											<input type="text" readonly class="form-control" id="reader" name="reader" value="${message.writer}">
										</div>

										<div class="form-group">
											<label for="content" class="col-form-label">내용</label>
											<textarea class="form-control"  id="content" name="content"></textarea>
										</div>
									 
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
											<button id="sendbtn" type="submit" class="btn btn-light" >답장하기</button>
										</div>		
									</form>					
								</div>
							</div>
						</div>
					</div>
            </c:forEach>
        </tbody>
    </table>								
<c:if test="${not empty message}">
<script type="text/javascript">
alert("${message}");
</script>
</c:if>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include  file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>마이페이지 </title>

<style type="text/css">
	
	html, body {
	    height: 100%;
	    min-height: 100%;
	}
	
	.container{
       height: 100%;
	}
	
	.nav-pills .nav-link.active, .nav-pills .show>.nav-link {background-color: #6d0d27;}
	.cl{ color:#6d0d27;}
	.cth{ padding:40px;heigth:100%;}
	
	
	
</style>

</head>
<body>
	<div class="container">	
		<nb:navbar></nb:navbar>
		
		
		
		
		
		<div class="row">
		  <div class="col-3"> <!-- https://getbootstrap.com/docs/4.6/components/navs/ -->
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active cl" id="v-pills-pwck-tab" data-toggle="pill" href="#v-pills-pwck" role="tab" aria-controls="v-pills-pwck" aria-selected="true">정보수정 </a>
		     	<div class="nav-link cl">
		     		<a>비밀번호변경 </a>|
		     		<a>회원탈퇴 </a>
		     	</div>
		      
		      <a class="nav-link cl" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">주문목록  </a>
		      
		      <a class="nav-link cl" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">내글관리 </a>
		      
		      <a class="nav-link cl" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">뭐가있지 </a>
		    </div>
		  </div>
		
		  
		  <div class="col-9">
		  
		    <div class="tab-content" id="v-pills-tabContent">
		    
		     <!-- 정보수정 비밀번호 확인 컨텐츠   -->
		      <div class="jumbotron tab-pane fade show active " id="v-pills-pwck" role="tabpanel" aria-labelledby="v-pills-pwck-tab">
		      		
		      		<p>정보수정을 원하시면 비밀번호를 입력해주세요 ! <br>
		      		<form action="${appRoot }/main/myinfos" method="post"> 
		      		
			      		<div class="form-group">
		                    <label class="control-label" for="userpw">비밀번호</label>
		                    <div class="input-group">
		                    	<input class="form-control" type="password" id="userpw" name="userpw" />
								<input class="btn btn-outline-secondary" type="submit" id="pwbtn" value="확인"/> 
							</div>
		                </div>
		      		</form>
		      		
		      		<c:if test="${param.error != null }">
		      			<span class="alert alert-danger">비밀번호가 일치하지않습니다. </span> 
		      		</c:if>
	            </div>
		      
		      
		      <!--  주문목록 관련 컨텐츠  -->
		      <div class="jumbotron tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
		      		주문목록 - 주문한 상품리스트 - 상품보기,택배조회(임의로 택배번호발급 - 최대한심플하게 )
		      </div>
		      
		      
		      
		      <!--  내글  관련 컨텐츠  -->
		      <div class="jumbotron tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
		      		내글관리 - 찜목록 , 게시판, 덧글, 업체상담신청내역 
		      </div>
		      
		      
		      
		      
		      <!--  기타 추가할 컨텐츠  -->
		      <div class="jumbotron tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
		      		뭐가있을까 뭐가있을까 뭐가있을까 뭐가있을까 뭐가있을까  뭐가있을까 뭐가있을까 
		      </div>
		      
		      
		      
		      
		    </div>
		  </div>
		</div>
	</div>
		
</body>
</html>
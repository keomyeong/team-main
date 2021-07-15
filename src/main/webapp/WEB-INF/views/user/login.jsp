<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include  file = "/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>login</title>
<script>
//아래쪽에서 id값을 받아서 데이터를 전송한다.
//click 메소드 안에 있는 함수를 실행해서 id와 비밀번호를 저장하고
//빈 값(공백값) 이면 경고창을 출력하고, 커서를 이동시킨다.
// val () 메소드는 form (양식)의 값을 가져오거나 값을 설정하는 메소드
// focus () 메소드는 해당 요소에 포커스를 부여하고, 텍스트 창의 경우 커서를 위치시켜 바로 입력이 가능하도록 하던가
// 버튼의 경우, 엔터키를 눌렀을때 클릭 효과를 낸다.
$(function(){
    $("#btnLogin").click(function(){
        var userid = $("#userid").val();
        var passwd = $("#passwd").val();
        if(userid==""){
            alert("아이디를 입력하세요.");
            $("#userid").focus();
            return;
        }
        if(passwd==""){
            alert("비밀번호를 입력하세요.");
            $("#userpw").focus();
            return;
        }
        //아이디와 비밀번호가 맞으면 loginCheck페이지로 넘어간다.
        document.form1.action = "${appRoot}/user/loginCheck";
        document.form1.submit();
    });
});
</script>
</head>
<body>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6 col-12">
			<h1>로그인</h1>
			<%-- <form action="${appRoot }/잘 모 르 겠어 " method="post"> --%>
				<div class="form-group">
					<label for="userid">ID</label>				
					<input id="userid" type = "text" class="form-control" name="userid" />
				</div>
				<div class="form-group">
					<label for="userpw">PassWord</label>
					<input id="userpw" type="password" class="form-control" name="userpassword" />
				</div>
				<input class="btn btn-primary" type="submit" id = "btnLogin" value="로그인">
			<!-- 아이디 또는 비밀번호가 일치하지 않는다는 메시지를 출력함 --> 
			<c:if test="${param.message == 'error' }">
            <div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
            </c:if>
			<%-- </form> --%>
		</div>
	</div>	
</div>

</body>
</html>
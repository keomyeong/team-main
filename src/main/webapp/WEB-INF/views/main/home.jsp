<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>메인 페이지</title>
</head>
<body>
	<div class="container">
		<nb:navbar></nb:navbar>
		<div class="contact">
			<div class="recruit animation-recruit">
				<div class="blueant">
					<div class="wrap">
						<h1>Gohome</h1>
						<ul class="cb">
							<li>
								<div class="text-area">
									<strong>일하는 것을 재미있어 합니다. </strong>
									<p>
										일을 통해 문제를 해결하고 새로운 분야에 도전하여 성공의 기쁨을 느끼면서 배우는 과정을 즐길 수
										있습니다.
									</p>
								</div>
							</li>
							<li>
								<div class="text-area">
									<strong>흐름을 읽는 개발자가 성장할 수 있다. </strong>
									<p>
										계획을 세워 차근차근 나아가는 개발자가 되겠습니다.<br>습관화 되어 있는 체크리스트 작성 및
										계획성으로 개발에 임하여 <br> 변화가 많은 상황에서도 차근차근 대처할 수 있도록 하겠습니다.
									</p>
								</div>
							</li>
							<li>
								<div class="text-area">
									<strong>꾸준히 성장하는 사람이 되겠습니다.</strong>
									<p>
										개발은 늘 트랜드에 민감해야 한다고 생각합니다.<br />성장하려는 욕심이 없다면 발전할 수 없고, 결국
										고이게 될 것입니다. <br />저는 꾸준히 성장하며 새로운 환경에서도 빠르게 적응할 수 있도록 하겠습니다.

									</p>
								</div>
							</li>
							<li>
								<div class="text-area">
									<strong>세계의 흐름을 읽는 개발자가 되겠습니다</strong>
									<p>
										다른 나라의 문화를 경험해보며, 경제를 꾸준히 공부하고 흐름을 읽을 줄 알아야 한다고 생각했습니다.<br>
										개발자로서 다양한 시선을 가질 수 있고, 글로벌로 진출하기 위해서는 흐름을 알아야한다고 생각합니다.<br>
										이에 따라 계획을 세워 꾸준히 성장하고, 세계의 흐름을 읽을 줄 아는 개발자가 되겠습니다.
									</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="google-map">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.352718627358!2d127.02827121611186!3d37.49959833571472!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca15796fe3091%3A0xaa658b05561b79ab!2z7ISc7Jq47Yq567OE7IucIOqwleuCqOq1rCDsl63sgrzrj5kg7YWM7Zek656A66GcN-q4uCA3!5e0!3m2!1sko!2skr!4v1629262397606!5m2!1sko!2skr"
				width="100%" height="450" style="border: 0;"></iframe>

		</div>
		<div class="wrap">
			<h2>Contact</h2>
			<p>
				<b>Address </b>서울특별시 강남구 테헤란로7길 7 중앙정보처리학원 <br /> <br /> <b>Project
				</b> Gohome <br /> <br /> <b>Team Member </b> 성재경 신영섭 안재우 이현우 임수빈 최은비
				<br /> <br />
				<!-- <b>Phone</b> 					
					<a href="tel:01042379510">gohome@naver.com</a> 
						<br /> <br /> 
						<b>E-mail</b>
					<a href="mailto:gohome@naver.com">gohome@naver.com</a> -->
			</p>
		</div>
	</div>


	<footer>
		<nb:footer></nb:footer>
	</footer>
</body>
</html>
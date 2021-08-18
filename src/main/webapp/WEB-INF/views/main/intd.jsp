<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nb" tagdir="/WEB-INF/tags/nb"%>

<!DOCTYPE html>

<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<nb:navbar></nb:navbar>
		<div class="contact">
			<div class="recruit animation-recruit">
				<div class="blueant">
					<div class="wrap">
						<h2>Gohome</h2>
						<ul class="cb">
							<li>
								<div class="text-area">
									<strong>일하는 것을 재미있어 합니다. </strong>
									<p>
										일을 통해 문제를 해결하고, 새로운 도전을 해보고, 성공의 기쁨을 느끼고, <br /> 원하는 결과는 얻지
										못하더라도, 새로운 것을 배우는 과정을 즐길 수 있습니다.
									</p>
								</div>
							</li>
							<li>
								<div class="text-area">
									<strong>더 좋은 사람이 되기 위한 열정이 있습니다.</strong>
									<p>
										‘세상에는 성공한 사람과 실패한 사람으로 구분되는 것이 아니라, <br /> 성장하는 사람과 그렇지 못한
										사람으로 나눕니다.’ <br /> 고홈은 자신의 삶의 매순간을 소중하게 생각하며 성장을 위해 <br />
										구체적인 노력을 실행에 옮깁니다.
									</p>
								</div>
							</li>
							<li>
								<div class="text-area">
									<strong>근성이 있습니다.</strong>
									<p>
										세상에 큰 변화를 만드는 Change Maker들에게는 ‘성공체험’이라는<br />공통점이 있습니다. 아주
										작고 사소한 일이더라도, 목표를 달성하기 위해<br />매몰차게 몰입해 갑니다.
									</p>
								</div>
							</li>
							<li>
								<div class="text-area">
									<strong>함께 성취하는 기쁨을 추구합니다.</strong>
									<p>우리 팀이 승리하는 것을 중요하게 생각합니다.</p>
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
	</div>
</body>
</html>
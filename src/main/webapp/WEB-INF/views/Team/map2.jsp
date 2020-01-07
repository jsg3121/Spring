<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a34fb1a44115ceb8abf8ead58e8d119"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a34fb1a44115ceb8abf8ead58e8d119"></script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css"
	type="text/css">
<style type="text/css">
	#maps{
		margin: 0px 25px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화 지도</title>
</head>
<body>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
		<c:import url="LeftMenu.jsp" />
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top.jsp" />
		<!-- 컨탠츠 -->
		<div class="layout content" id="content"> 
		<h1>문화 지도</h1>
			<div id="maps" style="width: 850px; height: 550px;"></div>
			<script type="text/javascript">
				$(document).ready(function() {

				});
				var mapContainer = document.getElementById('maps'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new daum.maps.LatLng(37.562367, 127.096295), // 지도의 중심좌표
			        level: 9 // 지도의 확대 레벨
			    };

			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커가 표시될 위치입니다 
			var positions = [
    {
        content: '<div>아차산 유아숲체험</div>', 
     
        latlng: new daum.maps.LatLng(37.562367 , 127.096295)
    },
    {
        content: '<div>아차산생태공원 생태교육</div>', 
        latlng: new daum.maps.LatLng(37.551980, 127.100710)
    },
    {
        content: '<div>청년드림관악캠프</div>', 
        latlng: new daum.maps.LatLng(37.478151, 126.951731)
    },
    {
        content: '<div>문화예술교육 지원사업 연극반 모집</div>',
        latlng: new daum.maps.LatLng(37.636745 , 127.041376)
    },
    {
        content: '<div>보건지소 어린이건강체험관</div>',
        latlng: new daum.maps.LatLng(37.478451, 126.951114)
    },
    {
        content: '<div>디자인 감각놀이터 디키디키</div>',
        latlng: new daum.maps.LatLng(37.566958,127.009596)
    },
    {
        content: '<div>문화예술교육 지원사업 연극반 모집</div>',
        latlng: new daum.maps.LatLng(37.636745 , 127.041376)
    },
    {
        content: '<div>어제 오늘 그리고 내일</div>',
        latlng: new daum.maps.LatLng(37.5666713 , 126.978177)
    },
    {
        content: '<div>문스타 뮤지컬과 세계시민교육</div>',
        latlng: new daum.maps.LatLng(37.475092 , 126.899085)
    },
    {
        content: '<div>［꿈꾸는어린이도서관 ］ 엄마표 영어동화  스토리텔링</div>',
        latlng: new daum.maps.LatLng(37.639401 ,127.067743)
    },
    {
        content:'<div>강동노인종합복지관 2학기 사회교육 프로그램 <br/></div>',
        
        latlng: new daum.maps.LatLng(37.552316 ,127.154266)
    },
    {
        content: '<div><미술관이 된 구벨기에영사관></div>',
        
        latlng: new daum.maps.LatLng(37.476118 ,126.979562)
    },
    {
        content: '<div>2018. 유아 및 어린이 독서회 모집</div>',
        
        latlng: new daum.maps.LatLng(37.538179,127.091827)
    },
    {
        content: '<div>어린이 영어 독서 클럽(그림책으로 시작하는 영어)</div>',
        
        latlng: new daum.maps.LatLng(37.551052 ,127.110570)
    },
    {
        content: '<div>친환경 속의 체험교실</div>',
        
        latlng: new daum.maps.LatLng(37.465672,127.089786)
    },
    {
        content: '<div>교과서 속의 음악여행</div>',
        
        latlng: new daum.maps.LatLng(37.537421,127.070536)
    },
    {
        content: '<div>무지개 클럽 멤버 모집</div>',
        
        latlng: new daum.maps.LatLng(37.652588,127.044066)
    },
    {
        content: '<div>[평생학습관]연필스케치와 꽃그림그리기 A반<br/>[평생학습관]오카리나<br/>[평생학습관]통기타<br/>[평생학습관]플루트A반<br/>[평생학습관]한국화 채색화B<br/>[평생학습관]하모니카초급<br/>'
        +'[평생학습관]한국화 채색화<br/>[평생학습관]한글서예<br/>[평생학습관]해금 초급<br/>[평생학습관]한문서예 초급<br/>[평생학습관]한지공예어르신<br/>ABC기초영어 특강(65세이상 무료특강)[평생학습관]해금 중급<br/>'
        +'[평생학습관]한문서예 중급<br/>[평생학습관]어르신영어</div>',
        
        latlng: new daum.maps.LatLng(37.516933,126.866441)
    },
    {
        content: '<div>［강서구 생활문화지원센터 ］0;염창문화예술창작공간0;을 소개합니다</div>',
        
        latlng: new daum.maps.LatLng(37.513181,126.900143)
    },
    {
        content: '<div>(신촌 홍대) 눈탱이감탱이 - 암흑카페</div>',
        
        latlng: new daum.maps.LatLng(37.556542,126.935409)
    },
    {
        content: '<div>제4기 노원평생교육원 프로그램 수강생 모집(가을특강)<br/>제4기 노원평생교육원 프로그램 수강생 모집 (청소년)<br/>'
        +'제4기 노원평생교육원 프로그램 접수 (성인)<br/></div>',
        
        latlng: new daum.maps.LatLng(37.653003,127.057986)
    },
    {
        content: '<div>훈련원과 하도감</div>',
        
        latlng: new daum.maps.LatLng(37.567213,127.012107)
    },
    {
        content: '<div>내일 세상은 아름다울 것이다</div>',
        
        latlng: new daum.maps.LatLng(37.573012,127.013751)
    },
    {
        content: '<div>도봉구 청소년참여위원회 늘솔길 6기 위원 모집</div>',
        
        latlng: new daum.maps.LatLng(37.654139 ,127.028990)
    },
    {
        content: '<div>정릉3동 자치회관 2층 회의실</div>',
        
        latlng: new daum.maps.LatLng(37.604423,127.011132)
    },
    {
        content: '<div>가나아트 컬렉션 <시대유감 時代遺憾></div>',
        
        latlng: new daum.maps.LatLng(37.564037,126.973781)
    },
    {
        content: '<div>군기시유적전시실</div>',
        
        latlng: new daum.maps.LatLng(37.566677,126.978153)
    },
    {
        content: '<div>요리하는 마술사</div>',        
        latlng: new daum.maps.LatLng(37.586223,127.000719)
    },
    {
        content: '<div>중국어 회화<br/>[낙성대공원도서관] Gang Gam-chan English Book Club<br/>강감찬 영어독서회원 모집<br/>문화가 있는날</div>',        
        latlng: new daum.maps.LatLng(37.472064,126.959358)
    },
    {
        content: '<div>[방아다리문학도서관]동화 쏙! 영어 쑥!<br/>[방아다리문학도서관]모여라 악동(樂童)<br/>[방아다리문학도서관]초등3-6 어린이 한자 병법</div>',        
        latlng: new daum.maps.LatLng(37.538528 ,126.827165)
    },
    {
        content: '<div>2018 독립영화 공공상영회</div>',        
        latlng: new daum.maps.LatLng(37.467744,126.944788)
    },
    {
        content: '<div>구립용산장애인복지관 모아음악수업 참여자모집</div>',        
        latlng: new daum.maps.LatLng(37.547329,126.961548)
    },
    {
        content: '<div>궁 : 장녹수전</div>',        
        latlng: new daum.maps.LatLng(37.565973,126.972855)
    },
   
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new daum.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
         // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
			</script>
		</div>

		<!-- 특수구역 -->
		<div class="history">
			<c:import url="History.jsp" />
		</div>
	</div>
	<!-- 하단 정보 -->
	<div class="bottom">
		<c:import url="Bottom.jsp" />
	</div>
</body>
</html>
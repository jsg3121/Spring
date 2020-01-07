<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a34fb1a44115ceb8abf8ead58e8d119"></script> -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a34fb1a44115ceb8abf8ead58e8d119&libraries=services"></script>
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
				var infowindow = new daum.maps.InfoWindow({
					zIndex : 1
				});
				var mapContainer = document.getElementById('maps'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new daum.maps.services.Places(map);

				// 카테고리로 문화르 검색합니다
				ps.categorySearch('CT1', placesSearchCB, {
					useMapBounds : true
				});

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === daum.maps.services.Status.OK) {
						for (var i = 0; i < data.length; i++) {
							displayMarker(data[i]);
						}
					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
					// 마커를 생성하고 지도에 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : new daum.maps.LatLng(place.y, place.x)
					});

					// 마커에 클릭이벤트를 등록합니다
					daum.maps.event
							.addListener(
									marker,
									'click',
									function() {
										// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
										infowindow
												.setContent('<div style="padding:5px;font-size:12px;">'
														+ place.place_name
														+ '</div>');
										infowindow.open(map, marker);
									});
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
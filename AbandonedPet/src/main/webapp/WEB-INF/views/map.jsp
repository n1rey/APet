<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  
  <style>
/* 	.box {
		position:relative;
	}  
  
  */
  	.animal-header {
  		z-index:999;
  		margin-left:30px;
  	}
  	
  	#map {
  		/* z-index:-1; */
  		margin-top:-33px;
  	}
  </style>
  
  </head>
  <body>
  		<div class="animal-header">
		  		<img src="/resources/images/animal-header.png" alt="image-header" width="250px"/>
		</div>
	   	<div id="map" style="width: 100%; height: 350px"></div>
	  	<!-- <div class="box2" style="height:200px;"></div> -->

    <script
      src="https://code.jquery.com/jquery-3.6.4.min.js"
      integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
      crossorigin="anonymous"
    ></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe9fe1780c1cb1dd5d288357cca644bb&libraries=clusterer,services"
    ></script>

    <script>
      var map = new kakao.maps.Map(document.getElementById("map"), {
        // 지도를 표시할 div
        center: new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
        level: 14, // 지도의 확대 레벨
      });

      // 마커 클러스터러를 생성합니다
      var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 10, // 클러스터 할 최소 지도 레벨
      });

      var markers = [];

      // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
      function makeOverListener(map, marker, infowindow) {
        return function () {
          infowindow.open(map, marker);
        };
      }
      // 인포윈도우를 닫는 클로저를 만드는 함수입니다
      function makeOutListener(infowindow) {
        return function () {
          infowindow.close();
        };
      }

      $.ajax({
        url: "http://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo?numOfRows=210&pageNo=1&serviceKey=ywr7vnan2TYelVeuVEGeCi2g2aBiBvysz7IerFiz0HaEt3YMUfOgQqBzuuY%2FQKKmvOickN%2Buc9SZ7n1AXPWD%2FA%3D%3D&_type=json",
        dataType: "json",
      }).done(function (data) {
        answer = 0;
        positions = data.response.body.items.item;
        console.log(positions.length);
        for (let i = 0; i < positions.length; i++) {
          if (positions[i].lat == null) {
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch(
              positions[i].careAddr,
              function (result, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {
                  var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                  marker = new kakao.maps.Marker({
                    position: coords,
                    clickable: true, // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
                  });

                  console.log(positions[i]);
                  // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                  var iwContent =
                    '<div style="padding:5px;">' +
                    positions[i].careNm +
                    "</div> <div> Tel : " +
                    positions[i].careTel +
                    "</div>"; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

                  // 인포윈도우를 생성합니다
                  var infowindow = new kakao.maps.InfoWindow({
                    position: iwPosition,
                    content: iwContent,
                  });

                  markers.push(marker);

                  kakao.maps.event.addListener(
                    marker,
                    "mouseover",
                    makeOverListener(map, marker, infowindow)
                  );
                  kakao.maps.event.addListener(
                    marker,
                    "mouseout",
                    makeOutListener(infowindow)
                  );
                }
              }
            );
          } else {
            iwPosition = new kakao.maps.LatLng(
              positions[i].lat,
              positions[i].lng
            );
            marker = new kakao.maps.Marker({
              position: iwPosition,
              clickable: true, // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
            });

            // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent =
              '<div style="padding:5px;">' +
              positions[i].careNm +
              "</div> <div> Tel : " +
              positions[i].careTel +
              "</div>"; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
              position: iwPosition,
              content: iwContent,
            });

            markers.push(marker);

            kakao.maps.event.addListener(
              marker,
              "mouseover",
              makeOverListener(map, marker, infowindow)
            );
            kakao.maps.event.addListener(
              marker,
              "mouseout",
              makeOutListener(infowindow)
            );
          }
        }
        clusterer.addMarkers(markers);
      });
    </script>
  </body>
</html>

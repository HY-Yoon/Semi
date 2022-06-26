<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 추천</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reco_main.css?1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>

<body>

<header>
	<jsp:include page="../default/mypage_header.jsp"/>
</header>
 <%
 		String fav = (String)request.getAttribute("fav");
 %>
 <script type="text/javascript">
		//sessionStorage.setItem("fav","${fav}");
		sessionStorage.setItem("fav","${sessionScope.fav}");
		sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
 </script>
<main>
	<div class="wrap">
			<div class="w_content">
				
			<div class="w_fav">
				<h1>관심지역 ${sessionScope.fav }</h1>
			</div>
			<div class="layout">	
				<c:choose>
					<c:when test="${fav eq '서울'}">
						<div class="w_img">
							<img alt="서울" src="https://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=14920&fileTy=MEDIA&fileNo=1&thumbTy=L">
									</div>
													
								</c:when>
					
					<c:when test="${fav eq '부산' }">
						<div class="w_img">
							<img src="https://bto.or.kr/attach/IMAGE/Board/95/2021/3/KkCmGzRAQBfxFsKx.JPG" alt="호천마을">
								</div>
									</c:when>
					
					
					<c:when test="${fav eq '경기' }">
						<div class="w_img">
							<img src="https://ggtour.or.kr/cgi/upload/story100/01%20%EA%B3%A8%EB%AA%A9%EC%97%90%EC%84%9C%20%EB%A7%8C%EB%82%9C%20%EB%8F%84%EC%8B%9C%20%EC%9D%B4%EC%95%BC%EA%B8%B0/04%20%ED%8C%8C%EC%A3%BC%20%EC%9E%A5%ED%8C%8C%EB%A6%AC/img/edit_images07.JPG" alt="평화누리공원">
								</div>
									</c:when>
					
					
					<c:when test="${fav eq '인천' }">
						<div class="w_img">
						    <img src="https://itour.incheon.go.kr/common/viewImg.do?imgId=DBI21122716225959207" alt="월미도">
								</div>
									</c:when>
									
									
					<c:when test="${fav eq '충청' }">
						<div class="w_img">
						     <img src="https://tour.chungbuk.go.kr/DATA/tour/main/thumb/t_15124473403.jpg" alt="월류봉">
								</div>
									</c:when>
					
					
					<c:when test="${fav eq '강원' }">
						<div class="w_img">
						    <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=5ef78854-8087-4c7b-9c9b-be375d9d9556" alt="육백마지기">
								</div>
									</c:when>
					
					
					<c:when test="${fav eq '전라' }">
						<div class="w_img">
							  <img src="https://t1.daumcdn.net/brunch/service/user/1jPF/image/qFZGU4gYug8cv0rEOGb5jbIJc9U.jpg" alt="순천만">
								</div>
									</c:when>
					
					
					<c:when test="${fav eq '경상' }">
						<div class="w_img">
						 <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=e913e2a8-e574-4f64-8f85-07927a9b30da" alt="미륵산">
								</div>
									</c:when>
					
					
					<c:when test="${fav eq '제주' }">
						<div class="w_img">
						    <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg" alt="우도">
								</div>
									</c:when>
									
						</c:choose>
												
			<div class="weather">
				<span class="w_fav">${sessionScope.fav } 현재 날씨</span>
					  <p class="time">
                 <span class="today">00.00.일 00:00</span>
                    </p>
          	          <span class="status_img">
                        <img src="" alt="날씨" class="weather_img">
            	        </span>
              		      <span class="status">
                        			
                  			  </span>
                  			  
					</div>
				
				</div>
			<div class="else">
			<div class="ment">
				<h1 style="text-align: center;">여행지 추천</h1>
			</div>
			
				<div class="e_wrap">
					<div class="e_img">
					<figure>
						<img src="https://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=14920&fileTy=MEDIA&fileNo=1&thumbTy=L" alt="롯데월드타워">
						<strong class="txt">서울 롯데타워</strong>
							<figcaption>
								<strong>서울 롯데타워</strong>
									<span>자세히보기</span>
									</figcaption>
										</figure>
					 				</div>
					
					<div class="e_img">
						<figure>
							<img src="https://ggtour.or.kr/cgi/upload/story100/01%20%EA%B3%A8%EB%AA%A9%EC%97%90%EC%84%9C%20%EB%A7%8C%EB%82%9C%20%EB%8F%84%EC%8B%9C%20%EC%9D%B4%EC%95%BC%EA%B8%B0/04%20%ED%8C%8C%EC%A3%BC%20%EC%9E%A5%ED%8C%8C%EB%A6%AC/img/edit_images07.JPG" alt="평화누리공원">
							<strong class="txt">파주 평화누리공원</strong>
								<figcaption>
									<strong class="txt">파주 평화누리공원</strong>
										<span>자세히보기</span>
											</figcaption>
												</figure>
											</div>
											
					<div class="e_img">
						<figure>
							<img src="https://itour.incheon.go.kr/common/viewImg.do?imgId=DBI21122716225959207" alt="월미도">
							<strong class="txt">인천 월미도</strong>
								<figcaption>
									<strong class="txt">인천 월미도</strong>
										<span>자세히보기</span>
											</figcaption>
												</figure>
											</div>						
					
					</div>
				
				
			<div class="e_wrap">
			
				<div class="e_img">
						<figure>
							<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=5ef78854-8087-4c7b-9c9b-be375d9d9556" alt="육백마지기">
							<strong class="txt">평창 육백마지기</strong>
								<figcaption>
									<strong class="txt">평창 육백마지기</strong>
										<span>자세히보기</span>
											</figcaption>
												</figure>
											</div>
					
				<div class="e_img">
						<figure>
						<img src="https://tour.chungbuk.go.kr/DATA/tour/main/thumb/t_15124473403.jpg" alt="월류봉">
							<strong class="txt">청주 월류봉</strong>
								<figcaption>
									<strong class="txt">청주 월류봉</strong>
										<span>자세히보기</span>
											</figcaption>
												</figure>
											</div>
											
			<div class="e_img">
						<figure>
							 <img src="https://t1.daumcdn.net/brunch/service/user/1jPF/image/qFZGU4gYug8cv0rEOGb5jbIJc9U.jpg" alt="순천만">
							<strong class="txt">순천만</strong>
								<figcaption>
									<strong class="txt">순천만</strong>
										<span>자세히보기</span>
											</figcaption>
												</figure>
											</div>
				</div>
				
				<div class="e_wrap">
				<div class="e_img">
						<figure>
							<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=e913e2a8-e574-4f64-8f85-07927a9b30da" alt="미륵산">
							<strong class="txt">통영 미륵산</strong>
								<figcaption>
									<strong class="txt">통영 미륵산</strong>
										<span>자세히보기</span>
											</figcaption>
												</figure>
											</div>
					
				<div class="e_img">
						<figure>
							<img src="https://bto.or.kr/attach/IMAGE/Board/95/2021/3/KkCmGzRAQBfxFsKx.JPG" alt="호천마을">
							<strong class="txt">부산 호천마을</strong>
								<figcaption>
									<strong class="txt">부산 호천마을</strong>
										<span>자세히보기</span>
											</figcaption>
												</figure>
											</div>
											
				<div class="e_img">
						<figure>
							 <img src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg" alt="우도">
							<strong class="txt">제주 우도</strong>
								<figcaption>
									<strong class="txt">제주 우도</strong>
										<span>자세히보기</span>
											</figcaption>
												</figure>
											</div>
											
				</div>
				
			</div>
				
				
			</div>
	
	
	</div>
	
</main>



<footer>
	<jsp:include page="../default/default_footer.jsp"/>
</footer>

<script src="${pageContext.request.contextPath}/js/recommend_main.js"></script>
</body>
</html>
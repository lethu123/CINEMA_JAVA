<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE HTML>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BHD CINEMA</title>
<!-- Favicon Icon -->
<jsp:include page="layouts/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/home/css/layout.css"
	media="all" />


<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<!-- Page loader -->
	<div id="preloader"></div>
	<!-- header section start -->

	<jsp:include page="layouts/navbar.jsp"></jsp:include>

	<!-- breadcrumb area start -->
	<section class="breadcrumb-area breadcrumb-area-custom "></section>
	<!-- breadcrumb area end -->

	<!-- video section start -->
	<section class="video ptb-90">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title pb-20">
						<h1>
							<i class="icofont icofont-film"></i> <s:message code="lable.movie_coming_soon_1"/>
						</h1>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-md-12">
					<div class="video-slider mt-20">
						<c:forEach var="film" items="${listFilm}">
							<div class="image">
								<div class="video-area">
									<img src="${film.image_film }" alt="video" /> <a
										href="${film.trailer }" class="popup-youtube"> <i
										class="icofont icofont-ui-play"></i>
									</a>
								</div>
								<h3><a href="${pageContext.request.contextPath}/detail/${film.id}">
												${film.name }</a></h3>
								<div class="review">
									<div class="author-review">
										<span style="color: #b6b7b9;"> <s:message code="lable.evaluate"/>: </span>
										<c:forEach begin="0" end="${film.evaluate }">
											<i class="icofont icofont-star"></i>
										</c:forEach>
									</div>

								</div>
								<p><s:message code="lable.view"/>: ${film.duration } m</p>
								
							</div>

						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- video section end -->



	<jsp:include page="layouts/footer.jsp"></jsp:include>
	<jsp:include page="layouts/bottom.jsp"></jsp:include>
	<!-- custom -->

</body>

</html>
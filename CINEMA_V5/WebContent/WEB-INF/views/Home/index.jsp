<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>Moviepoint - Online Movie,Vedio and TV Show HTML Template</title>
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


	<!-- hero area start -->
	<section class="hero-area" id="home">
		<div class="container">
			<div class="hero-area-slider">
				<c:forEach var="film" items="${listFilm1 }">
					<div class="row hero-area-slide">
						<div class="col-lg-6 col-md-5">
							<div class="hero-area-content">
								<img src="${film.image_film }" alt="about" />
							</div>
						</div>
						<div class="col-lg-6 col-md-7">
							<div class="hero-area-content pr-50">
								<h2>${film.name }</h2>
								<div class="review">
									<div class="author-review">
										<i class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i>
									</div>
									<h4>180k voters</h4>
								</div>
								<%-- <p>
									${film.describe}
								</p> --%>
								<p>She is a devil princess from the demon world. She grew up
									sheltered by her parents and doesn't really know how to be evil
									or any of the common actions, She is unable to cry due ...</p>

								<div class="slide-trailor">
									<h3>Watch Trailer</h3>
									<a class="theme-btn theme-btn2" href="#"><i
										class="icofont icofont-play"></i> Tickets</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="hero-area-thumb">
				<div class="thumb-prev">
					<div class="row hero-area-slide">
						<div class="col-lg-6">
							<div class="hero-area-content">
								<img src="${pageContext.request.contextPath}/assets/home/img/slide3.png" alt="about" />
							</div>
						</div>
						<div class="col-lg-6">
							<div class="hero-area-content pr-50">
								<h2>Last Avatar</h2>
								<div class="review">
									<div class="author-review">
										<i class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i>
									</div>
									<h4>180k voters</h4>
								</div>
								<p>She is a devil princess from the demon world. She grew up
									sheltered by her parents and doesn't really know how to be evil
									or any of the common actions, She is unable to cry due to...</p>
								<div class="slide-trailor">
									<h3>Watch Trailer</h3>
									<a class="theme-btn theme-btn2" href="#"><i
										class="icofont icofont-play"></i> Tickets</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="thumb-next">
					<div class="row hero-area-slide">
						<div class="col-lg-6">
							<div class="hero-area-content">
								<img src="${pageContext.request.contextPath}/assets/home/img/slide1.png" alt="about" />
							</div>
						</div>
						<div class="col-lg-6">
							<div class="hero-area-content pr-50">
								<h2>The Deer God</h2>
								<div class="review">
									<div class="author-review">
										<i class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i> <i
											class="icofont icofont-star"></i>
									</div>
									<h4>180k voters</h4>
								</div>
								<p>She is a devil princess from the demon world. She grew up
									sheltered by her parents and doesn't really know how to be evil
									or any of the common actions, She is unable to cry due to...</p>
								
								<div class="slide-trailor">
									<h3>Watch Trailer</h3>
									<a class="theme-btn theme-btn2" href="#"><i
										class="icofont icofont-play"></i> Tickets</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- hero area end -->
	<!-- portfolio section start -->
	<section class="portfolio-area pt-60">
		<div class="container">
			<div class="row flexbox-center">
				<div class="col-lg-6 text-center text-lg-left">
					<div class="section-title">
						<h1>
							<i class="icofont icofont-movie"></i> Phim sắp chiếu
						</h1>
					</div>
				</div>
				<div class="col-lg-6 text-center text-lg-right">
					<!-- <div class="portfolio-menu">
						<ul>
							<li data-filter="*" class="active">Latest</li>
							<li data-filter=".soon">Comming Soon</li>
							<li data-filter=".top">Top Rated</li>
							<li data-filter=".released">Recently Released</li>
						</ul>
					</div> -->

				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-lg-9">
					<div class="row portfolio-item">
						<c:forEach var="film" items="${listFilm2 }">
							<div class="col-md-4 col-sm-6">
								<div class="single-portfolio">
									<div class="single-portfolio-img">
										<img src="${film.image_film }" alt="portfolio" /> <a
											href="${film.trailer }" class="popup-youtube"> <i
											class="icofont icofont-ui-play"></i>
										</a>
									</div>
									<div class="portfolio-content">
										<h2>
											<a
												href="${pageContext.request.contextPath}/detail/${film.id}">
												${film.name }</a>
										</h2>
										<div class="review">
											<div class="author-review">
												<span style="color: #b6b7b9;"> Đánh giá: </span>
												<c:forEach begin="0" end="${film.evaluate }">
													<i class="icofont icofont-star"></i>
												</c:forEach>
											</div>
										</div>
										<br>
										<p>Lượt xem: 180k voters</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-lg-3  text-lg-left">
					<div style="margin-top: 48px; font-size: 22px"
						class="text-lg-left text-center">
						<i class="icofont icofont-bars"
							style="font-size: 35px; color: #fece50; margin-right: 5px"></i>Top
						phim
					</div>
					<hr>
					<div class="portfolio-sidebar">
						<c:forEach var="film" items="${topFilm }">
							<div class="left">
								<div class="img">
									<img alt="" src="${film.image_film }">
								</div>
								<div class="info_film">
									<p>
										Phim: <a
											href="${pageContext.request.contextPath}/detail/${film.id}">
											${film.name }</a>
									</p>
									<p>
										Đánh giá: ${film.evaluate } <i class="icofont icofont-star"
											style="color: #fece50;"></i>
									</p>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>



	<section class="portfolio-area pt-60">
		<div class="container">
			<div class="row flexbox-center">
				<div class="col-lg-6 text-center text-lg-left">
					<div class="section-title">
						<h1>
							<i class="icofont icofont-movie"></i> Phim đang chiếu
						</h1>
					</div>
				</div>
				<div class="col-lg-6 text-center text-lg-right"></div>
			</div>
			<hr />
			<div class="row">
				<div class="col-lg-12">
					<div class="row portfolio-item">
						<c:forEach var="film" items="${listFilm1 }">
							<div class="col-md-3 col-sm-6">
								<div class="single-portfolio">
									<div class="single-portfolio-img">
										<img src="${film.image_film }" alt="portfolio" /> <a
											href="${film.trailer }" class="popup-youtube"> <i
											class="icofont icofont-ui-play"></i>
										</a>
									</div>
									<div class="portfolio-content">
										<h2>
											<a
												href="${pageContext.request.contextPath}/detail/${film.id}">
												${film.name }</a>
										</h2>
										<div class="review">
											<div class="author-review">
												<span style="color: #b6b7b9;"> Đánh giá: </span>
												<c:forEach begin="0" end="${film.evaluate }">
													<i class="icofont icofont-star"></i>
												</c:forEach>
											</div>
										</div>
										<br>
										<p>Lượt xem: 180k voters</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- portfolio section end -->
	
	<!-- news section start -->
	<section class="news" style="margin-top:35px" id="news">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title pb-20">
						<h1>
							<i class="icofont icofont-coffee-cup"></i> Tin mới
						</h1>
					</div>
				</div>
			</div>
			<hr />
		</div>
		<div class="news-slide-area">
			<div class="news-slider">
				<div class="single-news">
					<div class="news-bg-1"></div>
					<div class="news-date">
						<h2>
							<span>NOV</span> 25
						</h2>
						<h1>2017</h1>
					</div>
					<div class="news-content">
						<h2>The Witch Queen</h2>
						<p>Witch Queen is a tall woman with a slim build. She has pink
							hair, which is pulled up under her hat, and teal eyes.</p>
					</div>
					<a href="#">Read More</a>
				</div>
				<div class="single-news">
					<div class="news-bg-2"></div>
					<div class="news-date">
						<h2>
							<span>NOV</span> 25
						</h2>
						<h1>2017</h1>
					</div>
					<div class="news-content">
						<h2>The Witch Queen</h2>
						<p>Witch Queen is a tall woman with a slim build. She has pink
							hair, which is pulled up under her hat, and teal eyes.</p>
					</div>
					<a href="#">Read More</a>
				</div>
				<div class="single-news">
					<div class="news-bg-3"></div>
					<div class="news-date">
						<h2>
							<span>NOV</span> 25
						</h2>
						<h1>2017</h1>
					</div>
					<div class="news-content">
						<h2>The Witch Queen</h2>
						<p>Witch Queen is a tall woman with a slim build. She has pink
							hair, which is pulled up under her hat, and teal eyes.</p>
					</div>
					<a href="#">Read More</a>
				</div>
			</div>
			<div class="news-thumb">
				<div class="news-next">
					<div class="single-news">
						<div class="news-bg-3"></div>
						<div class="news-date">
							<h2>
								<span>NOV</span> 25
							</h2>
							<h1>2017</h1>
						</div>
						<div class="news-content">
							<h2>The Witch Queen</h2>
							<p>Witch Queen is a tall woman with a slim build. She has
								pink hair, which is pulled up under her hat, and teal eyes.</p>
						</div>
						<a href="#">Read More</a>
					</div>
				</div>
				<div class="news-prev">
					<div class="single-news">
						<div class="news-bg-2"></div>
						<div class="news-date">
							<h2>
								<span>NOV</span> 25
							</h2>
							<h1>2017</h1>
						</div>
						<div class="news-content">
							<h2>The Witch Queen</h2>
							<p>Witch Queen is a tall woman with a slim build. She has
								pink hair, which is pulled up under her hat, and teal eyes.</p>
						</div>
						<a href="#">Read More</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- news section end -->


	<jsp:include page="layouts/footer.jsp"></jsp:include>
	<jsp:include page="layouts/bottom.jsp"></jsp:include>
	<!-- custom -->

</body>

</html>
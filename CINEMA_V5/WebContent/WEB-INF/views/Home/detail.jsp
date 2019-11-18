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
	<section class="breadcrumb-area breadcrumb-area-custom"></section>
	<!-- breadcrumb area end -->
	<!-- transformers area start -->
	<section class="transformers-area">
		<div class="container">
			<div class="transformers-box">
				<div class="row flexbox-center">
					<div class="col-lg-5 text-lg-left text-center">
						<div class="transformers-content">
							<img src="${filmDetail.image_film}" alt="about" />
						</div>
					</div>
					<div class="col-lg-7">
						<div class="transformers-content">
							<h2>${filmDetail.name}</h2>
							<p><s:message code="lable.film" /> 2D | <s:message code="lable.high_quality" /></p>
							<ul>
								<li>
									<div class="transformers-left"><s:message code="lable.producer" />:</div>
									<div class="transformers-right">${filmDetail.producer}</div>
								</li>
								<li>
									<div class="transformers-left"><s:message code="lable.actor" />:</div>
									<div class="transformers-right">${filmDetail.actor}</div>
								</li>

								<li>
									<div class="transformers-left"><s:message code="lable.duration" />:</div>
									<div class="transformers-right">${filmDetail.duration}m</div>
								</li>
								<li>
									<div class="transformers-left"><s:message code="lable.release" />:</div>
									<div class="transformers-right">${filmDetail.release}</div>
								</li>
								<li>
									<div class="transformers-left"><s:message code="lable.evaluate" />:</div>
									<div class="transformers-right" style="color: #fece50;">
										<c:forEach begin="0" end="${filmDetail.evaluate }">
											<i class="icofont icofont-star"></i>
										</c:forEach>
									</div>

								</li>
								<li>
									<div class="transformers-left"><s:message code="lable.cinema" />:</div>
									<div class="transformers-right">BHD Lê Văn Việt - Quận 9</div>
								</li>
								<li>
									<div class="transformers-left">Share:</div>
									<div class="transformers-right">
										<a href="#"><i class="icofont icofont-social-facebook"></i></a>
										<a href="#"><i class="icofont icofont-social-twitter"></i></a>
										<a href="#"><i class="icofont icofont-social-google-plus"></i></a>
										<a href="#"><i class="icofont icofont-youtube-play"></i></a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- transformers area end -->
	<!-- details area start -->
	<section class="details-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="details-content">
						<div class="details-overview">
							<h2><s:message code="lable.summary" /></h2>
							<p>${filmDetail.describe}</p>
						</div>
						<div class="details-reply">
							<h2><s:message code="lable.comment" /></h2>
							<form action="#">
								<div class="row">
									<div class="col-lg-12">
										<div class="textarea-container">
											<textarea placeholder="Thêm bình luận của bạn"></textarea>
										</div>
										<div class="details-comment">
											<button class="theme-btn theme-btn2"><s:message code="lable.send"/></button>
										</div>
									</div>
								</div>
							</form>
						</div>
						
						<!-- <div class="details-comment">
							<a class="theme-btn theme-btn2" href="#">Post Comment</a>
							<p>You may use these HTML tags and attributes: You may use
								these HTML tags and attributes: You may use these HTML tags and
								attributes:</p>
						</div>
						<div class="details-thumb">
							<div class="details-thumb-prev">
								<div class="thumb-icon">
									<i class="icofont icofont-simple-left"></i>
								</div>
								<div class="thumb-text">
									<h4>Previous Post</h4>
									<p>Standard Post With Gallery</p>
								</div>
							</div>
							<div class="details-thumb-next">
								<div class="thumb-text">
									<h4>Next Post</h4>
									<p>Standard Post With Preview Image</p>
								</div>
								<div class="thumb-icon">
									<i class="icofont icofont-simple-right"></i>
								</div>
							</div>
						</div> -->
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- details area end -->



	<jsp:include page="layouts/footer.jsp"></jsp:include>
	<jsp:include page="layouts/bottom.jsp"></jsp:include>
	<!-- custom -->
	<!-- <script src="assets/js/layout.js"></script> -->
</body>

</html>
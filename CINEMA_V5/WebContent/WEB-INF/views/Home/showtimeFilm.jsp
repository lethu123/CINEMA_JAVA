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
							<i class="icofont icofont-film"></i>
							<s:message code="lable.showtime_film" />
						</h1>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-md-12">
					<div class="details-reply">
						<h2 class="py-4">
							<s:message code="lable.choose_Film" />
						</h2>
						<form action="${pageContext.request.contextPath}/getTimeByFilm"
							method="POST">
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group">
										<div class="form-line">
											<select name="id" class="form-control show-tick"
												data-title="---- Loại phim ----">
												<c:forEach var="ele" items="${listFilmCategory1}">
													<option value="0" style="display: none">-------------</option>
													<option value="${ele.id}">${ele.name}</option>
												</c:forEach>
											</select>
										</div>

									</div>
								</div>
								<div class="col-lg-4">
									<button class="btn btn-success">
										<s:message code="lable.view" />
									</button>
								</div>
							</div>
						</form>

						<div class="test">
							<c:choose>
								<c:when test="${!empty listHour}">
									<p class="mb-3 ">
										<s:message code="lable.showtime_film" />
										: ${nameFilm.name}
									</p>
									<c:forEach var="film" items="${listHour.list}">

										<div class="row mb-4 pb-3 border-bottom">
											<div class="col-sm-12 col-md-3"
												style="border-right: 3px solid green">
												<p class="time_showtime">${film.date}</p>
												<p class="time_showtime">${film.room}</p>
											</div>
											<div class="col-sm-12 col-md-3">
												<c:forEach var="time" items="${film.time}">
													<%-- <p class="time_showtime">${time.hour_show}</p> --%>
													<p class="time_showtime">
														<a
															href="${pageContext.request.contextPath}/booking?date=${film.date}&time=${time.hour_show}&film=${nameFilm.id}&room=${film.room}"
															data-toggle="tooltip" title="Đặt vé">${time.hour_show}</a>
													</p>

												</c:forEach>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p>
										<s:message code="lable.not_found_showtime_date" />
									</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- video section end -->

	<jsp:include page="layouts/footer.jsp"></jsp:include>
	<jsp:include page="layouts/bottom.jsp"></jsp:include>
	<!-- custom -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/pages/forms/basic-form-elements.js"></script>

	<script type="text/javascript">
		$('#bs_datepicker_showtimedate input').datepicker({
			format : 'dd/mm/yyyy'
		})
	</script>

</body>

</html>
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
							<s:message code="lable.showtime_date" />
						</h1>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-md-12">
					<div class="details-reply">
						<h2 class="py-4">
							<s:message code="lable.choose_Date" />
						</h2>
						<form:form action="${pageContext.request.contextPath}/getTime"
							modelAttribute="detailShowtime" method="POST">
							<div class="row">
								<div class="col-lg-4">
									<div class="select-container">
										<div class="form-line" id="bs_datepicker_showtimedate">
											<form:input type="text" path="day_show"
												placeholder="EX: 20/10/2011" />
											<i class="icofont icofont-calendar"></i>
										</div>

									</div>
								</div>
								<div class="col-lg-4">
									<button class="btn btn-success">
										<s:message code="lable._view" />
									</button>
								</div>
							</div>
						</form:form>

						<div class="test">
							<c:choose>
								<c:when test="${!empty listFilm}">
									<p class="mb-3 ">
										<s:message code="lable.showtime_date" />
										${chooseDay}
									</p>
									<c:forEach var="film" items="${listFilm.list}">

										<p class="time_showtime">${film.room}</p>

										<div class="row mb-4">
											<div class="col-sm-12 col-md-3">
												<div class="img_showtime_date">
													<img alt="" src="${film.film.image_film }">
												</div>
											</div>
											<div class="col-sm-12 col-md-9">
												<div class="row">

													<div class="col-sm-12 pl-0">
														<h4>${film.film.name}</h4>
														<p>${film.film.describe}</p>
													</div>
													<div class="col-ms-12 mt-3">
														<c:forEach var="time" items="${film.time}">
															<p class="time_showtime">
																<a
																	href="${pageContext.request.contextPath}/booking?date=${chooseDay}&time=${time.hour_show}&film=${film.film.id}&room=${film.room}"
																	data-toggle="tooltip" title="Đặt vé">${time.hour_show}</a>
															</p>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
										<br>
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
		/* function getDate(val) {
			console.log(val);
			$.post('${pageContext.request.contextPath}/getTime', {
				day_show : val
			}, function(res) {
				console.log(res);
				var content = "";
				content = '';
				$('#time').html(content);
			});
		} */

		$('#bs_datepicker_showtimedate input').datepicker({
			format : 'dd/mm/yyyy'
		})
	</script>

</body>

</html>
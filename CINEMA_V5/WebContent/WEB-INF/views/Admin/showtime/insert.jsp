<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>BHD CINEMA</title>
<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<jsp:include page="../layouts/header.jsp"></jsp:include>

</head>

<body class="theme-blue">
	<!-- Page Loader -->
	<div class="page-loader-wrapper">
		<div class="loader">
			<div class="preloader">
				<div class="spinner-layer pl-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
			<p>Please wait...</p>
		</div>
	</div>
	<!-- #END# Page Loader -->
	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
	<!-- #END# Overlay For Sidebars -->

	<jsp:include page="../layouts/navbar.jsp"></jsp:include>

	<jsp:include page="../layouts/sidebar.jsp"></jsp:include>

	<!--   content -->
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2>
					<s:message code="lable.m_showtime" />
				</h2>
			</div>
			<!-- Basic Examples -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>
								<s:message code="lable.add_showtime" />
							</h2>
						</div>
						<div class="body">
							<div class="row">
								<form:form
									action="${pageContext.request.contextPath}/admin/showtime/insert"
									modelAttribute="showtimeDetail" method="POST">
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.day_show" /></label>
											<div class="form-line" id="bs_datepicker_showtime_date">
												<form:input type="text" path="day_show" class="form-control"
													placeholder="EX: 20/10/2011" />
											</div>
											<div class="error">
												<form:errors path="day_show" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.hour" /></label>
											<div class="form-line">
												<form:input type="text" path="hour_show"
													class="form-control" placeholder="EX: 20:00" />
											</div>
											<div class="error">
												<form:errors path="hour_show" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.film" /> </label>
											<div class="form-line">
												<form:select path="film.id" data-title="-------"
													items="${listFilm}" itemValue="id" itemLabel="name"
													class="form-control show-tick">
												</form:select>
											</div>
											<div class="error">
												<form:errors path="film.id" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.room" /></label>
											<div class="form-line">
												<form:select path="room.id" data-title="-------"
													items="${listRoom}" itemValue="id" itemLabel="name"
													class="form-control show-tick">
												</form:select>
											</div>
											<div class="error">
												<form:errors path="room.id" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 text-center">
										<button class="btn btn-primary" id="update" type="submit">
											<s:message code="lable.update" />
										</button>
										<button class="btn btn-danger" id="cancel" type="button">
											<s:message code="lable.cancel" />
										</button>
									</div>
								</form:form>

							</div>


						</div>
					</div>
				</div>
			</div>
			<!-- #END# Basic Examples -->

		</div>
	</section>
	<!-- end content -->

	<!-- javascript -->
	<jsp:include page="../layouts/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/pages/forms/basic-form-elements.js"></script>
</body>

</html>

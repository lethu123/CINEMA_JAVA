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
								<s:message code="lable.detail_showtime" />
							</h2>
							<ul class="header-dropdown m-r--5">
								<li class="dropdown"><a href="javascript:void(0);"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false"> <i
										class="material-icons">more_vert</i>
								</a>
									<ul class="dropdown-menu pull-right">
										<li><a href="javascript:void(0);">Action</a></li>
										<li><a href="javascript:void(0);">Another action</a></li>
										<li><a href="javascript:void(0);">Something else here</a></li>
									</ul></li>
							</ul>
						</div>
						<div class="body">

							<div class="row">
								<div class="col-sm-12" style="margin-bottom: 0 !important">
									<p>
										<s:message code="lable.new" />
									</p>
									<a class="btn btn-simple   btn-primary btn-icon  "
										href="${pageContext.request.contextPath}/admin/showtime/insert">
										<i class="material-icons">add</i>
									</a>
								</div>
							</div>
							<div class="fresh-datatables table-responsive">
								<table id="js-basic-example_showtime"
									class="table table-bordered table-striped table-hover  dataTable"
									cellspacing="0">
									<thead>
										<tr>
											<th><s:message code="lable.day_show" /></th>
											<th><s:message code="lable.hour" /></th>
											<th><s:message code="lable.film" /></th>
											<th><s:message code="lable.room" /></th>
											<th style="with: 200px !important"><s:message
													code="lable.action" /></th>
										</tr>
									</thead>
									<tbody>
										 <c:forEach var="showtime" items="${listShowtime}">
											<tr>
												<td>${showtime.day_show}</td>
												<td>${showtime.hour_show}</td>
												<td>${showtime.film.name}</td>
												<td>${showtime.room.name}</td>
												<td class=""><a
													class="btn btn-simple btn-warning btn-icon edit"
													href="${pageContext.request.contextPath}/admin/showtime/update?date=${showtime.day_show}&hour="${showtime.hour_show}>
														<i class="material-icons">edit</i>
												</a>
													<button class="btn btn-simple  btn-danger btn-icon  remove"
														type="button" onclick="onDelete('${showtime.day_show}, ${showtime.hour_show}')">
														<i class="material-icons">delete</i>
													</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
		src="${pageContext.request.contextPath}/assets/admin/js/pages/tables/jquery-datatable.js"></script>
</body>

</html>

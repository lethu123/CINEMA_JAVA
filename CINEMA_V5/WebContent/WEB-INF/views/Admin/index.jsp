<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>Welcome To | Bootstrap Based Admin Template - Material
	Design</title>
<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<jsp:include page="layouts/header.jsp"></jsp:include>
<link
	href="${pageContext.request.contextPath}/assets/admin/css/layout.css"
	rel="stylesheet" type="text/css">

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

	<jsp:include page="layouts/navbar.jsp"></jsp:include>

	<jsp:include page="layouts/sidebar.jsp"></jsp:include>

	<!--   content -->
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2>QUẢN LÝ PHIM</h2>
			</div>
			<!-- Basic Examples -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>DANH SÁCH PHIM</h2>
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
							<div class="fresh-datatables table-responsive">
								<table id="js-basic-example"
									class="table table-bordered table-striped table-hover  dataTable"
									cellspacing="0">
									<thead>
										<tr>
											<th>Hình ảnh</th>
											<th>Tên phim</th>
											<th>Mô tả</th>
											<th>Ngày khởi chiếu</th>
											<th>Loại phim</th>
											<th style="with: 200px !important">Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="film" items="${listFilm}">
											<tr>
												<td>
													<div class="td_img">
														<img alt="unknown" src="${film.image_film}">
													</div>
												</td>
												<td>${film.name}</td>
												<td>${film.describe}</td>
												<td>${film.release}</td>
												<td>${film.category}</td>
												<td class=""><a
													class="btn btn-simple btn-warning btn-icon edit" href="${pageContext.request.contextPath}/admin/film/update/${film.id}"> <i
														class="material-icons">edit</i></a> <a
													class="btn btn-simple  btn-danger btn-icon  remove"
													data-toggle="modal" data-target="#largeModalEdit"> <i
														class="material-icons">delete</i></a></td>
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


	<!-- Large Size -->
	<div class="modal fade" id="largeModalEdit" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="largeModalLabel">Cập nhật phim</h4>
				</div>
				<div class="modal-body">body</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link waves-effect">SAVE
						CHANGES</button>
					<button type="button" class="btn btn-link waves-effect"
						data-dismiss="modal">CLOSE</button>
				</div>
			</div>
		</div>
	</div>

	<!-- javascript -->
	<jsp:include page="layouts/footer.jsp"></jsp:include>
	
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/pages/tables/jquery-datatable.js"></script>



</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<jsp:include page="../layouts/navbar.jsp"></jsp:include>

	<jsp:include page="../layouts/sidebar.jsp"></jsp:include>

	<!--   content -->
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2>QUẢN LÍ COMBO</h2>
			</div>
			<!-- Basic Examples -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>DANH SÁCH COMBO</h2>
						</div>
						<div class="body">
							<div class="row">
								<div class="col-sm-12" style="margin-bottom: 0 !important">
									<p>Thêm mới</p>
									<a class="btn btn-simple   btn-primary btn-icon  "
										href="${pageContext.request.contextPath}/admin/combo/insert">
										<i class="material-icons">add</i>
									</a>
								</div>
							</div>
							<div class="fresh-datatables table-responsive">
								<table id="js-basic-example_account"
									class="table table-bordered table-striped table-hover  dataTable">
									<thead>
										<tr>
											<th>Tên combo</th>
											<th>Gía</th>
											<th>Trạng thái</th>
											<th style="with: 200px !important">Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="combo" items="${list_Combo}">
											<tr>
												<td>${combo.name}</td>
												<td>${combo.price}</td>
												<td><c:choose>
														<c:when test="${combo.available == true}">
															<i class="material-icons">done</i>
														</c:when>
														<c:otherwise>

														</c:otherwise>
													</c:choose></td>

												<td class="text-center index"><a
													class="btn btn-simple btn-warning btn-icon edit"
													href="${pageContext.request.contextPath}/admin/combo/update/${combo.id}">
														<i class="material-icons">edit</i>
												</a>
													<button class="btn btn-simple  btn-danger btn-icon  remove"
														type="button" onclick="onDelete('${combo.id}')">
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

	<script type="text/javascript">
		function onDelete(id) {
			var seft = this;
			if (id) {
				swal(
						{
							title : "XÓA",
							text : "Bạn muốn xóa loại vé này ra khỏi hệ thống !",
							type : "warning",
							showCancelButton : true,
							confirmButtonColor : "#DD6B55",
							confirmButtonText : "Xóa",
							cancalButtonText : "Hủy",
							closeOnConfirm : false
						},
						function() {
							$
									.post(
											'${pageContext.request.contextPath}/admin/combo/delete',
											{
												id : id
											},
											function(res) {
												console.log(res);
												swal(
														{
															title : 'THÔNG BÁO',
															type : res.errorCode == 0 ? 'success'
																	: 'error',
															text : res.message
														}, function() {
															window.location.reload();
														}

												);
											});
						});
			}
		}

		
	</script>

</body>

</html>

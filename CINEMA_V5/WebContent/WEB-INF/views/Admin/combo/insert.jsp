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
			<div class="block-header"></div>
			<!-- Basic Examples -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>THÊM MỚI COMBO</h2>
						</div>
						<div class="body">
							<div class="row">
								<form:form method="post"
									action="${pageContext.request.contextPath}/admin/combo/insert"
									modelAttribute="detailCombo">
									<div class="col-sm-12 col-md-8">
										<form:hidden path="id" />
										<div class="form-group">
											<label>Tên combo</label>
											<div class="form-line">
												<form:input path="name" class="form-control date"
													placeholder="EX: Combo bắp nước" />
											</div>
											<div class="error">
												<form:errors path="name" />
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>Trạng thái</label>
											<div class="demo-switch">
												<div class="switch">
													<label>OFF <input name="_is_available"
														type="checkbox" checked /><span
														class="lever switch-col-blue"></span>ON
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-12 col-md-8">
										<div class="form-group">
											<label>Gía combo</label>
											<div class="form-line">
												<form:input path="price" type="number"
													class="form-control date" placeholder="EX: 20.000 đ" />
											</div>
											<div class="error">
												<form:errors path="price" />
											</div>
										</div>
									</div>

									<div class="col-sm-12 text-center">
										<button class="btn btn-primary" id="update" type="submit">
											Lưu</button>
										<a class="btn btn-danger"
											href="${pageContext.request.contextPath}/admin/combo"
											type="button"> Hủy </a>
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

</body>

</html>

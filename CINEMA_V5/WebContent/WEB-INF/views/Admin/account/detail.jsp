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
				<h2>THÔNG TIN TÀI KHOẢN</h2>
			</div>
			<!-- Basic Examples -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>Tài khoản: ${detailAccount.username }</h2>
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
								<div class="col-sm-12 col-md-4">
									<div class="img_avatar">
										<c:choose>
											<c:when test="${detailAccount.avatar.length() > 0 }">
												<img alt="" src="${pageContext.request.contextPath}/assets/admin/images/${detailAccount.avatar}">
											</c:when>
											<c:otherwise>
												<img alt="" src="${pageContext.request.contextPath}/assets/admin/images/no-avatar.png">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="col-sm-12 col-md-8">
									<div class="row">
										<div class="col-sm-12">
											<h3>Họ tên: ${detailAccount.fullname}</h3>
										</div>
										<div class="col-sm-12">
											<p>Email: ${detailAccount.email}</p>
											<p>SĐT: ${detailAccount.phone}</p>
											<p>Địa chỉ: ${detailAccount.address}</p>
											<p>Giới thiệu: ${detailAccount.discribe} </p>
										</div>
									</div>
									<div class="row">
										<a href="${pageContext.request.contextPath}/admin/account/update/${detailAccount.username}" class="btn btn-primary  btn-block btn-lg waves-effect">Chỉnh sửa</a>
									</div>
								</div>

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

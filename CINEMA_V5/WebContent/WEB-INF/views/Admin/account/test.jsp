<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<base href="${pageContext.servletContext.contextPath}/">
<!-- <meta charset="UTF-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=Edge"> -->
<!-- <meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport"> -->
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
				<c:choose>
					<c:when test="${detailAccount.username.length() > 0 }">
						<h2>CẬP NHẬT TÀI KHOẢN</h2>
					</c:when>
					<c:otherwise>
						<h2>TẠO TÀI KHOẢN</h2>
					</c:otherwise>
				</c:choose>

			</div>
			<!-- Basic Examples -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<c:if test="${detailAccount.username.length() > 0 }">
								<h2>Tài khoản: ${detailAccount.username }</h2>
							</c:if>
						</div>
						<div class="body">
							<div class="row">

								<form:form
									action="${pageContext.request.contextPath}/admin/account/createOrUpdate"
									modelAttribute="detailAccount" enctype="multipart/form-data"
									method="post">
									<input type="hidden" value="${flag}" name="flag" />
									<form:hidden path="is_active" />
									<form:hidden path="avatar" />
									<div class="col-sm-12 col-md-4">
										<div class="img_avatar">
											<c:choose>
												<c:when test="${detailAccount.avatar.length() > 0 }">
													<img alt=""
														src="${pageContext.request.contextPath}/assets/admin/images/${detailAccount.avatar}">
												</c:when>
												<c:otherwise>
													<img alt=""
														src="${pageContext.request.contextPath}/assets/admin/images/no-avatar.png">
												</c:otherwise>
											</c:choose>
										</div>
										<h2 class="text-center">${detailAccount.username}</h2>
										<div class="form-group" style="margin-top: 20px">
											<input type="file" name="image" />
										</div>

									</div>

									<c:choose>
										<c:when test="${detailAccount.username.length() > 0 }">
											<div class="col-sm-12 col-md-8">
												<form:input path="username" type="hidden" />
												<form:hidden path="password" />

												<div class="form-group">
													<label>Họ tên</label>
													<div class="form-line">
														<form:input path="fullname" type="text"
															class="form-control date" placeholder="EX: Lê Thị Thu" />
													</div>
													<div class="error">
														<form:errors path="fullname" />
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>


											<div class="col-sm-12 col-md-8">
												<div class="form-group">
													<label>Tài khoản</label>
													<div class="form-line">
														<form:input path="username" class="form-control date"
															placeholder="EX: ThuKara" />
													</div>
													<div class="error">
														<form:errors path="username" />
													</div>
												</div>
											</div>
											<div class="col-sm-12 col-md-4">
												<div class="form-group">
													<label>Họ tên</label>
													<div class="form-line">
														<form:input path="fullname" type="text"
															class="form-control date" placeholder="EX: Lê Thị Thu" />
													</div>
													<div class="error">
														<form:errors path="fullname" />
													</div>
												</div>
											</div>
											<div class="col-sm-12 col-md-4">
												<div class="form-group">
													<label>Mật khẩu</label>
													<div class="form-line">
														<form:password path="password" class="form-control date" />
													</div>
													<div class="error">
														<form:errors path="password" />
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>


									<div class="col-sm-12 col-md-8">
										<div class="form-group">
											<label>Email</label>
											<div class="form-line">
												<form:input path="email" type="email"
													class="form-control date" placeholder="EX: thu@gmail.com" />
											</div>
											<div class="error">
												<form:errors path="email" />
											</div>
										</div>
									</div>
									<div class="col-sm-12 col-md-8">
										<div class="form-group">
											<label>Địa chỉ</label>
											<div class="form-line">
												<form:input path="address" type="text"
													class="form-control date" placeholder="EX: 97 Man Thiện" />
											</div>
										</div>
									</div>

									<c:choose>
										<c:when test="${detailAccount.username.length() > 0 }">
											<div class="col-sm-12 col-md-4">
												<div class="form-group">
													<label>SĐT</label>
													<div class="form-line">
														<form:input path="phone" type="text"
															class="form-control date" placeholder="EX: 12345" />
													</div>
												</div>
											</div>
											<div class="col-sm-12 col-md-4">
												<div class="form-group">
													<label>Quyền</label>
													<div class="form-line">
														<form:select path="permission" data-title="-------"
															items="${permissions}" itemValue="id" itemLabel="value"
															class="form-control show-tick">
														</form:select>
													</div>
													<div class="error">
														<form:errors path="permission" />
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-sm-12 col-md-6">
												<div class="form-group">
													<label>SĐT</label>
													<div class="form-line">
														<form:input path="phone" type="text"
															class="form-control date" placeholder="EX: 12345" />
													</div>
												</div>
											</div>
											<div class="col-sm-12 col-md-6">
												<div class="form-group">
													<label>Quyền</label>
													<div class="form-line">
														<form:select path="permission" data-title="-------"
															items="${permissions}" itemValue="id" itemLabel="value"
															class="form-control show-tick">
														</form:select>
													</div>
													<div class="error">
														<form:errors path="permission" />
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>

									<div class="col-ms-12 col-md-12">
										<div class="form-group">
											<label>Giới thiệu</label>
											<div class="form-line">
												<form:textarea rows="4" path="discribe"
													class="form-control no-resize" placeholder="EX: try more"></form:textarea>
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-12">
										<div class="form-group">
											<button class="btn btn-primary btn-block btn-lg waves-effect"
												id="test" type="submit">CẬP NHẬT</button>
										</div>
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

	<!-- 	<script type="text/javascript">
		$(document).ready(function() {
			$("#test1").submit(function(event) {
				alert("test")
				 $('#form_upload').submit();
				/* $('#upload_ava').click(); */
				event.preventDefault();
			});
		})
	</script>  -->

</body>

</html>

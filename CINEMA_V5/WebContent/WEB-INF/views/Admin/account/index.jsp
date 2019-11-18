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
				<h2>QUẢN LÍ TÀI KHOẢN</h2>
			</div>
			<!-- Basic Examples -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>DANH SÁCH TÀI KHOẢN</h2>
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
								<!-- <div class="col-sm-6" style="margin-bottom: 0 !important">
									<div class="form-group" style="margin-bottom: 0 !important">
										<label>TK đang hoạt động</label>
										<div class="demo-switch">
											<div class="switch">
												<label>OFF <input name="is_show" checked value=""
													type="checkbox" /><span class="lever switch-col-blue"></span>ON
												</label>
											</div>
										</div>
									</div>
								</div> -->
								<div class="col-sm-12" style="margin-bottom: 0 !important">
									<p>Thêm mới</p>
									<a class="btn btn-simple   btn-primary btn-icon  " href="${pageContext.request.contextPath}/admin/account/insert"> <i
										class="material-icons">add</i>
									</a>
								</div>
							</div>
							<div class="fresh-datatables table-responsive">
								<table id="js-basic-example_account"
									class="table table-bordered table-striped table-hover  dataTable">
									<thead>
										<tr>
											<th>Tài khoản</th>
											<th>Họ tên</th>
											<th>Email</th>
											<th>Quyền</th>
											<th style="with: 200px !important">Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="account" items="${listAccount}">
											<tr>
												<td>${account.username}</td>
												<td>${account.fullname}</td>
												<td>${account.email}</td>
												<c:forEach var="permission" items="${permissions }">
													<c:if test="${account.permission == permission.id}">
														<td>${permission.value}</td>
													</c:if>
												</c:forEach>

												<td class="text-center index"><a
													class="btn btn-simple btn-success btn-icon edit"
													href="${pageContext.request.contextPath}/admin/account/detail/${account.username}">
														<i class="material-icons">search</i>
												</a> <a class="btn btn-simple btn-warning btn-icon edit"
													href="${pageContext.request.contextPath}/admin/account/update/${account.username}">
														<i class="material-icons">edit</i>
												</a>
													<button class="btn btn-simple  btn-danger btn-icon  remove" ${account.permission == 1 ? 'disabled' : '' }
														type="button" onclick="onDelete('${account.username}')">
														<i class="material-icons">delete</i>
													</button></td>

												<%-- <td style="display: none" class="revert text-center"><a
													class="btn btn-simple btn-warning btn-icon "
													href="${pageContext.request.contextPath}/admin/account/active/${account.username}">
														<i class="material-icons">replay</i>
												</a></td> --%>
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
		function onDelete(username) {
			var seft = this;
			if (username) {
				swal(
					{
						title : "XÓA",
						text : "Bạn muốn xóa" + username
								+ " này ra khỏi hệ thông!",
						type : "warning",
						showCancelButton : true,
						confirmButtonColor : "#DD6B55",
						confirmButtonText : "Xóa",
						cancalButtonText : "Hủy",
						closeOnConfirm : false
					},
					function() {
						$.post(
							'${pageContext.request.contextPath}/admin/account/delete',
							{
								username : username
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

		/* function myFunction(event) {
			console.log(event.target);
		}

		$('input[type="checkbox"]').click(function() {
			var is_active = true;
			if ($(this).is(":checked")) {
				$(".revert").css("display", "none");
				$(".index").css("display", "block");
				var is_active = true;
			} else if ($(this).is(":not(:checked)")) {
				$(".revert").css("display", "block");
				$(".index").css("display", "none");
				var is_active = false;
			}
			
			$.post(
					'${pageContext.request.contextPath}/admin/account',
					{is_active: is_active},
					function(res){
						console.log(res);
					}
					
			);
		}); */
	</script>

</body>

</html>

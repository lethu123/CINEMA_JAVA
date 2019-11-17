
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
				<h2>
					<s:message code="lable.edit_film" />
				</h2>
			</div>

			<!-- CKEditor -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>
								<s:message code="lable.film" />
								: ${filmDetail.name}
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

							<form:form
								action="${pageContext.request.contextPath}/admin/film/update"
								modelAttribute="filmDetail" method="POST">
								<div class="row">
									<form:input type="hidden" path="id" value="${filmDetail.id}" />
									<form:input type="hidden" path="create_at" />
									<div class="col-sm-9">
										<div class="form-group">
											<label><s:message code="lable.name_film" /></label>
											<div class="form-line">
												<form:input path="name" type="text"
													class="form-control date" placeholder="EX: Gạo nếp gạo tẻ" />
											</div>
											<div class="error">
												<form:errors path="name" />
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label><s:message code="lable.film_status" /></label>
											<div class="demo-switch">
												<div class="switch">
													<label>OFF <input name="_is_show"
														value="${filmDetail.is_show}" type="checkbox"
														${filmDetail.is_show == true ? 'checked':'' } /><span
														class="lever switch-col-blue"></span>ON
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.type_film" /></label>
											<form:select path="category" data-title="-------"
												items="${category}" itemValue="id" itemLabel="value"
												class="form-control show-tick">
											</form:select>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.film_category" /></label>

											<form:select path="type_film" data-title="-------"
												items="${typeFilm}" itemValue="id" itemLabel="value"
												class="form-control show-tick">
											</form:select>
										</div>
									</div>
									<div class="col-ms-12 col-md-4">
										<div class="form-group">
											<label><s:message code="lable.duration" /></label>
											<div class="form-line">
												<form:input type="number" path="duration"
													class="form-control date" placeholder="EX: 120 (120 phút)" />
											</div>
											<div class="error">
												<form:errors path="duration" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-4">
										<div class="form-group">
											<label><s:message code="lable.release" /></label>
											<div class="form-line" id="bs_datepicker_container">
												<form:input type="text" path="release" class="form-control"
													placeholder="EX: 20/10/2011" />
											</div>
											<div class="error">
												<form:errors path="release" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-4">
										<div class="form-group">
											<label><s:message code="lable.evaluate" /></label>
											<div class="form-line">
												<form:input type="number" path="evaluate"
													class="form-control date" placeholder="note: Từ 1 tới 6 *" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.producer" /></label>
											<div class="form-line">
												<form:input type="text" path="director"
													class="form-control date" placeholder="EX: Thu Kara" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.director" /></label>
											<div class="form-line">
												<form:input type="text" path="producer"
													class="form-control date" placeholder="EX: Thu Kara" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.actor" /></label>
											<div class="form-line">
												<form:input type="text" path="actor"
													class="form-control date" placeholder="EX: Noo Phước Thịnh" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.image" /></label>
											<div class="row">
												<div class="col-sm-3">
													<img style="width: 100%; height: 50px"
														src="${filmDetail.image_film}">
												</div>
												<div class="col-sm-9">
													<div class="form-line">

														<form:input type="text" path="image_film"
															class="form-control date"
															placeholder="EX: https://hinhanh.png" />
													</div>
													<div class="error">
														<form:errors path="image_film" />
													</div>
												</div>
											</div>

										</div>
									</div>
									<div class="col-ms-12 col-md-12">
										<div class="form-group">
											<label><s:message code="lable.describe" /></label>
											<div class="form-line">
												<form:textarea rows="4" path="describe"
													class="form-control no-resize" placeholder="EX: Phim hay" />
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-12">
										<div class="form-group">
											<label>Trailer (link youtobe)</label>
											<div class="form-line">
												<form:input path="trailer" class="form-control no-resize"
													placeholder="EX: https://www.youtube.com/watch?v=LShH2XRgfNg" />
											</div>
										</div>
									</div>

									<div class="col-ms-12 col-md-12">
										<label>Trailer</label>


										<c:choose>
											<c:when test="${trailler.trim().length() != 0}">
												<textarea id="ckeditor" name="_trailer"
													placeholder="Chèn embed trailer của bạn vào đây !">
											<iframe width="560" height="315" src="${trailler}"
														frameborder="0"
														allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
														allowfullscreen></iframe>
											</textarea>

											</c:when>
											<c:otherwise>
												<textarea id="ckeditor" name="_trailer"
													placeholder="Chèn embed trailer của bạn vào đây !">
											
											</textarea>
											</c:otherwise>
										</c:choose>

										<%-- <textarea id="ckeditor" name="_trailer"
											placeholder="Chèn embed trailer của bạn vào đây !">
											
											
											<c:choose>
									            <c:when test="${trailler.trim().length() != 0}">
									                <iframe width="560" height="315"
														src="${trailler}" frameborder="0"
														allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
														allowfullscreen></iframe> 
									            </c:when>
									            <c:otherwise>
									                <p></p>
									            </c:otherwise>
									        </c:choose> 
										</textarea> --%>
										<div class="error">
											<form:errors path="trailer" />
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
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<!-- #END# CKEditor -->

		</div>
	</section>

	<!-- end content -->

	<!-- javascript -->
	<jsp:include page="../layouts/footer.jsp"></jsp:include>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/pages/forms/editors.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/pages/forms/basic-form-elements.js"></script>



</body>

</html>

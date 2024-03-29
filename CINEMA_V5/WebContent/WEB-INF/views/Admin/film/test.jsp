
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

							<form action="${pageContext.request.contextPath}/admin/film"
								method="POST" name="filmForm">
								<div class="row">
									<input type="hidden" name="id" value="${filmDetail.id}" /> <input
										type="hidden" name="create_at" value="${filmDetail.create_at}" />
									<div class="col-sm-9">
										<div class="form-group">
											<label><s:message code="lable.name_film" /></label>
											<div class="form-line">
												<input name="name" value="${filmDetail.name}" type="text"
													class="form-control date" placeholder="EX: Gạo nếp gạo tẻ" />
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label><s:message code="lable.film_status" /></label>
											<div class="demo-switch">
												<div class="switch">
													<%-- <label>OFF <input name="is_show"
														value="${filmDetail.is_show}" type="checkbox"
														${filmDetail.is_show == true ? 'checked':'' } /><span
														class="lever switch-col-blue"></span>ON
													</label> --%>
													<label>OFF <input name="is_show"
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
											<label><s:message code="lable.type_film" /></label> <select
												name="category" class="form-control show-tick"
												data-title="---- Loại phim ----">
												<c:forEach var="ele" items="${category}">
													<option ${filmDetail.category == ele.id ? 'selected': '' }
														value="${ele.id}">${ele.value}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.film_category" /></label> <select
												name="type_film" class="form-control show-tick"
												data-title="---- Thể loại phim ----">
												<c:forEach var="ele" items="${typeFilm}">
													<option ${filmDetail.type_film == ele.id ? 'selected': '' }
														value="${ele.id}">${ele.value}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="col-ms-12 col-md-4">
										<div class="form-group">
											<label><s:message code="lable.duration" /></label>
											<div class="form-line">
												<input type="number" value="${filmDetail.duration}"
													name="duration" class="form-control date"
													placeholder="EX: 120 (120 phút)">
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-4">
										<div class="form-group">
											<label><s:message code="lable.release" /></label>
											<div class="form-line" id="bs_datepicker_container">
												<input type="text" value="${filmDetail.release}"
													name="release" class="form-control"
													placeholder="EX: 20/10/2011">
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-4">
										<div class="form-group">
											<label><s:message code="lable.evaluate" /></label>
											<div class="form-line">
												<input type="number" value="${filmDetail.evaluate}"
													name="evaluate" class="form-control date"
													placeholder="note: Từ 1 tới 6 *">
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.producer" /></label>
											<div class="form-line">
												<input type="text" name="director"
													value="${filmDetail.director}" class="form-control date"
													placeholder="EX: Thu Kara">
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.director" /></label>
											<div class="form-line">
												<input type="text" name="producer"
													value="${filmDetail.producer}" class="form-control date"
													placeholder="EX: Thu Kara">
											</div>
										</div>
									</div>
									<div class="col-ms-12 col-md-6">
										<div class="form-group">
											<label><s:message code="lable.actor" /></label>
											<div class="form-line">
												<input type="text" name="actor" value="${filmDetail.actor}"
													class="form-control date" placeholder="EX: Noo Phước Thịnh">
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

														<input type="text" name="image_film"
															value="${filmDetail.image_film}"
															class="form-control date"
															placeholder="EX: https://hinhanh.png">
													</div>
												</div>
											</div>

										</div>
									</div>
									<div class="col-ms-12 col-md-12">
										<div class="form-group">
											<label><s:message code="lable.describe" /></label>
											<div class="form-line">
												<textarea rows="4" name="describe"
													class="form-control no-resize" placeholder="EX: Phim hay">${filmDetail.describe}</textarea>
											</div>
										</div>
									</div>

									<div class="col-ms-12 col-md-12">
										<label>Trailer</label>
										<textarea id="ckeditor" name="trailer"
											placeholder="Chèn embed trailer của bạn vào đây !">
										<iframe width="560" height="315" src="${filmDetail.trailer}"
												frameborder="0"
												allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe> 
										</textarea>
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
							</form>
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

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#update")
									.on(
											"click",
											function() {
												var name = $(
														"input[name='name']")
														.val();
												var actor = $(
														"input[name='actor']")
														.val();
												var type_film = $(
														"select[name='type_film']")
														.val();
												var category = $(
														"select[name='category']")
														.val();
												var producer = $(
														"input[name='producer']")
														.val();
												var director = $(
														"input[name='director']")
														.val();
												var evaluate = $(
														"input[name='duration']")
														.val();
												var evaluate = $(
														"input[name='evaluate']")
														.val();
												var is_show = $(
														"input[name='is_show']")
														.val();
												var release = $(
														"input[name='release']")
														.val();
												var image_film = $(
														"input[name='image_film']")
														.val();
												var describe = $(
														"textarea[name='describe']")
														.val();
												var trailerRes = CKEDITOR.instances['ckeditor']
														.getData();
												var trailers = trailerRes
														.indexOf("src");
												trailerRes = trailerRes
														.slice(trailers + 5);
												console.log("trailerRes",
														trailerRes);
												var indexDot = trailerRes
														.indexOf(";");
												if (indexDot != -1) {
													trailerRes = trailerRes
															.slice(0, indexDot);
												} else {
													var indexHref = trailerRes
															.indexOf("\"");
													trailerRes = trailerRes
															.slice(0, indexHref);
												}
												var index = trailerRes
														.indexOf("embed/")
												trailerRes = trailerRes.slice(
														0, index)
														+ "watch?v="
														+ trailerRes
																.slice(index + 6);

												var data = {
													name : $(
															"input[name='name']")
															.val(),
													actor : $(
															"input[name='actor']")
															.val(),
													type_film : $(
															"select[name='type_film']")
															.val(),
													category : $(
															"select[name='category']")
															.val(),
													producer : $(
															"input[name='producer']")
															.val(),
													director : $(
															"input[name='director']")
															.val(),
													evaluate : $(
															"input[name='duration']")
															.val(),
													evaluate : $(
															"input[name='evaluate']")
															.val(),
													is_show : $(
															"input[name='is_show']")
															.val(),
													release : $(
															"input[name='release']")
															.val(),
													image_film : $(
															"input[name='image_film']")
															.val(),
													describe : $(
															"textarea[name='describe']")
															.val(),
													trailer : trailerRes,
													create_at : $(
															"input[name='create_at']")
															.val(),
													update_at : moment()
															.format(
																	"DD/MM/YYYY")
												}

												console.log("name", name);
												console.log("actor", actor);
												console.log("type_film",
														type_film);
												console.log("category",
														category);

												console.log("producer",
														producer);
												console.log("director",
														director);
												console.log("evaluate",
														evaluate);
												console.log("is_show", is_show);

												console.log("describe",
														describe);

												console.log("indexHref",
														indexHref);
												console.log("trailer",
														trailerRes);

												$
														.post(
																'${pageContext.request.contextPath}/admin/film',
																JSON
																		.stringify(data),
																function(res) {
																	console
																			.log(
																					'reses',
																					res);
																}

														);

												/*  $.ajax({
												    type: "POST",
												    
												    contentType: "application/json", //this is required for spring 3 - ajax to work (at least for me)
												    url: "${pageContext.request.contextPath}/admin/film", //your valid url
												    
												    data: JSON.stringify(data), //json object or array of json objects
												    dataType : 'json',
												    success: function(result) {
												        console.log(result);
												    },
												    error: function(){
												        alert('failure');
												    }
												});  */

											})
						});
	</script>


</body>

</html>

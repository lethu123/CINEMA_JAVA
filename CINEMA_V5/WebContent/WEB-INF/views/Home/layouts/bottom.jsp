<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- jquery main JS -->
<script
	src="${pageContext.request.contextPath}/assets/home/js/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="${pageContext.request.contextPath}/assets/home/js/bootstrap.min.js"></script>
<!-- Slick nav JS -->
<script
	src="${pageContext.request.contextPath}/assets/home/js/jquery.slicknav.min.js"></script>
<!-- owl carousel JS -->
<script
	src="${pageContext.request.contextPath}/assets/home/js/owl.carousel.min.js"></script>
<!-- Popup JS -->
<script
	src="${pageContext.request.contextPath}/assets/home/js/jquery.magnific-popup.min.js"></script>
<!-- Isotope JS -->
<script
	src="${pageContext.request.contextPath}/assets/home/js/isotope.pkgd.min.js"></script>
<!-- main JS -->
<script src="${pageContext.request.contextPath}/assets/home/js/main.js"></script>
<!-- custom -->
<%-- 	<script src="${pageContext.request.contextPath}/assets/home/js/layout.js"></script>  --%>

<!-- Autosize Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/autosize/autosize.js"></script>
<!-- Moment Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/momentjs/moment.js"></script>
<!-- Bootstrap Material Datetime Picker Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>

<!-- Bootstrap Datepicker Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<!-- Ckeditor -->

<!-- SweetAlert Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/sweetalert/sweetalert.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/ckeditor/ckeditor.js"></script>
<!-- TinyMCE -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/tinymce/tinymce.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var pathname = window.location.pathname;
						$("#select").change(
								function() {
									var lang = $(this).find(':selected').attr(
											"data-lang");
									$.get(pathname + "?language=" + lang,
											function() {
												location.reload();
											});
									return false;
								});

						if (pathname != "${pageContext.request.contextPath}/showtimedate") {
							$
									.post(
											'${pageContext.request.contextPath}/removeShowtime',
											{}, function(res) {
												console.log(res);
											});
						}
					})
</script>
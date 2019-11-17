<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Jquery Core Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap Core Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/bootstrap/js/bootstrap.js"></script>

<!-- Select Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/bootstrap-select/js/bootstrap-select.js"></script>

<!-- Slimscroll Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

<!-- Waves Effect Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/node-waves/waves.js"></script>

<!-- Jquery CountTo Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-countto/jquery.countTo.js"></script>

<!-- Morris Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/raphael/raphael.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/morrisjs/morris.js"></script>

<!-- ChartJs -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/chartjs/Chart.bundle.js"></script>

<!-- Flot Charts Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/flot-charts/jquery.flot.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/flot-charts/jquery.flot.resize.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/flot-charts/jquery.flot.pie.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/flot-charts/jquery.flot.categories.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/flot-charts/jquery.flot.time.js"></script>

<!-- Sparkline Chart Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-sparkline/jquery.sparkline.js"></script>
<!-- Jquery DataTable Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

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
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/ckeditor/ckeditor.js"></script>
<!-- TinyMCE -->
<script
	src="${pageContext.request.contextPath}/assets/admin/plugins/tinymce/tinymce.js"></script>

<!-- SweetAlert Plugin Js -->
<script src="${pageContext.request.contextPath}/assets/admin/plugins/sweetalert/sweetalert.min.js"></script>
<!-- Custom Js -->
<script
	src="${pageContext.request.contextPath}/assets/admin/js/admin.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/assets/admin/js/pages/index.js"></script> --%>

<!-- Demo Js -->
<script src="${pageContext.request.contextPath}/assets/admin/js/demo.js"></script>


<script>
	$(document).ready(
		function() {
			var pathname = window.location.pathname;
			var list = [
			            "/CINEMA_V5/admin/account",
			            "/CINEMA_V5/admin/film",
			            "/CINEMA_V5/admin/account/insert",
			            "/CINEMA_V5/admin/film/insert"
			       ]
			list.forEach(function(e){
				if(pathname == e) {
					$.post(
						'${pageContext.request.contextPath}/checkLogin',
						{}, function(res) {
							
							/* if(res != "true") {
								console.log(res);
								window.location.replace("http://localhost:8080/CINEMA_V5/admin");
							} */
							
						});
				} 
			})
		})
</script>



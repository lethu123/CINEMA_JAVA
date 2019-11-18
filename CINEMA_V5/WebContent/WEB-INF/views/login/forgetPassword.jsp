<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../Admin/layouts/header.jsp"></jsp:include>
<link
	href="${pageContext.request.contextPath}/assets/admin/css/layout.css"
	rel="stylesheet" type="text/css">
</head>
<body class="homelogin">

	<div class="forms">
		<p>Welcome to CINEMA center!</p>

		<div class="row">
			<div class="col-sm-12 ">
				<h2 class="text-center">Enter your email</h2>
				<form >
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons"
							style="color: white !important">person</i>
						</span>
						<div class="form-line">
							<input type="text" class="form-control" placeholder="email"  id="email" />
						</div>

					</div>
					<div class="error">
						<span id="error"></span>
					</div>

					<div class="row m-t-15 m-b--20">
						<div class="col-xs-4" style="margin: 0 150px">
							<button onclick="sendEmail()"
								class="btn btn-block bg-pink waves-effect " type="button">
								Send    <i class="material-icons"
									style="color: white !important; margin-left: 10px">send</i>
							</button>
						</div>
					</div>
				</form>
			</div>

		</div>


	</div>



	<jsp:include page="../Admin/layouts/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function sendEmail() {
			if($('#email').val() == ''){
				$('#error').html("Vui lòng nhập email!");
			} else {
				$.post(
						'${pageContext.request.contextPath}/forgotPassword',
						{email: $('#email').val()},
						function(res) {
							console.log(res);
							if(res.errorCode != 0) {
								$('#error').html(res.message);
							} else {
								swal(
									{
										title : 'THÔNG BÁO',
										type : res.errorCode == 0 ? 'success'
												: 'error',
										text : res.message
									}, function() {
										window.location.replace('${pageContext.request.contextPath}/login');
									}

								);
							}
						}
					);
			}
			
			
		}
	</script>

</body>
</html>
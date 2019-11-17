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
				<h2 class="text-center">Login Your Account</h2>
				<form:form id="sign_in" method="POST"
					action="${pageContext.request.contextPath}/login"
					modelAttribute="detailAccount">
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons"
							style="color: white !important">person</i>
						</span>
						<div class="form-line">
							<form:input type="text" class="form-control" path="username"
								placeholder="username" />
						</div>
						<div class="error">
							<form:errors path="username" />
						</div>

					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons"
							style="color: white !important">lock</i>
						</span>
						<div class="form-line">
							<form:input type="password" class="form-control" path="password"
								placeholder="Password" />
						</div>
						<div class="error">
							<form:errors path="password" />
						</div>

					</div>
					<div class="row">
						<div class="col-xs-8 p-t-5">
							<input type="checkbox" name="rememberme" id="rememberme"
								class="filled-in chk-col-pink"> <label for="rememberme">Remember
								Me</label>
						</div>
						<div class="col-xs-4">
							<button  class="btn btn-block bg-pink waves-effect btn_login"
								type="submit">SIGN IN</button>
						</div>
					</div>
					<div class="row m-t-15 m-b--20">
						<div class="col-xs-6">
							<a href="${pageContext.request.contextPath}/register">Register
								Now!</a>
						</div>
						<div class="col-xs-6 align-right">
							<a href="#">Forgot Password?</a>
						</div>
					</div>
				</form:form>
			</div>

		</div>

		<div class="error">
			<span>${message}</span>
		</div>
	</div>



	<jsp:include page="../Admin/layouts/footer.jsp"></jsp:include>
	<script type="text/javascript">
	
		$('#btn_login').click(function() {
			$.post(
					'${pageContext.request.contextPath}/login',
					{},
					function(res) {
						console.log(res);
					}
			);
		})
	</script>
</body>
</html>
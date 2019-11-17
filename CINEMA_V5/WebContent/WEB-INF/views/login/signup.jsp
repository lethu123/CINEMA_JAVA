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
			<div class="col-sm-12">
				<h2 class="text-center">Register</h2>
				<form:form id="sign_up"
					action="${pageContext.request.contextPath}/register"
					modelAttribute="detailAccount" method="POST">
					<form:hidden path="create_at" />
					<form:hidden path="is_active" />
					<form:hidden path="permission" />
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons" style="color: white !important">person</i>
						</span>
						<div class="form-line">
							<form:input type="text" class="form-control" path="username"
								placeholder="Name Surname" />
						</div>
						<div class="error">
							<form:errors path="username" />
						</div>
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons" style="color: white !important">email</i>
						</span>
						<div class="form-line">
							<form:input type="email" class="form-control" path="email"
								placeholder="Email Address" />
						</div>
						<div class="error">
							<form:errors path="email" />
						</div>
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons" style="color: white !important">lock</i>
						</span>
						<div class="form-line">
							<form:input type="password" class="form-control" path="password"
								minlength="6" placeholder="Password" />
						</div>
						<div class="error">
							<form:errors path="password" />
						</div>
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons" style="color: white !important">edit</i>
						</span>
						<div class="form-line">
							<form:input type="text" class="form-control" path="fullname"
								minlength="6" placeholder="EX: Le Thi Thu" />
						</div>
						<div class="error">
							<form:errors path="fullname" />
						</div>
					</div>
					<div class="form-group">
						<input type="checkbox" name="terms" id="terms"
							class="filled-in chk-col-pink"> <label for="terms">I
							read and agree to the <a href="javascript:void(0);">terms of
								usage</a>.
						</label>
					</div>

					<button class="btn btn-block btn-lg bg-pink waves-effect btn_login"
						type="submit" disabled>SIGN UP</button>

					<div class="m-t-25 m-b--5 align-center">
						<a href="${pageContext.request.contextPath}/login">You already
							have a membership, Login now?</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>


	<jsp:include page="../Admin/layouts/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$('#terms').click(function() {
			if ($(this).is(":checked")) {
				$('.btn_login').removeAttr('disabled');
			} else {
				$('.btn_login').attr( "disabled", "disabled" );
			}
		})
	</script>
</body>
</html>
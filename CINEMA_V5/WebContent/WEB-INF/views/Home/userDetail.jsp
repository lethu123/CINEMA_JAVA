<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE HTML>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BHD CINEMA</title>
<!-- Favicon Icon -->
<jsp:include page="layouts/header.jsp"></jsp:include>



<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<!-- Page loader -->
	<div id="preloader"></div>
	<!-- header section start -->

	<jsp:include page="layouts/navbar.jsp"></jsp:include>


	<!-- breadcrumb area start -->
	<section class="breadcrumb-area breadcrumb-area-custom"></section>
	<!-- breadcrumb area end -->
	<!-- transformers area start -->
	<section class="transformers-area">
		<div class="container">
			<div class="transformers-box">
				<div class="row flexbox-center">
					<div class="col-lg-5 text-lg-left text-center">
						<div class="transformers-content">
							<img src="${pageContext.request.contextPath}/assets/admin/images/${userDetail.avatar}" alt="about" />
						</div>
					</div>
					<div class="col-lg-7">
						<div class="transformers-content">
							<h2>${userDetail.username}</h2>
							<ul>
								 <li>
									<div class="transformers-left"><s:message code="lable.fullname" />:</div>
									<div class="transformers-right">${userDetail.fullname}</div>
								</li>
								<li>
									<div class="transformers-left">email:</div>
									<div class="transformers-right">${userDetail.email}</div>
								</li>

								<li>
									<div class="transformers-left"><s:message code="lable.phone" />:</div>
									<div class="transformers-right">${userDetail.phone}</div>
								</li>
								<li>
									<div class="transformers-left"><s:message code="lable.address" />:</div>
									<div class="transformers-right">${userDetail.address}</div>
								</li>
								<li>
									<div class="transformers-left"><s:message code="lable.discribe" />:</div>
									<div class="transformers-right">${userDetail.discribe}</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- transformers area end -->
	



	<jsp:include page="layouts/footer.jsp"></jsp:include>
	<jsp:include page="layouts/bottom.jsp"></jsp:include>
	<!-- custom -->
	<!-- <script src="assets/js/layout.js"></script> -->
</body>

</html>
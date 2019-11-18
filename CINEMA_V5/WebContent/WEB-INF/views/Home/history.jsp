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
	<section class="breadcrumb-area breadcrumb-area-custom "></section>
	<!-- breadcrumb area end -->

	<!-- video section start -->
	<section class="video ptb-90">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title pb-20">
						<h1>
							<i class="icofont icofont-film"></i>
							<s:message code="lable.history" />
						</h1>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-md-12">
					<div class="mt-20">

						<c:choose>
							<c:when test="${sessionScope.userLogin.getUsername() != null}">
								<c:if test="${empty listItem}">
									<s:message code="lable.mes_empty" />
								</c:if>
								<c:if test="${!empty listItem}">
									<div class="buy-ticket-box mtr-30">
										<h4>Chi tiết vé</h4>
										<ul class="ulTicket">
											<li>
												<p>Địa chỉ</p> <span>BHD QUẬN 9</span>
											</li>
											<li>
												<p>Tài khoản</p> <span id="accountLS"></span>
											</li>
											<li>
												<p>Thời gian</p> <span id="timeLS"></span>
											</li>
											<li>
												<p>Phòng</p> <span id="roomLS"></span>
											</li>
											<li>
												<p>Tên phim</p> <span id="filmLS"></span>
											</li>
											<li>
												<p>Vé</p> <span id="ticketLS"></span>
											</li>
											<li>
												<p>Ghế</p> <span id="seatLS"></span>
											</li>
											<li>
												<p>Combo</p> <span id="comboLS"></span>
											</li>
											<li>
												<p>
													Tổng tiền: <span id="priceLS">0</span> vnd
												</p>
											</li>
										</ul>
									</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<s:message code="lable.warning_login" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- video section end -->



	<jsp:include page="layouts/footer.jsp"></jsp:include>
	<jsp:include page="layouts/bottom.jsp"></jsp:include>
	<!-- custom -->
	
	
	<script type="text/javascript">
		$(document).ready(function () {
			
			var res = JSON.parse(localStorage.getItem("_ticket"));
			console.log("list",res);
			
			$('#accountLS').html(res.account);
			$('#timeLS').html(res.day + " " +res.hour);
			$('#roomLS').html(res.room);
			$('#filmLS').html(res.film);
			_listTicket = "";
			_listCombo = "";
			_listSeat = "";
			var lenSeat = res.seat.length;
			var lenTicket = res.ticket.length;
			var lenCombo = res.combo.length;
			if(lenCombo > 0) {
				for(var i = 0; i< (lenCombo / lenTicket ); i++){
					_listCombo += res.combo[i] + " , ";
				}
				$('#comboLS').html(_listCombo);
				if(lenSeat > 0) {
					for(var i = 0; i < lenSeat /lenCombo ; i++){
						_listSeat += res.seat[i] + " , ";
					}
				}
				$('#seatLS').html(_listSeat);
				
			} else {
				$('#comboLS').html("Không có combo");
				if(lenSeat > 0) {
					for(var i = 0; i< lenSeat / lenTicket ; i++){
						_listSeat += res.seat[i] + " , ";
					}
				}
				$('#seatLS').html(_listSeat);
				
			}
			
			
			if(lenTicket > 0) {
				for(var i = 0; i < lenTicket ; i++){
					_listTicket += res.ticket[i] + " ,";
				}
			}
			$('#ticketLS').html(_listTicket);
			$('#priceLS').html(res.price);
		})
	</script>



</body>

</html>
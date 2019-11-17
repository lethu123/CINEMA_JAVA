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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/home/css/layout.css"
	media="all" />



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
							<i class="icofont icofont-ticket"></i> Buy Tickets
						</h1>
					</div>
				</div>
			</div>
			<hr />
			<div class="buy-ticket-area">
				<div class="row">
					<div class="col-lg-8">
						<div class="buy-ticket-box" id="booking-ticket">
							<h4>Choose ticket and foots</h4>
							<h5>ticket</h5>
							<form action="" id="form-submit">
								<table
									class="table table-bordered table-striped table-hover  dataTable">
									<thead>
										<tr>
											<th>Loại vé</th>
											<th>Số lượng</th>
											<th>Gía</th>
											<th>Tổng</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="typeTicket" items="${listTicket}">
											<tr>
												<td>${typeTicket.name}</td>
												<td>
													<%-- <div class="stepper-input">
													<button class="sub" id="btn-sub${typeTicket.id}" onclick="Sub(${typeTicket.price},${typeTicket.id} )">
														<i class="icofont icofont-minus"></i>
													</button>
													<input type="number" id="input${typeTicket.id}" class="quantity" value="0" />
													<button class="add" id="btn-add${typeTicket.id}" onclick="Add(${typeTicket.price}, ${typeTicket.id})">
														<i class="icofont icofont-ui-add"></i>
													</button>
												</div> --%>

													<div class="stepper-input">
														<span>Nhập số lượng vé: </span> <input type="number"
															name="${typeTicket.id}ITKP${typeTicket.price}"
															id="input${typeTicket.id}"
															onchange="handleOnchange(this.value, ${typeTicket.price}, ${typeTicket.id})"
															class="quantity" value="0" />
													</div>
												</td>
												<td>${typeTicket.price}</td>
												<td><span id="${typeTicket.id}" class="total">0</span>
													đ</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<table
									class="table table-bordered table-striped table-hover  dataTable">
									<thead>
										<tr>
											<th>Hình ảnh</th>
											<th>Combo</th>
											<th>Số lượng</th>
											<th>Gía</th>
											<th>Tổng</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="typeTicket" items="${listCombo}">
											<tr>
												<td style="width: 120px"><img alt=""
													src="${pageContext.request.contextPath}/assets/home/img/combo.jpg">
												</td>
												<td>${typeTicket.name}</td>
												<td>

													<div class="stepper-input">
														<span>Nhập số lượng mua: </span> <input type="number"
															name="${typeTicket.id}ICBP${typeTicket.price}"
															id="input${typeTicket.id}"
															onchange="handleOnchangeCombo(this.value, ${typeTicket.price}, ${typeTicket.id})"
															class="quantity" value="0" />
													</div>
												</td>
												<td>${typeTicket.price}</td>
												<td><span id="combo${typeTicket.id}" class="total">0</span>
													đ</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<button class="theme-btn" type="button" id="total">Next</button>
							</form>
						</div>
						<div class="buy-ticket-box" id="booking-seat"
							style="display: none">
							<h4>Choose seat</h4>
							<h5>${listSEAT.nameRoom}</h5>
							<h6>Screen</h6>
							<div class="ticket-box-table">
								<table style="margin-right: 20px">
									<c:forEach var="line" items="${listSEAT.lines}">
										<tr>
											<td>${line.nameLine}</td>
										</tr>
									</c:forEach>
								</table>
								<table class="ticket-table-seat">
									<c:forEach var="line" items="${listSEAT.lines}">
										<tr>
											<c:forEach var="seat" items="${line.list}">
												<td id="${seat.id}" onclick="clickme(${seat.id})">${seat.name}</td>
											</c:forEach>
										</tr>
									</c:forEach>
									<!-- <tr>
										<td class="active">1</td>
										<td class="active">1</td>
										<td class="active">1</td>
										<td class="active">1</td>
										<td class="active">1</td>
										<td class="active">1</td>
										<td class="active">1</td>
									</tr> -->

								</table>
							</div>
							<div class="ticket-box-available">
								<input type="checkbox" /> <span>Available</span> <input
									type="checkbox" checked /> <span>Unavailable</span> <input
									type="checkbox" /> <span>Selected</span>
							</div>
							<button id="btn-booking-seat" class="theme-btn">Quay lại</button>
							<button class="btn-warning" onclick="ThanhToan()">Thanh
								toán</button>
						</div>
					</div>
					<div class="col-lg-3 offset-lg-1">
						<div class="buy-ticket-box mtr-30">
							<h4>Your Information</h4>
							<ul>
								<li>
									<p>Địa chỉ</p> <span>BHD QUẬN 9</span>
								</li>
								<li>
									<p>Thời gian</p> <span>${date} - ${time}</span>
								</li>
								<li>
									<p>Phòng</p> <span>${room}</span>
								</li>
								<li>
									<p>Tên phim</p> <span>${name_film}</span>
								</li>
								<li>
									<p>Ticket number</p> <span id="no_seat"></span><span>Vé</span>
								</li>
								<li>
									<p>
										Tổng tiền: <span id="total_price">0</span> vnd
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- video section end -->

	<!-- Button to Open the Modal -->
	<button type="button" id="openModel" data-toggle="modal"
		style="display: none" data-target="#myModal1">Open modal</button>

	<!-- The Modal -->
	<div class="modal fade" id="myModal1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="color: black">Đăng nhập nhanh</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label>Username</label>
							<div class="form-line">
								<input type="text" class="form-control border bg-white" name="username" id="flashUS"
									placeholder="username" />
							</div>
							<div class="error text-danger" id="mesUS"></div>

						</div>
						<div class="form-group">
							<label>Password</label>
							<div class="form-line">
								<input type="text" class="form-control border bg-white" name="password" id="flashPW"
									placeholder="password" />
							</div>
							<div class="error text-danger" id="mesPW"></div>

						</div>
						<div class="error mt-3 text-danger" id="mes"></div>
						<div class="form-group text-right">
							<button type="button" class="btn btn-primary" onclick="login()" >Login</button>
							<button type="button" class="btn btn-secondary" id="btn_display"
								data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>

				<!-- Modal footer -->
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div> -->

			</div>
		</div>
	</div>
	
	
	<!-- Button to Open the Modal -->
	<button type="button" id="openModelTicket" data-toggle="modal"
		style="display: none" data-target="#myTicket">Open modal</button>
	<!-- The Modal -->
	<div class="modal fade" id="myTicket">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="color: black">Kết quả đặt vé</h4>
					<button type="button" class="close" onclick="redirectPage()">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="buy-ticket-box " style="color: black">
						
						<p>Địa chỉ:  <span>BHD QUẬN 9</span> </p> 
				
				
						<p>Tài khoản:  <span id="accountLS"></span> </p> 
			
			
						<p>Thời gian:  <span id="timeLS"></span> </p> 
			
		
						<p>Phòng:  <span id="roomLS"></span> </p> 
				
						<p>Tên phim:  <span id="filmLS"></span> </p>
				
						<p>Vé:  <span id="ticketLS"></span> </p>
				
						<p>Ghế:  <span id="seatLS"></span> </p>
					
						<p>Combo:  <span id="comboLS"></span> </p>
				
						<p>
							Tổng tiền: <span id="priceLS">0</span> vnd
						</p>
				
					</div>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="redirectPage()">OK</button>
				</div> 

			</div>
		</div>
	</div>



	<jsp:include page="layouts/footer.jsp"></jsp:include>
	<jsp:include page="layouts/bottom.jsp"></jsp:include>
	<!-- custom -->


	<script type="text/javascript">
	var totalPrice = 0;
		$('#total').click(function(){
			 var data = $("#form-submit").serialize();
			 var splitted = data.split("&");
			 console.log(splitted); 
			 var x = splitted.map(function(item, index){
			 var splitted1 = item.split("=");
			 var idex = splitted1[0].indexOf("P");
			 return parseInt(splitted1[0].slice(idex + 1))*parseInt(splitted1[1]);
			 })
			/*  tong tien */
			totalPrice = x.reduce(function(accumulator, currentValue) {
				  return accumulator + currentValue;
			});
			console.log(totalPrice); 
			$('#total_price').html(totalPrice);
			
			
			// mang ticket
			var z = splitted.filter(function(item, index){
				 var splitted1 = item.split("=");
				return splitted1[0].includes("TK");
			})
			console.log("Z", z); 
			// mang id ve
			var arrIDTK = z.filter(function(item, index){
				 var splitted12 = item.split("=");
				 var idex2 = splitted12[0].indexOf("I");
				 if(parseInt(splitted12[0].slice(0, idex2)) * parseInt(splitted12[1]) != 0) {
					 return item;
				 }
				
			}).map(function(item1){
				var splitted123 = item1.split("=");
				 var idex3 = splitted123[0].indexOf("I");
				 return splitted123[0].slice(0, idex3) + "/" + splitted123[1];
			})
			console.log("arrTKBK", arrIDTK); 
			localStorage.setItem("IDTicket", arrIDTK);
			// mang so luong tick ket
			var y = z.map(function(item, index){
				 var splitted1 = item.split("=");
				 return parseInt(splitted1[1]);
			 })
			 // so luong ghe == so luong ve
			var noSeat = y.reduce(function(accumulator, currentValue) {
				  return accumulator + currentValue;
			});
			
			// mang combo
			var combo = splitted.filter(function(item, index){
				 var splitted1 = item.split("=");
				return splitted1[0].includes("CB");
			})
			console.log("combo", combo); 
			// mang id COMBO
			var arrIDCB = combo.filter(function(item, index){
				 var splitted12 = item.split("=");
				 var idex2 = splitted12[0].indexOf("I");
				 if(parseInt(splitted12[0].slice(0, idex2)) * parseInt(splitted12[1]) != 0){
					 return item;
				 }
			}).map(function(item1){
				var splitted123 = item1.split("=");
				 var idex3 = splitted123[0].indexOf("I");
				 return splitted123[0].slice(0, idex3)+ "/" + splitted123[1];
			})
			console.log("arrIDCB", arrIDCB); 
			localStorage.setItem("IDCombo", arrIDCB);
			// mang so luong combo
			var numberCB = combo.map(function(item, index){
				 var splitted1 = item.split("=");
				 return parseInt(splitted1[1]);
			 })
			
			console.log(noSeat); 
			$('#no_seat').html(noSeat);
			localStorage.setItem("noSeat", noSeat);
			if(noSeat == 0) {
				swal("Lỗi!", "Vui lòng chọn vé!", "error");
			} else {
				$('#booking-seat').css("display","block");
				$('#booking-ticket').css("display","none");
				
			}
		})
		
		$('#btn-booking-seat').click(function(){
			$('#booking-seat').css("display","none");
			$('#booking-ticket').css("display","block");
		})
		
	
	</script>
	<script type="text/javascript">
		function handleOnchange( count, value, id) {
			var _count = parseInt(count);
			document.getElementById(id).innerHTML = value*_count;
		}
		
		function handleOnchangeCombo( count, value, id) {
			var _count = parseInt(count);
			document.getElementById("combo" + id).innerHTML = value*_count;
		}
		
		var listSeat = [];
		function clickme(value) {
			var noSeat = parseInt(localStorage.getItem("noSeat"));
			/* $("#" + value).toggleClass("active"); */
			if($("#" + value).hasClass( "active" )) {
				$("#" + value).removeClass("active");
				var i = listSeat.indexOf(value);
				if (i != -1) {
					listSeat.splice(i,1);
				}
			} else {
				$("#" + value).addClass("active");
				if(listSeat.length > noSeat - 1) {
					var idPop = listSeat[listSeat.length - 1];
					$("#" + idPop).removeClass("active");
					listSeat.pop();
					
					listSeat.push(value);
				} else {
					listSeat.push(value);
				}
				
				
			}
			console.log("newarr:", listSeat);
			localStorage.setItem("leastSEAT", listSeat);
			
		}
		
		
		
		function ThanhToan() {
			var noSeat = parseInt(localStorage.getItem("noSeat"));
			var listSEAT = localStorage.getItem("leastSEAT");
			var listCOMBO = localStorage.getItem("IDCombo");
			var listTICKET = localStorage.getItem("IDTicket");
			var price = $('#total_price').text();
			console.log(typeof listSEAT);
			var arrSEAT = listSEAT.split(",");
			
			/* var currentURL = window.location.href;
			const params = new URLSearchParams(currentURL); */
			
			let params = (new URL(document.location)).searchParams;
			
			
			var test = params.get('date');
			console.log("this date: ", test);
			
			
			console.log("list string ", arrSEAT);
			if(arrSEAT.length < noSeat) {
				swal("Lỗi!", "Vui lòng đủ " + noSeat + " ghế !", "error");
			} else {
				$.post(
					'${pageContext.request.contextPath}/bookingTick',
					{
						listSeat: listSEAT,
						listCombo: listCOMBO,
						listTicket: listTICKET,
						date: params.get('date'),
						time: params.get('time'),
						film: params.get('film'),
						room: params.get('room'),
						price: price
					},
					function (res) {
						console.log(res);
						if(res.error_code != 1) {
							localStorage.setItem("_ticket", JSON.stringify(res));
							swal(
								{
									title : 'THÔNG BÁO',
									type :  'success',
									text : 'Đặt vé thành công'
								}, function() {
									localStorage.removeItem("noSeat");
									localStorage.removeItem("leastSEAT");
									localStorage.removeItem("IDCombo");
									localStorage.removeItem("IDTicket");
									
									     
									
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
									
									$('#openModelTicket').trigger('click');
									/* window.location.replace("http://localhost:8080/CINEMA_V5/showtimedate"); */
								}

							);
						} else {
							$('#openModel').trigger('click');
						}
					}
				);
			}
			
		}
		
		function login(){
			var flashUS = $('#flashUS').val();
			var flashPW = $('#flashPW').val();
			if(flashUS.length == 0){
				$('#mesUS').html("Vui long nhap username!")
			}
			if(flashPW.length == 0){
				$('#mesPW').html("Vui long nhap password!")
			}
			
			if(flashUS.length != 0 && flashPW.length != 0) {
				$.post(
					'${pageContext.request.contextPath}/flashLogin',
					{
						username: flashUS,
						password: flashPW
					},
					function(res) {
						console.log("res login", res);
						if(res.errorCode == 1) {
							 $('#flashUS').val("");
							$('#flashPW').val("");
							$('#mes').html(res.message);
							
						} else {
							$('#btn-dangnhap').html("xin chào," + res.message);
							$('#btn_display').trigger('click');
						}
					}
						
				)
				
			}
		}
		
		function redirectPage(){
			window.location.replace("http://localhost:8080/CINEMA_V5/showtimedate"); 
		}
		
	</script>
</body>

</html>
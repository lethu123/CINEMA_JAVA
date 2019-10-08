<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<header class="header">
	<div class="container">
		<div class="header-area">
			<div class="logo">
				<a href="index-2.html"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="logo" /></a>
			</div>
			<div class="header-right">
				<form action="#">
					<select>
						<option value="Movies">Phim</option>
						<option value="Movies">Phim</option>
						<option value="Movies">Phim</option>
					</select> <input type="text" />
					<button>
						<i class="icofont icofont-search"></i>
					</button>
				</form>
				<ul>

					<c:choose>
						<c:when test="{userLogin} == 'lethu'">
							<li><a href="#">Xin chào, {userLogin}</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="login-popup" href="#">Đăng nhập</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
			<div class="menu-area">
				<div class="responsive-menu"></div>
				<div class="mainmenu">
					<ul id="primary-menu">
						<li><a class="active" href="${pageContext.request.contextPath}/">TRANG CHỦ</a></li>
						<li><a href="${pageContext.request.contextPath}/movie-playing">PHIM ĐANG CHIẾU</a></li>
						<li><a href="${pageContext.request.contextPath}/movie-commingsoon">PHIM SẮP CHIẾU</a></li>
						<li><a href="${pageContext.request.contextPath}/#news">TIN TỨC</a></li>
						<li><a href="#contact">LIÊN HỆ</a></li>
						<li><a href="#">LỊCH CHIẾU <i
								class="icofont icofont-simple-down"></i></a>
							<ul>
								<li><a href="blog-details.html">Lịch chiếu theo ngày</a></li>
								<li><a href="movie-details.html">Lịch chiếu theo phim</a></li>
							</ul></li>
						<li><a class="theme-btn" href="#"><i
								class="icofont icofont-ticket"></i> Mua vé</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
<div class="login-area">
	<div class="login-box">
		<a href="#"><i class="icofont icofont-close"></i></a>
		<h2>ĐĂNG NHẬP</h2>
		<form action="${pageContext.request.contextPath}/" method="post">
			<h6>Tên đăng nhập hoặc email</h6>
			<input type="text" class="form-control" name="username" />
			<h6>Mật khẩu</h6>
			<input type="text" class="form-control" name="password" />
			<div class="login-remember">
				<input type="checkbox" /> <span>Nhớ mật khẩu</span>
			</div>
			<div class="login-signup">
				<span>Đăng kí</span>
			</div>
			<button class="theme-btn" type="submit">Đăng nhập</button>
			<span>Mạng xã hội</span>
			<div class="login-social">
				<a href="#"><i class="icofont icofont-social-facebook"></i></a> <a
					href="#"><i class="icofont icofont-social-twitter"></i></a> <a
					href="#"><i class="icofont icofont-social-linkedin"></i></a> <a
					href="#"><i class="icofont icofont-social-google-plus"></i></a> <a
					href="#"><i class="icofont icofont-camera"></i></a>
			</div>
		</form>

	</div>
</div>
<div class="buy-ticket">
	<div class="container">
		<div class="buy-ticket-area">
			<a href="#"><i class="icofont icofont-close"></i></a>
			<div class="row">
				<div class="col-lg-8">
					<div class="buy-ticket-box">
						<h4>Buy Tickets</h4>
						<h5>Seat</h5>
						<h6>Screen</h6>
						<div class="ticket-box-table">
							<table class="ticket-table-seat">
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
							</table>
							<table>
								<tr>
									<td>1</td>
								</tr>
								<tr>
									<td>2</td>
								</tr>
								<tr>
									<td>3</td>
								</tr>
								<tr>
									<td>4</td>
								</tr>
								<tr>
									<td>5</td>
								</tr>
							</table>
							<table class="ticket-table-seat">
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td class="active">1</td>
									<td class="active">1</td>
									<td class="active">1</td>
									<td class="active">1</td>
									<td class="active">1</td>
									<td class="active">1</td>
									<td class="active">1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
							</table>
							<table>
								<tr>
									<td>1</td>
								</tr>
								<tr>
									<td>2</td>
								</tr>
								<tr>
									<td>3</td>
								</tr>
								<tr>
									<td>4</td>
								</tr>
								<tr>
									<td>5</td>
								</tr>
							</table>
							<table class="ticket-table-seat">
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
							</table>
						</div>
						<div class="ticket-box-available">
							<input type="checkbox" /> <span>Available</span> <input
								type="checkbox" checked /> <span>Unavailable</span> <input
								type="checkbox" /> <span>Selected</span>
						</div>
						<a href="#" class="theme-btn">previous</a> <a href="#"
							class="theme-btn">Next</a>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1">
					<div class="buy-ticket-box mtr-30">
						<h4>Your Information</h4>
						<ul>
							<li>
								<p>Location</p> <span>HB Cinema Box Corner</span>
							</li>
							<li>
								<p>TIME</p> <span>2018.07.09 20:40</span>
							</li>
							<li>
								<p>Movie name</p> <span>Home Alone</span>
							</li>
							<li>
								<p>Ticket number</p> <span>2 Adults, 2 Children, 2
									Seniors</span>
							</li>
							<li>
								<p>Price</p> <span>89$</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="container">


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</div>
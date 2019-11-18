<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<header class="header">
	<div class="container">
		<div class="header-area">
			<div class="logo">
				<a href="index-2.html"><img
					src="${pageContext.request.contextPath}/assets/home/img/logo.png"
					alt="logo" /></a>
			</div>
			<div class="header-right">
				<form action="#">
				<!-- <a href="#" data-lang="en">English</a> -->
					<select id="select">
						<option value="Moviess" selected data-lang="vi" style="display:none"><s:message code="lable.lan" /></option>
						<option value="Movies" data-lang="vi">Tiếng Việt</option>
						<option value="Movie" data-lang="en">English</option>
					</select> <input type="text" /> 
					<button>
						<i class="icofont icofont-search"></i>
					</button>
				</form>
				<ul>

					<c:choose>
						<c:when test="${sessionScope.userLogin.getUsername() != null}">
							<li><a href="${pageContext.request.contextPath}/detailUser/${sessionScope.userLogin.getUsername()}" data-toggle="tooltip" title="Xem chi tiết"><s:message code="lable.hello" /> , ${sessionScope.userLogin.getUsername()}</a></li>
							<li><a id="logout" href="${pageContext.request.contextPath}/logout"><i class="icofont icofont-logout"></i> <s:message code="lable.logout"/></a></li>
						</c:when>
						<c:otherwise>
							<li><a id="btn-dangnhap" class="theme-btn" href="${pageContext.request.contextPath}/login"><s:message code="lable.login"/>  /  <s:message code="lable.register"/> </a></li>
						</c:otherwise>
					</c:choose>
					

				</ul>
			</div>
			<div class="menu-area">
				<div class="responsive-menu"></div>
				<div class="mainmenu">
					<ul id="primary-menu">
						<li><a class="active"
							href="${pageContext.request.contextPath}/"><s:message
									code="lable.home" /> </a></li>

						<li><a
							href="${pageContext.request.contextPath}/movie-playing"><s:message
									code="lable.movie_playing" /></a></li>
						<li><a
							href="${pageContext.request.contextPath}/movie-commingsoon"><s:message
									code="lable.movie_coming_soon" /></a></li>
						<li><a href="${pageContext.request.contextPath}/#news"><s:message
									code="lable.news" /></a></li>
						<li><a href="${pageContext.request.contextPath}/history"><s:message code="lable.contact" /></a></li>
						<li><a href="#"><s:message code="lable.showtime" /> <i
								class="icofont icofont-simple-down"></i></a>
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/showtimedate"><s:message
											code="lable.showtime_date" /> </a></li>
								<li><a
									href="${pageContext.request.contextPath}/showtimefilm"><s:message
											code="lable.showtime_film" /> </a></li>
							</ul></li>
						<!-- <li><a class="theme-btn" href="#"><i
								class="icofont icofont-ticket"></i> Mua vé</a></li> -->
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>


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
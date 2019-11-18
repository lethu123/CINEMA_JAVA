<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section>
	<!-- Left Sidebar -->
	<aside id="leftsidebar" class="sidebar">
		<!-- User Info -->
		<div class="user-info">
			<div class="image">
				<img
					src="${pageContext.request.contextPath}/assets/admin/images/${sessionScope.userLoginAD.getAvatar()}"
					width="48" height="48" alt="User" />
			</div>

			<div class="info-container">
				<div class="name" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">${sessionScope.userLoginAD.getUsername()}</div>
				<div class="email">${sessionScope.userLoginAD.getEmail()}</div>
				<div class="btn-group user-helper-dropdown">
					<i class="material-icons" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
					<ul class="dropdown-menu pull-right">
						<li><a href="${pageContext.request.contextPath}/admin/account/detail/${sessionScope.userLoginAD.getUsername()}"><i
								class="material-icons">person</i>Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/logoutAD"><i
								class="material-icons">input</i>Sign Out</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- #User Info -->
		<!-- Menu -->
		<div class="menu">
			<ul class="list">
				<li class="active"><a
					href="${pageContext.request.contextPath}/admin/film"> <i
						class="material-icons">movie</i> <span>Quản lí phim</span>
				</a></li>
				
				<%-- <li><a href="${pageContext.request.contextPath}/admin/showtime">
						<i class="material-icons">today</i> <span>QL Lịch chiếu</span>
				</a></li> --%>
				
				<li><a href="${pageContext.request.contextPath}/admin/account">
						<i class="material-icons">account_box</i><span>QL Tài khoản</span>
				</a></li>
				
				<%-- <li><a href="javascript:void(0);" class="menu-toggle"> <i
						class="material-icons">widgets</i> <span>Booking</span>
				</a>
					<ul class="ml-menu">
						<li><a href="${pageContext.request.contextPath}/admin/ticket">
								<span>Quản lý vé</span>
						</a></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/booking"> <span>QL
									Đặt vé</span></a></li>
					</ul></li> 
					
				<li><a href="${pageContext.request.contextPath}/admin/combo">
						<i class="material-icons">shopping_cart</i> <span>QL Combo</span>
				</a></li> --%>

			</ul>
		</div>
		<!-- #Menu -->

	</aside>
	<!-- #END# Left Sidebar -->

</section>

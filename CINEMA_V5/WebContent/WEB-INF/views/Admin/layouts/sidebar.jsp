<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<section>
	<!-- Left Sidebar -->
	<aside id="leftsidebar" class="sidebar">
		<!-- User Info -->
		<div class="user-info">
			<div class="image">
				<img
					src="${pageContext.request.contextPath}/assets/admin/images/user.png"
					width="48" height="48" alt="User" />
			</div>
			<div class="info-container">
				<div class="name" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">John Doe</div>
				<div class="email">john.doe@example.com</div>
				<div class="btn-group user-helper-dropdown">
					<i class="material-icons" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
					<ul class="dropdown-menu pull-right">
						<li><a href="javascript:void(0);"><i
								class="material-icons">person</i>Profile</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="javascript:void(0);"><i
								class="material-icons">group</i>Followers</a></li>
						<li><a href="javascript:void(0);"><i
								class="material-icons">shopping_cart</i>Sales</a></li>
						<li><a href="javascript:void(0);"><i
								class="material-icons">favorite</i>Likes</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="javascript:void(0);"><i
								class="material-icons">input</i>Sign Out</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- #User Info -->
		<!-- Menu -->
		<div class="menu">
			<ul class="list">
				<li class="active"><a href="${pageContext.request.contextPath}/admin"> <i
						class="material-icons">movie</i> <span>Quản lí phim</span>
				</a></li>
				<li><a href="#"> <i
						class="material-icons">today</i> <span>QL Lịch chiếu</span>
				</a></li>
				<li><a href="#"> <i
						class="material-icons">account_box</i><span>QL Tài khoản</span>
				</a></li>
				<li><a href="javascript:void(0);" class="menu-toggle"> <i
						class="material-icons">widgets</i> <span>Booking</span>
				</a>
					<ul class="ml-menu">
						<li><a href="javascript:void(0);" > <span>Quản
									lý vé</span></a></li>
						<li><a href="javascript:void(0);" > <span>QL
									Đặt vé</span></a></li>
					</ul></li>
				<li><a href="#"> <i
						class="material-icons">shopping_cart</i> <span>QL Combo</span>
				</a></li>




			</ul>
		</div>
		<!-- #Menu -->

	</aside>
	<!-- #END# Left Sidebar -->
	
</section>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String menuPath = request.getContextPath();
String basemenuPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+menuPath+"/";
%>

<!-- #section:basics/side bar -->
	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<button class="btn btn-success">
				<i class="ace-icon fa fa-signal"></i>
			</button>

			<button class="btn btn-info">
				<i class="ace-icon fa fa-pencil"></i>
			</button>

			<!-- #section:basics/sidebar.layout.shortcuts -->
			<button class="btn btn-warning">
				<i class="ace-icon fa fa-users"></i>
			</button>

			<button class="btn btn-danger">
				<i class="ace-icon fa fa-cogs"></i>
			</button>

			<!-- /section:basics/sidebar.layout.shortcuts -->
		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span>

			<span class="btn btn-info"></span>

			<span class="btn btn-warning"></span>

			<span class="btn btn-danger"></span>
		</div>
	</div><!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list" id="menu">

		<li class="">
			<a href="index.html">
				<i class="menu-icon fa fa-tachometer"></i>
				<span class="menu-text"> Dashboard </span>
			</a>

			<b class="arrow"></b>
		</li>
		
		<li class="">
			<a href="<%=menuPath%>/home/index">
				<i class="menu-icon fa fa-home"></i>
				<span class="menu-text"> 首页 </span>
			</a>

			<b class="arrow"></b>
		</li>
		
		<li class="">
			<a href="<%=menuPath%>/usermanage/index">
				<i class="menu-icon fa fa-university"></i>
				<span class="menu-text">组织管理</span>
			</a>

			<b class="arrow"></b>
		</li>
		<li class="">
			<a href="<%=menuPath%>/cm/cm">
				<i class="menu-icon fa fa-university"></i>
				<span class="menu-text">内容管理</span>
			</a>

			<b class="arrow"></b>
		</li>
		
		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-user"></i>
				<span class="menu-text">人员管理</span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			
			<b class="arrow"></b>
			<ul class="submenu">
				<li class="">
					<a href="<%=menuPath%>/employee/index">
						<i class="menu-icon fa fa-caret-right"></i>
						职工管理1
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="<%=menuPath%>/employee/jqgrid">
						<i class="menu-icon fa fa-caret-right"></i>
						职工管理2
					</a>

					<b class="arrow"></b>
				</li>
			</ul>
		</li>
		
	
		<li class="">
			<a href="<%=menuPath%>/party/template">
				<i class="menu-icon fa fa-leaf"></i>
				<span class="menu-text">模板页面</span>
			</a>
			<b class="arrow"></b>
		</li>
		
		<li class="">
			<a href="<%=menuPath%>/account/login">
				<i class="menu-icon fa fa-power-off"></i>
				<span class="menu-text">退出登录</span>
			</a>
			<b class="arrow"></b>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-desktop"></i>
				<span class="menu-text">
					UI &amp; Elements
				</span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-caret-right"></i>

						Layouts
						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>

					<ul class="submenu">
						<li class="">
							<a href="top-menu.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Top Menu
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="two-menu-1.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Two Menus 1
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="two-menu-2.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Two Menus 2
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="mobile-menu-1.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Default Mobile Menu
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="mobile-menu-2.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Mobile Menu 2
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="mobile-menu-3.html">
								<i class="menu-icon fa fa-caret-right"></i>
								Mobile Menu 3
							</a>

							<b class="arrow"></b>
						</li>
					</ul>
				</li>

				<li class="">
					<a href="typography.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Typography
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="elements.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Elements
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="buttons.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Buttons &amp; Icons
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="content-slider.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Content Sliders
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="treeview.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Treeview
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="jquery-ui.html">
						<i class="menu-icon fa fa-caret-right"></i>
						jQuery UI
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="nestable-list.html">
						<i class="menu-icon fa fa-caret-right"></i>
						Nestable Lists
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-caret-right"></i>

						Three Level Menu
						<b class="arrow fa fa-angle-down"></b>
					</a>

					<b class="arrow"></b>

					<ul class="submenu">
						<li class="">
							<a href="#">
								<i class="menu-icon fa fa-leaf green"></i>
								Item #1
							</a>

							<b class="arrow"></b>
						</li>

						<li class="">
							<a href="#" class="dropdown-toggle">
								<i class="menu-icon fa fa-pencil orange"></i>

								4th level
								<b class="arrow fa fa-angle-down"></b>
							</a>

							<b class="arrow"></b>

							<ul class="submenu">
								<li class="">
									<a href="#">
										<i class="menu-icon fa fa-plus purple"></i>
										Add Product
									</a>

									<b class="arrow"></b>
								</li>

								<li class="">
									<a href="#">
										<i class="menu-icon fa fa-eye pink"></i>
										View Products
									</a>

									<b class="arrow"></b>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
		</li>
		
		<li id="customer-menu">
		</li>
	</ul><!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
	
	<script type="text/javascript">
		
		// 菜单定位
	    var pathname = window.location.pathname;
		$("li a").each(function() {
			var href = $(this).attr("href");
			if(pathname == href){
				$(this).parents("ul").parent("li").addClass("active open");
				$(this).parent("li").addClass("active");
			}
		});

	</script>

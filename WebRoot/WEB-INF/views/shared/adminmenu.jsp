<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String adminMenuPath = request.getContextPath();
String baseAdminMenuPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+adminMenuPath+"/";
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
		<a href="<%=adminMenuPath%>/home/adminindex">
			<i class="menu-icon fa fa-home"></i>
			<span class="menu-text"> 首页 </span>
		</a>
		<b class="arrow"></b>
	</li>

	<li class="">
		<a href="#" class="dropdown-toggle">
			<i class="menu-icon fa fa-user"></i>
			<span class="menu-text">用户管理</span>
			<b class="arrow fa fa-angle-down"></b>
		</a>
		
		<b class="arrow"></b>
		<ul class="submenu">
			<li class="">
				<a href="<%=adminMenuPath%>/usermanage/userindex">
					<i class="menu-icon fa fa-caret-right"></i>
					用户管理
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="<%=adminMenuPath%>/usermanage/addfamily">
					<i class="menu-icon fa fa-caret-right"></i>
					添加亲属
				</a>
				<b class="arrow"></b>
			</li>
		</ul>
	</li>
	
	<li class="">
		<a href="#" class="dropdown-toggle">
			<i class="menu-icon fa fa-user"></i>
			<span class="menu-text">医生管理</span>
			<b class="arrow fa fa-angle-down"></b>
		</a>
		
		<b class="arrow"></b>
		<ul class="submenu">
			<li class="">
				<a href="<%=adminMenuPath%>/doctormanage/index">
					<i class="menu-icon fa fa-caret-right"></i>
					医生信息
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="<%=adminMenuPath%>/doctormanage/bindingindex">
					<i class="menu-icon fa fa-caret-right"></i>
					指定医生
				</a>
				<b class="arrow"></b>
			</li>
		</ul>
	</li>
	
	<li class="">
		<a href="#" class="dropdown-toggle">
			<i class="menu-icon fa fa-list-ul"></i>
			<span class="menu-text">数据管理</span>
			<b class="arrow fa fa-angle-down"></b>
		</a>
		
		<b class="arrow"></b>
		<ul class="submenu">
			<li class="">
				<a href="<%=adminMenuPath%>/datamanage/electrocardiogramindex">
					<i class="menu-icon fa fa-caret-right"></i>
					心电数据
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="<%=adminMenuPath%>/datamanage/bloodoxygenindex">
					<i class="menu-icon fa fa-caret-right"></i>
					血氧数据
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="<%=adminMenuPath%>/datamanage/bloodpressureindex">
					<i class="menu-icon fa fa-caret-right"></i>
					血压数据
				</a>
				<b class="arrow"></b>
			</li>
			<li class="">
				<a href="<%=adminMenuPath%>/datamanage/bloodglucoseindex">
					<i class="menu-icon fa fa-caret-right"></i>
					血糖数据
				</a>
				<b class="arrow"></b>
			</li>
		</ul>
	</li>
	
	<li class="">
		<a href="<%=adminMenuPath%>/home/adminindex">
			<i class="menu-icon fa fa-cog"></i>
			<span class="menu-text">设备管理 </span>
		</a>
		<b class="arrow"></b>
	</li>

	<li class="">
		<a href="<%=adminMenuPath%>/party/template">
			<i class="menu-icon fa fa-leaf"></i>
			<span class="menu-text">模板页面</span>
		</a>
		<b class="arrow"></b>
	</li>
	
	<li class="">
		<a href="<%=adminMenuPath%>/account/login">
			<i class="menu-icon fa fa-power-off"></i>
			<span class="menu-text">退出登录</span>
		</a>
		<b class="arrow"></b>
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

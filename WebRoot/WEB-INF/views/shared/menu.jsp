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

	<ul class="nav nav-list" id="customer-menu">

	</ul><!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
	
	<script type="text/javascript">
		
		// 菜单定位	
		function lockmenu() {
			var pathname = window.location.pathname;
			$("li a").each(function() {
				var href = $(this).attr("href");
				if(pathname == href){
					$(this).parents("ul").parent("li").addClass("active open");
					$(this).parent("li").addClass("active");
				}
			});
		};
		
		
		jQuery(function () {
			$.ajax({
				url: "<%=menuPath%>/menus/loadmenus",
				type: "GET",
				success: function (data){
					if (data.success) {
						$("#customer-menu").append(data.html);
						lockmenu();
					} else {
						alert("获取菜单失败！");
					}
				}
			
			});
		});
		
	</script>

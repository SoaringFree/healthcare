<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login</title>
    
	<meta charset="utf-8" />
	
	<!-- bootstrap & font awesome -->
	<link rel="stylesheet" href="<%=path%>/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=path%>/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
	
	<!-- page specific plugin styles -->
	<!-- ace styles -->
	<link rel="stylesheet" href="<%=path%>/assets/css/ace.css" />

	<!--[if lte IE 9]>
		<link rel="stylesheet" href="<%=path%>/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
	<![endif]-->
	<link rel="stylesheet" href="<%=path%>/assets/css/ace-skins.min.css" />
	<link rel="stylesheet" href="<%=path%>/assets/css/ace-rtl.min.css" />
	
	<!--[if lte IE 9]>
	  <link rel="stylesheet" href="<%=path%>/assets/css/ace-ie.min.css" />
	<![endif]-->

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

	<!--[if lt IE 9]>
	<script src="<%=path%>/assets/js/html5shiv.js"></script>
	<script src="<%=path%>/assets/js/respond.js"></script>
	<![endif]-->
	
	
	<!-- The fav icon -->
    <link rel="shortcut icon" href="<%=path %>/assets/img/favicon.ico">
    <style type="text/css">
    	body {}
    	table { width: 100%; table-layout: fixed; }
    </style>
  </head>
  
  <body class="login-layout">
    <div class="main-container">
    	<div style="padding-top:2%; margin-left:60px">
			<h1>
				<i class="ace-icon fa fa-leaf green"></i>
				<span class="gold"><b>健康监测服务系统</b></span>
			</h1>
		</div>
		<div class="space-10"></div>
		<div class="main-content" style="padding-top:0">
			<div class="row" style="min-height:360px; background:url('assets/images/healthcare/bg_login.jpg') no-repeat;background-size:100% 360px;">
				<div class="col-sm-6 col-sm-offset-6" >
					<div class="login-container" >
						
						<div class="position-relative">
							<div id="login-box" 
								class="login-box visible widget-box no-border" 
								style="background-color: rgba(247, 247, 247, 0.9)" >
								<div class="widget-body" style="background-color: transparent">
									<div class="widget-main" style="background-color: transparent">
										<h5 class="header blue lighter bigger center">
											<i class="ace-icon fa fa-coffee green"></i>
											请输入您的登录信息！
										</h5>

										<div class="space-6"></div>
										
										<div id="error_msg" style="display: none" class="alert alert-danger">
										   <a href="javascript:;" onclick="errorMsgHide()" class="close">
										      &times;
										   </a>
										   <strong>登录失败: </strong><strong id="msg"></strong>
										</div>
										
										<form id="loginForm" name="loginForm">
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" id="userid" name="userId" class="form-control" placeholder="用户名" />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" id="password" name="password" class="form-control" placeholder="密码" />
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>
												
												<table>
								    				<tr>
								    					<td style="padding:0">
												    		<span class="input-icon input-icon-right">
																<input id="captcha" name="userCaptcha" type="text" placeholder="验证码" class="form-control" />
																<i class="ace-icon fa fa-leaf"></i>
															</span>
								    					</td>
								    					<td style="padding:0">
										    				<img id="captchaImg" alt="验证码" src="<%=path %>/captcha/getCaptcha.html"  style="margin-left:10px" />
										    				<a href="javascript:;" onclick="changeImg()" style="margin-left:5px"><i class="ace-icon fa fa-undo green"></i></a>
								    					</td>
								    				</tr>
								    			</table>

												<div class="space"></div>

												<div class="clearfix">
													<label class="inline">
														<input type="checkbox" class="ace" />
														<span class="lbl">记住密码</span>
													</label>

													<button type="button" class="width-35 pull-right btn btn-sm btn-primary" onclick="loginSubmit()">
														<i class="ace-icon fa fa-key"></i>
														<span class="bigger-110">登录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div><!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box" class="forgot-password-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												找回密码
											</a>
										</div>

										<div>
											<a href="#" data-target="#signup-box" class="user-signup-link">
												注册
												<i class="ace-icon fa fa-arrow-right"></i>	
											</a>
										</div>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border" style="background-color: rgba(247, 247, 247, 0.5)">
								<div class="widget-body" style="background-color: transparent">
									<div class="widget-main" style="background-color: transparent">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i>
											找回密码
										</h4>

										<div class="space-6"></div>
										<p>
											请输入您用于找回密码的邮箱！
										</p>

										<form>
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>

												<div class="clearfix">
													<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i>
														<span class="bigger-110">Send Me!</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div><!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box" class="back-to-login-link">
											返回登录
											<i class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border" style="background-color: rgba(247, 247, 247, 0.5)">
								<div class="widget-body" style="background-color: transparent">
									<div class="widget-main" style="background-color: transparent">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i>
											用户注册
										</h4>

										<div class="space-6"></div>
										<p> Enter your details to begin: </p>

										<form>
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="email" class="form-control" placeholder="Email" />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="text" class="form-control" placeholder="Username" />
														<i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" placeholder="Password" />
														<i class="ace-icon fa fa-lock"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right">
														<input type="password" class="form-control" placeholder="Repeat password" />
														<i class="ace-icon fa fa-retweet"></i>
													</span>
												</label>

												<label class="block">
													<input type="checkbox" class="ace" />
													<span class="lbl">
														I accept the
														<a href="#">User Agreement</a>
													</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i>
														<span class="bigger-110">Reset</span>
													</button>

													<button type="button" class="width-65 pull-right btn btn-sm btn-success">
														<span class="bigger-110">Register</span>

														<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box" class="back-to-login-link">
											<i class="ace-icon fa fa-arrow-left"></i>
											返回登录
										</a>
									</div>
								</div><!-- /.widget-body -->
							</div><!-- /.signup-box -->
						</div><!-- /.position-relative -->

					</div>
				</div><!-- /.col -->
			</div><!-- /.row -->
			<%@ include file="../shared/footer.jsp" %>
		</div><!-- /.main-content -->
	</div><!-- /.main-container -->
    
    <!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='<%=path%>/assets/js/jquery-2.1.4.min.js'>"+"<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
	<script type="text/javascript">
	 window.jQuery || document.write("<script src='../assets/js/jquery-1.11.3.min.js'>"+"<"+"/script>");
	</script>
	<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='<%=path%>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
    
    <!-- inline scripts related to this page -->
	<script type="text/javascript">
		jQuery(function($) {
		 $(document).on('click', '.toolbar a[data-target]', function(e) {
			e.preventDefault();
			var target = $(this).data('target');
			$('.widget-box.visible').removeClass('visible');//hide others
			$(target).addClass('visible');//show target
		 });
		});
		
		function loginSubmit() {
			if (0 >= $("#userid").val().trim().length) {
				errorMsgShow("请输入用户名！");
				return;
			}
			if(0 >= $("#password").val().trim().length) {
				errorMsgShow("请输入密码！");
				return;
			}
			if(0 >= $("#captcha").val().trim().length) {
				errorMsgShow("请输入验证码！");
				return;
			}
		
			$.ajax({
				type: "POST",
				url: "<%=path %>/account/login",
				data: $("#loginForm").serialize(),
				success: function(data) {
					if (data.success) {
						window.location.href = "<%=path %>" + data.url;
					} else {
						errorMsgShow(data.message);
					}
				}
			});
		};
		
		function errorMsgShow(msg) {
			$("#msg strong").remove();
			var strong = $('<strong>' + msg + '</strong>');
			$("#msg").append(strong);
			document.getElementById("error_msg").style.display = "";
		};
		
		function errorMsgHide() {
			document.getElementById("error_msg").style.display = "none";
		};
		
		function changeImg() {
			var imgSrc = $("#captchaImg");
			var src = imgSrc.attr("src");
			imgSrc.attr("src", changeUrl(src));
		};
		
		function changeUrl(url) {
			var timestamp = (new Date()).valueOf();
			
			if (url.indexOf("?") >= 0) {
				url = url.substring(0, url.indexOf('?'));
			} 
			
			url = url + "?timestamp=" + timestamp;
			return url;
		};

	</script>
  </body>
</html>


<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    
	<%@ include file="../shared/cssandjs.jsp" %>

	<link href='<%=basePath%>/assets/components/bootstrapvalidator/dist/css/bootstrapValidator.min.css' rel='stylesheet'>
    <script src="<%=path%>/assets/components/bootstrapvalidator/dist/js/bootstrapValidator.min.js"></script>
  </head>
  
  <body class="no-skin">
    
    <%@ include file="../shared/header.jsp" %>
    
    <!-- main container -->
    <div class="main-container" id="main-container">
    	<!-- #section:basics/side bar -->
		<div id="sidebar" class="sidebar responsive">
			<%@ include file="../shared/doctormenu.jsp" %>
		</div>
		
		<!-- /section:basics/side bar -->
		<div class="main-content">
			<div class="main-content-inner">
				<!-- 页面导航 -->
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="#">信息管理</a>
						</li>
						<li class="active">
							<a href="#">个人信息</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
				
					<!-- 页面内容 -->
					<div class="row">
					
					<!-- 账户信息 -->
					<div class="col-xs-12 col-sm-6 widget-container-col ui-sortable">
					<div class="widget-container">
						<div class="widget-box">
							<div class="box-inner">
								<div class="widget-header">
									<h5 class="widget-title"><b>账户信息</b></h5>
				                    <div class="widget-toolbar">
										<a href="#" data-action="fullscreen" class="orange2">
				                            <i class="ace-icon fa fa-expand"></i>
				                        </a>
				                        <a href="#" data-action="collapse">
				                            <i class="ace-icon fa fa-chevron-up"></i>
				                        </a>
			                        </div>			
								</div>
								
								<div class="widget-body">
									<br />

									<form id="userform" name="userform" class="form-horizontal">
										<div class="form-group center" style="display:none">
											<input type="text" class="form-control" id="user_id" name="id" readOnly />
											<input type="text" class="form-control" id="user_roleid" name="roleId" readOnly />
										</div>
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">用户名</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="user_userid" name="userId" readOnly />
							                </div>
							            </div>
							            
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">密码</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="password" class="form-control" id="user_password" name="password"  readOnly/>
							                </div>
							            </div>
							            
							            <div class="form-group center" id="user_repassword_div" style="display:none">
							            	<label class="col-lg-3 control-label">确认密码</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="password" class="form-control" id="user_repassword" name="repassword"/>
							                </div>
							            </div>
							             
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">姓名</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="user_username" name="userName"  readOnly/>
							                </div>
							            </div>
							            						            
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">注册日期</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="user_registDate" name="user_registDate" readOnly/>
							                </div>
							            </div>
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">登录日期</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="user_lastLoginDate" name="user_lastLoginDate" readOnly/>
							                </div>
							            </div>
						            </form>

				                	<div style="text-align:right; padding:0 10px 5px 0">
			                          	<button type="button" class="btn btn-sm btn-success" id="user_enable_edit" onclick="user_enable_edit()">编辑</button>
			                          	<button type="button" class="btn btn-sm btn-primary" id="user_edit_btn" onclick="userEditSubmit()">保存</button>
			                          	<button type="button" class="btn btn-sm btn-default" id="user_cancel" onclick="userCancel()" >取消</button>
			                      	</div>
									
								</div>
							
							</div>	
						</div>
					</div><!-- 账户信息 -->
					</div>
				
				
					<!-- 详细信息 -->
					<div class="col-xs-12 col-sm-6 widget-container-col ui-sortable">
					<div class="widget-container">
						<div class="widget-box">
							<div class="box-inner">
								<div class="widget-header">
									<h5 class="widget-title"><b>详细信息</b></h5>
				                    <div class="widget-toolbar">
										<a href="#" data-action="fullscreen" class="orange2">
				                            <i class="ace-icon fa fa-expand"></i>
				                        </a>
				                        <a href="#" data-action="collapse">
				                            <i class="ace-icon fa fa-chevron-up"></i>
				                        </a>
			                        </div>			
								</div>
								
								<div class="widget-body">
									<br />
									<form id="userinfoform" name="userinfoform" class="form-horizontal">
						            	<div class="form-group center" style="display:none">
											<input type="text" class="form-control" id="userinfo_id" name="id" readOnly />
											<input type="text" class="form-control" id="userinfo_userid" name="userId" readOnly />
										</div>
										
							            <div class="form-group center">
							                <label class="col-lg-3 control-label">性别</label>
							                <div class="col-xs-4 col-lg-4">
							                    <label class="radio-inline">
												  <input type="radio" checked name="sex" id="userinfo_sex1" value="1">男
												</label>
												<label class="radio-inline">
												  <input type="radio" name="sex" id="userinfo_sex2" value="0">女
												</label>
												<label class="radio-inline">
												  <input type="radio" name="sex" id="userinfo_sex3" value="2">未知
												</label>
							                </div>
							            </div>
							            
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">出生日期</label>
							            	<div class="col-xs-8 col-lg-8">
								                <div class="input-group date form_date"
								                	data-date="" data-date-format="yyyy-mm-dd"
								                	data-link-field="userinfo_birthday" data-link-format="yyyy-mm-dd">
								                    <input type="text" class="form-control" id="userinfo_birthday" name="userinfo_birthday" value="" readonly />
								                    <span class="input-group-addon">
								                    	<span class="glyphicon glyphicon-remove "></span>
							                    	</span>
													<span class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
								                </div>
								            </div>
							            </div>
							            
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">身份证号</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="userinfo_identity" name="identity"/>
							                </div>
							            </div>
							            
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">名族</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="userinfo_nation" name="nation"/>
							                </div>
							            </div>
							            
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">备用电话</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="userinfo_phone" name="backupPhone"/>
							                </div>
							            </div>
							            
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">邮箱</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="userinfo_email" name="email"/>
							                </div>
							            </div>
							            
							            <div class="form-group center">
							            	<label class="col-lg-3 control-label">家庭住址</label>
							                <div class="col-xs-8 col-lg-8">
							                    <input type="text" class="form-control" id="userinfo_address" name="address"/>
							                </div>
							            </div>
					            	</form>
									<div style="text-align:right; padding:0 10px 5px 0">
			                          	<button type="button" class="btn btn-sm btn-success" id="userinfo_enable_edit" onclick="doctorInfo_enable_edit()">编辑</button>
			                          	<button type="button" class="btn btn-sm btn-primary" id="userinfo_edit_btn" onclick="doctorInfoEditSubmit()">保存</button>
			                          	<button type="button" class="btn btn-sm btn-default" id="userinfo_cancel" onclick="doctorInfoCancel()" >取消</button>
			                      	</div>
								</div>
							
							</div>	
						</div>
					</div><!-- 详细信息 -->
					</div>
					
					</div> <!-- row -->
					
				</div> <!-- /.page-content -->
			</div>
		</div><!-- /.section:basics/sidebar -->
    </div><!-- /.main container -->
    
    <script type="text/javascript">
    
    	$(document).ready(function() {
			getDoctorAcount();
			getDoctorInfo();
			initValidate();
		});
		
		
		/****************************** 用户信息 ********************************/
		var USER = null;
		function getDoctorAcount() {
			$.ajax({
				url: "<%=path%>/drinfomgmt/getdoctoraccount",
				type: "GET",
				datatype: "json",
				data: {},
				success: function(data) {
					if (data.success == true) {
						USER = data.result;
						initDoctorAccount(data.result);
					} else {
						window.location.href = "<%=path %>/account/login";
					}
				}
			}); 
		}
		
		function initDoctorAccount(user) {
			$('#user_id').val(user.id);
			$('#user_userid').val(user.userId);
			$('#user_roleid').val(user.roleId);
    		$('#user_password').val(user.password);
    		$('#user_repassword').val(user.password);
    		$('#user_username').val(user.userName);
    		$('#user_registDate').val(user.registDate);
    		$('#user_lastLoginDate').val(user.lastLoginDate);
    		
    		$("#user_enable_edit").show();
    		$("#user_edit_btn").hide();
    		$("#user_edit_btn_div").hide();
    		$("#user_password").attr({ readonly: 'true' }); 
    		$("#user_username").attr({ readonly: 'true' }); 
		}
		
		function user_enable_edit() {
			$("#user_enable_edit").hide();
			$("#user_repassword_div").show();
			$("#user_edit_btn").show();
			$("#user_password").removeAttr("readonly");
			$("#user_username").removeAttr("readonly");
		}
		
		function userCancel() {
			$("#user_enable_edit").show();
    		$("#user_edit_btn").hide();
			$("#user_repassword_div").hide();
			$("#user_password").attr({ readonly: 'true' }); 
    		$("#user_username").attr({ readonly: 'true' }); 
			
			$("#userform").data('bootstrapValidator').resetForm(true);
    		$('#user_password').val(USER.password);
    		$('#user_username').val(USER.userName);
		}

		function userEditSubmit() {
			$.ajax({
				type: "POST",
				url: "<%=path%>/drinfomgmt/editdoctor",
				data: $("#userform").serialize(),
				success: function(data) {
					if (data.success == true) {
						getDoctorAcount();
						userCancel();
					} else {
						alert("修改失败，请重试.");
					}
				}
			});
		}
		
		
		
		/****************************** 详细信息 ********************************/
		var USERINFO = null;
		function getDoctorInfo() {
			$.ajax({
				url: "<%=path%>/drinfomgmt/getdoctorinfo",
				type: "GET",
				datatype: "json",
				data: {},
				success: function(data) {
					if (data.success == true) {
						USERINFO = data.result;
						initDoctorInfo(data.result, true);
					} else {
						initDoctorInfo(null, false);
					}
					doctorInfoControl();
				}
			}); 
		}
		
		function doctorInfoControl(fixed) {	
			if (fixed == false) {	
		   		$("#userinfo_enable_edit").hide();
	    		$("#userinfo_edit_btn").show();
	    		
		   		$("#userinfo_birthday").removeAttr("readonly"); 
		   		$("#userinfo_identity").removeAttr("readonly"); 
		   		$("#userinfo_nation").removeAttr("readonly"); 
		   		$("#userinfo_phone").removeAttr("readonly"); 
		   		$("#userinfo_email").removeAttr("readonly"); 
		   		$("#userinfo_address").removeAttr("readonly");
			} else {
				$("#userinfo_enable_edit").show();
	    		$("#userinfo_edit_btn").hide();
	    		
		   		$("#userinfo_birthday").attr({ readonly: 'true' }); 
		   		$("#userinfo_identity").attr({ readonly: 'true' }); 
		   		$("#userinfo_nation").attr({ readonly: 'true' }); 
		   		$("#userinfo_phone").attr({ readonly: 'true' }); 
		   		$("#userinfo_email").attr({ readonly: 'true' }); 
		   		$("#userinfo_address").attr({ readonly: 'true' });
			}
		}
		
		
		function initDoctorInfo(userinfo, notnull) {
	   		$('#userinfo_userid').val(USER.userId);
    		if (notnull == true) {
    			$('#userinfo_id').val(userinfo.id);
	    		if ("1" == userinfo.sex) {
		   			document.getElementById('userinfo_sex1').checked = true;
		   		} else if ("0" == userinfo.sex){
		   			document.getElementById('userinfo_sex2').checked = true;
		   		} else {
		   			document.getElementById('userinfo_sex3').checked = true;
		   		}
		   		$('#userinfo_birthday').val(userinfo.birthday);
		   		$('#userinfo_identity').val(userinfo.identity);
		   		$('#userinfo_nation').val(userinfo.nation);
		   		$('#userinfo_phone').val(userinfo.backupPhone);
		   		$('#userinfo_email').val(userinfo.email);
		   		$('#userinfo_address').val(userinfo.address);
    		} else {
    			$('#userinfo_id').val(0);
	   			document.getElementById('userinfo_sex1').checked = false;
	   			document.getElementById('userinfo_sex2').checked = false;
	   			document.getElementById('userinfo_sex3').checked = false;
		   		$('#userinfo_birthday').val('');
		   		$('#userinfo_identity').val('');
		   		$('#userinfo_nation').val('');
		   		$('#userinfo_phone').val('');
		   		$('#userinfo_email').val('');
		   		$('#userinfo_address').val('');
    		}
		}
		
		function doctorInfo_enable_edit() {
			doctorInfoControl(false);
		}
		
		function doctorInfoCancel() {
			doctorInfoControl(); 
			$("#userinfoform").data('bootstrapValidator').resetForm(true);
			if (USERINFO == null) {
				initDoctorInfo(null, false);
			} else {
				initDoctorInfo(USERINFO, true);
			}
		}

		function doctorInfoEditSubmit() {
			$.ajax({
				type: "POST",
				url: "<%=path%>/drinfomgmt/editdoctorinfo",
				data: $("#userinfoform").serialize(),
				success: function(data) {
					if (data.success == true) {
						doctorInfoCancel();
						getDoctorInfo();
					} else {
						alert("修改失败，请重试.");
					}
				}
			});
		}
		
		
		
		/****************************** 加载动画 ********************************/
    	function loading(loadingId, flag) {
    		if (false == flag) {
    			$("#" + loadingId).hide();
    		} else {
    			$("#" + loadingId).show();
    		}
			
		}
		
		
		/****************************** 数据验证 ********************************/
		function initValidate() {
			$('.form_date').datetimepicker({
		        language:  'zh-CN',
		        weekStart: 1,
		        todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0
		    });
	 
		    $("#userform").bootstrapValidator({
	
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            password: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The password is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 5,
		                        max: 20,
		                        message: 'The password must be more than 5 and less than 20 characters long'
		                    },
		                    identical: {
		                        field: 'repassword',
		                        message: 'The password and its confirm are not the same'
		                    }
	                    }
		            },
		            repassword: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The confirm password is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 5,
		                        max: 20,
		                        message: 'The password must be more than 5 and less than 20 characters long'
		                    },
		                    identical: {
		                        field: 'password',
		                        message: 'The password and its confirm are not the same'
		                    }
	                    }
		            },
		            userName: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The username is required and cannot be empty'
		                    }
	                    }
		            }
		        }
		    });
	        $("#userCancel").click(function() {
	        	$("#userform").data('bootstrapValidator').resetForm(true);
		    });
		    
		    
		    $("#userinfoform").bootstrapValidator({
	
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            identity: {
		            	validators: {

		                    stringLength: {
		                        min: 18,
		                        max: 18,
		                        message: 'The identity must be 18 characters long'
		                    }
	                    }
		            },
		            backupPhone: {
		            	validators: {
		                    stringLength: {
		                        min: 11,
		                        max: 11,
		                        message: 'The phone number must be 11 numbers long'
		                    },
		                    regexp: {
		                        regexp: /^[1]\d{10}$/,
		                        message: 'The number must be only be phone number'
		                    }
	                    }
		            },
		            email: {
		            	validators: {
		                    regexp: {
		                        regexp: /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/,
		                        message: 'The email must be valid'
		                    }
	                    }
		            }
		        }
		    });
	        $("#userinfoCancel").click(function() {
	        	$("#userinfoform").data('bootstrapValidator').resetForm(true);
		    });
		}
    
    </script>
    
  </body>
</html>
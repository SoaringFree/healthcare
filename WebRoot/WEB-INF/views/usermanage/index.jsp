<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
	<%@ include file="../shared/cssandjs.jsp" %>
	
	<!-- 其他 css js 引用 -->
	<link href='<%=basePath%>/assets/components/bootstrapvalidator/dist/css/bootstrapValidator.min.css' rel='stylesheet'>
	
	<!-- bootstrapValidator js -->
    <script src="<%=path%>/assets/components/bootstrapvalidator/dist/js/bootstrapValidator.min.js"></script>

	<!-- bootstrap-paginator plugin -->
	<script src="<%=path%>/assets/components/bootstrap-paginator/bootstrap-paginator.js"></script>
	
	<style type="text/css">
		input, select, button {
	   		vertical-align:middle
	   	}
	   	
	   	select {
		  	padding: 4px 1px;
		  	border-radius: 0px;
		  	height:32px;
		}
		
	</style>
	
  </head>
  
  <body class="no-skin">
    
    <%@ include file="../shared/header.jsp" %>
    
    <!-- main container -->
    <div class="main-container" id="main-container">
    	<!-- #section:basics/side bar -->
		<div id="sidebar" class="sidebar responsive">
			<%@ include file="../shared/adminmenu.jsp" %>
		</div>
		
		<!-- /section:basics/side bar -->
		<div class="main-content">
			<div class="main-content-inner">
				<!-- 页面导航 -->
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-user"></i>
							<a href="#">用户管理</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					<!-- 页面内容 -->
					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title"><b>用户信息</b></h5>
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
							<!--  multi-condition query -->
							<div class="input-append center">
						        <input style="height:32px" id="userId" name="userId" type="text" placeholder="用户ID" />
						        <input style="height:32px" id="userName" name="userName" type="text" placeholder="姓名" />
						        
						        <select id="roleId" name="roleId">
						        	<option value="0">用户类型</option>
		                			<option value="2">患者用户</option>
		                			<option value="3">医生用户</option>
		                			<option value="4">亲属用户</option>
		                			<option value="1">管理员用户</option>
		                		</select>
						        
						        <button style="height:32px" class="btn btn-primary btn-xs"  type="button" onclick="search()">
						        	<i class="glyphicon glyphicon-search white"></i>查询
						        </button>
						        <button style="height:32px" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#createModal" type="button" >
						        	<i class="glyphicon glyphicon-plus-sign white"></i>新增
						        </button>
						    </div>
						    <br />
						    
						    <!-- the result table -->
							<table class="table table-striped table-bordered responsive">
								<thead>
									<tr>
										<th style="text-align:center;">序号</th>
										<th style="text-align:center; display:none">ID</th>
										<th style="text-align:center;">用户名</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center; display:none">RoleID</th>
										<th style="text-align:center;">用户类型</th>
										<th style="text-align:center;">注册时间</th>
										<th style="text-align:center;">操作</th>
									</tr>
								</thead>
								<tbody id="tby">
									
								</tbody>
								
								
							</table>
							
							<div id="loading" class="center">
								<span>
								<img src="<%=path %>/assets/img/ajax-loaders/ajax-loader-10.gif" title="img/ajax-loaders/ajax-loader-10.gif">
								&nbsp;正在加载...
								</span>
							</div>
							
							<div>
								<ul id="paginator"></ul>
							</div>
						</div>
					
					</div>	
					</div>
					</div>
				
				

				</div>
				
				
			</div>
		</div><!-- /.section:basics/sidebar -->
    </div><!-- /.main container -->
    
    
    <!-- create / user-->
	<div class="modal fade bold" style="display: none;" id="createModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" onclick="create_close()">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>新建用户</b></span>
	                </div>
	            </div>
	            
	            <div class="modal-body" style="padding-bottom:10px">
	            	<form id="create_form" name="create_form" class="form-horizontal">
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">用户名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="create_userid" name="userId" />
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">密码</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="password" class="form-control" id="create_password" name="password" />
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">确认密码</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="password" class="form-control" id="create_repassword" name="repassword"/>
			                </div>
			            </div>
			             
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">姓名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="create_username" name="userName" />
			                </div>
			            </div>
			            
		               	<div class="form-group">
			            	<label class="col-lg-3 control-label">用户类型</label>
			                <div class="col-xs-8 col-lg-8" >
			                     <select id="create_roleid" name="roleId">
		                			<option value="2">患者用户</option>
		                			<option value="3">医生用户</option>
		                			<option value="4">亲属用户</option>
		                			<option value="1">管理员用户</option>
		                		</select>
			                </div>
			            </div>
		            </form>
	        	</div>

	    		<div class="modal-footer">
	                <div class="col-lg-4 col-lg-offset-7">
	            		<div class="col-lg-4">
                          	<button type="button" class="btn btn-sm btn-primary" id="create_btn" onclick="createSubmit()">保存</button>
                      	</div>
                      	<div class="col-lg-4">
                          	<button type="button" class="btn btn-sm btn-success" id="create_reset_btn" >重置</button>
                      	</div>
                      	<div class="col-lg-4">
                          	<button type="button" class="btn btn-sm btn-default" id="create_close" onclick="create_close()" >关闭</button>
                      	</div>
                   	</div>
	            </div>

	    	</div>
	    </div>
    </div>
    
    
    <!-- detail / user-->
	<div class="modal fade bold" style="display: none;" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" onclick="detail_close()" aria-hidden="true">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>用户信息</b></span>
	                </div>
	            </div>
	            
	            <div class="modal-body" style="padding-bottom:10px">
	            	<form id="detail_form" name="detail_form" class="form-horizontal">
						<div class="form-group center" style="display:none">
							<input type="text" class="form-control" id="detail_id" name="id" readOnly />
						</div>
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">用户名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="detail_userid" name="userId" readOnly />
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">密码</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="password" class="form-control" id="detail_password" name="password"  readOnly/>
			                </div>
			            </div>
			            
			            <div class="form-group center" id="detail_repassword_div" style="display:none">
			            	<label class="col-lg-3 control-label">确认密码</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="password" class="form-control" id="detail_repassword" name="repassword"/>
			                </div>
			            </div>
			             
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">姓名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="detail_username" name="userName"  readOnly/>
			                </div>
			            </div>
			            
		               	<div class="form-group">
			            	<label class="col-lg-3 control-label">用户类型</label>
			                <div class="col-xs-8 col-lg-8" >
			                     <select id="detail_roleid" name="roleId">
		                			<option value="2">患者用户</option>
		                			<option value="3">医生用户</option>
		                			<option value="4">亲属用户</option>
		                			<option value="1">管理员用户</option>
		                		</select>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">注册日期</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="detail_registDate" name="detail_registDate" readOnly/>
			                </div>
			            </div>
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">登录日期</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="detail_lastLoginDate" name="detail_lastLoginDate" readOnly/>
			                </div>
			            </div>
		            </form>
	        	</div>

	    		<div class="modal-footer">
	                <div class="col-lg-4 col-lg-offset-7">
	                	<div class="col-lg-4" id="detail_enable_edit_div" >
                          	<button type="button" class="btn btn-sm btn-success" id="detail_enable_edit" onclick="detail_enable_edit()">编辑</button>
                      	</div>
	            		<div class="col-lg-4"  id="detail_edit_btn_div">
                          	<button type="button" class="btn btn-sm btn-primary" id="detail_edit_btn" onclick="datailEditSubmit()">保存</button>
                      	</div>
                      	<div class="col-lg-4">
                          	<button type="button" class="btn btn-sm btn-default" id="detail_close" onclick="detail_close()" >关闭</button>
                      	</div>
                   	</div>
	            </div>

	    	</div>
	    </div>
    </div>
    
    
    <!-- edit / userinfo -->
	<div class="modal fade bold" style="display: none;" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" onclick="edit_close()" aria-hidden="true">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>用户基本信息</b></span>
	                </div>
	            </div>
	            
	            <div class="modal-body" style="padding-bottom:10px"> 
		            <form id="edit_userinfo_form" name="edit_userinfo_form" class="form-horizontal">
		            	<div class="form-group center" style="display:none">
							<input type="text" class="form-control" id="edit_id" name="id" readOnly />
						</div>
						
						<div class="form-group center">
			            	<label class="col-lg-3 control-label">用户名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="edit_userid" name="userId" readOnly />
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">姓名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="edit_username" name="username" readOnly />
			                </div>
			            </div>
						
			            <div class="form-group center">
			                <label class="col-lg-3 control-label">性别</label>
			                <div class="col-xs-4 col-lg-4">
			                    <label class="radio-inline">
								  <input type="radio" checked name="sex" id="edit_sex1" value="1">男
								</label>
								<label class="radio-inline">
								  <input type="radio" name="sex" id="edit_sex2" value="0">女
								</label>
								<label class="radio-inline">
								  <input type="radio" name="sex" id="edit_sex3" value="2">未知
								</label>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">出生日期</label>
			            	<div class="col-xs-8 col-lg-8">
				                <div class="input-group date form_date"
				                	data-date="" data-date-format="yyyy-mm-dd"
				                	data-link-field="birthday" data-link-format="yyyy-mm-dd">
				                    <input type="text" class="form-control" id="edit_birthday" name="edit_birthday" value="" readonly />
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
			                    <input type="text" class="form-control" id="edit_identity" name="identity"/>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">名族</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="edit_nation" name="nation"/>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">备用电话</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="edit_phone" name="backupPhone"/>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">邮箱</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="edit_email" name="email"/>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">家庭住址</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="edit_address" name="address"/>
			                </div>
			            </div>
	            	</form>
	        	</div>
				
				<div class="modal-footer">
	                <div class="col-lg-4 col-lg-offset-7">
	                	<div class="col-lg-4" id="edit_enable_edit_div" >
                          	<button type="button" class="btn btn-sm btn-success" id="edit_enable_edit" onclick="edit_enable_edit()">编辑</button>
                      	</div>
	            		<div class="col-lg-4"  id="edit_edit_btn_div">
                          	<button type="button" class="btn btn-sm btn-primary" id="edit_edit_btn" onclick="editSubmit()">保存</button>
                      	</div>
                      	<div class="col-lg-4">
                          	<button type="button" class="btn btn-sm btn-default" id="edit_close" onclick="edit_close()" >关闭</button>
                      	</div>
                   	</div>
	            </div>
				
	    	</div>
	    </div>
    </div>
    
    
    <!-- Delete -->
	<div class="modal fade" style="display: none;" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog bold">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>提示信息</b></span>
	                </div>
	            </div>
	            <br />
	            <div class="modal-body" align="center" style="padding-top:0px">
	                <span>
	                	<input type="hidden" id="delete_data_id" name="delete_data_id"/>
	                    <textarea cols="60" rows="3" id="delete_msg" style="text-align:center; font-size:14px; color:Black; border-style: solid; border-color: #FFFFFF; resize: none;" disabled> 
	                    </textarea>
	                </span>
	            </div>
	            <div class="modal-footer no-margin-top">
	                <div class="col-lg-4 col-lg-offset-7">
		            	<div class="col-lg-4" >
                           	<button type="button" class="btn btn-sm btn-primary" id="deleteBtn" onclick="deleteSubmit()">删除</button>
                       	</div>
		            	<div class="col-lg-4">
                           	<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
                       	</div>
		            	
                   	</div>
	            </div>
	        </div>
	        <!-- /.modal-content-->
	    </div>
	</div>
    
    
    <script type="text/javascript">

		var userList = null;

		$(document).ready(function() {
			// TODO
			getUsers();
			
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
	 
		    $("#create_form").bootstrapValidator({
	
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            userId: {
		                message: 'The user id is not valid',
		                validators: {
		                    notEmpty: {
		                        message: 'The user id is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 11,
		                        max: 11,
		                        message: 'The user id must be 11 numbers long'
		                    },
		                    regexp: {
		                        regexp: /^[1]\d{10}$/,
		                        message: 'The user id must be only be phone number'
		                    },
		                    remote: {
		                        message: 'The user id is not available, please change another one',
		                        url: '<%=path%>/usermanage/isUserIdAvailable'
		                    }
		                }
		            },
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
	        $("#create_reset_btn").click(function() {
		        $("#create_form").data('bootstrapValidator').resetForm(true);
		    });
		    
		    
		    $("#detail_form").bootstrapValidator({
	
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
	        $("#detail_close").click(function() {
	        	$("#detail_form").data('bootstrapValidator').resetForm(true);
		        //resetForm();
		    });
		    
		    
		    $("#edit_userinfo_form").bootstrapValidator({
	
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
	        $("#edit_close").click(function() {
	        	$("#edit_userinfo_form").data('bootstrapValidator').resetForm(true);
		    });

		});    

	
		function search() {
			getUsers();
		}

		/* 获取患者用户信息 */
		function getUsers() {

			var userId = $("#userId").val();
			var userName = $("#userName").val();
			var roleId = $("#roleId").val();
			
			loading();
			var url= "<%=basePath%>/usermanage/getuser";
			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {page: 1, rows: 10, userId: userId, userName: userName, roleId: roleId},
				success: function(data) {
					
					// 解析data
					userList = null;
					userList = data.result;
					loading(false, "loading");
					// 装填表格
	                initTable(userList, data.page);
					
					// 获取currentPage 请求页面
					var currentPage = data.page;
					// 获取totalPages 总页面
					var totalPages = data.total;
					// 获取numberofPages 显示的页面
					var numberofPages = totalPages > 10 ? 10 : totalPages;
					//alert(currentPage + " : " + totalPages + " : " + numberofPages);
					var options = {
						bootstrapMajorVersion: 3,
	                    currentPage: currentPage,       // 当前页
	                    totalPages: totalPages,      	// 总页数
	                    numberofPages: numberofPages,   // 显示的页数
	                    itemTexts: function (type, page, current) {
	                        switch (type) {
	                            case "first":
	                                return "|<<";
	                                break;
	                            case "prev":
	                                return "<";
	                                break;
	                            case "next":
	                                return ">";
	                                break;
	                            case "last":
	                                return ">>|";
	                                break;
	                            case "page":
	                                return page;
	                                break;
	                        }
	                    },
	                    onPageClicked: function (event, originalEvent, type, page) {
	                    	var userId = $("#userId").val();
							var userName = $("#userName").val();
							var roleId = $("#roleId").val();
	                    	loading();
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {page: page, rows: 10, userId: userId, userName: userName, roleId: roleId},
								success: function(data) {
									userList = null;
									userList = data.result;
									loading(false, "loading");
					                initTable(userList, page);
					            }
					        });
					     }  
					
					};
					
					$("#paginator").bootstrapPaginator(options);
				}
			});
		
		};
	
		/* 装填用户信息 */
		function initTable(userList, currentPage) {
			$("#tby tr").remove();
			if (null != userList) {
			
				$.each(userList, function(index, item) {
					
					var tr = $("<tr></tr>");
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + ((currentPage-1)*10	+ index + 1) + '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.userId       	+ '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.userName      	+ '</td>');
					var td4 = $('<td style="text-align:center; display:none;">' 		 + item.roleId   		+ '</td>');
					var td5 = $('<td style="text-align:center; vertical-align:middle;">' + item.roleName     	+ '</td>');
					var td6 = $('<td style="text-align:center; vertical-align:middle;">' + item.registDate    	+ '</td>');
					var td7 = $('<td style="text-align:center;">' +
	            					'<a class="btn btn-success btn-xs"  onclick=" detail(' + index + ') ">'  +
	                					'<i class="glyphicon glyphicon-zoom-in icon-white" ></i>' +
	                						'详情' +
	            					'</a>' +
	            					"&nbsp;" +
	            					'<a class="btn btn-info btn-xs"  onclick=" edit(' + index + ', ' + item.userId + ') ">' +
	                					'<i class="glyphicon glyphicon-edit icon-white"></i>' +
	                						'基本信息' +
	            					'</a>' +
	            					"&nbsp;" +
	            					'<a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteModal" onclick="deleteConfirm(' + index + ', ' + item.id + ')">' +
	                					'<i class="glyphicon glyphicon-trash icon-white"></i>' +
	                						'删除' +
	            					'</a>' +
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2)
						.append(td3).append(td4).append(td5)
						.append(td6).append(td7);
					
					$("#tby").append(tr);
					
				});
			}
		}
		
		
		/****************************** 新建用户 ********************************/
		function createSubmit() {
			$.ajax({
				type: "POST",
				url: "<%=path%>/usermanage/createuser",
				data: $("#create_form").serialize(),
				success: function(data) {
					if (data.success == true) {
						getUsers();
					} else {
						alert("新建用户失败，请重试.");
					}
					create_close();
				}
			});
		}
		
		function create_close() {
			$("#create_form").data('bootstrapValidator').resetForm(true);
			$("#createModal").modal("hide");
		}
    
 		
 		/****************************** 账户信息 ********************************/
    	function detail(index) {
    		$('#detail_id').val(userList[index].id);
			$('#detail_userid').val(userList[index].userId);
    		$('#detail_password').val(userList[index].password);
    		$('#detail_repassword').val(userList[index].password);
    		$('#detail_username').val(userList[index].userName);
    		$('#detail_roleid').val(userList[index].roleId);
    		$('#detail_registDate').val(userList[index].registDate);
    		$('#detail_lastLoginDate').val(userList[index].lastLoginDate);
    		
    		$("#detail_enable_edit_div").show();
    		$("#detail_repassword_div").hide();
    		$("#detail_edit_btn_div").hide();
    		$("#detail_password").attr({ readonly: 'true' }); 
    		$("#detail_username").attr({ readonly: 'true' }); 
			$("#detailModal").modal("show");
		};
		
		function detail_enable_edit() {
			$("#detail_enable_edit_div").hide();
			$("#detail_repassword_div").show();
			$("#detail_edit_btn_div").show();
			$("#detail_password").removeAttr("readonly");
			$("#detail_username").removeAttr("readonly");
		}
		
		function detail_close() {
			$("#detail_form").data('bootstrapValidator').resetForm(true);
			$("#detailModal").modal("hide");
			
		}

		function datailEditSubmit() {
			$.ajax({
				type: "POST",
				url: "<%=path%>/usermanage/edituser",
				data: $("#detail_form").serialize(),
				success: function(data) {
					if (data.success == true) {
						detail_close();
						getUsers();
					} else {
						alert("修改失败，请重试.");
					}
				}
			});
		}
    	
    	
    	/****************************** 基本信息 ********************************/
    	function edit(index, userid) {
    		$.ajax({
				type: "GET",
				url: "<%=path%>/usermanage/getuserinfo",
				data: {userid: userid},
				success: function(data) {
					if (data.success == true) {
						loadUserInfoToEdit(index, true, data.userinfo);
					} else {
						loadUserInfoToEdit(index, false, null);
					}
					editControll();
				}
			});
    	}
    	
    	function editControll() {
    		$("#edit_enable_edit_div").show();
    		$("#edit_edit_btn_div").hide();
    		
	   		$("#edit_birthday").attr({ readonly: 'true' }); 
	   		$("#edit_identity").attr({ readonly: 'true' }); 
	   		$("#edit_nation").attr({ readonly: 'true' }); 
	   		$("#edit_phone").attr({ readonly: 'true' }); 
	   		$("#edit_email").attr({ readonly: 'true' }); 
	   		$("#edit_address").attr({ readonly: 'true' }); 
    		
			$("#editModal").modal("show");
    	}
    	
    	function loadUserInfoToEdit(index, notnull, userinfo){
    		$('#edit_userid').val(userList[index].userId);
    		$('#edit_username').val(userList[index].userName);

    		if (notnull == true) {
    			$('#edit_id').val(userinfo.id);
	    		if ("1" == userinfo.sex) {
		   			document.getElementById('edit_sex1').checked = true;
		   		} else if ("0" == userinfo.sex){
		   			document.getElementById('edit_sex2').checked = true;
		   		} else {
		   			document.getElementById('edit_sex3').checked = true;
		   		}
		   		$('#edit_birthday').val(userinfo.birthday);
		   		$('#edit_identity').val(userinfo.identity);
		   		$('#edit_nation').val(userinfo.nation);
		   		$('#edit_phone').val(userinfo.backupPhone);
		   		$('#edit_email').val(userinfo.email);
		   		$('#edit_address').val(userinfo.address);
    		} else {
    			$('#edit_id').val(0);
	   			document.getElementById('edit_sex1').checked = false;
	   			document.getElementById('edit_sex2').checked = false;
	   			document.getElementById('edit_sex3').checked = false;
		   		$('#edit_birthday').val('');
		   		$('#edit_identity').val('');
		   		$('#edit_nation').val('');
		   		$('#edit_phone').val('');
		   		$('#edit_email').val('');
		   		$('#edit_address').val('');
    		}
		}
		
		function edit_enable_edit() {
			$("#edit_enable_edit_div").hide();
    		$("#edit_edit_btn_div").show();

    		$("#edit_birthday").removeAttr("readonly");
    		$("#edit_identity").removeAttr("readonly");
    		$("#edit_nation").removeAttr("readonly");
    		$("#edit_phone").removeAttr("readonly");
    		$("#edit_email").removeAttr("readonly");
    		$("#edit_address").removeAttr("readonly");
		}
		
		function editSubmit() {
			$.ajax({
				type: "POST",
				url: "<%=path%>/usermanage/edituserinfo",
				data: $("#edit_userinfo_form").serialize(),
				success: function(data) {
					if (data.success == true) {
						edit_close();
					} else {
						alert("修改失败，请重试.");
					}

				}
			});
		}
		
		function edit_close() {
        	$("#edit_userinfo_form").data('bootstrapValidator').resetForm(true);
		    $("#editModal").modal("hide");
		}
    	
    	
    	/****************************** 删除用户 ********************************/
    	function deleteConfirm(index, dataId) {
			
			$("#delete_data_id").val(dataId);
			
			var userId = userList[index].userId;
			var userName = userList[index].userName;
			var msg = "You've chosed this user：" + 
					"\r\n 用户名: " + userId + ",  姓名: " + userName + 
					"\r\n Do you really want to delete this user?";
			$("#delete_msg").val(msg);
		};
		
		function deleteSubmit() {
			var id = $("#delete_data_id").val();
			$.ajax({
				url: "<%=path%>/usermanage/deleteuser",
				type: "POST",
				data: {id: id},
				success: function(data) {
					if (data.success == true) {
						$("#deleteModal").modal("hide");
						getUsers();
					} else {
						alert("删除失败，请重试.");
					}
				}
			});
		};
    	
    	
    	/****************************** 加载动画 ********************************/
    	function loading(flag, loadingId) {
    		if (false == flag) {
    			$("#" + loadingId).hide();
    		} else {
    			$("#" + loadingId).show();
    		}
			
		}
		
		
		/****************************** 日期格式化 ********************************/
		function formatDate (data) {
            var d = new Date(data);
            var year = d.getFullYear();
            var month = d.getMonth() + 1;
            var day = d.getDate();
            
            var hours = d.getHours();
            hours = (hours > 9) ? hours : ("0" + hours);
			var minutes = d.getMinutes(); 
			minutes = (minutes > 9) ? minutes : ("0" + minutes);
			var seconds = d.getSeconds(); 
            seconds = (seconds > 9) ? seconds : ("0" + seconds);
            
            return year+"-"+month+"-"+day+ " " +hours+":"+minutes+":"+seconds;
	    }
		
    </script>
    
  </body>
</html>

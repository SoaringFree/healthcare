<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加医生</title>
    
	<%@ include file="../shared/cssandjs.jsp" %>
	
	<!-- 其他 css js 引用 -->
	<link href='<%=basePath%>/assets/components/bootstrapvalidator/dist/css/bootstrapValidator.min.css' rel='stylesheet'>
	<link href='<%=basePath%>/assets/components/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css' rel='stylesheet'>
	

	<!-- bootstrapValidator js -->
    <script src="<%=path%>/assets/components/bootstrapvalidator/dist/js/bootstrapValidator.min.js"></script>
    <!-- bootstrap-datetimepicker js -->
    <script src="<%=path%>/assets/components/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=basePath%>/assets/components/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
	
	<!-- bootstrap-paginator plugin -->
	<script src="<%=path%>/assets/components/bootstrap-paginator/bootstrap-paginator.js"></script>
	
	<style type="text/css">
		input, button {
	   		vertical-align:middle
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

						<li class="active">
							<a href="#">添加医生</a>
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
							<h5 class="widget-title"><b>患者信息</b></h5>
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
										<th style="text-align:center;">用户ID</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center; display:none">RoleID</th>
										<th style="text-align:center;">用户类型</th>
										<th style="text-align:center;">注册时间</th>
										<th style="text-align:center;">登录时间</th>
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
		            EmployeeNumber: {
		                message: 'The employee number is not valid',
		                validators: {
		                    notEmpty: {
		                        message: 'The employee number is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 10,
		                        max: 10,
		                        message: 'The employee number must be 10 characters long'
		                    },
		                    regexp: {
		                        regexp: /^[2][12]\d{8}$/,
		                        message: 'The employee number must be only be phone number'
		                    },
		                    remote: {
		                        message: 'The employee number is not available, please change another one',
		                        url: '<%=path%>/employee/IsEmployeeNumberAvailable'
		                    }
		                }
		            },
		            EmployeePass: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The password is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 6,
		                        max: 30,
		                        message: 'The password must be more than 6 and less than 30 characters long'
		                    },
		                    identical: {
		                        field: 'ReEmployeePass',
		                        message: 'The password and its confirm are not the same'
		                    }
	                    }
		            },
		            ReEmployeePass: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The confirm password is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 6,
		                        max: 30,
		                        message: 'The password must be more than 6 and less than 30 characters long'
		                    },
		                    identical: {
		                        field: 'EmployeePass',
		                        message: 'The password and its confirm are not the same'
		                    }
	                    }
		            },
		            EmployeeName: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The username is required and cannot be empty'
		                    }
	                    }
		            },
		            birthday: {
		            	validators: {
	                    notEmpty: {
		                        message: 'The birthday is required and cannot be empty'
		                	}
	                	}
		            },
		            EmployeeIdentity: {
		                message: 'The Identity is not valid',
		                validators: {
		                    notEmpty: {
		                        message: 'The Identity is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 18,
		                        max: 18,
		                        message: 'The Identity must be 18 characters long'
		                    }
		                }
		            },
		            workdate: {
		            	validators: {
	                    notEmpty: {
		                        message: 'The workdate is required and cannot be empty'
		                	}
	                	}
		            }
		        }
		    });
	        
	        $("#resetBtn").click(function() {
		        $("#create_form").data('bootstrapValidator').resetForm(true);
		    });
		    
		    
		    $("#edit_form").bootstrapValidator({
	
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            EmployeePass: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The password is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 6,
		                        max: 30,
		                        message: 'The password must be more than 6 and less than 30 characters long'
		                    },
		                    identical: {
		                        field: 'ReEmployeePass',
		                        message: 'The password and its confirm are not the same'
		                    }
	                    }
		            },
		            ReEmployeePass: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The confirm password is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 6,
		                        max: 30,
		                        message: 'The password must be more than 6 and less than 30 characters long'
		                    },
		                    identical: {
		                        field: 'EmployeePass',
		                        message: 'The password and its confirm are not the same'
		                    }
	                    }
		            },
		            EmployeeName: {
		            	validators: {
		                    notEmpty: {
		                        message: 'The username is required and cannot be empty'
		                    }
	                    }
		            },
		            edit_birthday: {
		            	validators: {
	                    notEmpty: {
		                        message: 'The birthday is required and cannot be empty'
		                	}
	                	}
		            },
		            EmployeeIdentity: {
		                message: 'The Identity is not valid',
		                validators: {
		                    notEmpty: {
		                        message: 'The Identity is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 18,
		                        max: 18,
		                        message: 'The Identity must be 18 characters long'
		                    }
		                }
		            },
		            edit_workdate: {
		            	validators: {
	                    notEmpty: {
		                        message: 'The workdate is required and cannot be empty'
		                	}
	                	}
		            }
		        }
		    });
	        
	        $("#editResetBtn").click(function() {
	        	$("#edit_form").data('bootstrapValidator').resetForm(true);
		        resetForm();
		    });
	        
	        
		});    

		/* 获取患者用户信息 */
		function getUsers() {
			
			var userId = $("#userId").val();
			var userName = $("#userName").val();
			loading();
			var url= "<%=basePath%>/usermanage/getuser";
			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {page: 1, rows: 10, userId: userId, userName: userName, roleId: 2},
				success: function(data) {
					
					// 解析data
					userList = null;
					userList = data.result;
					loading(false);
					// 装填表格
	                initTable(userList, data.page);
					
					// 获取currentPage 请求页面
					var currentPage = data.page;
					// 获取totalPages 总页面
					var totalPages = data.total;
					// 获取numberofPages 显示的页面
					var numberofPages = totalPages > 10 ? 10 : totalPages;
					//alert(data.currentPage + " : " + data.totalPage + " : " + numberofPages);
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
	                    	loading();
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {page: page, rows: 10, userId: userId, userName: userName, roleId: 2},
								success: function(data) {
									userList = null;
									userList = data.result;
									loading(false);
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
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + ((currentPage - 1) * 5 + index + 1) + '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.userId       	+ '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.userName      	+ '</td>');
					var td4 = $('<td style="text-align:center; display:none;">' 		 + item.roleId   		+ '</td>');
					var td5 = $('<td style="text-align:center; vertical-align:middle;">' + item.roleName     	+ '</td>');
					var td6 = $('<td style="text-align:center; vertical-align:middle;">' + item.registDate    	+ '</td>');
					var td7 = $('<td style="text-align:center; vertical-align:middle;">' + item.lastLoginDate   + '</td>');
					var td8 = $('<td style="text-align:center;">' +
	            					'<a class="btn btn-success btn-xs" data-toggle="modal" data-target="#editModal" onclick=" view(' + index + ', ' + item.id + ') ">'  +
	                					'<i class="glyphicon glyphicon-zoom-in icon-white" ></i>' +
	                						'详情' +
	            					'</a>' +
	            					"&nbsp;" +
	            					'<a class="btn btn-info btn-xs" data-toggle="modal" data-target="#editModal" onclick=" edit(' + index + ', ' + item.id + ') ">' +
	                					'<i class="glyphicon glyphicon-edit icon-white"></i>' +
	                						'编辑' +
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
						.append(td6).append(td7).append(td8);
					
					$("#tby").append(tr);
					
				});
			}
		}
    
    
    
    
    
    	
    	
    	
    	function loading(flag) {
    		if (false == flag) {
    			$("#loading").hide();
    		} else {
    			$("#loading").show();
    		}
			
		}
		
    </script>
    
  </body>
</html>

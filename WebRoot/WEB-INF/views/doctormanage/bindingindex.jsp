<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>指定医生</title>
    
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
							<a href="#">医生管理</a>
						</li>
						<li>
							<a href="#">指定医生</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
				<div class="row">
					<!-- 患者内容 -->
					<div class="col-xs-12 col-sm-6 widget-container-col ui-sortable">
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
						        <input style="height:32px" id="userId" name="userId" type="text" placeholder="用户名" />
						        <input style="height:32px" id="userName" name="userName" type="text" placeholder="姓名" /> 
						        <button style="height:32px" class="btn btn-primary btn-xs"  type="button" onclick="search()">
						        	<i class="glyphicon glyphicon-search white"></i>查询
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
										<th style="text-align:center;">操作</th>
									</tr>
								</thead>
								<tbody id="tby">
								</tbody>
							</table>
							
							<div id="loading_user" class="center">
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
				
				
					<!-- 医生内容 -->
					<div class="col-xs-12 col-sm-6 widget-container-col ui-sortable">
					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title" id="user_doctor_title"><b>医生信息</b></h5>
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
							<table class="table table-striped table-bordered responsive">
								<thead>
									<tr>
										<th style="text-align:center;">序号</th>
										<th style="text-align:center; display:none">ID</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center;">职称</th>
										<th style="text-align:center;">科室</th>
										<th style="text-align:center;">指定时间</th>
										<th style="text-align:center;">操作</th>
									</tr>
								</thead>
								<tbody id="user_doctor_tby">
									<tr>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center; display:none;"></td>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center;"></td>
									</tr>
								</tbody>
							</table>
							<div id="loading_doctor" class="center">
								<span>
								<img src="<%=path %>/assets/img/ajax-loaders/ajax-loader-10.gif" title="img/ajax-loaders/ajax-loader-10.gif">
								&nbsp;正在加载...
								</span>
							</div>
						</div>
					
					</div>	
					</div>
					</div>
					
					<!-- 可用医生 -->
					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title"><b>可指定的医生</b></h5>
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
							<table class="table table-striped table-bordered responsive">
								<thead>
									<tr>
										<th style="text-align:center;">序号</th>
										<th style="text-align:center; display:none">ID</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center;">职称</th>
										<th style="text-align:center;">科室</th>
										<th style="text-align:center;">患者数量</th>
										<th style="text-align:center;">操作</th>
									</tr>
								</thead>
								<tbody id="able_doctor_tby">
									<tr>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center; display:none;"></td>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center; vertical-align:middle;"></td>
										<td style="text-align:center;"></td>
									</tr>
								</tbody>
							</table>
							<div id="loading_able_doctor" class="center">
								<span>
								<img src="<%=path %>/assets/img/ajax-loaders/ajax-loader-10.gif" title="img/ajax-loaders/ajax-loader-10.gif">
								&nbsp;正在加载...
								</span>
							</div>
							<div>
								<ul id="able_doctor_paginator"></ul>
							</div>
						</div>
					
					</div>	
					</div>
					</div>
					
					</div>
				
				</div>
				</div><!-- page-content -->
			</div>
		</div><!-- /.section:basics/sidebar -->
    </div><!-- /.main container -->


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
	
	<!-- assign -->
	<div class="modal fade" style="display: none;" id="assignModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
	                	<input type="hidden" id="assign_user_id" name="assign_user_id"/>
	                	<input type="hidden" id="assign_doctor_id" name="assign_doctor_id"/>
	                    <textarea cols="60" rows="3" id="assign_msg" style="text-align:center; font-size:14px; color:Black; border-style: solid; border-color: #FFFFFF; resize: none;" disabled> 
	                    </textarea>
	                </span>
	            </div>
	            <div class="modal-footer no-margin-top">
	                <div class="col-lg-4 col-lg-offset-7">
		            	<div class="col-lg-4" >
                           	<button type="button" class="btn btn-sm btn-primary" id="assignBtn" onclick="assignSubmit()">指定</button>
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
		var userDoctors = null;

		$(document).ready(function() {
			getUsers();
			getAbleDoctors();
		});
	
		function search() {
			getUsers();
		}

		/* 获取医生用户信息 */
		function getUsers() {

			var userId = $("#userId").val();
			var userName = $("#userName").val();
			loading("loading_user");
			var url= "<%=basePath%>/doctormanage/getusers";
			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {page: 1, rows: 10, userId: userId, userName: userName},
				success: function(data) {
					
					// 解析data
					userList = null;
					userList = data.result;
					loading("loading_user", false);
					// 装填表格
	                initTable(userList, data.page);
					getuserdoctors(0);
					
					// 获取currentPage 请求页面
					var currentPage = data.page;
					// 获取totalPages 总页面
					var totalPages = data.total;
					// 获取numberofPages 显示的页面
					var numberofPages = totalPages > 10 ? 10 : totalPages;
					//alert(data.currentPage + " : " + data.totalPage + " : " + numberofPages);
					var options = {
						bootstrapMajorVersion: 3,
						size: "mini",
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
	                    	loading("loading_user");
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {page: page, rows: 10, userId: userId, userName: userName},
								success: function(data) {
									userList = null;
									userList = data.result;
									loading("loading_user", false);
					                initTable(userList, page);
					                getuserdoctors(0);
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
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + ((currentPage-1)*10 	+ index + 1) + '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.userId       	+ '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.userName      	+ '</td>');
					var td4 = $('<td style="text-align:center;">' +
	            					'<a class="btn btn-success btn-xs"  onclick=" getuserdoctors(' + index + ') ">'  +
	                					'<i class="glyphicon glyphicon-zoom-in icon-white" ></i>' +
	                						'详情' +
	            					'</a>' + 
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2)
						.append(td3).append(td4);
					
					$("#tby").append(tr);
					
				});
			}
		}
		
		
		/****************************** 患者医生信息 ********************************/
		var selectedUserIndex = null;
		function getuserdoctors(index) {
			$("#user_doctor_title b").remove();
			var title = $("<b>" + userList[index].userName + " 的指定医生</b>");
			$("#user_doctor_title").append(title);
			selectedUserIndex = index;
			getUserDoctors(userList[index].userId);
		}
		
		function getUserDoctors(userId) {
			userDoctors = null;
			loading("loading_doctor");
			$.ajax({
				type: "GET",
				url: "<%=path%>/doctormanage/getuserdoctors",
				data: {userId: userId},
				success: function(data) {
					loading("loading_doctor", false);
					if (data.success == true) {
						userDoctors = data.result;
						initUserDoctorTable(userDoctors);
					} else {
						alert("医生信息加载失败，请重试.");
					}
				}
			});
		}
		
		/* 装填患者医生信息 */
		function initUserDoctorTable(userDoctors) {
			$("#user_doctor_tby tr").remove();
			if (null != userDoctors) {
				$.each(userDoctors, function(index, item) {
					var tr = $("<tr></tr>");
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + (index + 1) + '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.userName      	+ '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.professional   	+ '</td>');
					var td4 = $('<td style="text-align:center; vertical-align:middle;">' + item.department   	+ '</td>');
					var td5 = $('<td style="text-align:center; vertical-align:middle;">' + item.bindDate    	+ '</td>');
					var td6 = $('<td style="text-align:center;">' + 
            					'<a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteModal" onclick="deleteConfirm(' + index + ', ' + item.id + ')">' +
                					'<i class="glyphicon glyphicon-trash icon-white"></i>' +
                						'删除' +
            					'</a>' +
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2)
						.append(td3).append(td4).append(td5).append(td6);
					
					$("#user_doctor_tby").append(tr);
				});
			}
		}
		
		
		/****************************** 删除指定医生 ********************************/
    	function deleteConfirm(index, dataId) {
			
			$("#delete_data_id").val(dataId);
			var docName = userDoctors[index].userName;
			var userName = userList[selectedUserIndex].userName;
			var msg = "您确定要删除\r\n" + 
						userName + " 的指定医生 " + docName + " 吗?";
			$("#delete_msg").val(msg);
		};
		
		function deleteSubmit() {
			var id = $("#delete_data_id").val();
			$.ajax({
				url: "<%=path%>/doctormanage/deletedoctor",
				type: "POST",
				data: {id: id},
				success: function(data) {
					if (data.success == true) {
						$("#deleteModal").modal("hide");
						getuserdoctors(selectedUserIndex);
						getAbleDoctors();
					} else {
						alert("删除失败，请重试.");
					}
				}
			});
		};
		
		
		/****************************** 可用医生信息 ********************************/
		var ableDoctors = null;
		var users = null;
		function getAbleDoctors(){

			loading("loading_able_doctor");
			var url= "<%=basePath%>/doctormanage/getdoctorinfos";
			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {page: 1, rows: 10},
				success: function(data) {
					
					// 解析data
					ableDoctors = null;
					ableDoctors = data.result;
					users = null;
					users = data.users;
					loading("loading_able_doctor", false);
					// 装填表格
	                initAbleDoctorTable(ableDoctors, users, data.page);
					
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
	                    	loading("loading_able_doctor");
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {page: page, rows: 10},
								success: function(data) {
									ableDoctors = null;
									ableDoctors = data.result;
									users = null;
									users = data.users;
									loading("loading_able_doctor", false);
					                initAbleDoctorTable(ableDoctors, users, page);
					            }
					        });
					     }  
					
					};
					
					$("#able_doctor_paginator").bootstrapPaginator(options);
				}
			});
		}
		
		function initAbleDoctorTable(doctors, users, currentPage) {
			$("#able_doctor_tby tr").remove();
			if (null != doctors) {	
				$.each(doctors, function(index, item) {
					var tr = $("<tr></tr>");
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + ((currentPage-1)*10 	+ index + 1) + '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.userName      	+ '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.professional   	+ '</td>');
					var td4 = $('<td style="text-align:center; vertical-align:middle;">' + item.department   	+ '</td>');
					var td5 = $('<td style="text-align:center; vertical-align:middle;">' + users[index] 	   	+ '</td>');
					var td6 = $('<td style="text-align:center;">' +
	            					'<a class="btn btn-warning btn-xs" data-toggle="modal" onclick="assigndoctor(' + index + ')">' +
	                					'<i class="glyphicon glyphicon-plus-sign white"></i>' +
	                						'指定' +
	            					'</a>' +
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2)
						.append(td3).append(td4).append(td5).append(td6);
					
					$("#able_doctor_tby").append(tr);
					
				});
			}
		}
		
		function isAbleDocto(doctorId) {
			var able = true;
			$.each(userDoctors, function(index, item){
				if (item.doctorId == doctorId) {
					able = false;
				}
			});
			return able;
		}
		
		function assigndoctor(index) {
			if (userDoctors.length >= 3) {
				alert("用户指定医生已达到上限.");
			} else {
				if (isAbleDocto(ableDoctors[index].doctorId)) {
					$("#assign_user_id").val(userList[selectedUserIndex].userId);
					$("#assign_doctor_id").val(ableDoctors[index].doctorId);
					var docName = ableDoctors[index].userName;
					var userName = userList[selectedUserIndex].userName;
					var msg = "您确定要指定\r\n" + 
								docName + " 为 " + userName + " 的医生吗?";
					$("#assign_msg").val(msg);
					$("#assignModal").modal("show");
				} else {
					alert("不能重复指定该医生.");
				}
			}
		}
		
		function assignSubmit() {
			var userId = $("#assign_user_id").val();
			var doctorId = $("#assign_doctor_id").val();
			$.ajax({
				url: "<%=path%>/doctormanage/assigndoctor",
				type: "POST",
				data: {userId: userId, doctorId: doctorId},
				success: function(data) {
					if (data.success == true) {
						$("#assignModal").modal("hide");
						getuserdoctors(selectedUserIndex);
						getAbleDoctors();
					} else {
						alert("删除失败，请重试.");
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

    </script>
    
  </body>
</html>

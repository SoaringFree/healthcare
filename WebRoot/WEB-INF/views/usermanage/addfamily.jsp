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
							<a href="#">添加亲属</a>
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
						        <input style="height:32px" id="userId" name="userId" type="text" placeholder="用户名" />
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
    
    
    <!-- detail / family info -->
	<div class="modal fade bold" style="display: none;" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" onclick="detail_close()">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>亲属信息</b></span>
	                </div>
	            </div>
	            
	            <!-- 患者用户Index -->
	            <div class="form-group center" style="display:none">
           			<input type="text" class="form-control" id="selected_userindex" />
           		</div>
	            
	            <div>
	            <table class="table table-striped table-bordered responsive">
					<thead>
						<tr>
							<th style="text-align:center;">序号</th>
							<th style="text-align:center; display:none">ID</th>
							<th style="text-align:center;">姓名</th>
							<th style="text-align:center;">关系</th>
							<th style="text-align:center;">添加时间</th>
							<th style="text-align:center;">操作</th>
						</tr>
					</thead>
					<tbody id="family_tby">
						<tr>
							<td style="text-align:center; vertical-align:middle;"></td>
							<td style="text-align:center; display:none;"></td>
							<td style="text-align:center; vertical-align:middle;"></td>
							<td style="text-align:center; vertical-align:middle;"></td>
							<td style="text-align:center; vertical-align:middle;"></td>
							<td style="text-align:center;"></td>
						</tr>
					</tbody>
				</table>
				<div id="loading_family" class="center">
					<span>
					<img src="<%=path %>/assets/img/ajax-loaders/ajax-loader-10.gif" title="img/ajax-loaders/ajax-loader-10.gif">
					&nbsp;正在加载...
					</span>
				</div>
	            </div>
	            
	            <hr />
	            
	            <div>
	            <div class="input-append center">
			        <input style="height:32px" id="familyId" name="familyId" type="text" placeholder="用户名" />
			        <input style="height:32px" id="familyName" name="familyName" type="text" placeholder="姓名" />
			        <button style="height:32px" class="btn btn-primary btn-xs"  type="button" onclick="searchfamily()">
			        	<i class="glyphicon glyphicon-search white"></i>查询
			        </button>
			    </div>	    
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
					<tbody id="able_family_tby">
					</tbody>
				</table>
				<div id="loading_able_family" class="center">
					<span>
					<img src="<%=path %>/assets/img/ajax-loaders/ajax-loader-10.gif" title="img/ajax-loaders/ajax-loader-10.gif">
					&nbsp;正在加载...
					</span>
				</div>
				<div>
					<ul id="able_family_paginator"></ul>
				</div>
	            </div>
	            

	    		<div class="modal-footer">
	                <div class="col-lg-4 col-lg-offset-7">
                      	<div class="col-lg-12">
                          	<button type="button" class="btn btn-sm btn-default" id="detail_close" onclick="detail_close()" >关闭</button>
                      	</div>
                   	</div>
	            </div>

	    	</div>
	    </div>
    </div>
    
    
    <!-- add user family-->
	<div class="modal fade bold" style="display: none;" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" onclick="add_close()">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>用户关系</b></span>
	                </div>
	            </div>
	            
	            <div class="modal-body" style="padding-bottom:10px">
	            	<form id="add_form" name="add_form" class="form-horizontal">
	            		<div class="form-group center" style="display:none">
	            			<input type="text" class="form-control" id="add_id" name="Id" value=0 />
	            			<input type="text" class="form-control" id="add_userid" name="userId" />
	            			<input type="text" class="form-control" id="add_familyid" name="familyId" />
	            		</div>
	            		
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">关系</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="add_relationship" name="relationship" />
			                </div>
			            </div>
		            </form>
	        	</div>

	    		<div class="modal-footer">
	                <div class="col-lg-4 col-lg-offset-7">
	            		<div class="col-lg-6">
                          	<button type="button" class="btn btn-sm btn-primary" id="add_btn" onclick="addSubmit()">保存</button>
                      	</div>
                      	<div class="col-lg-6">
                          	<button type="button" class="btn btn-sm btn-default" id="add_close" onclick="add_close()" >关闭</button>
                      	</div>
                   	</div>
	            </div>

	    	</div>
	    </div>
    </div>
    
    
     <!-- delete family -->
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
			getUsers();
		});    

		/* 获取患者用户信息 */
		function getUsers() {
			
			var userId = $("#userId").val();
			var userName = $("#userName").val();
			loading("loading");
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
					loading("loading", false);
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
	                    	loading("loading");
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {page: page, rows: 10, userId: userId, userName: userName, roleId: 2},
								success: function(data) {
									userList = null;
									userList = data.result;
									loading("loading", false);
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
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + ((currentPage-1)*10 	+ index + 1) + '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.userId       	+ '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.userName      	+ '</td>');
					var td4 = $('<td style="text-align:center; display:none;">' 		 + item.roleId   		+ '</td>');
					var td5 = $('<td style="text-align:center; vertical-align:middle;">' + item.roleName     	+ '</td>');
					var td6 = $('<td style="text-align:center; vertical-align:middle;">' + item.registDate    	+ '</td>');
					var td7 = $('<td style="text-align:center;">' +
	            					'<a class="btn btn-success btn-xs" data-toggle="modal" data-target="#editModal" onclick="familydetail(' + index + ') ">'  +
	                					'<i class="glyphicon glyphicon-zoom-in icon-white" ></i>' +
	                						'亲属信息' +
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
    
    
    	/****************************** 亲属详情 ********************************/
    	function familydetail(index) {
			loading("loading_family");
			$("#selected_userindex").val(index);
    		getuserfamily(userList[index].userId);
    		$("#detailModal").modal("show");
    		searchfamily();
    	}
    	
    	var familyInfo = null;
    	function getuserfamily(userid) {
    		familyInfo = null;
    		$.ajax({
    			url: "<%=basePath%>/usermanage/getfamilyinfo",
    			datatype: "json",
    			type: "GET",
    			data: {userId: userid},
    			success: function(data) {
    				loading("loading_family", false);
    				if (data.success == true) {
    					familyInfo = data.result;
    					initFamilyTable(familyInfo);
    				} 
    			}
    		});
    	}
    	
    	/* 装填亲属信息 */
		function initFamilyTable(familylist) {
			$("#family_tby tr").remove();
			if (null != familylist) {
				$.each(familylist, function(index, item) {
					var tr = $("<tr></tr>");
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + (index + 1) 			+ '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.familyName     	+ '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.relationship    + '</td>');
					var td4 = $('<td style="text-align:center; vertical-align:middle;">' + item.bindDate   		+ '</td>');
					var td5 = $('<td style="text-align:center;">' +
	            					'<a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteModal" onclick="deleteConfirm(' + index + ', ' + item.id + ')">' +
	                					'<i class="glyphicon glyphicon-trash icon-white"></i>' +
	                						'删除' +
	            					'</a>' +
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2).append(td3).append(td4).append(td5);
					$("#family_tby").append(tr);
				});
			}
		}
    
    	function detail_close() {
    		$("#detailModal").modal("hide");
    		resetAbleTable();
    	}
    
    
    	/****************************** 查询并添加亲属 ********************************/
    	var ableFamily = null;
    	function searchfamily() {
    		var familyId = $("#familyId").val();
			var familyName = $("#familyName").val();
			var url= "<%=basePath%>/usermanage/searchfamily";
			loading("loading_able_family");
			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {page: 1, rows: 5, userId: familyId, userName: familyName},
				success: function(data) {
					ableFamily = null;
					ableFamily = data.result;
					loading("loading_able_family", false);
	                initAbleTable(ableFamily, data.page);
					
					var currentPage = data.page;
					var totalPages = data.total;
					var numberofPages = totalPages > 10 ? 10 : totalPages;
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
	                    	var familyId = $("#familyId").val();
							var familyName = $("#familyName").val();
							loading("loading_able_family");
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {page: page, rows: 5, userId: familyId, userName: familyName},
								success: function(data) {
									ableFamily = null;
									ableFamily = data.result;
									loading("loading_able_family", false);
					                initAbleTable(ableFamily, page);
					            }
					        });
					     }  
					
					};
					
					$("#able_family_paginator").bootstrapPaginator(options);
				}
			});
    	}
    
    	function initAbleTable(ableFamily, page) {
			$("#able_family_tby tr").remove();
			if (null != ableFamily) {
				$.each(ableFamily, function(index, item) {
					var tr = $("<tr></tr>");
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + ((page-1)*5 + index + 1) 	+ '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.userId     		+ '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.userName    	+ '</td>');
					var td4 = $('<td style="text-align:center;">' +
	            					'<a class="btn btn-warning btn-xs" onclick="addfamily(' + item.userId + ')">' +
	                					'<i class="glyphicon  glyphicon-plus-sign white"></i>' +
	                						'添加' +
	            					'</a>' +
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2).append(td3).append(td4);
					$("#able_family_tby").append(tr);
				});
			}
		}
		
		function resetAbleTable() {
			$("#familyId").val("");
			$("#familyName").val("");
			$("#able_family_tby tr").remove();
			var tr = $("<tr></tr>");
			$("#able_family_tby").append(tr);
		}
    
    	function addfamily(familyId) {
    		var userindex = $("#selected_userindex").val();
    		$("#add_userid").val(userList[userindex].userId);
    		$("#add_familyid").val(familyId);
    		$("#add_relationship").val("");
    		$("#addModal").modal("show");
    	}
    	
    	function addSubmit() {
    		$.ajax({
				type: "POST",
				url: "<%=path%>/usermanage/addfamily",
				data: $("#add_form").serialize(),
				success: function(data) {
					if (data.success == true) {
						getuserfamily(userList[$("#selected_userindex").val()].userId);
					} else {
						alert("添加亲属失败，请重试.");
					}
					add_close();
				}
			});
    	}
    	
    	function add_close() {
    		$("#add_userid").val("");
    		$("#add_familyid").val("");
    		$("#addModal").modal("hide");
    	}
    
    
    	/****************************** 删除用户亲属 ********************************/
    	function deleteConfirm(index, dataId) {
			$("#delete_data_id").val(dataId);
			var userName = userList[$("#selected_userindex").val()].userName;
			var familyName = familyInfo[index].familyName;
			var msg = "您确定要删除\r\n" + 
					userName + " 的亲属 " + familyName + " 吗?";

			$("#delete_msg").val(msg);
		};
		
		function deleteSubmit() {
			var id = $("#delete_data_id").val();
			$.ajax({
				url: "<%=path%>/usermanage/deletefamily",
				type: "POST",
				data: {id: id},
				success: function(data) {
					if (data.success == true) {
						$("#deleteModal").modal("hide");
						getuserfamily(userList[$("#selected_userindex").val()].userId);
					} else {
						alert("删除失败，请重试.");
					}
				}
			});
		};
		
    
    
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

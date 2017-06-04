<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>设备管理</title>
    
	<%@ include file="../shared/cssandjs.jsp" %>
	
	<!-- 其他 css js 引用 -->
	<link href='<%=basePath%>/assets/components/bootstrapvalidator/dist/css/bootstrapValidator.min.css' rel='stylesheet'>
	<!-- bootstrapValidator js -->
    <script src="<%=path%>/assets/components/bootstrapvalidator/dist/js/bootstrapValidator.min.js"></script>
	
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
		
		#devicelist_tby > tr > td {
			text-align: center; 
			vertical-align: middle;
		}
		
		td {
			cursor: default;
		}
		
		td > .btn-xs {
    		padding-top: 2px;
    		padding-bottom: 2px;
    		border-width: 2px;
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
							<a href="#">设备管理</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title" ><b>设备数据</b></h5>
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
						        <input style="height:32px" id="patientId" name="patientId" type="text" placeholder="用户名" />
						        <input style="height:32px" id="userName" name="userName" type="text" placeholder="姓名" />
					            <input style="height:32px" id="startTime" name="startTime" class="datepicker"  type="text" placeholder="起始日期" />
        						<input style="height:32px" id="endTime" name="endTime" class="datepicker" type="text" placeholder="结束日期" />
						        <select style="height:32px;" id="deviceType" name="deviceType">
								  <option value="0">设备类型</option>
								  <option value="1">血氧仪</option>
								  <option value="2">心电仪</option>
								  <option value="3">血压计</option>
								  <option value="6">血糖仪</option>
								</select>
						        <button style="height:32px" class="btn btn-primary btn-xs"  type="button" onclick="getdeviceList()">
						        	<i class="glyphicon glyphicon-search white"></i>查询
						        </button>
						        <button style="height:32px" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#createModal" type="button" >
						        	<i class="glyphicon glyphicon-plus-sign white"></i>新增
						        </button>
						        <button style="height:32px;" class="btn btn-danger btn-xs" id="deleteData" data-toggle="modal" data-target="#deleteModal" type="button" disabled >
						        	<i class="glyphicon glyphicon-trash white"></i>删除
						        </button>
						        
						    </div>
						    <br />
						
							<table class="table table-striped table-bordered responsive">
								<thead>
									<tr>
										<th style="text-align:center;"><input type="checkbox" id=select_all value="" /></th>
										<th style="text-align:center;">序号</th>
										<th style="text-align:center; display:none">ID</th>
										<th style="text-align:center;">用户名</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center;">设备类型</th>
										<th style="text-align:center;">注册时间</th>
										<th style="text-align:center;">操作</th>
									</tr>
								</thead>
								<tbody id="devicelist_tby">
									<tr>
									</tr>
								</tbody>
							</table>
							
							<div id="loading_devicelist" style="display:none;" class="center">
								<span>
								<img src="<%=path %>/assets/img/ajax-loaders/ajax-loader-10.gif" title="img/ajax-loaders/ajax-loader-10.gif">
								&nbsp;正在加载...
								</span>
							</div>
							<div style="text-align:center;">
								<ul id="paginator"></ul>
							</div>
							
						</div>
					
					</div>	
					</div>
					</div>
				
				</div><!-- page-content -->
			</div>
		</div><!-- /.section:basics/sidebar -->
    </div><!-- /.main container -->


	<!-- create / device -->
	<div class="modal fade bold" style="display: none;" id="createModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" onclick="create_close()">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>添加设备</b></span>
	                </div>
	            </div>
	            
	            <div class="modal-body" style="padding-bottom:10px">
	            	<form id="create_form" name="create_form" class="form-horizontal">
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">用户名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="create_userId" name="userId" />
			                </div>
			            </div>
			            
			            <div class="form-group">
			            	<label class="col-lg-3 control-label">设备类型</label>
			                <div class="col-xs-8 col-lg-8" >
			                     <select style="height:32px;" id="create_deviceType" name="deviceType">
								  <option value="1">血氧仪</option>
								  <option value="2">心电仪</option>
								  <option value="3">血压计</option>
								  <option value="6">血糖仪</option>
								</select>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">设备地址</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="create_deviceMac" name="deviceMac"/>
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
    
    
    <!-- edit / device-->
	<div class="modal fade bold" style="display: none;" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" onclick="edit_close()">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>修改设备信息</b></span>
	                </div>
	            </div>
	            
	            <div class="modal-body" style="padding-bottom:10px">
	            	<form id="edit_form" name="edit_form" class="form-horizontal">
			            <div class="form-group center" style="display:none">			            	
		                    <input type="text" class="form-control" id="edit_id" name="id" />		               
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">用户名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="edit_patientId" name="patientId" readonly/>
			                </div>
			            </div>
			            
			            <div class="form-group">
			            	<label class="col-lg-3 control-label">设备类型</label>
			                <div class="col-xs-8 col-lg-8" >
			                     <select style="height:32px;" id="edit_deviceType" name="deviceType">
								  <option value="1">血氧仪</option>
								  <option value="2">心电仪</option>
								  <option value="3">血压计</option>
								  <option value="6">血糖仪</option>
								</select>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">设备地址</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="edit_deviceMac" name="deviceMac" readonly/>
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
	                	<h5>确定删除选中的信息吗？</h5>
	            </div>
	            <div class="modal-footer no-margin-top">
	                <div class="col-lg-4 col-lg-offset-7">
		            	<div class="col-lg-5" >
                           	<button type="button" class="btn btn-sm btn-danger" id="deleteBtn" onclick="deleteSubmit()">删除</button>
                       	</div>
		            	<div class="col-lg-5">
                           	<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
                       	</div>
		            	
                   	</div>
	            </div>
	        </div>
	        <!-- /.modal-content-->
	    </div>
	</div>


   
    <script type="text/javascript">

		var deviceList = null;

		$(document).ready(function() {
			getdeviceList();

		    $('.datepicker').datetimepicker({
		        language: 'zh-CN',//显示中文
				format: 'yyyy-mm-dd',//显示格式
				minView: "month",//设置只显示到月份
				initialDate: new Date(),//初始化当前日期
				autoclose: true,//选中自动关闭
				todayBtn: true//显示今日按钮
		    });
 
		});


		/****************************** 患者心电信息 ********************************/
	
		function getdeviceList() {
			var url= "<%=basePath%>/addevicemgmt/getdevice";
			loading("loading_devicelist");
			
			var pId = $("#patientId").val();
			var uName = $("#userName").val();
			var sTime = $("#startTime").val();
			var eTime = $("#endTime").val();
			var devType = $("#deviceType").val(); 
			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {page: 1, rows: 10, patientId: pId, userName: uName, deviceType: devType, startTime: sTime, endTime: eTime},
				success: function(data) {
					loading("loading_devicelist", false);
					
					deviceList = null;
					deviceList = data.result;
	                initDeviceList(deviceList, data.page);
					
					var currentPage = data.page;
					var totalPages = data.total;
					var numberofPages = totalPages > 10 ? 10 : totalPages;
					var options = {
						bootstrapMajorVersion: 3,
	                    currentPage: currentPage,  
	                    totalPages: totalPages,  
	                    numberofPages: numberofPages, 
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

	                    	loading("loading_devicelist");
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {page: page, rows: 10, patientId: pId, userName: uName, deviceType: devType,startTime: sTime, endTime: eTime},
								success: function(data) {
									deviceList = null;
									deviceList = data.result;
									loading("loading_devicelist", false);
					                initDeviceList(deviceList, data.page);
					            }
					        });
					     }  
					
					};
					$("#paginator").bootstrapPaginator(options);
				}
			});
		};
		
		
		/* 装填血氧数据信息 */
		function initDeviceList(deviceList, page) {
			$("#devicelist_tby tr").remove();
			if (null != deviceList) {
				$.each(deviceList, function(index, item) {
					var tr = $("<tr></tr>");
					var td0 = $('<td><input type="checkbox" name="cbx" value="' + item.id + '" onclick="select_one();"/></td>');
					var td1 = $('<td>' + ((page-1)*10 + index + 1) + '</td>');
					var td2 = $('<td style="display:none;">'+ item.id + '</td>');
					var td3 = $('<td>' + item.patientId		+ '</td>');
					var td4 = $('<td>' + item.userName		+ '</td>');
					// var td5 = $('<td>' + item.deviceType	+ '</td>');
					var td6 = $('<td>' + item.registDate	+ '</td>');
					
					var type = parseInt(item.deviceType);
					var td5;
					if (type == 1) {
						td5 = $('<td><img src="<%=basePath%>/assets/images/healthcare/ic_spo.png" alt="血氧仪"></td>');
					} else if (type == 2) {
						td5 = $('<td><img src="<%=basePath%>/assets/images/healthcare/ic_ecg.png" alt="心电仪"></td>');
					} else if (type == 3) {
						td5 = $('<td><img src="<%=basePath%>/assets/images/healthcare/ic_bp.png" alt="血压计"></td>');
					} else {
						td5 = $('<td><img src="<%=basePath%>/assets/images/healthcare/ic_glu.png" alt="血糖仪"></td>');
					}
					
					var td7 = $('<td>' +
	            					'<a class="btn btn-success btn-xs"  onclick="edit_device(' + index + ');">'  +
	                					'<i class="glyphicon glyphicon-edit icon-white" ></i>' +
	                						'修改' +
	            					'</a>' +
	        					'</td>'
	        					);
					
					tr.append(td0).append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7);
					$("#devicelist_tby").append(tr);
				});
			}
		}


		/****************************** 添加设备验证 ********************************/
		$("#create_form").bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            userId: {
	                message: '用户名不可用',
	                validators: {
	                    notEmpty: {
	                        message: '用户名不能为空'
	                    },
	                    stringLength: {
	                        min: 11,
	                        max: 11,
	                        message: '用户名长度错误'
	                    },
	                    regexp: {
	                        regexp: /^[1]\d{10}$/,
	                        message: '用户名不合法'
	                    },
	                    remote: {
	                        message: '用户名不存在',
	                        url: '<%=path%>/addevicemgmt/isUserIdAvailable'
	                    }
	                }
	            },
	            deviceMac: {
	                message: '设备地址不可用',
	                validators: {
	                    notEmpty: {
	                        message: '设备地址不能为空'
	                    },
	                    stringLength: {
	                        min: 17,
	                        max: 17,
	                        message: '设备地址长度错误'
	                    },
	                    regexp: {
	                        regexp: /^([0-9a-fA-F]{2})(([/\s:][0-9a-fA-F]{2}){5})$/,
	                        message: '设备地址不合法'
	                    },
	                    remote: {
	                        message: '该设备已存在',
	                        url: '<%=path%>/addevicemgmt/isDeviceMacAvailable'
	                    }
	                }
	            }
	        }
	    });
        $("#create_reset_btn").click(function() {
	        $("#create_form").data('bootstrapValidator').resetForm(true);
	    });
	    
	    
	    /****************************** 添加设备 ********************************/
		function createSubmit() {
			$.ajax({
				type: "POST",
				url: "<%=path%>/addevicemgmt/adddevice",
				data: {
					userId: $("#create_userId").val(), 
					deviceType: $("#create_deviceType").val(), 
					deviceMac: $("#create_deviceMac").val()
				},
				success: function(data) {
					if (data.success == true) {
						create_close();
						getdeviceList();
					} else {
						alert(data.message);
					}
				}
			});
		}
		
		function create_close() {
			$("#create_form").data('bootstrapValidator').resetForm(true);
			$("#createModal").modal("hide");
		}

		
		/****************************** 修改 ********************************/
		$("#edit_form").bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            userId: {
	                message: '用户名不可用',
	                validators: {
	                    notEmpty: {
	                        message: '用户名不能为空'
	                    },
	                    stringLength: {
	                        min: 11,
	                        max: 11,
	                        message: '用户名长度错误'
	                    },
	                    regexp: {
	                        regexp: /^[1]\d{10}$/,
	                        message: '用户名不合法'
	                    },
	                    remote: {
	                        message: '用户名不存在',
	                        url: '<%=path%>/addevicemgmt/isUserIdAvailable'
	                    }
	                }
	            },
	            deviceMac: {
	                message: '设备地址不可用',
	                validators: {
	                    notEmpty: {
	                        message: '设备地址不能为空'
	                    },
	                    stringLength: {
	                        min: 17,
	                        max: 17,
	                        message: '设备地址长度错误'
	                    },
	                    regexp: {
	                        regexp: /^([0-9a-fA-F]{2})(([/\s:][0-9a-fA-F]{2}){5})$/,
	                        message: '设备地址不合法'
	                    }
	                }
	            }
	        }
	    });
        $("#edit_reset_btn").click(function() {
	        $("#edit_form").data('bootstrapValidator').resetForm(true);
	    });
		
		function edit_device(index) {
			$('#edit_id').val(deviceList[index].id);
			$('#edit_patientId').val(deviceList[index].patientId);
    		$('#edit_deviceType').val(deviceList[index].deviceType);
    		$('#edit_deviceMac').val(deviceList[index].deviceMac);

    		$("#edit_enable_edit_div").show();
    		$("#edit_edit_btn_div").hide();
			$("#editModal").modal("show");
		}

		function edit_enable_edit() {
			$("#edit_enable_edit_div").hide();
    		$("#edit_edit_btn_div").show();

    		$("#edit_patientId").removeAttr("readonly");
    		$("#edit_deviceMac").removeAttr("readonly");
		}
		
		function editSubmit() {
			$.ajax({
				type: "POST",
				url: "<%=path%>/addevicemgmt/editdevice",
				data: $("#edit_form").serialize(),
				success: function(data) {
					if (data.success == true) {
						edit_close();
						getdeviceList();
					} else {
						alert(data.message);
					}

				}
			});
		}
		
		function edit_close() {
        	$("#edit_form").data('bootstrapValidator').resetForm(true);
		    $("#editModal").modal("hide");
		}

		/****************************** 全选事件 ********************************/
		$("#select_all").click( 
			function(){ 
				if(this.checked) { 
					$("input[name='cbx']").each(function(){this.checked=true;}); 
					document.getElementById("deleteData").disabled = false;
				} else { 
					$("input[name='cbx']").each(function(){this.checked=false;}); 
					document.getElementById("deleteData").disabled = true;
				} 
			} 
		);
		
		
		function select_one() {
			var haschecked = false;
			$("input[name='cbx']").each(function() {
				if(this.checked) {
					haschecked = true;
			    }
			});
			if (haschecked) {
				document.getElementById("deleteData").disabled = false;
			} else {
				document.getElementById("deleteData").disabled = true;
			}
			
		}


		/****************************** 删除信息 ********************************/
		function deleteSubmit() {
			var ids = [];
			$("input[name='cbx']").each(function() {
				if(this.checked) {
					ids.push(this.value);
			    }
			});

			$.ajax({
				url: "<%=basePath%>/addevicemgmt/deletedevice",
				type: "POST",
				datatype: "json",
				traditional: true,
				data: {ids: ids},
				success: function(data) {
					$("#deleteModal").modal("hide");
					if (data.success) {
						getdeviceList();
					} else {
						alert("删除失败，请重试。");
					}
				}
			});
			document.getElementById("deleteData").disabled = true;
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

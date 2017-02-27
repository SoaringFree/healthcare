<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的医生</title>
    
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
			<%@ include file="../shared/usermenu.jsp" %>
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
							<a href="#">个人信息</a>
						</li>
						<li>
							<a href="#">我的医生</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<!-- 医生内容 -->
					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title" ><b>我的指定医生</b></h5>
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
				
				</div><!-- page-content -->
			</div>
		</div><!-- /.section:basics/sidebar -->
    </div><!-- /.main container -->

	
	 <!-- detail / doctor info -->
	<div class="modal fade bold" style="display: none;" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:16px;color:black;"><b>医生信息</b></span>
	                </div>
	            </div>
	            
	            <div class="modal-body" style="padding-bottom:10px">
	            	<form id="detail_form" name="detail_form" class="form-horizontal">

			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">用户名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="detail_doctorid" name="doctorId" readOnly />
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">姓名</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="detail_username" name="username"  readOnly/>
			                </div>
			            </div>
			            
			            <div class="form-group center">
			            	<label class="col-lg-3 control-label">职称</label>
			                <div class="col-xs-8 col-lg-8">
			                    <input type="text" class="form-control" id="detail_professional" name="professional" readOnly/>
			                </div>
			            </div>
			             
			            <div class="form-group">
			            	<label class="col-lg-3 control-label">专家</label>
			                <div class="col-xs-8 col-lg-8">
			                    <select id="detail_expert" name="expert">
						        	<option value="0">否</option>
		                			<option value="1">是</option>
		                		</select>
			                </div>
			            </div>
			            
			            <div class="form-group">
			            	<label class="col-lg-3 control-label">科室</label>
			            	<div class="col-xs-8 col-lg-8">
								<select id="detail_departmentId" name="departmentId">
		                		</select>
	                		</div>
						</div>
									            
			            <div class="form-group">
			            	<label class="col-lg-3 control-label">简介</label>
			                <div class="col-xs-8 col-lg-8">
			                    <textarea cols="43" rows="4" id="detail_brief" name="brief" style="font-size:14px; color:Black; border-style: solid;  resize: none;" readOnly> 
	                    		</textarea>
			                </div>
			            </div>
			            
			            <div class="form-group">
			            	<label class="col-lg-3 control-label">专长</label>
			                <div class="col-xs-8 col-lg-8">
			                    <textarea cols="43" rows="2" id="detail_speciality" name="speciality" style="font-size:14px; color:Black; border-style: solid; resize: none;" readOnly> 
	                    		</textarea>
			                </div>
			            </div>

		            </form>
	        	</div>

	    		<div class="modal-footer">
	                <div class="col-lg-4 col-lg-offset-7">
                      	<div class="col-lg-4">
                          	<button type="button" class="btn btn-sm btn-default" data-dismiss="modal" >关闭</button>
                      	</div>
                   	</div>
	            </div>

	    	</div>
	    </div>
    </div>


   
    <script type="text/javascript">

		var userDoctors = null;

		$(document).ready(function() {
			loadDepartments();
			getUserDoctors();
		});
	

		/****************************** 患者医生信息 ********************************/
		function getUserDoctors() {
			userDoctors = null;
			loading("loading_doctor");
			$.ajax({
				type: "GET",
				url: "<%=path%>/userinfo/getmydoctors",
				data: {},
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
            					'<a class="btn btn-success btn-xs"  onclick=" detail(' + index + ') ">'  +
                					'<i class="glyphicon glyphicon-zoom-in icon-white" ></i>' +
                						'详情' +
            					'</a>' + 
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2)
						.append(td3).append(td4).append(td5).append(td6);
					
					$("#user_doctor_tby").append(tr);
				});
			}
		}
		
		
		var departments = null;
		/****************************** 部门信息 ********************************/
		function loadDepartments() {
			departments = null;
			$.ajax({
				type: "GET",
				url: "<%=path%>/department/getdepartments",
				data: {},
				success: function(data) {
					if (data.success == true) {
						departments = data.result;
					} else {
						alert("科室信息加载失败，请重试.");
					}
				}
			});
		}
		
		function createDepartmentSelect(name, data) {
			$("#" + name).empty();
			$.each(data, function (index, item) {		
				$("#"+ name).append("<option value='"+ item.departmentId +"'>"+ item.department +"</option>");
			});
		}
		
		
		/****************************** 医生信息 ********************************/
    	function detail(index) {
    		$.ajax({
				type: "GET",
				url: "<%=path%>/userinfo/getdoctorinfo",
				data: {doctorId: userDoctors[index].doctorId},
				success: function(data) {
					createDepartmentSelect("detail_departmentId", departments);
					if (data.success == true) {
						loadDoctorInfoToDetail(index, true, data.doctorinfo[0]);
					} else {
						loadDoctorInfoToDetail(index, false, null);
					}

				}
			});
		};
		
		function loadDoctorInfoToDetail(index, notnull, userinfo){
    		$('#detail_doctorid').val(userDoctors[index].doctorId);
    		$('#detail_username').val(userDoctors[index].userName);

    		if (notnull == true) {
		   		$('#detail_professional').val(userinfo.professional);
		   		$('#detail_expert').val(userinfo.expert);
		   		$('#detail_departmentId').val(userinfo.departmentId);
		   		$('#detail_brief').val(userinfo.brief);
		   		$('#detail_speciality').val(userinfo.speciality);

    		} else {
	   			$('#detail_professional').val('');
		   		$('#detail_expert').val(0);
		   		$('#detail_departmentId').val('');
		   		$('#detail_brief').val('');
		   		$('#detail_speciality').val('');
    		}
    		
    		$('#detailModal').modal('show');
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

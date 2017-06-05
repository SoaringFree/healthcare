<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的客户</title>
    
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
		
		#patient_tby > tr > td {
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
							<i class="ace-icon fa fa-user"></i>
							<a href="#">信息管理</a>
						</li>
						<li>
							<a href="#">我的客户</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title" ><b>我的客户</b></h5>
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
										<th style="text-align:center;">电话</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center;">指定时间</th>
										<th style="text-align:center;">操作</th>
									</tr>
								</thead>
								<tbody id="patient_tby">
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
							<div id="loading_patient" class="center">
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

		var patients = null;

		$(document).ready(function() {
			getPatients();
		});
	

		/****************************** 患者医生信息 ********************************/
		function getPatients() {
			patients = null;
			loading("loading_patient");
			$.ajax({
				type: "GET",
				url: "<%=path%>/drinfomgmt/getmypatient",
				data: {},
				success: function(data) {
					loading("loading_patient", false);
					if (data.success == true) {
						patients = data.result;
						initPatientTable(patients);
					} else {
						alert("患者信息加载失败，请重试.");
					}
				}
			});
		}
		
		/* 装填患者医生信息 */
		function initPatientTable(patients) {
			$("#patient_tby tr").remove();
			if (null != patients) {
				$.each(patients, function(index, item) {
					var tr = $("<tr></tr>");
					var td0 = $('<td>' + (index + 1) + '</td>');
					var td1 = $('<td style="display:none;">' 		+ item.id	+ '</td>');
					var td2 = $('<td>' + item.patientId   	+ '</td>');
					var td3 = $('<td>' + item.userName   	+ '</td>');
					var td4 = $('<td>' + item.bindDate    	+ '</td>');
					var td5 = $('<td>' + 
            					'<a class="btn btn-success btn-xs"  onclick=" detail(' + index + ') ">'  +
                					'<i class="glyphicon glyphicon-zoom-in icon-white" ></i>' +
                						'详情' +
            					'</a>' + 
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2).append(td3).append(td4).append(td5);
					
					$("#patient_tby").append(tr);
				});
			}
		}
		

		/****************************** 患者信息 ********************************/
    	function detail(index) {
    		$.ajax({
				type: "GET",
				url: "<%=path%>/drinfomgmt/getpatientinfo",
				data: {patientId: patients[index].patientId},
				success: function(data) {
					createDepartmentSelect("detail_departmentId", departments);
					if (data.success == true) {
						loadPatientInfoToDetail(index, true, data.doctorinfo[0]);
					} else {
						loadPatientInfoToDetail(index, false, null);
					}

				}
			});
		};
		
		function loadPatientInfoToDetail(index, notnull, userinfo){
    		$('#detail_doctorid').val(patients[index].doctorId);
    		$('#detail_username').val(patients[index].userName);

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

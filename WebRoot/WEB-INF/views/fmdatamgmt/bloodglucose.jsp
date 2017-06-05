<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>血糖数据</title>
    
	<%@ include file="../shared/cssandjs.jsp" %>
	
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
		
		#glulist_tby > tr > td {
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
			<%@ include file="../shared/familymenu.jsp" %>
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
							<a href="#">健康数据</a>
						</li>
						<li>
							<a href="#">血糖数据</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title" ><b>血糖数据</b></h5>
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
					            <input style="height:32px" id="startTime" name="startTime" class="datepicker"  type="text" placeholder="起始日期" />
        						<input style="height:32px" id="endTime" name="endTime" class="datepicker" type="text" placeholder="结束日期" />
						        <select style="height:32px;" id="myPatient" name="myPatient">
								  <option value="0">选择亲属</option>
								</select>
						        <button style="height:32px" class="btn btn-primary btn-xs"  type="button" onclick="getMyPatientGluList()">
						        	<i class="glyphicon glyphicon-search white"></i>查询
						        </button>
						    </div>
						    <br />
						
							<table class="table table-striped table-bordered responsive">
								<thead>
									<tr>
										<th style="text-align:center;">序号</th>
										<th style="text-align:center; display:none">ID</th>
										<th style="text-align:center;">用户名</th>
										<th style="text-align:center;">姓名</th>
										<th style="text-align:center;">血糖浓度（mmol/L）</th>
										<th style="text-align:center;">时间</th>
										<th style="text-align:center;">状态</th>
									</tr>
								</thead>
								<tbody id="glulist_tby">
									<tr>
									</tr>
								</tbody>
							</table>
							
							<div id="loading_glulist" style="display:none;" class="center">
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


    <script type="text/javascript">

		var gluList = null;

		$(document).ready(function() {
			getMyPatient();
			getMyPatientGluList();

		    $('.datepicker').datetimepicker({
		        language: 'zh-CN',//显示中文
				format: 'yyyy-mm-dd',//显示格式
				minView: "month",//设置只显示到月份
				initialDate: new Date(),//初始化当前日期
				autoclose: true,//选中自动关闭
				todayBtn: true//显示今日按钮
		    });
 
		});
		
		function getMyPatient() {
			$.ajax({
				type: "GET",
				url: "<%=path%>/fmdatamgmt/getmypatient",
				data: {},
				success: function(data) {
					if (data.success == true) {
						initSelecte(data.result);
					} else {
						alert("信息加载失败，请重试.");
					}
				}
			});
		}
		
		function initSelecte(patient) {
			if (null != patient) {
				$.each(patient, function(index, item) {
					$("#myPatient").append("<option value='" + item.patientId + "'>" + item.userName + "</option>");
				});
			}
		}
		

		/****************************** 患者血糖信息 ********************************/
	
		function getMyPatientGluList() {
			var url= "<%=basePath%>/fmdatamgmt/getmypatientgludata";
			loading("loading_glulist");

			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {
					page: 1, 
					rows: 10, 
					patientId: $("#myPatient").val(), 
					startTime: $("#startTime").val(), 
					endTime: $("#endTime").val()
				},
				success: function(data) {
					loading("loading_glulist", false);
					
					gluList = null;
					gluList = data.result;
	                initGLUList(gluList, data.page);
					
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

	                    	loading("loading_glulist");
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {
									page: 1, 
									rows: 10, 
									patientId: $("#myPatient").val(), 
									startTime: $("#startTime").val(), 
									endTime: $("#endTime").val()
								},
								success: function(data) {
									gluList = null;
									gluList = data.result;
									loading("loading_glulist", false);
					                initGLUList(gluList, data.page);
					            }
					        });
					     }  
					
					};
					$("#paginator").bootstrapPaginator(options);
				}
			});
		};
		
		
		/* 装填心电记录信息 */
		/* 装填用户信息 */
		function initGLUList(gluList, page) {
			$("#glulist_tby tr").remove();
			if (null != gluList) {
				$.each(gluList, function(index, item) {
					var tr = $("<tr></tr>");
					var td1 = $('<td>' + ((page-1)*10 + index + 1) + '</td>');
					var td2 = $('<td style="display:none;">'+ item.id + '</td>');
					var td3 = $('<td>' + item.patientId		+ '</td>');
					var td4 = $('<td>' + item.userName		+ '</td>');
					var td5 = $('<td>' + item.bloodGlucose	+ '</td>');
					var td6 = $('<td>' + item.measureDate	+ '</td>');
					
					var glu = item.bloodGlucose;
					var td7;
					if (glu >= 3.9 && glu <= 7.8) {
						td7 = $('<td><span class="label label-success arrowed arrowed-in-right">正常</span></td>');
					} else if (glu < 3.9) {
						td7 = $('<td><span class="label label-primary arrowed arrowed-in-right">偏低</span></td>');
					} else {
						td7 = $('<td><span class="label label-warning arrowed arrowed-in-right">偏高</span></td>');
					}
	
					tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7);
					$("#glulist_tby").append(tr);
				});
			}
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

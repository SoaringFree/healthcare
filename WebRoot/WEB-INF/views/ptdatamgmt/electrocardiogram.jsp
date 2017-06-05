<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>心电数据</title>
    
	<%@ include file="../shared/cssandjs.jsp" %>
	
	<script src="<%=path%>/assets/components/bootstrap-paginator/bootstrap-paginator.js"></script>	
	<script src="<%=path%>/assets/highcharts/highstock.js"></script>
	<script src="<%=path%>/assets/highcharts/grid-light.js"></script>
	
	<style type="text/css">
		input, select, button {
	   		vertical-align:middle
	   	}
	   	
	   	select {
		  	padding: 4px 1px;
		  	border-radius: 0px;
		  	height:32px;
		}
		
		#ecglist_tby > tr > td {
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
			<%@ include file="../shared/patientmenu.jsp" %>
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
							<a href="#">心电数据</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title" ><b>心电数据</b></h5>
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
						        <button style="height:32px" class="btn btn-primary btn-xs"  type="button" onclick="getMyEcgList()">
						        	<i class="glyphicon glyphicon-search white"></i>查询
						        </button>
						    </div>
						    <br />
						
							<table class="table table-striped table-bordered responsive">
								<thead>
									<tr>
										<th style="text-align:center;">序号</th>
										<th style="text-align:center; display:none">ID</th>
										<th style="text-align:center;">心率（次/分）</th>
										<th style="text-align:center;">时间</th>
										<th style="text-align:center;">状态</th>
										<th style="text-align:center;">心电图</th>
									</tr>
								</thead>
								<tbody id="ecglist_tby">
									<tr>
									</tr>
								</tbody>
							</table>
							
							<div id="loading_ecglist" style="display:none;" class="center">
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

	
	 <!-- detail / ecg -->
	<div class="modal fade bold" style="display: none;" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	    <div class="modal-dialog" style="width:900px">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span id=ecg_title style="font-size:16px;color:black;"><b>心电图</b></span>
	                </div>
	            </div>
	            
	            <div class="modal-body" style="padding-bottom:10px">
	            	<div id="ecg_chart" style="width:860px">
	            	
	            	
	            	</div>

	        	</div>
	    	</div>
	    </div>
    </div>
    

    <script type="text/javascript">

		var ecgList = null;
		var chart = null;
		
		$(document).ready(function() {
			initChart();
			getMyEcgList();
			
		    $('.datepicker').datetimepicker({
		        language: 'zh-CN',//显示中文
				format: 'yyyy-mm-dd',//显示格式
				minView: "month",//设置只显示到月份
				initialDate: new Date(),//初始化当前日期
				autoclose: true,//选中自动关闭
				todayBtn: true//显示今日按钮
		    });
 
		});


		function initChart() {
			
			Highcharts.setOptions({
				lang: {
					resetZoom: "返回",
				}
			});
		
			chart = new Highcharts.StockChart('ecg_chart',{
				
				chart: {
					zoomType: 'xy',
				},
		        exporting: {
		            enabled: false       //去掉图像右上角的打印保存功能
		        },
		        title: {
		            text: '',
		            x: 0 //center
		        },
		        credits: {
		            enabled: false     //去掉highcharts网站url
		        },
		        xAxis: {
	                tickInterval: 1, // 坐标轴刻度间隔
	                tickWidth: 0,
	                gridLineColor: '#FA7A7A',
	                title: {
	                    text: '时长 30s'
	                },
	                labels:{
						enabled: false
					},
	            },
		        yAxis: { 
	                tickInterval: 1, // 坐标轴刻度间隔
	                tickWidth: 0,
	                gridLineColor: '#FA7A7A',
	                labels:{  
                        // 标签位置  
                        align: 'right', 
                        x: 30,
                		y: 0,
                        // 标签格式化  
                        formatter: function(){  
                            return this.value + 'mV';  
                        }  
                    }, 
                    title: {
	                    text: '-'
	                },
	            },
	            plotOptions: {
	            	series: {
	                    cursor: 'pointer',
	                    marker: {
	                        lineWidth: 1
	                    }
	                },
	            },
		        tooltip: {
		             series: {
	                    cursor: 'pointer',
	                    marker: {
	                        lineWidth: 1
	                    }
	                },
		        },
		        legend: {
		            enabled: false,
		        },
		        series: [{
		        	name: '心电图',
		        	data: [],
		        	color: '#000000',
		        	lineWidth: 1,
		        }],
		        rangeSelector: {  // 左上角选择则其
	                enabled: false,
	            },
			});       
	    };

		
		

		/****************************** 患者心电信息 ********************************/
	
		function getMyEcgList() {
			var url= "<%=basePath%>/ptdatamgmt/getmyecgdata";
			loading("loading_ecglist");
						
			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {
					page: 1, 
					rows: 10, 
					startTime: $("#startTime").val(), 
					endTime: $("#endTime").val()
				},
				success: function(data) {
					loading("loading_ecglist", false);
					
					ecgList = null;
					ecgList = data.result;
	                initECGList(ecgList, data.page);
					
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

	                    	loading("loading_ecglist");
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {
									page: page, 
									rows: 10, 
									startTime: $("#startTime").val(), 
									endTime: $("#endTime").val()
								},
								success: function(data) {
									ecgList = null;
									ecgList = data.result;
									loading("loading_ecglist", false);
					                initECGList(ecgList, data.page);
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
		function initECGList(ecgList, page) {
			$("#ecglist_tby tr").remove();
			if (null != ecgList) {
				$.each(ecgList, function(index, item) {
					var heartRate = parseInt(item.heartRate, 16);
				
					var tr = $("<tr></tr>");
					var td1 = $('<td>' + ((page-1)*10 + index + 1) + '</td>');
					var td2 = $('<td style="display:none;">'+ item.id + '</td>');
					var td5 = $('<td>' + 	heartRate		+ '</td>');
					var td6 = $('<td>' + item.measureDate	+ '</td>');
					
					var td7;
					if (heartRate >= 60 && heartRate <= 100) {
						td7 = $('<td><span class="label label-success arrowed arrowed-in-right">正常</span></td>');
					} else if (heartRate < 60) {
						td7 = $('<td><span class="label label-primary arrowed arrowed-in-right">偏低</span></td>');
					} else {
						td7 = $('<td><span class="label label-warning arrowed arrowed-in-right">偏高</span></td>');
					}
					var td8 = $('<td>' +
	            					'<a class="btn btn-success btn-xs"  onclick=" detail_ecg(' + item.id + ', ' + index + ') ">'  +
	                					'<i class="glyphicon glyphicon-zoom-in icon-white" ></i>' +
	                						'详情' +
	            					'</a>' +
	        					'</td>'
	        					);
	
					tr.append(td1).append(td2).append(td5).append(td6).append(td7).append(td8);
					$("#ecglist_tby").append(tr);
				});
			}
		}

		
		/****************************** 心电图 ********************************/
		var ecg = null;
		function detail_ecg(id, index) {
			ecg = null;
			$('#detailModal').modal('show');
			setTitle(index);
			
			$.ajax({
				type: "GET",
				url: "<%=path%>/ptdatamgmt/getecgbyid",
				data: {id: id},
				success: function(data) {
					if (data.success == true) {
						chart.series[0].setData(data.ecgArr);
					} else {
						alert("信息加载失败，请重试.");
					}
				}
			});
		}
		
		function setTitle(index) {
			var data = ecgList[index];
			$("#ecg_title b").remove();
			var t = $("<b>" + "[" + data.measureDate + "] 的心电图</b>");
			$("#ecg_title").append(t);
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

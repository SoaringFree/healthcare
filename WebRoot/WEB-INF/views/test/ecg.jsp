<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>心电记录</title>
    
	<%@ include file="../shared/cssandjs.jsp" %>
	
	<!-- bootstrap-paginator plugin -->
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
							<a href="#">健康信息</a>
						</li>
						<li>
							<a href="#">心电记录</a>
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
							<h5 class="widget-title" ><b>我的心电记录</b></h5>
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
										<th style="text-align:center;">心率</th>
										<th style="text-align:center;">时间</th>
										<th style="text-align:center;">状态</th>
										<th style="text-align:center;">心电图</th>
									</tr>
								</thead>
								<tbody id="ecglist_tby">
									<tr>
										<td style="text-align:center; vertical-align:middle;">1</td>
										<td style="text-align:center; display:none;">1</td>
										<td style="text-align:center; vertical-align:middle;">75</td>
										<td style="text-align:center; vertical-align:middle;">2017-03-13 12:45:30</td>
										<td style="text-align:center; vertical-align:middle;">Normal</td>
										<td style="text-align:center;">
											<a class="btn btn-success btn-xs"  onclick=" detail_ecg(1, '2017-03-13 12:45:30') ">
	                							<i class="glyphicon glyphicon-zoom-in icon-white" ></i> 
	                							详情
	            							</a>
										</td>
									</tr>
									
									<tr>
										<td style="text-align:center; vertical-align:middle;">2</td>
										<td style="text-align:center; display:none;">1</td>
										<td style="text-align:center; vertical-align:middle;">78</td>
										<td style="text-align:center; vertical-align:middle;">2017-03-13 12:44:42</td>
										<td style="text-align:center; vertical-align:middle;">Normal</td>
										<td style="text-align:center;">
											<a class="btn btn-success btn-xs"  onclick=" detail_ecg(1, '2017-03-13 12:44:42') ">
	                							<i class="glyphicon glyphicon-zoom-in icon-white" ></i> 
	                							详情
	            							</a>
										</td>
									</tr>
									
									<tr>
										<td style="text-align:center; vertical-align:middle;">3</td>
										<td style="text-align:center; display:none;">1</td>
										<td style="text-align:center; vertical-align:middle;">67</td>
										<td style="text-align:center; vertical-align:middle;">2017-03-11 22:32:15</td>
										<td style="text-align:center; vertical-align:middle;">Normal</td>
										<td style="text-align:center;">
											<a class="btn btn-success btn-xs"  onclick=" detail_ecg(1, '2017-03-11 22:32:15') ">
	                							<i class="glyphicon glyphicon-zoom-in icon-white" ></i> 
	                							详情
	            							</a>
										</td>
									</tr>
									
									<tr>
										<td style="text-align:center; vertical-align:middle;">4</td>
										<td style="text-align:center; display:none;">1</td>
										<td style="text-align:center; vertical-align:middle;">73</td>
										<td style="text-align:center; vertical-align:middle;">2017-03-11 22:30:28</td>
										<td style="text-align:center; vertical-align:middle;">Normal</td>
										<td style="text-align:center;">
											<a class="btn btn-success btn-xs"  onclick=" detail_ecg(1, '2017-03-11 22:30:28') ">
	                							<i class="glyphicon glyphicon-zoom-in icon-white" ></i> 
	                							详情
	            							</a>
										</td>
									</tr>
									
									<tr>
										<td style="text-align:center; vertical-align:middle;">5</td>
										<td style="text-align:center; display:none;">1</td>
										<td style="text-align:center; vertical-align:middle;">81</td>
										<td style="text-align:center; vertical-align:middle;">2017-03-10 16:12:56</td>
										<td style="text-align:center; vertical-align:middle;">Normal</td>
										<td style="text-align:center;">
											<a class="btn btn-success btn-xs"  onclick=" detail_ecg(1, '2017-03-06 09:10:11') ">
	                							<i class="glyphicon glyphicon-zoom-in icon-white" ></i> 
	                							详情
	            							</a>
										</td>
									</tr>
									
									<tr>
										<td style="text-align:center; vertical-align:middle;">6</td>
										<td style="text-align:center; display:none;">1</td>
										<td style="text-align:center; vertical-align:middle;">78</td>
										<td style="text-align:center; vertical-align:middle;">2017-03-06 09:10:11</td>
										<td style="text-align:center; vertical-align:middle;">Normal</td>
										<td style="text-align:center;">
											<a class="btn btn-success btn-xs"  onclick=" detail_ecg(1, '2017-03-06 09:10:11') ">
	                							<i class="glyphicon glyphicon-zoom-in icon-white" ></i> 
	                							详情
	            							</a>
										</td>
									</tr>
									
									<tr>
										<td style="text-align:center; vertical-align:middle;">7</td>
										<td style="text-align:center; display:none;">1</td>
										<td style="text-align:center; vertical-align:middle;">69</td>
										<td style="text-align:center; vertical-align:middle;">2017-03-05 10:44:18</td>
										<td style="text-align:center; vertical-align:middle;">Normal</td>
										<td style="text-align:center;">
											<a class="btn btn-success btn-xs"  onclick=" detail_ecg(1, '2017-03-05 10:44:18') ">
	                							<i class="glyphicon glyphicon-zoom-in icon-white" ></i> 
	                							详情
	            							</a>
										</td>
									</tr>
									
									<tr>
										<td style="text-align:center; vertical-align:middle;">8</td>
										<td style="text-align:center; display:none;">1</td>
										<td style="text-align:center; vertical-align:middle;">72</td>
										<td style="text-align:center; vertical-align:middle;">2017-03-05 08:12:46</td>
										<td style="text-align:center; vertical-align:middle;">Normal</td>
										<td style="text-align:center;">
											<a class="btn btn-success btn-xs"  onclick=" detail_ecg(1, '2017-03-05 08:12:46') ">
	                							<i class="glyphicon glyphicon-zoom-in icon-white" ></i> 
	                							详情
	            							</a>
										</td>
									</tr>
									
								</tbody>
							</table>
							<div id="loading_ecglist" style="display:none;" class="center">
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
				
				<!-- 
	    		<div class="modal-footer">
	                <div class="col-lg-4 col-lg-offset-7">
                      	<div class="col-lg-4">
                          	<button type="button" class="btn btn-sm btn-default" data-dismiss="modal" >关闭</button>
                      	</div>
                   	</div>
	            </div>
				-->
				 
	    	</div>
	    </div>
    </div>


   
    <script type="text/javascript">

		var ecgList = null;
		var chart = null;
		
		$(document).ready(function() {
			initChart();
			//getecgList();
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
	
		function getecgList() {
			var url= "<%=basePath%>/usermanage/getuser";
			loading("loading_ecglist");
			
			$.ajax({
				url: url,
				datatype: "json",
				type: "GET",
				data: {page: 1, rows: 10},
				success: function(data) {
					
					ecgList = null;
					ecgList = data.result;
					loading(false, "loading_ecglist");

	                initECGList(ecgList, data.page);
					
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

	                    	loading("loading_ecglist");
	                        $.ajax({
								url: url,
								datatype: "json",
								type: "GET",
								data: {page: page, rows: 10},
								success: function(data) {
									ecgList = null;
									ecgList = data.result;
									loading(false, "loading_ecglist");
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
					
					var tr = $("<tr></tr>");
					var td0 = $('<td style="text-align:center; vertical-align:middle;">' + ((page-1)*10	+ index + 1) + '</td>');
					var td1 = $('<td style="text-align:center; display:none;">' 		 + item.id 				+ '</td>');
					var td2 = $('<td style="text-align:center; vertical-align:middle;">' + item.heartRate       + '</td>');
					var td3 = $('<td style="text-align:center; vertical-align:middle;">' + item.measureDate    	+ '</td>');
					var td4 = $('<td style="text-align:center; vertical-align:middle;">' + item.state	      	+ '</td>');
					var td5 = $('<td style="text-align:center;">' +
	            					'<a class="btn btn-success btn-xs"  onclick=" detail_ecg(' + item.id + ') ">'  +
	                					'<i class="glyphicon glyphicon-zoom-in icon-white" ></i>' +
	                						'详情' +
	            					'</a>' +
	        					'</td>'
	        					);
	
					tr.append(td0).append(td1).append(td2)
						.append(td3).append(td4).append(td5);
					
					$("#ecglist_tby").append(tr);
					
				});
			}
		}

		
		/****************************** 心电图 ********************************/
		var ecg = null;
		function detail_ecg(id, date) {
			ecg = null;
			$('#detailModal').modal('show');
			setTitle(date);
			
			draw_ecg();
			return;
			
			$.ajax({
				type: "GET",
				url: "<%=path%>/test/getuserecg",
				data: {},
				success: function(data) {
					if (data.success == true) {
						ecg = data.result;
					} else {
						alert("信息加载失败，请重试.");
					}
				}
			});
		}
		
		function setTitle(date) {
			$("#ecg_title b").remove();
			var t = $("<b>" + date + " 的心电图</b>");
			$("#ecg_title").append(t);
		}
		
		function draw_ecg() {
			var data = [];
	        ecg_data = [145, 137, 128, 135, 150, 160, 160, 155, 144, 133, 126, 117, 107, 105, 102, 100, 99, 95, 96, 101, 102, 105, 112, 112, 114, 115, 109, 110, 118, 118, 112, 111, 124, 128, 128, 124, 119, 119, 119, 117, 112, 94, 85, 108, 128, 126, 124, 129, 138, 140, 141, 143, 140, 137, 134, 131, 128, 120, 122, 121, 113, 114, 117, 121, 121, 120, 125, 126, 114, 116, 121, 137, 159, 162, 156, 166, 187, 212, 228, 223, 208, 198, 196, 190, 175, 164, 157, 146, 141, 145, 149, 148, 144, 139, 139, 137, 128, 131, 143, 122,87, 61, 40, 15, 11, 16, 24, 26, 28, 29, 29, 29, 29, 30, 30, 31, 32, 32, 33, 33, 51, 92, 127, 128, 128, 136, 131, 128, 128, 120, 98, 81, 80, 92, 99, 100, 103, 109, 124, 124, 124, 165, 198, 190, 190, 184, 182, 182, 174, 159, 145, 144, 175, 215, 240, 245, 240, 235, 229, 222, 221, 218, 211, 205, 203, 202, 190, 178, 156, 116, 126, 174, 199, 187, 179, 175, 163, 131, 128, 123, 118, 122, 127, 108, 94, 86, 73, 78, 83, 84, 91, 100, 109, 117, 128, 147, 161, 168, 170, 169];

	        if (null != ecg_data) {
	        	for(var i = 0; i < 15; i++) {
		        	$.each(ecg_data, function(index, item) {
		        		data.push(item - 128);
		        	});	
	        	}
	        	chart.series[0].setData(data);
	        }
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

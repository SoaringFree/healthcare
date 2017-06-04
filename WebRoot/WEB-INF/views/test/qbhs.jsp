<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>重叠点检测</title>
    
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
    
    <!-- main container -->
    <div class="main-container" id="main-container">

		<!-- /section:basics/side bar -->
		<div class="main-content">
			<div class="main-content-inner">
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					
					<div align="center" style="margin-top:80px;">
						<h1>一种基于区别函数的重叠点检测系统</h1>
					</div>
					
					<hr />
				
					<div class="container" style="width:500px;padding:10px">
						<div class="row">
							<div class="col-xs-2 col-md-2 col-lg-2" style="margin-top:5px;">	
								<span style="font-size:14px;">节点集合</span>
							</div>
							
							<div class="col-xs-9 col-md-9 col-lg-9">
								<label class="ace-file-input">
									<input type="file" id="id-input-file-2">
									<span class="ace-file-container" data-title="浏览文件">
										<span class="ace-file-name" data-title="nodes.txt">
											<i class=" ace-icon fa fa-upload"></i>
										</span>
									</span>
									<a class="remove" href="#">
										<i class=" ace-icon fa fa-times"></i>
									</a>
								</label>
							</div>
							
						</div>
						
						
						<div class="row" style="margin-top:20px;">
							<div class="col-xs-2 col-md-2 col-lg-2" style="margin-top:5px;">	
								<span style="font-size:14px;" >边&nbsp;集&nbsp;合</span>
							</div>
							
							<div class="col-xs-9 col-md-9 col-lg-9">
								<label class="ace-file-input">
									<input type="file" id="id-input-file-2">
									<span class="ace-file-container" data-title="浏览文件">
										<span class="ace-file-name" data-title="No File ...">
											<i class=" ace-icon fa fa-upload"></i>
										</span>
									</span>
									<a class="remove" href="#">
										<i class=" ace-icon fa fa-times"></i>
									</a>
								</label>
							</div>
							
						</div>
						
						<div class="row" align="center" style="margin-top:20px;">
							<button class="btn btn-primary"  style="height:40px" type="button" onclick="start()">开始检测</button>
						</div>
						
						
					</div>

				</div><!-- page-content -->
			</div>
		</div><!-- /.section:basics/sidebar -->
    </div><!-- /.main container -->


	<!-- Delete -->
	<div class="modal fade" style="display: none;" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog bold" style="width:650px;">
	        <div class="modal-content">
	            <div class="modal-header no-padding">
	                <div class="table-header" style="text-align:center">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	                        <span class="white">&times;</span>
	                    </button>
                    	<span style="font-size:18px;"><b>检测结果</b></span>
	                </div>
	            </div>
	            <br />
	            <div class="modal-body" align="center" style="padding-top:0px">
	                
	                <table class="table table-striped table-bordered responsive">
						<thead>
							<tr>
								<th style="text-align:center;">序号</th>
								<th style="text-align:center;">中心点</th>
								<th style="text-align:center;">内部节点</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="text-align:center; vertical-align:middle;">1
								</td>
								<td style="text-align:center; vertical-align:middle;">18
								</td>
								<td style="text-align:center; vertical-align:middle; width:500px;">
									2, 6, 7, 10, 14, 18, 23, 26, 27, 28, 32, 33, 42, 49, 55, 57, 58, 61
								</td>
							</tr>
							<tr>
								<td style="text-align:center; vertical-align:middle;">2
								</td>
								
								<td style="text-align:center; vertical-align:middle;">15
								</td>
								<td style="text-align:center; vertical-align:middle; width:500px;">
									1, 3, 4, 5, 9, 11, 12, 13, 15, 16, 17, 19, 21, 22, 24, 25, 29, 30, 31, 34, 35, 36, 37, 38, 39, 41, 43, 44, 45, 46, 47, 48, 50, 51, 52, 53, 54, 56, 59, 60, 62
								</td>
							</tr>
						</tbody>

					</table>
	                
	                <form class="form-horizontal">

						<div class="form-group center">
			            	<label class="col-xs-3 col-lg-3 control-label">重叠点</label>
			                <div class="col-xs-6 col-lg-6">
			                    <input type="text" class="form-control"/>
			                </div>
			            </div>
		            </form>
	                
	            </div>
	         
	        </div>
	        <!-- /.modal-content-->
	    </div>
	</div>





    <script type="text/javascript">

		$(document).ready(function() {
			//
		});
		
		function start(){
		
			$("#resultModal").modal("show");
		
		}

    </script>
    
  </body>
</html>

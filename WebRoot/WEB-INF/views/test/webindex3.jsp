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
    
    <!-- main container -->
    <div class="main-container" id="main-container">

		<!-- /section:basics/side bar -->
		<div class="main-content">
			<div class="main-content-inner">
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					
					<div align="center">
						<h1>Workspaces</h1>
					</div>
					
					<hr />
				
					<div class="container" style="padding:10px">
						<div class="row">
							<div class="col-xs-4 col-sm-4 col-lg-4">
								<button class="btn btn-primary" style="height:40px"  type="button">Add Workspace</button>
							</div>

							<div class="col-xs-4 col-sm-4 col-lg-4">
								<select style="width:150px; height:40px;">
								  <option>All Teams</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								</select>

							</div>
							<div class="col-xs-4 col-sm-4 col-lg-4">
								<div class="input-append">
								  <input class="span2" type="text" style="height:40px">
								  <button class="btn btn-primary"  style="height:40px" type="button">Search</button>
								</div>
							</div>
						</div>
					</div>

					<table class="table table-striped table-bordered responsive">
						<thead>
							<tr>
								<th style="text-align:center;"><input type="checkbox" value=""/></th>
								<th style="text-align:center;">名称</th>
								<th style="text-align:center;">内存</th>
								<th style="text-align:center;">工程</th>
								<th style="text-align:center;">编译环境</th>
								<th style="text-align:center;">操作</th>
							</tr>
						</thead>
						<tbody id="ecglist_tby">
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" value=""/></td>
								<td style="text-align:center; vertical-align:middle;">douzizuibang/wksp-oqsd</td>
								<td style="text-align:center; vertical-align:middle;">2048 MB</td>
								<td style="text-align:center; vertical-align:middle;">0</td>
								<td style="text-align:center; vertical-align:middle;">java</td>
								<td style="text-align:center;">
									<i class="fa fa-caret-square-o-right fa-lg icon-white" ></i>
           							<i class="fa fa-cog fa-lg icon-white" ></i>
           							<i class="fa fa-plus-square fa-lg icon-white" ></i>
								</td>
							</tr>
							
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" value=""/></td>
								<td style="text-align:center; vertical-align:middle;">douzizuibang/wksp-imal</td>
								<td style="text-align:center; vertical-align:middle;">2048 MB</td>
								<td style="text-align:center; vertical-align:middle;">0</td>
								<td style="text-align:center; vertical-align:middle;">java</td>
								<td style="text-align:center;">
									<i class="fa fa-caret-square-o-right fa-lg icon-white" ></i>
           							<i class="fa fa-cog fa-lg icon-white" ></i>
           							<i class="fa fa-plus-square fa-lg icon-white" ></i>
								</td>
							</tr>
							
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" value=""/></td>
								<td style="text-align:center; vertical-align:middle;">douzizuibang/wksp-keex</td>
								<td style="text-align:center; vertical-align:middle;">2048 MB</td>
								<td style="text-align:center; vertical-align:middle;">2</td>
								<td style="text-align:center; vertical-align:middle;">.net</td>
								<td style="text-align:center;">
									<i class="fa fa-caret-square-o-right fa-lg icon-white" ></i>
           							<i class="fa fa-cog fa-lg icon-white" ></i>
           							<i class="fa fa-plus-square fa-lg icon-white" ></i>
								</td>
							</tr>
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" value=""/></td>
								<td style="text-align:center; vertical-align:middle;">douzizuibang/wksp-ow8i</td>
								<td style="text-align:center; vertical-align:middle;">2048 MB</td>
								<td style="text-align:center; vertical-align:middle;">1</td>
								<td style="text-align:center; vertical-align:middle;">java</td>
								<td style="text-align:center;">
									<i class="fa fa-caret-square-o-right fa-lg icon-white" ></i>
           							<i class="fa fa-cog fa-lg icon-white" ></i>
           							<i class="fa fa-plus-square fa-lg icon-white" ></i>
								</td>
							</tr>
							
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" value=""/></td>
								<td style="text-align:center; vertical-align:middle;">douzizuibang/wksp-rzow</td>
								<td style="text-align:center; vertical-align:middle;">2048 MB</td>
								<td style="text-align:center; vertical-align:middle;">0</td>
								<td style="text-align:center; vertical-align:middle;">.net</td>
								<td style="text-align:center;">
									<i class="fa fa-caret-square-o-right fa-lg icon-white" ></i>
           							<i class="fa fa-cog fa-lg icon-white" ></i>
           							<i class="fa fa-plus-square fa-lg icon-white" ></i>
								</td>
							</tr>
							
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" value=""/></td>
								<td style="text-align:center; vertical-align:middle;">douzizuibang/wksp-cypl</td>
								<td style="text-align:center; vertical-align:middle;">2048 MB</td>
								<td style="text-align:center; vertical-align:middle;">1</td>
								<td style="text-align:center; vertical-align:middle;">.net</td>
								<td style="text-align:center;">
									<i class="fa fa-caret-square-o-right fa-lg icon-white" ></i>
           							<i class="fa fa-cog fa-lg icon-white" ></i>
           							<i class="fa fa-plus-square fa-lg icon-white" ></i>
								</td>
							</tr>
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" value=""/></td>
								<td style="text-align:center; vertical-align:middle;">douzizuibang/wksp-vmbw</td>
								<td style="text-align:center; vertical-align:middle;">2048 MB</td>
								<td style="text-align:center; vertical-align:middle;">1</td>
								<td style="text-align:center; vertical-align:middle;">java</td>
								<td style="text-align:center;">
									<i class="fa fa-caret-square-o-right fa-lg icon-white" ></i>
           							<i class="fa fa-cog fa-lg icon-white" ></i>
           							<i class="fa fa-plus-square fa-lg icon-white" ></i>
								</td>
							</tr>
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" value=""/></td>
								<td style="text-align:center; vertical-align:middle;">douzizuibang/wksp-p35e</td>
								<td style="text-align:center; vertical-align:middle;">2048 MB</td>
								<td style="text-align:center; vertical-align:middle;">0</td>
								<td style="text-align:center; vertical-align:middle;">java</td>
								<td style="text-align:center;">
									<i class="fa fa-caret-square-o-right fa-lg icon-white" ></i>
           							<i class="fa fa-cog fa-lg icon-white" ></i>
           							<i class="fa fa-plus-square fa-lg icon-white" ></i>
								</td>
							</tr>
						</tbody>
					</table>
					
					
				
				</div><!-- page-content -->
			</div>
		</div><!-- /.section:basics/sidebar -->
    </div><!-- /.main container -->

	
	 


   
    <script type="text/javascript">

		

    </script>
    
  </body>
</html>

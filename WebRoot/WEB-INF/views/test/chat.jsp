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
		
		
		
		/* bubble style */
		.sender{
            clear:both;
        }
        .sender div:nth-of-type(1){
            float: left;
        }
        .sender div:nth-of-type(2){
            background-color: aquamarine;
            float: left;
            margin: 0 20px 10px 15px;
            padding: 10px 10px 10px 0px;
            border-radius:7px;
        }

        .receiver div:first-child img,
        .sender div:first-child img{
            width:50px;
            height: 50px;
        }

        .receiver{
            clear:both;
        }
        .receiver div:nth-child(1){
            float: right;
        }
        .receiver div:nth-of-type(2){
            float:right;
            background-color: gold;
            margin: 0 10px 10px 20px;
            padding: 10px 0px 10px 10px;
            border-radius:7px;
        }

        .left_triangle{
            height:0px;  
            width:0px;  
            border-width:8px;  
            border-style:solid;  
            border-color:transparent aquamarine transparent transparent;  
            position: relative;
            left:-16px;
            top:3px;
        }

        .right_triangle{
            height:0px;  
            width:0px;  
            border-width:8px;  
            border-style:solid;  
            border-color:transparent transparent transparent gold;  
            position: relative;
            right:-16px;
            top:3px;
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
							<a href="#">健康服务</a>
						</li>
						<li>
							<a href="#">健康咨询</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
				<div class="row">
					<!-- 在线医生 -->
					<div class="col-xs-4 col-sm-2 widget-container-col ui-sortable">
					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title"><b>我的医生</b></h5>
		                    <div class="widget-toolbar">
								<a href="#" data-action="fullscreen" class="orange2">
		                            <i class="ace-icon fa fa-expand"></i>
		                        </a>
		                        <a href="#" data-action="collapse">
		                            <i class="ace-icon fa fa-chevron-up"></i>
		                        </a>
	                        </div>			
						</div>
						
						<div class="widget-body" style="height:470px">
							<br />
						    
						    <!-- the result table -->
							<table class="table table-hover ">
								<thead>
									<tr>
									</tr>
								</thead>
								<tbody id="tby">
									<tr>
										<td>
											<img src="<%=basePath%>/assets/images/avatars/user3.jpg" height="45" width="45">
										</td>
										<td style="text-align:center;vertical-align:middle;">陶秀</td>
										<td style="text-align:center;vertical-align:middle;">在线</td>
									</tr>
									<tr >
										<td>
											<img src="<%=basePath%>/assets/images/avatars/user1.jpg" height="45" width="45">
										</td>
										<td style="text-align:center;vertical-align:middle;">李小璐</td>
										<td style="text-align:center;vertical-align:middle;">在线</td>
									</tr>
									<tr>
										<td>
											<img src="<%=basePath%>/assets/images/avatars/user4.jpg" height="45" width="45">
										</td>
										<td style="text-align:center;vertical-align:middle;">郑维嘉</td>
										<td style="text-align:center;vertical-align:middle;">离线</td>
									</tr>
								</tbody>
							</table>
							
						</div>
					
					</div>	
					</div>
					</div>
					</div>
				
				
					<!-- 聊天界面 -->
					<div class="col-xs-6 col-sm-6 widget-container-col ui-sortable">
					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title" id="user_doctor_title"><b>陶秀</b></h5>
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
						<div style="padding: 5px; height:450px; overflow-y: scroll;">
						
						<!-- Right -->
						<div class="receiver">
						    <div>
						        <img src="<%=basePath%>/assets/images/avatars/user.jpg">
						    </div>
							<div>
							 	<div class="right_triangle"></div>
							   	<span> 陶医生，在吗？ </span>
							 </div>
						</div> 
						
						<!-- Left -->
						<div class="sender">
						    <div>
						    	<img src="<%=basePath%>/assets/images/avatars/user3.jpg">
						    </div>
							<div>
						        <div class="left_triangle"></div>
						      	<span> 你好，在呢。 </span>
						   </div>
					  	</div>
					  	
						<!-- Right -->
						<div class="receiver">
						    <div>
						        <img src="<%=basePath%>/assets/images/avatars/user.jpg">
						    </div>
							<div>
							 	<div class="right_triangle"></div>
							   	<span> 你好。我想问问你我最近的心脏状况。 </span>
							 </div>
						</div>
						
						<!-- Left -->
						<div class="sender">
						    <div>
						    	<img src="<%=basePath%>/assets/images/avatars/user3.jpg">
						    </div>
							<div>
						        <div class="left_triangle"></div>
						      	<span> 嗯，我看了你最近的心电图，应该是没有什么异常情况的。 </span>
						   </div>
					  	</div> 
						
						<!-- Right -->
						<div class="receiver">
						    <div>
						        <img src="<%=basePath%>/assets/images/avatars/user.jpg">
						    </div>
							<div>
							 	<div class="right_triangle"></div>
							   	<span> 好的，谢谢你了。 </span>
							 </div>
						</div>
						
					  	</div>
					  	<hr />
					  	<div id="input_message" style="padding-bottom:10px">
					  		<div class="input-append center">
						        <input style="height:32px; width:360px" id="send_message" type="text" placeholder="输入消息" />
						        <button style="height:32px" class="btn btn-primary btn-xs"  type="button" onclick="sendMessage()">
						        	<i class="glyphicon glyphicon-send white"></i> &nbsp;发送
						        </button>
						    </div>
					  	
					  	</div><!-- ./ input_message -->
					  	
					  	
					  	
						</div><!-- ./ widget-body -->
					
					
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

		
		$(document).ready(function() {
			//getecgList();
		});


		
		




		
		

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

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
	
	<script src="<%=path%>/assets/js/sockjs.js"></script>
	
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
							<a href="#">健康咨询</a>
						</li>
						<li>
							<a href="#">健康咨询</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>
				
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<div class="widget-container">
					<div class="widget-box">
					<div class="box-inner">
						<div class="widget-header">
							<h5 class="widget-title" ><b>健康咨询</b></h5>
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
							
							<div>
								<textarea id="message" rows="6" cols="20"></textarea>
							</div>
							<div>
								<button type="button" class="btn btn-sm btn-default" onclick="send()"> Send </button>
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

		var websocket;  

		$(document).ready(function() {
			initsock();
		});



		function initsock(){
			
            var path = '<%=basePath%>';  
		    var userId = '13519131421';  

		    
		    if ('WebSocket' in window) {  

		        websocket = new WebSocket("ws://localhost:8080/healthcare/echo?userId=" + userId);  
		    } else if ('MozWebSocket' in window) {  

		        websocket = new MozWebSocket("ws://localhost:8080/echo?userId=" + userId);  
		    } else {  

		        websocket = new SockJS("http://localhost:8080/echo/sockjs?userId=" + userId);  
		    }  
		    websocket.onopen = function(event) {  
		        console.log("WebSocket:已连接");  
		        console.log(event);  
		    };  
		    websocket.onmessage = function(event) {  
		    
		    	console.log("WebSocket:收到消息");  
		        alert(event.data); 
		        /*
		        var data = event.data;  
		        console.log("WebSocket:收到一条消息-norm", data);  
		        alert("WebSocket:收到一条消息");  
		        */
		    };  
		    websocket.onerror = function(event) {  
		        console.log("WebSocket:发生错误 ");  
		        console.log(event);  
		    };  
		    websocket.onclose = function(event) {  
		        console.log("WebSocket:已关闭");  
		        console.log(event);  
		    };
        }

 		function send(){
		    if (websocket != null) {
		        var message = document.getElementById('message').value;
		        websocket.send(message);
		    } else {
		        alert('未与服务器链接.');
		    }
		}

    </script>
    
  </body>
</html>

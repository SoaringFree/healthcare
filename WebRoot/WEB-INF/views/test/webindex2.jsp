<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>webindex1</title>
    
	<%@ include file="../shared/cssandjs.jsp" %>
		
	<link href='<%=path%>/assets/ztree/css/zTreeStyle/zTreeStyle.css' rel='stylesheet'>
	<script src="<%=path%>/assets/ztree/js/jquery.ztree.all-3.5.js"></script>
	
	
	<style type="text/css">
		input, select, button {
	   		vertical-align:middle
	   	}
	   	
	   	select {
		  	padding: 4px 1px;
		  	border-radius: 0px;
		  	height:32px;
		}
		
		div#rMenu {
			border: 1px solid #c5d0dc;
			position: absolute; 
			visibility: hidden; 
			text-align: center;
			background-color: rgba(255,255,255,1);
		}
		div#rMenu ul li{
			padding: 0px;
			margin: 0px 3px 0px -20px;
			width: 180px;
			text-align: left;
			list-style: none outside none;
		}
		
		div#rMenu > ul> li> i{
			width: 13px;
		}
		
		.rc-sp {
			margin-left: 19px;
		}
		
		.b-dorder-li {
			border: 1px solid #c5d0dc; 
			border-top: none;
			border-left: none;
			border-right: none;
		}
		
		#div1, #left_down {
			border: 1px solid #c5d0dc;
		}
		
		#div2 {
			 border: none;
		}
		
		#div2_down {
			height: 19px; 
			border: 1px solid #c5d0dc; 
			border-top: none;
			margin-left:-5px; 
			background-color: #d9d9d9;
		}
		
		div .index {
			/*color: #00CC99;*/
			background-color: #d9d9d9;
			/*border-color: #0000FF;*/
			/*border: 1px solid ;*/
		}
		
		div .code {
			background-color: #F7F6F2;
		}
		
		.list-unstyled {
		　　padding-right: 0;
		　　list-style: none;
			font-size: 16px;
	　　}
	
		.list-unstyled-code {
		　　padding-left: 0;
		　　list-style: none;
			font-size: 16px;
	　　}
	
		.tab-content {
		    border: 1px solid #c5d0dc;
		    padding: 10px 0px 0px 12px;
		    position: relative;
		}
		
		.keyword {
			color: #7F0055;
			font-weight: bold;
		}
		
		.comment {
			color: #2A3AFF;
		}
		
		.str {
			color: #2A3AFF;
		}
		
		.var {
			color: #2A3AFF;
		}
		
		.parm {
			color: #FF00FF;
		}
		
		.ano {
			color: #646464;
			font-style: italic;
		}
		
		.lg-func {
			color: #008066;
			font-weight: bold;
		}
		
		.func {
			color: #008066;
		}
		
		
		.dev-list-unstyled {
		　　padding-left: 0;
			margin-left:0;
		　　list-style: none;
			list-style-type: none;
			font-size: 13px;
	　　}
		
		.dev-code {
			color: #008066;
			font-weight: bold;
		}
		
		.widget-box {
		    border: 1px solid #c5d0dc;
		    border-top: none;
		    border-left: none;
		    border-right: none;   
		}
		
		.widget-header-small {
		    min-height: 30px;
		    padding-left: 10px;
		}
		
		.widget-color-orange {
		    border-color: #d9d9d9;
		}
		.widget-color-orange > .widget-header {
		    
		    border-color: #d9d9d9;
		    background: #F7F6F2;
		}
		
		.widget-color-orange > .widget-header > .widget-title {
		    color: #000000;
		}
		
		.widget-color-orange > .widget-header > .widget-toolbar:before {
		    /*border-color: #FEA;*/
		    opacity: 0;
		}
		
		#div1 .widget-color-orange > .widget-header > .widget-toolbar > a > i {
			color: #d9d9d9;
		}
		
		.nav-tabs > li > a {
		    padding: 7px 12px 8px;
		    height: 31px
		}
		
		
		#left_down .widget-toolbar {
		    float: left;
		    padding: 0px;
		}
		
		.dev_icon {
			background-repeat: no-repeat; 
			background-position: center; 
			/*background-size: cover;*/ 
			display: block; 
			background-image:url(../healthcare/assets/ztree/img/dev.png) ;
		}
		
		
		#left_down .widget-color-orange > .widget-header > .widget-toolbar > [data-action="lf_off"] {
		    color: #d9d9d9;
		}
		
		#left_down .widget-color-orange > .widget-header > .widget-toolbar > [data-action="dev_icon"] {
		    color: #69aa46;
		}
		
		
		.lf_ul > li {
			width: 258px;
		}
		
		.tabs-left > .nav-tabs > li.active > a, .tabs-left > .nav-tabs > li.active > a:focus, .tabs-left > .nav-tabs > li.active > a:hover {
			border-right-color: #c5d0dc;
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

				
		<div class="row" style="margin:0px" >
			<div class="row" style="height:480px">
				
				<div id="div1" class="col-xs-3 col-sm-3 col-lg-3 code" style="margin:0px; padding:0px" >
					<div class="widget-box widget-color-orange collapsed ui-sortable-handle" style="opacity:1; z-index:0; margin:0px;">
						<div class="widget-header widget-header-small">
	                        <h6 class="widget-title">
	                            Project Explorer
	                        </h6>
	
	                        <div class="widget-toolbar">
	                        	<a href="#" data-action="reload">
	                                <i class="ace-icon fa fa-chevron-down"></i>
	                            </a>
	                        	<a href="#" data-action="reload">
	                                <i class="ace-icon fa fa-refresh"></i>
	                            </a>
	                            <a href="#" data-action="reload">
	                                <i class="ace-icon fa fa-exchange"></i>
	                            </a>
	                            <a href="#" data-action="reload">
	                                <i class="ace-icon fa fa-compress"></i>
	                            </a>
	                            <a href="#" data-action="settings">
	                                <i class="ace-icon fa fa-cog"></i>
	                            </a>

	                        </div>
	                    </div>
					</div>
				
					<div class="content_wrap" style="height:440px; margin:0px; overflow:auto">
	                    <div class="zTreeDemoBackground">
	                        <ul id="treeDemo" class="ztree"></ul>
	                    </div>
	                    <div id="rMenu" style="z-index:999; visibility:hidden">
	                        <ul style="margin-top:3px; margin-bottom:3px;">
	                        	<li class="b-dorder-li">
                                    <i class="fa fa-plus-square icon-white"></i>&nbsp;新建
                                    <i class="fa fa-caret-right icon-white" style="float:right"></i>
                                </li>
                                <li class="b-dorder-li">
                                	<span class="rc-sp">运行测试</span>
                                	<i class="fa fa-caret-right icon-white" style="float:right"></i>
                                </li>
                                <li>
                                    <i class="fa  fa-pencil-square-o icon-white"></i>&nbsp;编辑文件
                                </li>
                                <li>
                                <li>
                                    <i class="fa fa-scissors icon-white"></i>&nbsp;剪切
                                </li>
                                <li>
                                    <i class="fa fa-files-o icon-white"></i>&nbsp;复制
                                </li>
                                <li>
                                    <i class="fa fa-clipboard icon-white"></i>&nbsp;粘贴
                                </li>
                                <li>
                                    <i class="fa fa-times-circle-o icon-white"></i>&nbsp;重命名
                                </li>
                                <li class="b-dorder-li">
                                    <i class="fa fa-trash icon-white"></i>&nbsp;删除
                                </li>
                                
                                <li >
                                	<span class="rc-sp">下载</span>
                                </li>

                                <li>
                                    <span class="rc-sp">Git</span>
                                    <i class="fa fa-caret-right icon-white" style="float:right"></i>
                                </li>
                                <li>
                                	<span class="rc-sp">Maven</span>
                                    <i class="fa fa-caret-right icon-white" style="float:right"></i>
                                </li>
	                        </ul>
	                    </div>
	                </div>

				</div><!-- ./. div1 -->
				
				<div id="div2" class="col-xs-9 col-sm-9 col-lg-9" style="height:455px; margin:0px; ">
					<div id="tab_div" style="margin-left:-5px">
						<ul class="nav nav-tabs" role="tablist" id="tab_ul">
							<li id="tab_li_app_java" class="active">  
                                <a href="#tab_content_app_java" data-toggle="tab" id="tab_a_app_java">
                                    <button class="close closeTab" type="button" onclick="closeTab(this);">×</button>
                                    AccountController.java
                                </a>
                            </li>
						</ul>
							
						<!-- Tab panes -->
						<div class="tab-content" id="tab_content" >
							<div id="app_java" role="tabpanel" class="tab-pane active">
								<!-- <div class="row" style="height:428px;"> -->
								<div class="row" style="height:422px; overflow:auto; margin-right:0px; margin-top:-10px;">
									<div id="code_index" class="col-xs-1 col-sm-1 col-lg-1 index" style="width:40px;" >
										<ul class="list-unstyled" >
											<li>1</li>
											<li>2</li>
											<li>3</li>
											<li>4</li>
											<li>5</li>
											<li>6</li>
											<li>7</li>
											<li>8</li>
											<li>9</li>
											<li>10</li>
											<li>11</li>
											<li>12</li>
											<li>13</li>
											<li>14</li>
										</ul>
									</div>
									<div class="code" >
										<ul class="list-unstyled-code">
											<li><span class="keyword">package</span> webide;</li>
											<li>&nbsp;</li>
											<li><span class="keyword">import</span> java.util.HashMap;</li>
											<li><span class="keyword">import</span> java.util.Map;</li>
											<li>&nbsp;</li>
											<li><span class="keyword">import</span> javax.servlet.http.HttpServletRequest;</li>
											<li><span class="keyword">import</span> javax.servlet.http.HttpSession;</li>
											<li>&nbsp;</li>
											<li><span class="keyword">import</span> org.springframework.beans.factory.annotation.Autowired;</li>
											<li><span class="keyword">import</span> org.springframework.stereotype.Controller;</li>
											<li><span class="keyword">import</span> org.springframework.ui.ModelMap;</li>
											<li><span class="keyword">import</span> org.springframework.web.bind.annotation.RequestMapping;</li>
											<li><span class="keyword">import</span> org.springframework.web.bind.annotation.RequestMethod;</li>
											<li><span class="keyword">import</span> org.springframework.web.bind.annotation.ResponseBody;</li>
											<li><span class="keyword">import</span> org.springframework.web.bind.annotation.SessionAttributes;</li>
											<li><span class="keyword">import</span> org.springframework.web.servlet.ModelAndView;</li>
											<li>&nbsp;</li>
											<li><span class="keyword">import</span> com.example.model.User;</li>
											<li><span class="keyword">import</span> com.example.service.UserService;</li>
											<li>&nbsp;</li>
											<li class="comment">/**</li>
											<li class="comment">* Login</li>
											<li class="comment">*</li>
											<li class="comment">*/</li>
											<li class="ano">@Controller</li>
											<li class="ano">@RequestMapping(<span class="str">"/account"</span>)</li>
											<li class="ano">@SessionAttributes(<span class="str">"UserSession")</span></li>
											<li> <span class="keyword"> public class </span> AccountController</li>
											<li>{</li>
											
											<li class="ano">&nbsp;&nbsp;&nbsp;&nbsp;@Autowired</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">private </span>UserService userSrv;
											</li>
											<li>&nbsp;</li>
											
											<li class="ano">&nbsp;&nbsp;&nbsp;&nbsp;@RequestMapping(<span class="parm">value</span> = <span class="str">"/login"</span>, <span class="parm">method</span> = RequestMethod.GET)</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public </span>
												ModelAndView 
												<span class="lg-func">index</span>()
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;{</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return new </span>
												ModelAndView(
												<span class="str">"/account/login"</span>
												);
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;}</li>
											
											<li class="ano">&nbsp;&nbsp;&nbsp;&nbsp;@RequestMapping(<span class="parm">value</span> = <span class="str">"/login"</span>, <span class="parm">method</span> = RequestMethod.POST)</li>
											<li class="ano">&nbsp;&nbsp;&nbsp;&nbsp;@ResponseBody</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">public Object </span>
												<span class="lg-func">login</span>
												(User <span class="parm">user</span>, HttpServletRequest <span class="parm">request</span>, HttpSession <span class="parm">session</span>, ModelMap <span class="parm">model</span>)
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;{</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Map&lt;<span class="keyword">String</span>,<span class="keyword"> Object</span>&gt;&nbsp;map = HashMap&lt;<span class="keyword">String</span>,<span class="keyword"> Object</span>&gt;();
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;map.put(<span class="str">"success"</span>, <span class="keyword">false</span>);
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="str">String </span>userCaptcha = <span class="parm">request</span>.<span class="func">getParameter</span>(<span class="str">"userCaptcha"</span>).<span class="func">toString</span>().<span class="func">toUpperCase</span>();
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="str">String </span>captcha = <span class="parm">session</span>.<span class="func">getAttribute</span>(<span class="str">"captcha"</span>).<span class="func">toString</span>();
											</li>
											<li>&nbsp;</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if </span>(!userCaptcha.equals(captcha))</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;map.put(
												<span class="str">"message"</span>, 
												<span class="str">"验证码错误！"</span>);
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keywaord">return </span>map;
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
											<li>&nbsp;</li>
											
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User login_user = userSrv.getUser(<span class="parm">user</span>);</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if </span>
												(<span class="keyword">null </span>!= login_user &amp;&amp;  
												<span class="keyword">0</span> != login_user.getId())
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String url = <span class="str">"/user/index"</span>;
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;model.addAttribute(<span class="str">"UserSession"</span>, login_user);
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;map.clear();
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;map.put(<span class="str">"success"</span>, <span class="keyword">true</span>);
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;map.put(<span class="str">"url"</span>, url);
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">else </span></li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;map.put(<span class="str">"message"</span>, <span class="str">"用户名或密码错误！"</span>);
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return </span>map;
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;}</li>
											<li>&nbsp;</li>
											<li>}</li>
											<li></li>
											
										</ul>
									</div>									
								</div>
								
								
								
							
							</div>
						</div>
					</div>
					
					<div id="div2_down">
						<div style="float:left; margin-left:10px">1:1</div>
						<div style="float:right; margin-right:20px">UTF-8&nbsp;&nbsp;Java</div>
					</div>
					
				</div><!-- ./. div2 -->
				
			</div>
			
			<div class="row" >
				<div id="div3" class="col-xs-12 col-sm-12 col-lg-12" >
					<div id="left_down_div" class="row" >
						<div id="left_down"  class="col-xs-3 col-sm-3 col-lg-3" style="height:223px; margin:0px; padding:0px">
							<div class="widget-box widget-color-orange collapsed ui-sortable-handle" style="opacity:1; z-index:0; margin:0px;">
								<div class="widget-header widget-header-small" style="margin-left:0px;">
			
			                        <div class="widget-toolbar">
			                        	<a href="#" data-action="ld_off">
			                                <i class="ace-icon fa fa-chevron-down"></i>
			                            </a>
			                        	<a href="#" data-action="ld_off">
			                                <i class="dev_icon">&nbsp;&nbsp;&nbsp;</i>
			                            </a>
			                            <a href="#" data-action="dev_icon" onclick="showDEV()">
			                                <i class="ace-icon fa  fa-circle"></i>
			                                dev-machine
			                            </a>
			                            <a href="#" data-action="ld_off">
			                                SSH
			                            </a>
			                            <a href="#" data-action="ld_off">
			                                <i class="ace-icon fa fa-cog"></i>
			                            </a>
		
			                        </div>
			                    </div>
			                    
			                    <div class="tabbable tabs-left">
	                                <ul class="nav nav-tabs lf_ul">
	                                    <li class="active">
	                                        <a href="#lf_terminal">
			                                	<i class="glyphicon glyphicon-chevron-right green"></i>
			                                    <button class="close closeTab" style="float:right;" type="button" onclick="closeTab(this);">×</button>
			                                    Terminal
			                                </a>
	                                    </li>
	
	                                  
	                                </ul>
	                            </div>
			                    
							</div>
						</div>
						
						<div id="debug_div" class="col-xs-9 col-sm-9 col-lg-9" style="margin-left:-5px">
							<ul class="nav nav-tabs" role="tablist">
								<li> 
	                                <a href="#tab_debug_dev_machine" data-toggle="tab" id="tab_a_app_java">
	                                	<i class="glyphicon glyphicon-align-left green"></i>
	                                    <button class="close closeTab" type="button" onclick="closeTab(this);">×</button>
	                                    dev-machine
	                                </a>
	                            </li>
								<li class="active">  
	                                <a href="#tab_debug_terminal" data-toggle="tab" id="tab_a_app_java">
	                                	<i class="glyphicon glyphicon-chevron-right green"></i>
	                                    <button class="close closeTab" type="button" onclick="closeTab(this);">×</button>
	                                    Terminal
	                                </a>
	                            </li>
	                            <li>  
	                                <a href="#tab_debug_server" data-toggle="tab">
	                                	<i class="fa fa-tasks  green"></i>
	                                    <button class="close closeTab" type="button" onclick="closeTab(this);">×</button>
	                                    Server
	                                </a>
	                            </li>
							</ul>
							<div class="tab-content" id="tab_content" >
								<div id="tab_debug_dev_machine" role="tabpanel" class="tab-pane" style="height:180px">
									dev-machine
								</div>
								<div id="tab_debug_terminal" role="tabpanel" class="tab-pane active" style="height:180px">
									<ul class="list-unstyled">
										<li>user@8152a8ffb23:/projects$ </li>
										<li>user@8152a8ffb23:/projects$ mvn clean</li>
										<li>user@8152a8ffb23:/projects$ mvn package</li>
									</ul>
									
									
								</div>
								<div id="tab_debug_server" role="tabpanel" class="tab-pane" style="height:180px">
									Server
								</div>
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
			
		</div>	
				
	</div><!-- page-content -->
	</div>
	</div><!-- /.section:basics/sidebar -->
    </div><!-- /.main container -->

	
	<div class="modal fade bold" style="display: none;" id="devModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog" style="width:1200px;">
	        <div class="modal-content">
	            <div class="modal-body" style="padding-bottom:10px">
	            	<div id="dev_modal" >
						<ul class="nav nav-tabs" role="tablist">
							<li> 
                                <a href="#dev_machine_modal" data-toggle="dev_modal_tab">
                                	<i class="glyphicon glyphicon-align-left green"></i>
                                    <button class="close closeTab" type="button" onclick="closeTab(this);">×</button>
                                    dev-machine
                                </a>
                            </li>
						</ul>
						<div class="tab-content" id="dev_modal_tab">
							<div id="dev_machine_modal" role="tabpanel" class="tab-pane active">
							<div class="row" style="width:1100px; overflow-x:auto;">
							<div>
								<ul class="dev-list-unstyled">				
									<li>[<span class="dev-code">STDOUT</span>] Workspace </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,790[main]             [INFO ] [o.a.c.s.VersionLoggerListener 89]    - Server version:        Apache Tomcat/8.5.11</li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,795[main]             [INFO ] [o.a.c.s.VersionLoggerListener 91]    - Server built:          Jan 10 2017 21:02:52 UTC </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,795[main]             [INFO ] [o.a.c.s.VersionLoggerListener 93]    - Server number:         8.5.11.0 </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,796[main]             [INFO ] [o.a.c.s.VersionLoggerListener 95]    - OS Name:               Linux </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,796[main]             [INFO ] [o.a.c.s.VersionLoggerListener 97]    - OS Version:            3.10.0-514.2.2.el7.x86_64 </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,797[main]             [INFO ] [o.a.c.s.VersionLoggerListener 99]    - Architecture:          amd64 </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,797[main]             [INFO ] [o.a.c.s.VersionLoggerListener 101]   - Java Home:             /usr/lib/jvm/java-8-openjdk-amd64/jre </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,797[main]             [INFO ] [o.a.c.s.VersionLoggerListener 103]   - JVM Version:           1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13 </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,798[main]             [INFO ] [o.a.c.s.VersionLoggerListener 105]   - JVM Vendor:            Oracle Corporation </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,798[main]             [INFO ] [o.a.c.s.VersionLoggerListener 107]   - CATALINA_BASE:         /home/user/ws-agent </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,799[main]             [INFO ] [o.a.c.s.VersionLoggerListener 109]   - CATALINA_HOME:         /home/user/ws-agent </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,801[main]             [INFO ] [o.a.c.s.VersionLoggerListener 115]   - Command line argument: -Xms256m </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,802[main]             [INFO ] [o.a.c.s.VersionLoggerListener 115]   - Command line argument: -Xmx2048m </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,803[main]             [INFO ] [o.a.c.s.VersionLoggerListener 115]   - Command line argument: -Djuli-logback.configurationFile=file:/home/user/ws-agent/conf/tomcat-logger.xml </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,803[main]             [INFO ] [o.a.c.s.VersionLoggerListener 115]   - Command line argument: -Djdk.tls.ephemeralDHKeySize=2048 </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,907[main]             [INFO ] [o.a.c.http11.Http11NioProtocol 525]  - Initializing ProtocolHandler ["http-nio-4401"] </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:38,938[main]             [INFO ] [o.a.catalina.startup.Catalina 617]   - Initialization processed in 473 ms </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:39,000[main]             [INFO ] [c.m.JmxRemoteLifecycleListener 336]  - The JMX Remote Listener has configured the registry on port 32002 and the server on port 32102 for the Platform server </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:39,001[main]             [INFO ] [o.a.c.core.StandardService 416]      - Starting service Catalina </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:39,001[main]             [INFO ] [o.a.c.core.StandardEngine 259]       - Starting Servlet Engine: Apache Tomcat/8.5.11 </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:39,155[ost-startStop-1]  [INFO ] [o.a.c.startup.HostConfig 923]        - Deploying web application archive /home/user/ws-agent/webapps/ROOT.war </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:47,510[ost-startStop-1]  [INFO ] [o.e.c.a.p.s.WorkspaceHolder 59]      - Workspace ID: workspace5s655qjkdz2g8gh1 </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:48,652[s polled Thread]  [INFO ] [o.e.c.p.m.server.rmi.RmiClient 130]  - Port/Name:15782/MavenRemoteServerImpl75c0cbd0 </li>
									<li>[<span class="dev-code">STDOUT</span>]  </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:50,510[ost-startStop-1]  [INFO ] [o.a.c.startup.HostConfig 987]        - Deployment of web application archive /home/user/ws-agent/webapps/ROOT.war has finished in 11,354 ms </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:50,513[main]             [INFO ] [o.a.c.http11.Http11NioProtocol 570]  - Starting ProtocolHandler [http-nio-4401] </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:33:50,521[main]             [INFO ] [o.a.catalina.startup.Catalina 668]   - Server startup in 11581 ms </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:34:01,507[io-4401-exec-10]  [INFO ] [a.c.w.i.BasicWebSocketEndpoint 49]   - Web socket session opened </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017-05-09 03:34:01,508[io-4401-exec-10]  [INFO ] [a.c.w.i.BasicWebSocketEndpoint 50]   - Endpoint: 1770967579 </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017/05/09 03:34:02 A new channel with id 'channel-1' successfully opened </li>
									<li>[<span class="dev-code">STDOUT</span>] 2017/05/09 03:34:03 Start new terminal. </li>
								</ul>
							</div>	
							</div>
							</div>
						</div>
					</div>
	        	</div>
	    	</div>
	    </div>
    </div>
   
    
    
    <script type="text/javascript">

		var setting = {
			view: {
				dblClickExpand: false,
			},
			edit: {
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onRightClick: OnRightClick,
				onClick: OnClick,
				onDrop: zTreeOnDrop,
				beforeDrag: beforeDrag,
				beforeDrop: beforeDrop
			}
		};
		var zNodes = [
			{ name:"webide", open:true, icon:'<%=path %>/assets/ztree/img/mvn-web.png', children:[
   				{ name:"src", open:true, icon:'<%=path %>/assets/ztree/img/pkgfold.png', children:[
   					{ name:"com.example", open:true, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
   						{ name:"controller", open:true, icon:'<%=path %>/assets/ztree/img/pkg.png', children:[
   							{ name:"AccountController.java", icon:'<%=path %>/assets/ztree/img/cls.png',}
   						]},
   						{ name:"dao", open:true, icon:'<%=path %>/assets/ztree/img/pkg.png', children:[
   							{ name:"UserDao.java", icon:'<%=path %>/assets/ztree/img/cls.png',}
   						]},
   						{ name:"model", open:true, icon:'<%=path %>/assets/ztree/img/pkg.png', children:[
   							{ name:"User.java", icon:'<%=path %>/assets/ztree/img/cls.png',}
   						]},
   						{ name:"service", open:true, icon:'<%=path %>/assets/ztree/img/pkg.png', children:[
   							{ name:"UserService.java", icon:'<%=path %>/assets/ztree/img/cls.png',}
   						]}
   					]}
   				]}, 
   				{ name:"Maven Dependencies", open:false, icon:'<%=path %>/assets/ztree/img/lib.png', children:[
   					{ name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
   				]},
   				{ name:"JRE System Library", open:false, icon:'<%=path %>/assets/ztree/img/lib.png', children:[
   					{ name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
   				]},
   				{ name:"target", open:true, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
                    { name:"webide", open:false, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
                        { name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
                    ]},
                    { name:"m2e-jee", open:false, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
                        { name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
                    ]},
                    { name:"maven-archiver", open:false, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
                        { name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
                    ]},
                    { name:"webide.war", icon:'<%=path %>/assets/ztree/img/war.png',}
                ]},
   				
   				{ name:"WebRoot", open:true, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
   					{ name:"META-INF", open:false, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
   						{ name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
   					]},
   					{ name:"WEB-INF", open:true, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
   						{ name:"config", open:false, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
	   						{ name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
	   					]},
	   					{ name:"lib", open:false, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
	   						{ name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
	   					]},
	   					{ name:"views", open:false, icon:'<%=path %>/assets/ztree/img/fold.png', children:[
	   						{ name:"pom.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
	   					]},
	   					{ name:"web.xml", icon:'<%=path %>/assets/ztree/img/xml.png',}
   					]},
   					{ name:"index.jsp", icon:'<%=path %>/assets/ztree/img/jsp.png',}
   				]},
   				{ name:"clean.bat", icon:'<%=path %>/assets/ztree/img/cogs.png',},
   				{ name:"package.bat", icon:'<%=path %>/assets/ztree/img/cogs.png',},
   				{ name:"pom.xml", icon:'<%=path %>/assets/ztree/img/mav.png',},
   				{ name:"README.md", icon:'<%=path %>/assets/ztree/img/rdm.png',},
   				
      		]}
		];
		var zTree, rMenu;
		
		
		
		$(document).ready(function(){
			initTree();
			addCodeIndex(70);
		});
		
		
		function initTree() {
	    	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			zTree = $.fn.zTree.getZTreeObj("treeDemo");
			//zTree.expandAll(true);
			rMenu = $("#rMenu");
	    };
	    
	    function OnRightClick(event, treeId, treeNode) {
			if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
				zTree.cancelSelectedNode();
				//showRMenu("root", event.clientX - 198, event.clientY - 94);
			} else if (treeNode && !treeNode.noR) {
				zTree.selectNode(treeNode);
				showRMenu("node", event.clientX-8, event.clientY-42);
			}
		}
		
		function OnClick(event, treeId, treeNode) {
			
			var nodes = zTree.getSelectedNodes();
			if (nodes[0].children && nodes[0].children.length > 0) {
				//alert("中间结点");
				
			} else {
				//zTree.removeNode(nodes[0]);
				//alert("叶子节点");

				var tab_options = {
		    		tab_Content_id: "tab_content",
					tab_UL_id: "tab_ul",
					tabName: nodes[0].name,
					tabTitle: nodes[0].name,
					tabUrl: "#",
				};
				
				addTab(tab_options);
			}
		}
		
		function zTreeOnDrop(event, treeId, treeNodes, targetNode, moveType) {
		    alert("拖动节点：" + treeNodes[0].id + " : " + treeNodes[0].name);
		    
		    alert("目标节点：" + targetNode.id + " : " + targetNode.name);
		    var pare = treeNodes[0].getParentNode();
		    alert("目标父节点：" + pare.id + " : " + pare.name);
		    
		    if (pare.id == orgParentNode.id) {
		    	alert("同级别移动！");
		    	return;
		    } else {
		    	// TODO
		    	;
		    }
		};
		
		function beforeDrag(treeId, treeNodes) {
			for (var i=0,l=treeNodes.length; i<l; i++) {
				if (treeNodes[i].drag === false) {
					return false;
				}
			}
			return true;
		}
		
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			orgParentNode = treeNodes[0].getParentNode();
			return targetNode ? targetNode.drop !== false : true;
		}
		
		function showRMenu(type, x, y) {
			$("#rMenu ul").show();
			if (type=="root") {
				$("#m_del").hide();
				$("#m_check").hide();
				$("#m_unCheck").hide();
			} else {
				$("#m_del").show();
				$("#m_check").show();
				$("#m_unCheck").show();
			}
			rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});
	
			$("body").bind("mousedown", onBodyMouseDown);
		}
		function hideRMenu() {
			if (rMenu) rMenu.css({"visibility": "hidden"});
			$("body").unbind("mousedown", onBodyMouseDown);
		}
		function onBodyMouseDown(event){
			if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
				rMenu.css({"visibility" : "hidden"});
			}
		}
		
		function showTreeNode() {
			hideRMenu();
			var nodes = zTree.getSelectedNodes();
			if (nodes && nodes.length>0) {
				if (nodes[0].children && nodes[0].children.length > 0) {
					alert("查看中间节点");
				} else {
					alert("查看叶子节点");
				}
			}
		};
		
		
	
	
		/*************************动态添加TAB**************************/
		/**
		 * 增加标签页
		 */
		function addTab(options) {
			//option:
		   	//tabMainName:tab标签页所在的容器
		   	//tabName:当前tab的名称
		   	//tabTitle:当前tab的标题
		   	//tabUrl:当前tab所指向的URL地址
		   	options.tabName = replacePoint(options.tabName);
		    

		   	var exists = checkTabIsExists(options.tab_UL_id, options.tabName);
		   	if(exists){
		       	$("#tab_a_"+options.tabName).click();
		   	} else {
		       	$("#"+options.tab_UL_id).append('<li id="tab_li_'+options.tabName+'"><a href="#tab_content_'+options.tabName+'" data-toggle="tab" id="tab_a_'+options.tabName+'"><button class="close closeTab" type="button" onclick="closeTab(this);">×</button>'+options.tabTitle+'</a></li>');
		        
		       	//固定TAB中IFRAME高度
		       	mainHeight = $(document.body).height() - 5;
		        
		       	var content = '';
		       	if(options.content){
		           	content = option.content;
		       	} else {
		           // content = '<iframe src="' + options.tabUrl + '" width="100%" height="'+mainHeight+'px" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>';
		       	}
		       	$("#"+options.tab_Content_id).append('<div role="tabpanel" class="tab-pane" id="'+options.tabName+'">'+content+'</div>');
		       	$("#tab_a_"+options.tabName).click();
			}
		}
		
		function replacePoint(str) {
			return str.replace('.','_');
		}
		
		/**
		 * 关闭标签页
		 * @param button
		 */
		function closeTab (button) {
		    
		    //通过该button找到对应li标签的id
		    var li_id = $(button).parent().parent().attr('id');
		    var id = li_id.replace("tab_li_","");
		    
		    //如果关闭的是当前激活的TAB，激活他的前一个TAB
		    if ($("li.active").attr('id') == li_id) {
		        $("li.active").prev().find("a").click();
		    }
		    
		    //关闭TAB
		    $("#" + li_id).remove();
		    $("#tab_content_" + id).remove();
		};
		
		/**
		 * 判断是否存在指定的标签页
		 * @param tabMainName
		 * @param tabName
		 * @returns {Boolean}
		 */
		function checkTabIsExists(tabMainName, tabName){
		    var tab = $("#"+tabMainName+" > #tab_li_"+tabName);
		    //console.log(tab.length)
		    return tab.length > 0;
		}
	
		function addCodeIndex(lines) {
			$("#code_index ul").remove();
			var ul = $("<ul class='list-unstyled'></ul>");
			
			for (var i = 0; i < lines; i++) {
				var li = $("<li>"+ (i+1) + "</li>");
				ul.append(li);
			}
			$("#code_index").append(ul);
		}
	
		function showDEV() {
			$("#devModal").modal("show");
		}
	
    </script>
    
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String cssPash = request.getContextPath();
String basecssPash = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cssPash+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!-- The styles -->
<!-- bootstrap & font awesome -->
<link rel="stylesheet" href="<%=cssPash%>/assets/css/bootstrap.css" />
<link rel="stylesheet" href="<%=cssPash%>/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="stylesheet" href='<%=cssPash%>/assets/css/bootstrap-datetimepicker.min.css' />

<!-- page specific plugin styles -->
<!-- ace styles -->
<link rel="stylesheet" href="<%=cssPash%>/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
	<link rel="stylesheet" href="<%=cssPash%>/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
<![endif]-->
<link rel="stylesheet" href="<%=cssPash%>/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=cssPash%>/assets/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
  <link rel="stylesheet" href="<%=cssPash%>/assets/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->
<!-- ace settings handler -->
<script src="<%=cssPash%>/assets/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="<%=cssPash%>/assets/js/html5shiv.min.js"></script>
<script src="<%=cssPash%>/assets/js/respond.min.js"></script>
<![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="<%=cssPash%>/assets/img/favicon.ico">

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
	window.jQuery || document.write("<script src='<%=cssPash%>/assets/js/jquery-2.1.4.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
		window.jQuery || document.write("<script src='<%=cssPash%>/assets/js/jquery-1.11.3.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='<%=cssPash%>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="<%=cssPash%>/assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
  <script src="<%=cssPash%>/assets/js/excanvas.min.js"></script>
<![endif]-->

<script src="<%=cssPash%>/assets/js/jquery-ui.custom.min.js"></script>
<script src="<%=cssPash%>/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=cssPash%>/assets/js/jquery.easypiechart.min.js"></script>
<script src="<%=cssPash%>/assets/js/jquery.sparkline.index.min.js"></script>
<script src="<%=cssPash%>/assets/js/jquery.flot.min.js"></script>
<script src="<%=cssPash%>/assets/js/jquery.flot.pie.min.js"></script>
<script src="<%=cssPash%>/assets/js/jquery.flot.resize.min.js"></script>

    <!-- bootstrap-datetimepicker js -->
<script src="<%=cssPash%>/assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=cssPash%>/assets/js/bootstrap-datetimepicker.zh-CN.js"></script>

<!-- ace scripts -->
<script src="<%=cssPash%>/assets/js/ace-elements.min.js"></script>
<script src="<%=cssPash%>/assets/js/ace.min.js"></script>


<script type="text/javascript">
	try{ace.settings.check('navbar' , 'fixed');}catch(e){}
	try{ace.settings.check('sidebar' , 'fixed');}catch(e){}
	try{ace.settings.check('main-container' , 'fixed');}catch(e){}
	try{ace.settings.check('sidebar' , 'collapsed');}catch(e){}
	try{ace.settings.check('breadcrumbs' , 'fixed');}catch(e){}
	
	// 日期插件
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
    
	$('ul.nav-list li a').each(function () {
        if ($($(this))[0].href == String(window.location))
            $(this).parent().addClass('active');
    });

</script>


<#macro header>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>电玩城 - 后台管理</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="">


  <!-- Stylesheets -->
  <link href="${cssUrl}/bootstrap.css" rel="stylesheet">
  <!-- Font awesome icon -->
  <link rel="stylesheet" href="${cssUrl}/font-awesome.css"> 
  <!-- jQuery UI -->
  <link rel="stylesheet" href="${cssUrl}/jquery-ui-1.9.2.custom.min.css"> 
  <!-- Calendar -->
  <link rel="stylesheet" href="${cssUrl}/fullcalendar.css">
  <!-- prettyPhoto -->
  <link rel="stylesheet" href="${cssUrl}/prettyPhoto.css">  
  <!-- Star rating -->
  <link rel="stylesheet" href="${cssUrl}/rateit.css">
  <!-- Date picker -->
  <link rel="stylesheet" href="${cssUrl}/bootstrap-datetimepicker.min.css">
  <!-- CLEditor -->
  <link rel="stylesheet" href="${cssUrl}/jquery.cleditor.css"> 
  <!-- Uniform 
  <link rel="stylesheet" href="${cssUrl}/uniform.default.html"> -->
  <!-- Uniform -->
  <link rel="stylesheet" href="${cssUrl}/daterangepicker-bs3.css" />
  <!-- Bootstrap toggle -->
  <link rel="stylesheet" href="${cssUrl}/bootstrap-switch.css">
  <!-- jsTree -->
  <link rel="stylesheet" href="${cssUrl}/jstree/default/style.min.css" />
  <!-- Main stylesheet -->
  <link href="${cssUrl}/style.css" rel="stylesheet">
  <!-- Widgets stylesheet -->
  <link href="${cssUrl}/widgets.css" rel="stylesheet">  
    <!-- Gritter Notifications stylesheet -->
  <link href="${cssUrl}/jquery.gritter.css" rel="stylesheet">   
  <link rel="stylesheet" href="${jsUrl}/datatables/css/dataTables.bootstrap.css">
  <link rel="stylesheet" href="${cssUrl}/jquery-ui-timepicker-addon.css">
  <!-- menu-->
  <link rel="stylesheet" href="${cssUrl}/menu.css">
  
  
  
  
  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="${jsUrl}/html5shim.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="${imgUrl}/favicon/favicon.png">
  <script>
	 var GLBConfig={
		homeUrl:"${siteUrl}/"
	};
  </script>
  <span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span> 

<!-- JS -->
<script src="${jsUrl}/jquery.js"></script> <!-- jQuery -->

<!--
<script src="${jsUrl}//languages/jquery.validationEngine-en.js"></script>
<script src="${jsUrl}/jquery.validationEngine.js"></script>
-->

<script src="${jsUrl}/bootstrap.js"></script> <!-- Bootstrap -->
<script src="${jsUrl}/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
<script src="${jsUrl}/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="${jsUrl}/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="${jsUrl}/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->

<!-- Morris JS -->
<script src="${jsUrl}/raphael-min.js"></script>
<script src="${jsUrl}/morris.min.js"></script>

<!-- jQuery Flot -->
<script src="${jsUrl}/excanvas.min.js"></script>
<!-- 

<script src="${jsUrl}/jquery.flot.js"></script>
<script src="${jsUrl}/jquery.flot.resize.js"></script>
<script src="${jsUrl}/jquery.flot.pie.js"></script>
<script src="${jsUrl}/jquery.flot.stack.js"></script>

-->

<!-- jQuery Notification - Noty -->
<script src="${jsUrl}/noty/jquery.noty.packaged.min.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<!-- Daterangepicker -->
<script src="${jsUrl}/moment.min.js"></script>
<script src="${jsUrl}/daterangepicker.js"></script>

<script src="${jsUrl}/sparklines.js"></script> <!-- Sparklines -->
<script src="${jsUrl}/jquery.gritter.min.js"></script> <!-- jQuery Gritter -->
<script src="${jsUrl}/jquery.form.js"></script> <!-- jQuery Form -->
<script src="${jsUrl}/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="${jsUrl}/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
<!--<script src="${jsUrl}/jquery.uniform.min.html"></script>  jQuery Uniform -->
<script src="${jsUrl}/jquery.slimscroll.min.js"></script> <!-- jQuery SlimScroll -->
<script src="${jsUrl}/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
<script src="${jsUrl}/filter.js"></script> <!-- Filter for support page -->
<script src="${jsUrl}/jstree/jstree.min.js"></script><!--jstree-->
<script src="${jsUrl}/custom.js"></script> <!-- Custom codes -->

<script src="${jsUrl}/layer/layer.js"></script> <!-- Custom codes -->
<script src="${jsUrl}/jquery-ui-timepicker-addon.js"></script> <!-- timepicker -->

<script src="${jsUrl}/manage.js"></script> <!-- manage codes -->
  <#nested>
</head>

</#macro>
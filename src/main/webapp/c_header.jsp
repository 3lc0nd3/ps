<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1" >

    <%
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
    %>


    <script src="javascripts/app.js"></script>
    <script src="javascripts/jquery/jquery-1.8.2.min.js"></script>
    <script src="javascripts/jquery/jquery.metadata.js"></script>
    <script src="javascripts/bootstrap/bootstrap.min.js"></script>

    <script src="javascripts/jquery/jquery-validate/jquery.validate.min.js"></script>
    <script src="javascripts/jquery/jquery-validate/messages_es.js"></script>
    <script src="javascripts/jquery/jquery-validate/additional-methods.min.js"></script>

    <script src="javascripts/jqPlot/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="javascripts/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <link href="javascripts/jquery/uiThemes/overcast/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css">

    <script type='text/javascript' src='javascripts/jquery/jquery-ui-timepicker-addon/jquery-ui-timepicker-addon.js'></script>
    <link href="javascripts/jquery/jquery-ui-timepicker-addon/jquery-ui-timepicker-addon.css" rel="stylesheet" type="text/css">

    <script src="javascripts/jqPlot/excanvas.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.barRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.categoryAxisRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.pointLabels.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasTextRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.cursor.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.logAxisRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.canvasAxisTickRenderer.min.js"></script>
    <script src="javascripts/jqPlot/jqplot.highlighter.js"></script>
    <%--<script src="javascripts/jqPlot/jqplot."></script>--%>
    <%--<script src="javascripts/jqPlot/jqplot."></script>--%>

    <script src="javascripts/jquery/jquery.formatCurrency-1.4.0.min.js"></script>

    <link rel="stylesheet" href="stylesheets/app.css">
    <link rel="stylesheet" href="stylesheets/bootstrap/bootstrap.min.css">
    <style>
      body {
        /*padding-top: 60px; *//* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>
    <link rel="stylesheet" href="stylesheets/bootstrap/bootstrap-responsive.min.css">

    
    <link rel="stylesheet" href="javascripts/jqPlot/jquery.jqplot.min.css">


    <script type='text/javascript' src='dwr/engine.js'></script>
    <script type='text/javascript' src='dwr/util.js'></script>
    <script type='text/javascript' src='dwr/interface/mottaRemoto.js'></script>
    <%--<script src="javascripts/jquery.js"></script>--%>
    <script type="text/javascript">
//        jQuery = jQuery.noConflict();
    </script>
</head>

<body>
    <jsp:include page="c_menu.jsp"/>
    <jsp:include page="c_banner.jsp"/>
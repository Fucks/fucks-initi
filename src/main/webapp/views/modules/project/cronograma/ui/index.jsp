<%-- 
    Document   : index
    Created on : 06/11/2015, 10:26:14
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<c:url value="/resource/css/custom/custom.css" />">

        <link rel=stylesheet href="<c:url value="/resource/library/gantt/platform.css" />" type="text/css">

        <link rel=stylesheet href="<c:url value="/resource/library/gantt/gantt.css" />" type="text/css">
        <link rel=stylesheet href="<c:url value="/resource/library/gantt/ganttPrint.css" />" type="text/css" media="print">

        <link rel="stylesheet" type="text/css" href="<c:url value="/resource/library/gantt/libs/jquery.svg.css" />">

        <!-- datepicker -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resource/library/gantt/libs/material-datepicker/css/material.datepicker.css" />">
    </head>
    <body>

        <div ng-switch on="currentState">
            <div ng-switch-when="cronograma.list">
                <div ng-include="'views/modules/project/cronograma/ui/gantt.jsp'"></div>
            </div>
            <div ng-switch-default>
                <div ng-include="'views/modules/project/cronograma/ui/gantt.jsp'"></div>
            </div>
        </div>

    <script src="<c:url value="/resource/library/gantt/libs/jquery.livequery.min.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/libs/jquery.timers.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/libs/platform.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/libs/date.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/libs/i18nJs.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/libs/JST/jquery.JST.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/library/gantt/libs/jquery.svg.min.js" />"></script>


    <!--In case of jquery 1.7-->
    <!--<script type="text/javascript" src="libs/jquery.svgdom.pack.js"></script>-->

    <!--In case of jquery 1.8-->
    <script type="text/javascript" src="<c:url value="/resource/library/gantt/libs/jquery.svgdom.1.8.js" />"></script>


    <script src="<c:url value="/resource/library/gantt/ganttUtilities.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/ganttTask.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/ganttDrawerSVG.js" />"></script>
    <!--<script src="ganttDrawer.js"></script>-->
    <script src="<c:url value="/resource/library/gantt/ganttGridEditor.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/ganttMaster.js" />"></script>  
    <script src="<c:url value="/resource/library/gantt/libs/moment.min.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/libs/jquery-2.1.3.min.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/libs/knockout-3.2.0.js" />"></script>
    <script src="<c:url value="/resource/library/gantt/libs/material-datepicker/js/material.datepicker.js" />"></script>

    <!-- Controllers do modulo -->
    <script type="text/javascript"  src="<c:url value="/views/modules/project/cronograma/services/cronograma-service.js" />" ></script>
    <script type="text/javascript"  src="<c:url value="/views/modules/project/cronograma/controller/cronograma-controller.js" />" ></script>
</body>
</html>

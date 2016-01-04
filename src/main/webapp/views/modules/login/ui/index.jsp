<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/resource/css/materialize/materialize.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resource/css/font/icon.css" />">
        <link rel="stylesheet" href="<c:url value="/resource/library/angular-material/angular-material.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resource/library/md-data-table/md-data-table.min.css" />">

        <title>Entre!</title>
        <link rel="stylesheet" href="<c:url value="/resource/css/custom/login.css" />">
    </head>
    <body>
        <header>
            {{title}}
        </header>

        <div ui-view ></div>

        <p class="copyright">
        </p> 


        <!-- JQuery -->
        <script src="<c:url value="/resource/js/jquery/jquery-1.11.3.min.js" />"></script>

        <!-- Angular Material Dependencies -->
        <script src="<c:url value="/resource/js/angular/angular.js" />"></script>
        <!--<script src="<c:url value="/resource/js/angular/angular.min.js" />"></script>-->
        <script src="<c:url value="/resource/js/angular/angular-animate.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-aria.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-ui-router.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-cookies.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-sanitize.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-touch.min.js" />"></script>

        <!-- Material -->
        <script src="<c:url value="/resource/js/materialize/materialize.min.js" />"></script>
        <script src="<c:url value="/resource/library/angular-material/angular-material.min.js" />"></script>


        <!-- Controllers do modulo -->
        <script type="text/javascript" src="<c:url value="/views/modules/login/login-main.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/login/controller/login-controller.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/login/services/account-service.js" />" ></script>
    </body>
</html>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>{{title}}</title>
        <jsp:include page="../../styles.jsp" />
        <link rel="stylesheet" href="<c:url value="/resource/css/custom/custom.css" />">
        <c:url value="/logout" var="logoutUrl" />
    </head>
    <body>
        <div class="row">
            <div class="header">
                <!-- HEADER -->
                <jsp:include page="../../../header.jsp" />
            </div>

            <!-- Conteudo -->
            <div class="row">
                <div ui-view class="container" ></div>
            </div>

        </div>

        <jsp:include page="../../scripts.jsp" />

        <!-- Controllers do modulo -->
        <!-- Project Controller / Services -->
        <script type="text/javascript" src="<c:url value="/views/modules/project/project-main.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/project/project/controller/project-controller.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/project/project/services/project-service.js" />" ></script>
        
        <!-- Cronograma Controller / Services -->
        <script type="text/javascript"  src="<c:url value="/views/modules/project/cronograma/controller/cronograma-controller.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/project/cronograma/services/cronograma-service.js" />" ></script>
    </body>
</html>

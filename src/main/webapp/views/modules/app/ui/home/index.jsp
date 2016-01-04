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
        <title>Home</title>
        <jsp:include page="../../styles.jsp" />
        <link rel="stylesheet" href="<c:url value="/resource/css/custom/custom.css" />">
        <c:url value="/logout" var="logoutUrl" />
    </head>
    <body>
        <div class="nav-wrapper">
            <header>
                <span class="truncate title">{{title}} <b>${pageContext.request.userPrincipal.principal.firstName}</b></span>
            </header>
        </div>

        <div ui-view ></div>

        <jsp:include page="../../scripts.jsp" />

        <!-- Controllers do modulo -->
        <script type="text/javascript" src="<c:url value="/views/modules/app/home-main.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/app/controller/home-controller.js" />" ></script>
    </body>
</html>

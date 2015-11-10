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
        <link rel="stylesheet" href="<c:url value="/resources/css/custom/custom.css" />">
        <c:url value="/logout" var="logoutUrl" />
    </head>
    <body>
        <nav>
            <div class="nav-wrapper">
                <header>
                    <span class="truncate title">{{title}} <b>${pageContext.request.userPrincipal.principal.firstName}</b></span>
                    <a href="#" data-activates="mobile-demo" class="button-collapse waves-effect waves-block"><i class="mdi-navigation-menu"></i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="${logoutUrl}" class="waves-effect waves-block" ><i class="mdi-action-exit-to-app"></i></a></li>
                    </ul>
                    <ul class="side-nav" id="mobile-demo">
                        <li><a href="${logoutUrl}" >Sair</a></li>
                    </ul>
                </header>
            </div>
        </nav>

        <div ui-view ></div>

        <jsp:include page="../../scripts.jsp" />

        <!-- Controllers do modulo -->
        <script type="text/javascript" src="<c:url value="/views/modules/home/home-main.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/home/controller/home-controller.js" />" ></script>
    </body>
</html>

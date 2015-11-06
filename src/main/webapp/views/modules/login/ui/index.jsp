<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../styles.jsp" />
        <title>Entre!</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/custom/login.css" />">
    </head>
    <body>
        <header>
            {{title}}
        </header>

        <div ui-view ></div>

        <p class="copyright">
        </p> 


        <jsp:include page="../../scripts.jsp" />

        <!-- Controllers do modulo -->
        <script type="text/javascript" src="<c:url value="/views/modules/login/login-main.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/login/controller/login-controller.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/login/services/account-service.js" />" ></script>
    </body>
</html>

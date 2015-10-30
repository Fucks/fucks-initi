<%-- 
    Document   : home
    Created on : 29/10/2015, 14:24:57
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is a HOME!</h1> <form action="<c:url value="/logout" />" method="post"><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button type="submit">Logout</button></form>
    </body>
</html>

<%-- 
    Document   : login
    Created on : 30/10/2015, 10:04:40
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1> Login </h1>
        <c:url value="/login" var="loginUrl"/>
        <c:url value="/logout" var="logoutUrl"/>
        <form action="${loginUrl}" method="post">       
            <c:if test="${param.error != null}">        
                <p>
                    Invalid username and password.
                </p>
            </c:if>
            <c:if test="${param.logout != null}">       
                <p>
                    You have been logged out.
                </p>
            </c:if>
            <p>
                <label for="username">Username</label>
                <input type="text" id="username" name="username"/>	
            </p>
            <p>
                <label for="password">Password</label>
                <input type="password" id="password" name="password"/>	
            </p>
            <input type="hidden"                        
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
            <button type="submit" class="btn">Log in</button>
        </form>
    </body>
</html>

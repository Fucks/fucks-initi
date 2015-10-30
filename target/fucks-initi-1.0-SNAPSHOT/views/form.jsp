<%-- 
    Document   : form
    Created on : 30/10/2015, 11:15:08
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/json; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Novo Usuario</h1>
        <form action="free" method="POST">
            <label>Nome</label>
            <input name="name" type="text" />
            <br />
            <label>E-mail</label>
            <input name="email" type="text" />
            <br />
            <label>usuario</label>
            <input name="username" type="text" />
            <br />
            <label>Password</label>
            <input name="password" type="text" />
            <br />
            <button type="submit" value="Cadastrar" >Cadastrar</button>
        </form>
    </body>
</html>

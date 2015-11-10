<%-- 
    Document   : header
    Created on : 10/11/2015, 09:44:07
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<nav>
    <c:url value="/logout" var="logoutUrl" />
    <div class="nav-wrapper">
        <header>
            <ul class="left hide-on-med-and-down">
                <li>
                    <a href="{{navigation}}" class="waves-effect waves-block left hide-on-med-and-down"><i class="material-icons">arrow_back</i></a>
                </li>
            </ul>
            <a href="#" data-activates="mobile-demo" class="button-collapse waves-effect waves-block left"><i class="mdi-navigation-menu"></i></a>
            <span class="truncate title left">{{title}}</span>

            <ul class="right hide-on-med-and-down">
                <li><a class="dropdown-button" href="#!" data-activates="usersettings">${pageContext.request.userPrincipal.principal.firstName}<i class="mdi-navigation-arrow-drop-down right"></i></a></li>
            </ul>

            <ul id="usersettings" class="dropdown-content">
                <li><a href="#!">Perfil</a></li>
                <li><a href="${logoutUrl}">Sair</a></li>
            </ul>

            <ul class="side-nav" id="mobile-demo">
                <li><a href="{{navigation}}" >Voltar</a></li>
                <li><a href="${logoutUrl}" >Sair</a></li>
            </ul>
        </header>
    </div>
</nav>
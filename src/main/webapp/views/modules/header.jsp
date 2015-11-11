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
                    <a ng-click="goToBack(navigation)" class="waves-effect waves-block left hide-on-med-and-down"><i class="material-icons">arrow_back</i></a>
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
<style>
    .loader-background{
        top: 88px;
        bottom: 0;
        right: 0;
        left: 0;
        background-color: #FFF;
        opacity: .7;
        position: absolute;
        z-index: 1002;
        color: #FFF;
    }
    .sk-fading-circle {
        margin: 100px auto;
        width: 40px;
        height: 40px;
        position: relative;
        z-index: 1003;
    }

    .sk-fading-circle .sk-circle {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
    }

    .sk-fading-circle .sk-circle:before {
        content: '';
        display: block;
        margin: 0 auto;
        width: 15%;
        height: 15%;
        background-color: #333;
        border-radius: 100%;
        -webkit-animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
        animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
    }
    .sk-fading-circle .sk-circle2 {
        -webkit-transform: rotate(30deg);
        -ms-transform: rotate(30deg);
        transform: rotate(30deg);
    }
    .sk-fading-circle .sk-circle3 {
        -webkit-transform: rotate(60deg);
        -ms-transform: rotate(60deg);
        transform: rotate(60deg);
    }
    .sk-fading-circle .sk-circle4 {
        -webkit-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
        transform: rotate(90deg);
    }
    .sk-fading-circle .sk-circle5 {
        -webkit-transform: rotate(120deg);
        -ms-transform: rotate(120deg);
        transform: rotate(120deg);
    }
    .sk-fading-circle .sk-circle6 {
        -webkit-transform: rotate(150deg);
        -ms-transform: rotate(150deg);
        transform: rotate(150deg);
    }
    .sk-fading-circle .sk-circle7 {
        -webkit-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
        transform: rotate(180deg);
    }
    .sk-fading-circle .sk-circle8 {
        -webkit-transform: rotate(210deg);
        -ms-transform: rotate(210deg);
        transform: rotate(210deg);
    }
    .sk-fading-circle .sk-circle9 {
        -webkit-transform: rotate(240deg);
        -ms-transform: rotate(240deg);
        transform: rotate(240deg);
    }
    .sk-fading-circle .sk-circle10 {
        -webkit-transform: rotate(270deg);
        -ms-transform: rotate(270deg);
        transform: rotate(270deg);
    }
    .sk-fading-circle .sk-circle11 {
        -webkit-transform: rotate(300deg);
        -ms-transform: rotate(300deg);
        transform: rotate(300deg); 
    }
    .sk-fading-circle .sk-circle12 {
        -webkit-transform: rotate(330deg);
        -ms-transform: rotate(330deg);
        transform: rotate(330deg); 
    }
    .sk-fading-circle .sk-circle2:before {
        -webkit-animation-delay: -1.1s;
        animation-delay: -1.1s; 
    }
    .sk-fading-circle .sk-circle3:before {
        -webkit-animation-delay: -1s;
        animation-delay: -1s; 
    }
    .sk-fading-circle .sk-circle4:before {
        -webkit-animation-delay: -0.9s;
        animation-delay: -0.9s; 
    }
    .sk-fading-circle .sk-circle5:before {
        -webkit-animation-delay: -0.8s;
        animation-delay: -0.8s; 
    }
    .sk-fading-circle .sk-circle6:before {
        -webkit-animation-delay: -0.7s;
        animation-delay: -0.7s; 
    }
    .sk-fading-circle .sk-circle7:before {
        -webkit-animation-delay: -0.6s;
        animation-delay: -0.6s; 
    }
    .sk-fading-circle .sk-circle8:before {
        -webkit-animation-delay: -0.5s;
        animation-delay: -0.5s; 
    }
    .sk-fading-circle .sk-circle9:before {
        -webkit-animation-delay: -0.4s;
        animation-delay: -0.4s;
    }
    .sk-fading-circle .sk-circle10:before {
        -webkit-animation-delay: -0.3s;
        animation-delay: -0.3s;
    }
    .sk-fading-circle .sk-circle11:before {
        -webkit-animation-delay: -0.2s;
        animation-delay: -0.2s;
    }
    .sk-fading-circle .sk-circle12:before {
        -webkit-animation-delay: -0.1s;
        animation-delay: -0.1s;
    }

    @-webkit-keyframes sk-circleFadeDelay {
        0%, 39%, 100% { opacity: 0; }
        40% { opacity: 1; }
    }

    @keyframes sk-circleFadeDelay {
        0%, 39%, 100% { opacity: 0; }
        40% { opacity: 1; } 
    }
</style>
<div class="loader-background" data-loading>
    <div class="sk-fading-circle" data-loading>
        <div class="sk-circle1 sk-circle"></div>
        <div class="sk-circle2 sk-circle"></div>
        <div class="sk-circle3 sk-circle"></div>
        <div class="sk-circle4 sk-circle"></div>
        <div class="sk-circle5 sk-circle"></div>
        <div class="sk-circle6 sk-circle"></div>
        <div class="sk-circle7 sk-circle"></div>
        <div class="sk-circle8 sk-circle"></div>
        <div class="sk-circle9 sk-circle"></div>
        <div class="sk-circle10 sk-circle"></div>
        <div class="sk-circle11 sk-circle"></div>
        <div class="sk-circle12 sk-circle"></div>
    </div>
</div>
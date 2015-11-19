<%-- 
    Document   : header
    Created on : 10/11/2015, 09:44:07
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:url value="/logout" var="logoutUrl" />
<div class="nav-wrapper" ng-cloak>
    <md-toolbar>
        <header>
            <div class="md-toolbar-tools">
                <md-button ng-click="goToBack(navigation)" class="md-icon-button" aria-label="Go Back">
                    <imd-icon class="material-icons">arrow_back</imd-icon>
                </md-button>
                <span class="truncate title left hide-sm">{{title}}</span>
                <span flex></span>
                <md-menu class="md-menu" style="margin: 0;">
                    <md-button class="md-button" 
                               aria-label="Open user menu" 
                               ng-click="$mdOpenMenu()" type="button" 
                               aria-haspopup="true" 
                               ng-transclude
                               aria-expanded="false"
                               style="height: 64px;top:-5px;">
                        <img class="toolbar-user-avatar ng-scope" src="resources/images/default_user.png">
                        <span class="ng-scope">
                            ${pageContext.request.userPrincipal.principal.firstName}
                        </span><div class="md-ripple-container"></div></md-button>
                    <md-menu-content width="4" class="md-white-cyan-theme">
                        <md-menu-item role="menuitem">
                            <md-button class="md-button md-white-cyan-theme md-ink-ripple" ng-transclude="" ng-click="vm.toggleNotificationsTab(2)" aria-label="side navigation">
                                <md-icon class="ng-scope ng-isolate-scope md-white-cyan-theme md-font zmdi zmdi-settings material-icons" aria-hidden="true">settings</md-icon>
                                <span class="ng-scope">Opções</span>
                                <div class="md-ripple-container"></div></md-button>
                        </md-menu-item>
                        <md-menu-item role="menuitem">
                            <md-button class="md-button md-white-cyan-theme md-ink-ripple" ng-transclude="" href="#/profile" aria-label="side navigation">
                                <md-icon md-font-icon="zmdi zmdi-account" class="ng-scope ng-isolate-scope md-white-cyan-theme md-font zmdi zmdi-account material-icons" aria-hidden="true">person</md-icon>
                                <span class="ng-scope">Profile</span>
                            </md-button>
                        </md-menu-item>
                        <md-menu-divider role="separator"></md-menu-divider>
                        <md-menu-item role="menuitem">
                            <md-button class="md-button md-white-cyan-theme md-ink-ripple" ng-transclude="" href="${logoutUrl}" aria-label="side navigation">
                                <md-icon class="ng-scope ng-isolate-scope md-white-cyan-theme md-font zmdi zmdi-sign-in material-icons" aria-hidden="true">exit_to_app</md-icon>
                                <span  class="ng-scope">Sair</span>
                            </md-button>
                        </md-menu-item>
                    </md-menu-content>
                </md-menu>
            </div>
        </header>

    </md-toolbar>


</div>
<style type="text/css">
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
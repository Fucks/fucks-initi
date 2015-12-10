<%-- 
    Document   : home
    Created on : 06/11/2015, 10:26:47
    Author     : wellington.fucks
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="user-module" var="userModule" />
<c:url value="projeto" var="projetoModule" />
<div class="container valign-center">
    <div class="row">
        <div class="col s12 m6 l3 valign">
            <a href="${userModule}">
                <div class="card-panel waves-effect home-menu center-align">
                    <i class="material-icons medium">add</i>
                    <h4 class="hide-on-small-only">Novo</h4>
                </div>
            </a>
        </div>
        <div class="col s12 m6 l3 valign">
            <a href="${projetoModule}">
                <div class="card-panel waves-effect home-menu center-align">
                    <i class="material-icons medium">schedule</i>
                    <h4 class="hide-on-small-only">Projetos</h4>
                </div>
            </a>
        </div>
        <div class="col s12 m6 l3 valign">
            <div class="card-panel waves-effect home-menu center-align">
                <i class="material-icons medium">person</i>
                <h4 class="hide-on-small-only">Profile</h4>
            </div>
        </div>
        <div class="col s12 m6 l3 valign">
            <div class="card-panel waves-effect home-menu center-align">
                <i class="material-icons medium">settings</i>
                <h4 class="hide-on-small-only">Opções</h4>
            </div>
        </div>

        <div class="col s12 m6 l3 valign">
            <div class="card-panel waves-effect home-menu center-align">
                <i class="material-icons medium">exit_to_app</i>
                <h4 class="hide-on-small-only">Sair</h4>
            </div>
        </div>
    </div>
</div>
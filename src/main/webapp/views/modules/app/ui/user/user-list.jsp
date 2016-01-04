<%-- 
    Document   : home
    Created on : 06/11/2015, 10:26:47
    Author     : wellington.fucks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<div>
    <div class="row" style="margin-top: 10px;margin-bottom: 8px;">
        <div class="col s12 m6 l6">
            <md-input-container class="md-icon-float md-block" style="margin-top: 0;">
                <!-- Use floating label instead of placeholder -->
                <label>Buscar por usuários</label>
                <md-icon><i class="material-icons">search</i></md-icon>
                <input type="text" ng-model="controller.currentPage.query" ng-keyup="$event.keyCode == 13 && controller.loadUsers()" >
            </md-input-container>
        </div>
        <div class="col s12 m6 l6 ">
            <div class="input-field right">
                <button class="waves-effect waves-light btn light-blue" ng-click="controller.loadUsers()"><i class="mdi-content-filter-list left"></i><span class="hide-on-med-only">Filtrar</span></button>
                <button class="waves-effect waves-light btn light-blue"><i class="mdi-file-file-download left"></i><span class="hide-on-med-only">Importar</span></button>
            </div>
        </div>
    </div>
    <div class="col s12 m12 l12 valign">
        <div class="row">
            <div class="col s12 m12 l12 card-panel" style="padding: 0">
                <jsp:include page="table.jsp" />
            </div>
        </div>
    </div>
    <div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
        <a class="btn-floating waves-effect orange darken-3 waves-light btn-large" ng-click="controller.changeToNew()">
            <i class="material-icons">add</i>
        </a>
    </div>
</div>

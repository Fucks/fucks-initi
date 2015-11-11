<%-- 
    Document   : home
    Created on : 06/11/2015, 10:26:47
    Author     : wellington.fucks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
    <div class="row" style="margin-top: 10px ">
        <div class="col s12 m6 l6">
            <div class="input-field">
                <i class="mdi-action-search prefix"></i>
                <input id="icon_prefix" type="text" ng-model="currentPage.query" ng-keyup="$event.keyCode == 13 && loadUsers()" >
                <label for="icon_prefix">Buscar por usuários</label>
            </div>
        </div>
        <div class="col s12 m6 l6 ">
            <div class="input-field right">
                <button class="waves-effect waves-light btn light-blue" ng-click="loadUsers()"><i class="mdi-content-filter-list left"></i><span class="hide-on-med-only">Filtrar</span></button>
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
        <a class="btn-floating waves-effect orange darken-3 waves-light btn-large" ng-click="changeToNew()">
            <i class="material-icons">add</i>
        </a>
    </div>
</div>

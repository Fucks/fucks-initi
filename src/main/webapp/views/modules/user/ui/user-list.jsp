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
    <div class="col s12 m12 l12 valign card-panel">
        <div class="row">
            <div class="col s12 m12 l12">
                <table class="responsive-table">
                    <thead>
                        <tr>
                            <th data-field="firstname" class="grey-text text-darken-4" >Nome</th>
                            <th data-field="username" class="grey-text text-darken-4" >Usuário</th>
                            <th data-field="email" class="grey-text text-darken-4" >Email</th>
                            <th data-field="actions"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="user in currentPage.content">
                            <td width="40%">{{user.firstName}} {{user.lastName}}</td>
                            <td width="20%">{{user.username}}</td>
                            <td width="30%">{{user.email}}</td>
                            <td width="15%">
                                <i class="waves-effect material-icons blue-grey-text text-lighten-2" style="margin-right: 5px">mode_edit</i>
                                <i class="waves-effect material-icons blue-grey-text text-lighten-2" style="margin-right: 5px">remove_circle</i>
                                <i class="waves-effect material-icons blue-grey-text text-lighten-2">delete</i>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div ng-show="currentPage.content.length == 0">
                    <h5>Nenhum usuário encontrado.</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
        <a class="btn-floating btn-large light-blue">
            <i class="material-icons">add</i>
        </a>
    </div>
</div>

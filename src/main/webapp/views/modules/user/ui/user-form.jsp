<%-- 
    Document   : user-form
    Created on : Nov 10, 2015, 9:13:21 PM
    Author     : Fucks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row">
    <div class="col s12 m12 l12 valign card-panel">
        <div class="section">
            <form name="form" class="col s12">
                <div class="input-field col s12 m6">
                    <input id="firstname" ng-model="currentEntity.firstName" required type="text" focus ng-disabled="{{currentState == DETAIL_STATE}}">
                    <label for="firstname" ng-class="{
                            'active'
                            :currentState != INSERT_STATE}">Nome </label>
                </div>
                <div class="input-field col s12 m6">
                    <input id="lastname" ng-model="currentEntity.lastName" required type="text"  ng-disabled="{{currentState == DETAIL_STATE}}">
                    <label for="lastname" ng-class="{
                            'active'
                            :currentState != INSERT_STATE}">Sobrenome </label>
                </div>
                <div class="input-field col s12 m6">
                    <input id="username" ng-model="currentEntity.username" required type="text"  ng-disabled="{{currentState == DETAIL_STATE}}">
                    <label for="username" ng-class="{
                            'active'
                            :currentState != INSERT_STATE}">Usuário</label>
                </div>
                <div class="input-field col s12 m6">
                    <input id="email" ng-model="currentEntity.email" required type="text"  ng-disabled="{{currentState == DETAIL_STATE}}">
                    <label for="email" ng-class="{
                            'active'
                            :currentState != INSERT_STATE}">E-mail</label>
                </div>
                <div class="input-field col s12 m6">
                    <input id="password" ng-model="currentEntity.password" required type="password"  ng-disabled="{{currentState == DETAIL_STATE}}">
                    <label for="password" ng-class="{
                            'active'
                            :currentState != INSERT_STATE}">Senha</label>
                </div>
                <div class="input-field col s12 m6">
                    <input id="confirm-password" ng-model="confirmPassword" required type="password"  ng-disabled="{{currentState == DETAIL_STATE}}">
                    <label for="confirm-password">Confirmar senha</label>
                </div>
                <div class="section right">
                    <div class="col s12">
                        <a class="waves-effect waves-light btn light-blue" ng-show="currentState == EDIT_STATE" ng-click="update()"><i class="material-icons left">save</i>Atualizar</a>
                        <a class="waves-effect waves-light btn light-blue" ng-show="currentState == INSERT_STATE" ng-click="insert()"><i class="material-icons left">save</i>salvar</a>
                        <a class="btn-orange btn-flat waves-effect waves-orange" ng-click="changeToList()"><i class="material-icons left">cancel</i>cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
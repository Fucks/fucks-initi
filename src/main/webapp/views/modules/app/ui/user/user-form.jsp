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
                <div layout-gt-sm="row">
                    <md-input-container class="md-block" flex-gt-sm>
                        <label>Nome </label>
                        <input id="firstname" ng-model="controller.currentEntity.firstName" required type="text" focus ng-disabled="{{controller.currentState == controller.DETAIL_STATE}}">
                    </md-input-container>
                    <md-input-container class="md-block" flex-gt-sm>
                        <label>Sobrenome </label>
                        <input id="lastname" ng-model="controller.currentEntity.lastName" required type="text"  ng-disabled="{{controller.currentState == controller.DETAIL_STATE}}">
                    </md-input-container>
                </div>
                <div layout-gt-sm="row">
                    <md-input-container class="md-block" flex-gt-sm>
                        <label>Usuário</label>
                        <input id="username" ng-model="controller.currentEntity.username" required type="text"  ng-disabled="{{controller.currentState == controller.DETAIL_STATE}}">
                    </md-input-container>
                    <md-input-container class="md-block" flex-gt-sm>
                        <label>E-mail</label>
                        <input id="email" ng-model="controller.currentEntity.email" required type="text"  ng-disabled="{{controller.currentState == controller.DETAIL_STATE}}">
                    </md-input-container>
                </div>
                <div layout-gt-sm="row">
                    <md-input-container class="md-block" flex-gt-sm>
                        <label>Senha</label>
                        <input id="password" ng-model="controller.currentEntity.password" required type="password"  ng-disabled="{{controller.currentState == controller.DETAIL_STATE}}">
                    </md-input-container>
                    <md-input-container class="md-block" flex-gt-sm>
                        <label>Confirmar senha</label>
                        <input id="confirm-password" ng-model="controller.confirmPassword" required type="password"  ng-disabled="{{controller.currentState == controller.DETAIL_STATE}}">
                    </md-input-container>
                </div>
                <div flex-gt-sm="40">
                    <md-input-container class="md-block" flex-gt-sm>
                        <md-select placeholder="Selecione o Perfil de acesso" ng-model="controller.currentEntity.profile">
                            <md-option ng-value="profile" ng-selected="controller.currentEntity.profile.name" ng-repeat="profile in controller.profiles">{{profile.name}}</md-option>
                        </md-select>
                    </md-input-container>
                </div>
                <div class="input-field col s12">
                    <div class="section right">
                        <div class="col s12">
                            <a class="waves-effect waves-light btn light-blue" ng-show="controller.currentState == controller.EDIT_STATE" ng-click="controller.update()"><i class="material-icons left">save</i>Atualizar</a>
                            <a class="waves-effect waves-light btn light-blue" ng-show="controller.currentState == controller.INSERT_STATE" ng-click="controller.insert()"><i class="material-icons left">save</i>salvar</a>
                            <a class="btn-orange btn-flat waves-effect waves-orange" ng-click="controller.changeToList()"><i class="material-icons left">cancel</i>cancelar</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
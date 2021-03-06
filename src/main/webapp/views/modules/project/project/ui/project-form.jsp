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
                    <input id="firstname" ng-model="currentEntity.name" required type="text" focus >
                    <label for="firstname" ng-class="{
                            'active'
                            :currentState != INSERT_STATE}">Nome </label>
                </div>
                <div class="input-field col s12 m6">
                    <textarea id="lastname" ng-model="currentEntity.description" required type="text" ></textarea>
                    <label for="lastname" ng-class="{
                            'active'
                            :currentState != INSERT_STATE}">Descrição </label>
                </div>
                <div class="input-field col s12">
                    <div class="section right">
                        <div class="col s12">
                            <a class="waves-effect waves-light btn light-blue" ng-show="currentState == EDIT_STATE" ng-click="update()"><i class="material-icons left">save</i>Atualizar</a>
                            <a class="waves-effect waves-light btn light-blue" ng-show="currentState == INSERT_STATE" ng-click="insert()"><i class="material-icons left">save</i>salvar</a>
                            <a class="btn-orange btn-flat waves-effect waves-orange" ng-click="changeToList()"><i class="material-icons left">cancel</i>cancelar</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
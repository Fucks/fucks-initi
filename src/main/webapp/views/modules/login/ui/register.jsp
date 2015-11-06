<%-- 
    Document   : register
    Created on : 04/11/2015, 16:47:54
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="register">
    <div class="row">
        <h5 class="center-align">
            Forneça seus dados para criação de conta
        </h5>
    </div>
    <form name="registerForm">
        <div class="row">
            <div class="input-field col s12">
                <input id="name" ng-model="currentRegisterer.name" required type="text">
                <label for="name">Nome Completo</label>
                <div role="alert">
                    <span class="error" ng-show="registerForm.userName.$error.required">
                        Required!</span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <input id="username" ng-model="currentRegisterer.username" required type="text">
                <label for="username">Usuário</label>
            </div>
            <div class="input-field col s6">
                <input id="email" ng-model="currentRegisterer.email" required type="text">
                <label for="email">E-mail</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <input id="password" ng-model="currentRegisterer.password" required type="password">
                <label for="password">Senha</label>
            </div>
            <div class="input-field col s6">
                <input id="confirm-password" ng-model="confirmPassword" required type="password">
                <label for="confirm-password">Confirmar senha</label>
            </div>
        </div>

        <div class="row">
            <div class="center-align">
                <button class="btn waves-effect waves-light" type="button" ng-click='registerer()'>Cadastrar
                </button>
            </div>
        </div>
    </form>
    <footer><a href="#" ng-click='goToLogin()'>Entrar</a></footer>
</div>

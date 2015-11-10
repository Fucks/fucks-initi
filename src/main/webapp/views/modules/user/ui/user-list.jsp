<%-- 
    Document   : home
    Created on : 06/11/2015, 10:26:47
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container valign-center">
    <div class="row">
        <div class="col s12 m12 l12 valign card-panel">
            <h5 class="left-align">Usuários já cadastrados</h5>

            <div class="row"  >
                <div class="col s12 m12 l12" ng-repeat="user in users">
                    <div class="card-panel lighten-5 z-depth-1 waves-effect waves-block">
                        <div class="valign-wrapper">
                            <div class="col s1 m1 l1">
                                <img src="resources/images/default_user.png"  height="50" width="50" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
                            </div>
                            <div class="col s10">
                                <div class="col s12 m12 l12">
                                    <label for="first_name">Nome: </label>
                                    <span id="first_name" class="black-text">{{user.firstName}} {{user.lastName}}</span>
                                </div>
                                <div class="col s12 m6 l6">
                                    <label for="username">Usuário: </label>
                                    <span id="username">{{user.username}}</span>
                                </div>
                                <div class="col s12 m6 l6">
                                    <label for="email">Email: </label>
                                    <span id="email">{{user.email}}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
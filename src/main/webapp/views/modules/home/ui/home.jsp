<%-- 
    Document   : home
    Created on : 06/11/2015, 10:26:47
    Author     : wellington.fucks
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="user-module" var="userModule" />
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
            <div class="card-panel waves-effect home-menu center-align">
                <i class="material-icons medium">cloud_download</i>
                <h4 class="hide-on-small-only">Download</h4>
            </div>
        </div>
        <div class="col s12 m6 l3 valign">
            <div class="card-panel waves-effect home-menu center-align">
                <i class="material-icons medium">file_download</i>
                <h4 class="hide-on-small-only">Cloud </h4>
            </div>
        </div>
        <div class="col s12 m6 l3 valign">
            <div class="card-panel waves-effect home-menu center-align">
                <i class="material-icons medium">font_download</i>
                <h4 class="hide-on-small-only">Upload</h4>
            </div>
        </div>
        <div class="col s12 m6 l3 valign">
            <div class="card-panel waves-effect home-menu center-align">
                <i class="material-icons medium">account_balance</i>
                <h4 class="hide-on-small-only">Cloud </h4>
            </div>
        </div>
        <div class="col s12 m6 l3 valign">
            <div class="card-panel waves-effect home-menu center-align">
                <i class="material-icons medium">add</i>
                <h4 class="hide-on-small-only">Download</h4>
            </div>
        </div>
    </div>
</div>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="login">
    <i ripple>
    </i>
    <div class="photo">
    </div>
    <span>Forne�a seus dados para autentica��o</span>
    <c:url value="/login" var="loginUrl" />
    <form action="${loginUrl}" id="login-form" method="POST">
        <div class="row">
            <div class="input-field col s12">
                <input id="username" name="username" type="text" ng-class="{'invalid' : error == 1}">
                <label for="username">Usu�rio</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input id="password" name="password" type="password" ng-class="{'invalid' : error == 1}">
                <label for="password">Senha</label>
            </div>
        </div>
        <div class="form-group">
            <input id="stay-signed" type="checkbox" >
            <label for="stay-signed">Permanecer logado.</label>
            <button class="btn waves-effect waves-light" type="submit">Entrar 
                <i class="zmdi zmdi-mail-send"></i>
            </button>
        </div>
    </form>
    <footer><a href="#0">Create an account</a></footer>
</div>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="login">
    <i ripple>
    </i>
    <div class="photo">
    </div>
    <span>Forneça seus dados para autenticação</span>
    <c:url value="/login" var="loginUrl" />
    <form action="${loginUrl}" id="login-form" method="POST">
        <div class="row">
            <div class="input-field col s12">
                <input id="username" name="username" type="text" focus ng-class="{'invalid' : error == 1}">
                <label for="username">Usuário</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input id="password" name="password" type="password" ng-class="{'invalid' : error == 1}">
                <label for="password">Senha</label>
            </div>
        </div>
        <div class="form-group">
            <input id="remember-me" name="remember-me" type="checkbox" >
            <label for="remember-me">Permanecer logado.</label>
            <button class="btn waves-effect waves-light" type="submit" name="action">Entrar
                <i class="material-icons right">send</i>
            </button>
        </div>
    </form>
    <footer><a href="#" ng-click='goToRegister()'>Criar uma conta</a></footer>
</div>
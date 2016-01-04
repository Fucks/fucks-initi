<md-data-table-toolbar class="alternate" ng-show="controller.selected.length" layout-align="space-between">
    <div>{{controller.selected.length}} {{controller.selected.length > 1 ? 'registros selecionados' : 'registro selecionado'}}</div>
    <md-button class="md-icon-button" ng-click="controller.remove($event)">
        <i class="material-icons md-dark">delete</i>
    </md-button>
</md-data-table-toolbar>

<md-data-table-container>
    <table md-data-table md-row-select="controller.selected" md-progress="deferred" class="md-primary">
        <thead md-order="query.order" md-trigger="onPaginationChange" orderBy="entity.firstName">
            <tr>
                <th name="Nome" order-by="firstName"></th>
                <th name="E-mail" order-by="email"></th>
                <th name="Usuário" order-by="username"></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="entity in controller.currentPage.content">
                <td>{{entity.firstName}} {{entity.lastName}}</td>
                <td>{{entity.email}}</td>
                <td>{{entity.username}}</td>
                <td><a class="btn-flat waves-effect" style="padding: 0 10px;" ng-click="controller.changeToEdit(entity.id)"><i class="material-icons">mode_edit</i></a></td>
            </tr>
        </tbody>
    </table>
</md-data-table-container>

<md-data-table-pagination md-limit='controller.currentPage.size' md-max='controller.currentPage.totalPages' md-page="controller.currentPage.pageNumber" md-total="{{controller.currentPage.totalElements}}" md-trigger="controller.onPaginationChange"></md-data-table-pagination>
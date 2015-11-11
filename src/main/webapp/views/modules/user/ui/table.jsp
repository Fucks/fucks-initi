<md-data-table-toolbar class="alternate" ng-show="selected.length" layout-align="space-between">
    <div>{{selected.length}} {{selected.length > 1 ? 'registros selecionados' : 'registro selecionado'}}</div>
    <md-button class="md-icon-button" ng-click="delete($event)">
        <i class="material-icons md-dark">delete</i>
    </md-button>
</md-data-table-toolbar>

<md-data-table-container>
    <table md-data-table md-row-select="selected" md-progress="deferred" class="md-primary">
        <thead md-order="query.order" md-trigger="onChange">
            <tr>
                <th name="Nome" order-by="firstName"></th>
                <th name="E-mail" order-by="email"></th>
                <th name="Usuário" order-by="username"></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="entity in currentPage.content">
                <td>{{entity.firstName}} {{entity.lastName}}</td>
                <td>{{entity.email}}</td>
                <td>{{entity.username}}</td>
                <td><a class="btn-flat waves-effect" style="padding: 0 10px;" ng-click="changeToEdit(entity.id)"><i class="material-icons">mode_edit</i></a></td>
            </tr>
        </tbody>
    </table>
</md-data-table-container>

<md-data-table-pagination md-limit='currentPage.size' md-max='currentPage.totalPages' md-page="currentPage.pageNumber" md-total="{{currentPage.totalElements}}" md-trigger="onPaginationChange"></md-data-table-pagination>
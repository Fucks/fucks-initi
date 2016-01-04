<%-- 
    Document   : edit-task-dialog-template
    Created on : 17/12/2015, 11:23:26
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<md-dialog aria-label="Editar atividade"  ng-cloak style="max-height: 95%;">
    <md-toolbar class="resource-header">
        <div class="md-toolbar-tools">
            <h2>Editar atividade</h2>
            <span flex></span>
            <md-button class="md-icon-button" aria-label="Close" ng-click="cancelar()">
                <md-icon><i class="material-icons" style="color: #373737;">close</i></md-icon>
            </md-button>
        </div>
    </md-toolbar>
    <md-dialog-content>
        <md-tabs md-dynamic-height md-border-bottom>
            <md-tab label="Informações">
                <md-content class="md-padding" style="height: 444px;width: 690px;">
                    <div class="md-dialog-content">
                        <div layout-gt-sm="row">
                            <md-input-container class="md-block" flex-gt-sm>
                                <label>Nível</label>
                                <input ng-model="currentTask.code" disabled>
                            </md-input-container>
                        </div>
                        <div layout-gt-sm="row">
                            <md-input-container class="md-block" flex-gt-sm>
                                <label>Atividade</label>
                                <input ng-model="currentTask.name">
                            </md-input-container>
                            <md-input-container class="md-block" flex-gt-sm>
                                <label>Progresso</label>
                                <input ng-model="currentTask.progress" type="number">
                            </md-input-container>
                        </div>
                        <md-input-container class="md-block">
                            <label>Descrição</label>
                            <textarea ng-model="currentTask.description" columns="50" rows="5"></textarea>
                        </md-input-container>
                        <div layout-gt-sm="row">
                            <md-input-container class="md-block" flex-gt-sm>
                                <label>Duração</label>
                                <input ng-model="currentTask.duration" ng-change="durationCallback()" max="100" type="number">
                            </md-input-container>
                            <div class="input-field">
                                <md-datepicker id="startDate" flex-gt-sm ng-model="currentTask.startDate" 
                                               ng-change="changeStartDateCallback(currentTask.startDate)" 
                                               style="margin-top: 17px"
                                               md-placeholder="Data Inicial">
                                </md-datepicker>
                                <label for="startDate" class="active">Data inicial</label>
                            </div>
                            <div class="input-field">
                                <md-datepicker id="endDate" flex-gt-sm ng-model="currentTask.endDate" 
                                               ng-change="changeEndDateCallback(currentTask.endDate)" 
                                               style="margin-top: 17px"
                                               md-placeholder="Data Final">
                                </md-datepicker>
                                <label for="endDate" class="active">Data final</label>
                            </div>
                        </div>
                        <div layout-gt-sm="row">
                        </div>
                    </div>
                </md-content>
            </md-tab>
            <md-tab label="Recursos">
                <md-content class="md-padding" style="height: 444px;width: 690px;">
                    <md-data-table-toolbar class="alternate" ng-show="selectedResources.length" layout-align="space-between">
                        <div>{{selectedResources.length}} {{selectedResources.length > 1 ? 'registros selecionados' : 'registro selecionado'}}</div>
                        <md-button class="md-icon-button" ng-click="removeResourceTask($event)">
                            <i class="material-icons md-dark">delete</i>
                        </md-button>
                    </md-data-table-toolbar >
                    <md-data-table-toolbar  ng-show="!selectedResources.length">
                        <div flex></div>
                        <md-button class="md-icon-button" ng-click="addAssign()">
                            <i class="material-icons md-dark">add</i>
                            <md-tooltip>
                                Alocar recurso
                            </md-tooltip>
                        </md-button>
                    </md-data-table-toolbar>

                    <md-data-table-container>
                        <table md-data-table md-row-select="selectedResources" md-progress="deferred" class="md-primary">
                            <thead md-order="query.order" md-trigger="onPaginationChange" orderBy="entity.firstName">
                                <tr>
                                    <th name="Nome" order-by="name"></th>
                                    <th name="UN"></th>
                                    <th name="Porcentagem"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="entity in currentTask.assigs">
                                    <td style="width: 200px">
                                        <md-select ng-model="entity.assignment" placeholder="Selecione o Recurso">
                                            <md-option ng-value="resource" ng-repeat="resource in projectResources">{{resource.name}}</md-option>
                                        </md-select>
                                    </td>
                                    <td style="width: 80px">{{entity.unit}}</td>
                                    <td style="width: 80px"><input type="text" dir="rtl" name="duration" ng-value="{{entity.percent}}" style="margin: 0;">
                                </tr>
                            </tbody>
                        </table>
                    </md-data-table-container>
                </md-content>
            </md-tab>
        </md-tabs>
    </md-dialog-content>
    <md-dialog-actions layout="row" style="order:2; padding: 10px">
        <span flex></span>
        <button class="btn-orange btn-flat waves-effect waves-orange" ng-click="cancelar()"><i class="material-icons left">cancel</i>cancelar</button>
        <button class="waves-effect waves-light btn green" ng-click="salvar()" style="margin: 0 15px"><i class="material-icons left">save</i><span class="hide-on-med-only">Salvar</span></button>
    </md-dialog-actions>
</md-dialog>
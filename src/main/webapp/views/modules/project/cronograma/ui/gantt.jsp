<%-- 
    Document   : gantt
    Created on : 07/12/2015, 11:31:48
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!-- adiciona os imports necessários -->
<div class="page-content">
    <div class="col s12 m12 l12">
        <div class="col s12">
            <div class="row" style="margin-top: 10px ">
                <div class="col s12 m6 l6">
                    <div class="input-field">
                    </div>
                </div>
                <div class="col s12 m6 l6 ">
                    <div class="input-field right">
                        <button class="waves-effect waves-light btn light-blue" ng-click="showAdvanced($event)"><i class="material-icons">settings</i></button>
                        <button class="waves-effect waves-light btn light-blue" ng-click="viewResources()"><i class="material-icons left">person_add</i><span class="hide-on-med-only">Add Recurso</span></button>
                        <button class="waves-effect waves-light btn green" ng-click="saveGanttOnServer()"><i class="material-icons left">save</i><span class="hide-on-med-only">Salvar</span></button>
                    </div>
                </div>
            </div>
        </div>
        <div id="resourcesContent" ng-hide="{{!showResourceContent}}" layout="column" class="col s12 card-panel" ng-class="{'ng-hide' : !showResourceContent}">
            <md-toolbar class="resource-header">
                <div class="md-toolbar-tools">
                    <h2 class="md-flex">Equipe do Projeto</h2>
                    <span flex></span>
                    <md-button class="md-icon-button" aria-label="Close" ng-click="viewResources()">
                        <md-icon><i class="material-icons" style="color: #373737;">close</i></md-icon>
                    </md-button>
                </div>
            </md-toolbar>
            <div flex layout="row">
                <div flex layout="column" style="overflow: auto;">
                    <md-content flex layout-margin>
                        <md-list>
                            <md-list-item class="sm-3-line" ng-repeat="entity in projectResources">
                                <img class="face" src="resource/images/default_user.png">
                                <div class="md-list-item-text">
                                    <h4>{{entity.name}}</h4>
                                    <p>{{entity.occupation}} - {{entity.profile}}</p>
                                </div>
                                <md-button class="md-icon-button md-secondary" aria-label="Close" ng-click="removeResourceInProject(entity)">
                                    <md-icon><i class="material-icons" style="color: #373737;">delete</i></md-icon>
                                </md-button>
                                <md-divider md-inset ng-if="!$last"></md-divider>
                            </md-list-item>
                        </md-list>
                    </md-content>
                </div>
                <div flex layout="column">
                    <md-content flex layout-margin>
                        <h2 class="md-flex">Alocar novo recurso no projeto</h2>
                        <form>
                            <div layout layout-sm="column">
                                <md-input-container flex>
                                    <label>Nome</label>
                                    <input ng-model="resource.name">
                                </md-input-container>
                            </div>
                            <div layout layout-sm="column">
                                <md-input-container flex>
                                    <label>Cargo</label>
                                    <input ng-model="resource.occupation">
                                </md-input-container>
                                <md-input-container flex>
                                    <label>Perfil</label>
                                    <input ng-model="resource.profile">
                                </md-input-container>
                            </div>
                            <div class="input-field col s12">
                                <div class="section right">
                                    <div class="col s12">
                                        <button class="waves-effect waves-light btn light-blue" ng-click="addResourceInProject(resource)"><i class="material-icons left">save</i>Salvar</button>
                                        <button class="waves-effect waves-light btn" ng-click="resource = {}"><i class="material-icons left">cancel</i>Limpar</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </md-content>
                </div>
            </div>
        </div>
        <div class="col s1" ng-hide="{{showResourceContent}}" ng-class="{'ng-hide' : showResourceContent}">
            <div class="noprint">
                <div class="tools-buttons">
                    <md-button onclick="$('#workSpace').trigger('undo.gantt');" class="md-raised md-icon-button" aria-label="Desfazer">
                        <md-icon><i class="material-icons">undo</i></md-icon>
                        <md-tooltip md-direction="left">
                            Desfazer
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('redo.gantt');" class="md-raised md-icon-button" aria-label="Refazer">
                        <md-icon><i class="material-icons">redo</i></md-icon>
                        <md-tooltip md-direction="left">
                            Refazer
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('addAboveCurrentTask.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">vertical_align_top</i></md-icon>
                        <md-tooltip md-direction="left">
                            Inserir atividade acima
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('addBelowCurrentTask.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">vertical_align_bottom</i></md-icon>
                        <md-tooltip md-direction="left">
                            Inserir atividade abaixo
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('indentCurrentTask.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">arrow_forward</i></md-icon>
                        <md-tooltip md-direction="left">
                            Avançar
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('outdentCurrentTask.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">arrow_back</i></md-icon>
                        <md-tooltip md-direction="left">
                            Recuar
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('moveUpCurrentTask.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">arrow_upward</i></md-icon>
                        <md-tooltip md-direction="left">
                            Mover para cima
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('moveDownCurrentTask.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">arrow_downward</i></md-icon>
                        <md-tooltip md-direction="left">
                            Mover para baixo
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('zoomPlus.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">zoom_in</i></md-icon>
                        <md-tooltip md-direction="left">
                            Mais zoom
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('zoomMinus.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">zoom_out</i></md-icon>
                        <md-tooltip md-direction="left">
                            Menos zoom
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="$('#workSpace').trigger('deleteCurrentTask.gantt');" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">delete</i></md-icon>
                        <md-tooltip md-direction="left">
                            Excluir atividade
                        </md-tooltip>
                    </md-button>
                    <md-button onclick="print();" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">print</i></md-icon>
                        <md-tooltip md-direction="left">
                            Imprimir
                        </md-tooltip>
                    </md-button>
                    <md-button ng-click="showCriticalPath()" class="md-raised md-icon-button" aria-label="More">
                        <md-icon><i class="material-icons">timeline</i></md-icon>
                        <md-tooltip md-direction="left">
                            Caminho critico
                        </md-tooltip>
                    </md-button>
                </div>
            </div>
        </div>
        <div  id="workSpace" ng-hide="{{showResourceContent}}"  class="col s11 card-panel" ng-class="{'ng-hide' : showResourceContent}" style="padding: 0">
            <div id="taZone" style="display:none;" class="noprint">
                <textarea rows="8" cols="150" style="display:none;" id="ta">
                    {"tasks":[],"deletedTaskIds":[],"resources":[{"id":"tmp_1","name":"Resource 1","$$hashKey":"object:86"},{"id":"tmp_2","name":"Resource 2","$$hashKey":"object:87"},{"id":"tmp_3","name":"Resource 3","$$hashKey":"object:88"},{"id":"tmp_4","name":"Resource 4","$$hashKey":"object:89"},{"id":"tmp_5","name":"Resource 5","$$hashKey":"object:90"},{"id":"tmp_6","name":"Resource 6","$$hashKey":"object:91"},{"id":"tmp_7","name":"Resource 7","$$hashKey":"object:92"},{"id":"tmp_8","name":"Resource 8","$$hashKey":"object:93"},{"id":"tmp_9","name":"Resource 9","$$hashKey":"object:94"},{"id":"tmp_10","name":"Resource 10","$$hashKey":"object:95"},{"name":"asdas","occupation":"dasdas","profile":"dasdasd","$$hashKey":"object:149"},{"name":"dddd","occupation":"dddd","profile":"ddddd","$$hashKey":"object:154"},{"name":"asdasdas","occupation":"dasdasdas","profile":"dasdasdasd","$$hashKey":"object:159"}],"roles":[{"id":"tmp_1","name":"Project Manager"},{"id":"tmp_2","name":"Worker"},{"id":"tmp_3","name":"Stakeholder/Customer"}],"canWrite":true,"canWriteOnParent":true,"splitterPosition":90,"zoom":"m"}
                </textarea>

                <button ng-click="loadGanttFromServer();" style="display:none;">load</button>
            </div>
        </div>

    </div>
</div>

<div id="gantEditorTemplates" style="display:none;">


    <div class="__template__" type="GANTBUTTONS">
        <!--
        -->
    </div>

    <div class="__template__" type="TASKSEDITHEAD">
        <!--
    <table md-data-table md-row-select="selected" md-progress="deferred" class="gdfTable md-primary ">
          <thead>
            <tr>
              <th style="width:35px;">#</th>
              <th style="width:50px;"></th>
              <th style="width:80px;">Nível</th>
              <th style="width:300px;">Atividade</th>
              <th style="width:120px;">Data Inicial</th>
              <th style="width:120px;">Data Final</th>
              <th style="width:100px;">Duração</th>
              <th style="width:80px;">Dependencias</th>
              <th style="width:200px;">Recursos</th>
            </tr>
          </thead>
        </table>
        -->
    </div>

    <div class="__template__" type="TASKROW"><!--
        <tr taskId="(#=obj.inprojectId#)" class="taskEditRow" level="(#=level#)">
            <td class="edit" style="cursor:pointer;"><span class="taskRowIndex">(#=obj.getRow()+1#)</span></td>
            <td class="noClip" align="center"><div class="taskStatus cvcColorSquare" status="(#=obj.status#)"></div></td>
            <td style="padding: 10px;"><input type="text" dir="rtl" name="code" disabled='true' value="(#=obj.code#)"></td>
            <td class="indentCell" style="padding-left:(#=obj.level*10#)px;">
                <div class="(#=obj.isParent()?'exp-controller expcoll exp':'exp-controller'#)" align="center"></div>
                <input type="text" class="(#=obj.isParent()?'eap':''#)" name="name" value="(#=obj.name#)">
            </td>
    
            <td><input type="text" id="start(#=obj.getRow()+1#)" class="(#=obj.isParent()?'eap':''#) data" name="start" value=""></td>
            <td><input type="text" id="end(#=obj.getRow()+1#)" class="(#=obj.isParent()?'eap':''#) data" name="end" value=""></td>
            <td><input type="text" dir="rtl" name="duration" class="(#=obj.isParent()?'eap':''#)" value="(#=obj.duration#)"></td>
            <td><input type="text" class="(#=obj.isParent()?'eap':''#)" name="depends" value="(#=obj.depends#)" (#=obj.hasExternalDep?"readonly":""#)></td>
            <td class="taskAssigs"><md-chips ng-model="(#=obj.assigs#)">
                  <md-chip-template>
                    <strong>{{$chip}}</strong>
                  </md-chip-template>
                </md-chips></td>
        </tr>
        --></div>

    <div class="__template__" type="TASKEMPTYROW"><!--
    <tr class="taskEditRow emptyRow" >
      <td class="mdl-data-table__cell--non-numeric""></td>
      <td class="mdl-data-table__cell--non-numeric noClip" align="center"></td>
      <td class="mdl-data-table__cell--non-numeric"></td>
      <td class="mdl-data-table__cell--non-numeric"></td>
      <td class="mdl-data-table__cell--non-numeric"></td>
      <td class="mdl-data-table__cell--non-numeric"></td>
      <td class="mdl-data-table__cell--non-numeric"></td>
      <td class="mdl-data-table__cell--non-numeric"></td>
      <td class="mdl-data-table__cell--non-numeric"></td>
    </tr>
        --></div>

    <div class="__template__" type="TASKBAR"><!--
    <div class="taskBox taskBoxDiv" taskId="(#=obj.id#)" >
      <div class="layout (#=obj.hasExternalDep?'extDep':''#)">
        <div class="taskStatus" status="(#=obj.status#)"></div>
        <div class="taskProgress" style="width:(#=obj.progress>100?100:obj.progress#)%; background-color:(#=obj.progress>100?'red':'rgb(153,255,51);'#);"></div>
        <div class="milestone (#=obj.startIsMilestone?'active':''#)" ></div>
    
        <div class="taskLabel"></div>
        <div class="milestone end (#=obj.endIsMilestone?'active':''#)" ></div>
      </div>
    </div>
        --></div>

    <div class="__template__" type="CHANGE_STATUS"><!--
      <div class="taskStatusBox">
        <div class="taskStatus cvcColorSquare" status="STATUS_ACTIVE" title="active"></div>
        <div class="taskStatus cvcColorSquare" status="STATUS_DONE" title="completed"></div>
        <div class="taskStatus cvcColorSquare" status="STATUS_FAILED" title="failed"></div>
        <div class="taskStatus cvcColorSquare" status="STATUS_SUSPENDED" title="suspended"></div>
        <div class="taskStatus cvcColorSquare" status="STATUS_UNDEFINED" title="undefined"></div>
      </div>
        --></div>


    <div class="__template__" type="TASK_EDITOR"><!--
    <div class="ganttTaskEditor">
    <table width="100%">
      <tr>
        <td>
          <table cellpadding="5">
            <tr>
              <td><label for="code">code/short name</label><br><input type="text" name="code" id="code" value="" class="formElements"></td>
             </tr><tr>
              <td><label for="name">name</label><br><input type="text" name="name" id="name" value=""  size="35" class="formElements"></td>
            </tr>
            <tr></tr>
              <td>
                <label for="description">description</label><br>
                <textarea rows="5" cols="30" id="description" name="description" class="formElements"></textarea>
              </td>
            </tr>
          </table>
        </td>
        <td valign="top">
          <table cellpadding="5">
            <tr>
            <td colspan="2"><label for="status">status</label><br><div id="status" class="taskStatus" status=""></div></td>
            <tr>
            <td colspan="2"><label for="progress">progress</label><br><input type="text" name="progress" id="progress" value="" size="3" class="formElements"></td>
            </tr>
            <tr>
            <td><label for="start">start</label><br><input type="text" name="start" id="start"  value="" class="date" size="10" class="formElements"><input type="checkbox" id="startIsMilestone"> </td>
            <td rowspan="2" class="graph" style="padding-left:50px"><label for="duration">dur.</label><br><input type="text" name="duration" id="duration" value=""  size="5" class="formElements"></td>
          </tr><tr>
            <td><label for="end">end</label><br><input type="text" name="end" id="end" value="" class="date"  size="10" class="formElements"><input type="checkbox" id="endIsMilestone"></td>
          </table>
        </td>
      </tr>
      </table>
    
    <h2>assignments</h2>
    <table  cellspacing="1" cellpadding="0" width="100%" id="assigsTable">
      <tr>
        <th style="width:100px;">name</th>
        <th style="width:70px;">role</th>
        <th style="width:30px;">est.wklg.</th>
        <th style="width:30px;" id="addAssig"><span class="teamworkIcon" style="cursor: pointer">+</span></th>
      </tr>
    </table>
    
    <div style="text-align: right; padding-top: 20px"><button id="saveButton" class="button big">save</button></div>
    </div>
        --></div>


    <div class="__template__" type="ASSIGNMENT_ROW"><!--
    <tr taskId="(#=obj.task.id#)" assigId="(#=obj.assig.id#)" class="assigEditRow" >
      <td ><div class="input-field col s12"><select name="resourceId"  class="formElements" (#=obj.assig.id.indexOf("tmp_")==0?"":"disabled"#) ></select></div></td>
      <td ><select type="select" name="roleId"  class="formElements"></select></td>
      <td ><input type="text" name="effort" value="(#=getMillisInHoursMinutes(obj.assig.effort)#)" size="5" class="formElements"></td>
      <td align="center"><span class="teamworkIcon delAssig" style="cursor: pointer">d</span></td>
    </tr>
        --></div>


    <div class="__template__" type="RESOURCE_EDITOR"><!--
    <div class="resourceEditor" style="padding: 5px;">
      <h2>Project team</h2>
      <table  cellspacing="1" cellpadding="0" width="100%" id="resourcesTable">
        <tr>
          <th style="width:100px;">name</th>
          <th style="width:30px;" id="addResource"><span class="teamworkIcon" style="cursor: pointer">+</span></th>
        </tr>
      </table>
    
      <div style="text-align: right; padding-top: 20px"><button id="resSaveButton" class="button big">save</button></div>
    </div>
        --></div>


    <div class="__template__" type="RESOURCE_ROW"><!--
    <tr resId="(#=obj.id#)" class="resRow" >
      <td ><input type="text" name="name" value="(#=obj.name#)" style="width:100%;" class="formElements"></td>
      <td align="center"><span class="teamworkIcon delRes" style="cursor: pointer">d</span></td>
    </tr>
        --></div>

</div>

'use strict';

angular.module("Project").controller('DialogController', function ($scope, $mdDialog, currentTask, projectResources) {

    $scope.currentTask = currentTask;
    $scope.projectResources = projectResources;
    $scope.selectedResources = [];

    $scope.addAssign = addAssign;
    $scope.cancelar = cancelar;
    $scope.changeEndDateCallback = endChangeCallback;
    $scope.changeStartDateCallback = startChangeCallback;
    $scope.durationCallback = durationCallback;
    $scope.formatDates = formatDates();
    $scope.removeResourceTask = removeResourceTask;
    $scope.salvar = salvar;

    function formatDates() {
        $scope.currentTask.startDate = new Date($scope.currentTask.start);
        $scope.currentTask.endDate = new Date($scope.currentTask.end);
    }
    ;

    function startChangeCallback(date) {
        var dur = $scope.currentTask.duration;
        date.clearTime();
        $scope.currentTask.endDate = new Date(computeEndByDuration(date.getTime(), dur));
    }

    function endChangeCallback(end) {
        var start = $scope.currentTask.startDate;
        end.setHours(23, 59, 59, 999);

        if (end.getTime() < start.getTime()) {
            var dur = $scope.currentTask.duration;
            start = incrementDateByWorkingDays(end.getTime(), -dur);
            $scope.currentTask.startDate = new Date(computeStart(start));
        } else {
            $scope.currentTask.duration = recomputeDuration(start.getTime(), end.getTime());
        }
    }
    ;

    function durationCallback() {
        var start = $scope.currentTask.startDate;
        var dur = $scope.currentTask.duration;
        dur = dur <= 0 ? 1 : dur;
        $scope.currentTask.endDate = new Date(computeEndByDuration(start.getTime(), dur));
    }
    ;

    function addAssign() {
        var resourceTask = new ResourceTask();
        
        resourceTask.percent = 0;
        
        $scope.currentTask.assigs.push(resourceTask);
    }
    ;
    
    function removeResourceTask($event){
        $scope.selectedResources.forEach(function(resource){
            $scope.currentTask.assigs.splice($scope.currentTask.assigs.indexOf(resource),1);
        });
        $scope.selectedResources = [];
    }

    function cancelar() {
        $mdDialog.cancel();
    }
    ;
    function salvar() {
        $mdDialog.hide($scope.currentTask);
    }
    ;
})
angular.module('forms', ['blimpKit', 'platformView', 'platformLocale']).controller('FormController', ($scope, $http, LocaleService, ViewParameters) => {
    $scope.forms = {
        form: {}
    };

    $scope.model = {};

    $scope.onTriggerClicked = function(){
        $http.post("/services/ts/sales/bpmn/ProcessService.ts/processes/sls_mp", JSON.stringify($scope.model)).then(function (response) {
            if (response.status != 202) {
                alert(`Unable to trigger a new process: '${response.message}'`);
                return;
            }
            alert("A new process instance has been triggered.\nResponse: " + JSON.stringify(response.data));
        });
    }
    

});
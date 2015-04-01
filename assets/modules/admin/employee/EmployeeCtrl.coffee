app.controller "EmployeeCtrl", [
  "$scope",
  "$mdSidenav",
  "$http",
  ($scope, $mdSidenav, $http) ->
    $scope.users = []

    $http.get "/user/list"
    .success (result) ->
      console.log result
      $scope.users = result
    $scope.toggleLeft = () ->
      $mdSidenav('left').toggle()
      .then () ->
        $log.debug("toggle left is done")
]

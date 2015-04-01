app.controller "RoleCtrl", [
  "$scope",
  "$http",
  ($scope, $http) ->
    $scope.roles = []
    $scope.data = 
      new_role: ""
    $scope.add = () ->
      data = 
        name: $scope.data.new_role
      $http.post "/role/create", data
      .success (result) ->
        $scope.data.new_role = null
        if result
          $scope.roles.push result

    $http.get "/role/list"
    .success (data) ->
      $scope.roles = data


]

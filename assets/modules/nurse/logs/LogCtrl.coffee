app.controller "LogCtrl", [
  "$scope",
  "$http",
  ($scope, $http) ->
    $scope.logs        = []
    $scope.detailModal = false
    $scope.selected    = {}

    $http.get "/log/list"
    .success (result) ->
      $scope.logs = result

    $scope.toggleModal = () ->
      $scope.detailModal = !$scope.detailModal
    $scope.select = (index) ->
      $scope.selected  = $scope.logs[index]

]
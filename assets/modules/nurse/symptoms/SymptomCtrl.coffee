app.controller "SymptomCtrl", [
  "$scope",
  "$http",
  ($scope, $http) ->
    $scope.symptoms = []

    $scope.data =
      symptom:
        name: ''
        description: ''

    $scope.add = () ->
      $http.post "/symptom/create", $scope.data.symptom
      .success (data) ->
        if data
          $scope.symptoms.push data

    $http.get "/symptom/list"
    .success (data) ->
      $scope.symptoms = data
]

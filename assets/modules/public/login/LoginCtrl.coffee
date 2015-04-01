app.controller "LoginCtrl", [
  "$scope",
  "$http",
  ($scope, $http) ->
    $scope.login = () ->
      document.location = "/auth/google/"
    
    $scope.user =
      email: ''
      password: ''
]

app.config ($mdThemingProvider) ->
  $mdThemingProvider.theme 'docs-dark', 'default'
  .primaryPalette 'yellow'
  .dark()
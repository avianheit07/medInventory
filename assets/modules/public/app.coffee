app = angular.module("RegistrationApp", [ "ngResource", "ngRoute", "ngMaterial", "ngMessages" ])

app.config [ "$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
  .when("/",
    template: JST["public/login/login.html"]()
    controller: "LoginCtrl"
  )
 ]
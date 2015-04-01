app = angular.module("RegistrationApp", [ "ngResource", "ngRoute" ])

app.config [ "$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
  .when("/medicine",
    template: JST["nurse/medicine/list.html"]()
    controller: "MedCtrl"
  )
  .when("/symptoms",
    template: JST["nurse/symptoms/list.html"]()
    controller: "SymptomCtrl"
  )
  .when("/logs",
    template: JST["nurse/logs/list.html"]()
    controller: "LogCtrl"
  )
  .when("/inquiries",
    template: JST["nurse/inquiries/list.html"]()
    controller: "InquiryCtrl"
  )
  .when("/settings",
    template: JST["nurse/settings/list.html"]()
    controller: "SettingCtrl"
  ).when("/medicine",
    template: JST["nurse/medicine/list.html"]()
    controller: "MedCtrl"
  )
 ]
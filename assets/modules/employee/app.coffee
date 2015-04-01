app = angular.module("RegistrationApp", [ "ngResource", "ngRoute" ])

app.config [ "$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
  .when("/medicine",
    template: JST["employee/medicine/med.html"]()
    controller: "MedCtrl"
  ).when("/inquiries",
    template: JST["employee/inquire/inquiry.html"]()
    controller: "InquiryCtrl"
  ).when("/medicine",
    template: JST["employee/medicine/med.html"]()
    controller: "MedCtrl"
  )
 ]
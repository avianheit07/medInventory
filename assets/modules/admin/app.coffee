app = angular.module("RegistrationApp", [ "ngResource", "ngRoute", "ngMaterial", "ngMessages" ])

app.config [ "$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider
  .when("/employee",
    template: JST["admin/employee/employee.html"]()
    controller: "EmployeeCtrl"
  ).when("/role",
    template: JST["admin/role/role.html"]()
    controller: "RoleCtrl"
  ).when("/setting",
    template: JST["admin/setting/setting.html"]()
    controller: "SettingCtrl"
  ).when("/employee",
    template: JST["admin/employee/employee.html"]()
    controller: "EmployeeCtrl"
  )
 ]
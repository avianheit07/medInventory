app.controller "InquiryCtrl", [
  "$scope",
  "$http",
  ($scope, $http) ->
    $scope.logs        = []
    $scope.detailModal = false
    $scope.selected    = {}
    $scope.message     = ''
    $scope.user        = {}
    $scope.value       =
      inquirer: null
      chat: []

    $http.get "/log/list"
    .success (result) ->
      $scope.logs = result

    $http.get "/auth/logged"
    .success (data) ->
      $scope.user = data
      io.socket.get "/inquiry/show/#{data.session.id}", (msg) ->
        console.log 'here', msg
        if msg.length > 0
          $scope.value = msg[0]
          $scope.test  = manipulateString($scope.value.chat)
          console.log $scope.value

        $scope.$digest()

      io.socket.on "inquiry/#{data.session.id}", (msg) ->
        console.log 'socket listen', msg
        if msg?
          $scope.value.chat = chat
          $scope.test       = manipulateString($scope.value.chat)

        $scope.$digest()


    $scope.toggleModal = () ->
      $scope.detailModal = !$scope.detailModal
    $scope.select = (index) ->
      $scope.selected  = $scope.logs[index]
    $scope.send = () ->
      type = (if $scope.value.id? then "put" else "post")

      data = 
        username: "#{$scope.user.session.given_name}"+ " #{$scope.user.session.family_name}"
        message: $scope.message

      if type is 'put'
        console.log 'put'
        $scope.value.chat.push data
        console.log 'put', $scope.value
        $scope.test           =  manipulateString($scope.value.chat)
        io.socket[type] "/inquiry/create", $scope.value, (data, result) ->

      else
        console.log 'post'
        $scope.value.inquirer = $scope.user.session.id
        $scope.value.chat.push data

        io.socket[type] "/inquiry/create", $scope.value, (data, result) ->



    manipulateString = (obj) ->
      string = ''

      obj.forEach (value) ->
        if value
          string += "<b>#{value.username}:</b> #{value.message}"

      return string

]
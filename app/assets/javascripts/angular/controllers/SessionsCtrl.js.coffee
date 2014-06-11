@app.controller 'SessionsCtrl', ['$scope', '$location', 'Login', 'Session', ($scope, $location, Login, Session) ->
	$scope.alerts = []
	$scope.a = "ok"

	$scope.crear = (params) ->
		$scope.login = new Login(params)
		Login.create($scope.login, ($data) ->
			if $data.user != null
				Session.activate()
				Session.setUser($data.user)
				$location.path("/forms")
			else
				$scope.addAlert("danger", "Error en los datos")
				$scope.session = angular.copy({})
		)

	$scope.addAlert = (tipo, msj) ->
    	$scope.alerts.push({type: tipo, msg: msj})

	$scope.closeAlert = (index) ->
    	$scope.alerts.splice(index, 1)
]
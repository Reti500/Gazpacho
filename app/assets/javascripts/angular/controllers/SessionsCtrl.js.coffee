@app.controller 'SessionsCtrl', ['$scope', '$location', 'Session', ($scope, $location, Session) ->
	$scope.alerts = []

	$scope.login = (params) ->
		$scope.session = new Session(params)
		Session.create($scope.session, ($data) ->
			if $data.state == "Logged"
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
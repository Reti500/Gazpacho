@app.controller 'AuthServiceCtrl', 
	['$scope', '$rootScope', '$location', '$log', 'AUTH_EVENTS', 'AuthService', 'Session', 
	($scope, $rootScope, $location, $log, AUTH_EVENTS, AuthService, Session) -> 
	
		$scope.alerts = []

		$scope.credentials = {
			email: '',
			password: ''
		}

		$scope.login = (credentials) ->
			$scope.authService = new AuthService(credentials)
			AuthService.create($scope.session, 
				($data) ->
					if $data.state == "Logged"
						$location.path("/projects")
						$rootScope.$broadcast(AUTH_EVENTS.loginSuccess)
						Session.create()
					else
						$scope.addAlert("danger", "Error en los datos")
						$scope.session = angular.copy({})
						$rootScope.$broadcast(AUTH_EVENTS.loginFailed)
			)

		$scope.addAlert = (tipo, msj) ->
    		$scope.alerts.push({type: tipo, msg: msj});

  		$scope.closeAlert = (index) ->
		    $scope.alerts.splice(index, 1);
	]
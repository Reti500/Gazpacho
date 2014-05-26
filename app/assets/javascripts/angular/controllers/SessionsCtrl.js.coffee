@app.controller 'SessionsCtrl', ['$scope', '$routeParams', 'Session', ($scope, $routeParams, Session) -> 
	$scope.session = new Session($routeParams)

	$scope.submit = () ->
		console.log("submit")


		Session.create($scope.session, ($data) ->
			console.log($data)
		)
]
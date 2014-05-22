@app.controller 'FormsShowCtrl', ['$scope', '$routeParams', 'Form', ($scope, $routeParams, Form) ->
	$scope.form = Form.show({ id: $routeParams.id })
]
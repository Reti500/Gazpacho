@app.controller 'FormsIndexCtrl', ['$scope', 'Form', ($scope, Form) ->
	Form.index({}, ($data) ->
		$scope.forms = $data.forms
		console.log($data.forms)
	)
]
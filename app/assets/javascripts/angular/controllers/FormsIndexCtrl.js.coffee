@app.controller 'FormsIndexCtrl', ['$scope', 'Form', ($scope, Form) ->
	$scope.forms = Form.index()
	$scope.all = $scope.forms.forms
]
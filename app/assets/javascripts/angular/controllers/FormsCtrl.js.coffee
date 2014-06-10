@app.controller 'FormsCtrl', ['$scope', 'Form', 'Project', ($scope, Form, Project) ->
	$scope.index = () ->
		Form.index({}, ($data) ->
			$scope.forms = $data.forms
		)

		Project.index({}, ($data) ->
			$scope.projects = $data.projects
		)

	$scope.new = ($routeParams, $isValid) ->
		if $isValid
			alert($routeParams)

	$scope.nuevo = ($params) ->
		$scope.form = new Form($params)
		Form.create($scope.form, ($data) ->
			$scope.forms.push($data.form)
		)
	console.log("aef")
]
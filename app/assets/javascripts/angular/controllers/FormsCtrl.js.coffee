@app.controller 'FormsCtrl', ['$scope', '$routeParams', 'Form', 'Project', ($scope, $routeParams, Form, Project) ->
	$scope.index = () ->
		Form.index({}, ($data) ->
			$scope.forms = $data.forms
		)

		Project.index({}, ($data) ->
			$scope.projects = $data.projects
		)

	$scope.show = () ->
		console.log($routeParams)
		Form.show({id: $routeParams.id}, ($data) ->
			$scope.form = $data.form
		)

	$scope.nuevo = ($params) ->
		$scope.form = new Form($params)
		Form.create($scope.form, ($data) ->
			$scope.forms.push($data.form)
			$scope.form = angular.copy({})
		)

	$scope.delete = () ->
		@deleteUser = window.confirm('Are you absolutely sure you want to delete?')

		if @deleteUser
			console.log("muere!!")

	$scope.ver_pregunta = () ->
		
]
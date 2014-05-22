@app.controller 'FormsCtrl', ['$scope', 'Form', 'Project', ($scope, Form, Project) ->
	# $scope.index = () ->
	# 	Form.index({}, ($data) ->
	# 		$scope.forms = $data.forms
	# 	)

	# $scope.projects = () ->
	# 	Project.index({}, ($data)->
	# 		$scope.projects = $data.projects
	# 	)

	$scope.index = Form.index({}, ($data) ->
		$scope.forms = $data.forms
	)

	$scope.projects = Project.index({}, ($data) ->
		$scope.projects = $data.projects
		console.log( $data.forms)
	)

	$scope.new = ($isValid) ->
		if $isValid then alert("new") else alert("dksjfbhhkdsbgfh")
]
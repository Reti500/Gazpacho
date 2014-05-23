@app.controller 'ProjectCtrl', ['$scope', 'Project', ($scope, Project) -> 
	$scope.index = () ->
		Project.index({}, ($data) ->
			$scope.projects = $data.projects
		)

	$scope.new = ($routeParams) ->
		if $routeParams.$valid
			# $scope.project = new Project($routeParams)
			# Project.create($scope.project)
			console.log($routeParams)
]
@app.controller 'ProjectsCtrl', ['$scope', '$location', 'Project', ($scope, $location, Project) ->

	$scope.viewAllProjects = true
	$scope.viewSingleProject = false
	$scope.idProject = -1

	$scope.index = () ->
		Project.index({}, ($data) ->
			$scope.projects = $data.projects
		)

	$scope.show = ($id) ->
		Project.show({ id: $id }, ($data) ->
			$scope.project = $data.project
			$scope.verSingle($id)
		)

	# $scope.new = ($routeParams) ->
	# 	console.log($routeParams)
	# 	if $routeParams.id
	# 		$scope.update = Project.show({ id: $routeParams.id })
	# 		Project.update($scope.update, ($data) ->
	# 			if($data.status == "Guardado")
	# 				$scope.project = angular.copy({})
	# 				$scope.index()
	# 		)
	# 	else
	# 		$scope.project = new Project($routeParams)
	# 		Project.create($scope.project, ($data) ->
	# 			if($data.status == "Guardado")
	# 				$scope.project = angular.copy({})
	# 				$scope.index()
	# 			)

		

	$scope.destroy = ($id) ->
		Project.destroy({ id: $id }, ($data) ->
			$scope.index()
		)

	$scope.verAll = () ->
		$scope.viewAllProjects = true
		$scope.viewSingleProject = false
		$scope.project = angular.copy({})

	$scope.verSingle = ($id) ->
		$scope.viewAllProjects = false
		$scope.viewSingleProject = true
		$scope.idProject = $id
]
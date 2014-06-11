@app.controller 'ProjectsCtrl', 
	['$scope', '$routeParams', '$location', '$log', 'Project', 'Session', ($scope, $routeParams, $location, $log, Project, Session) ->

		$scope.viewAllProjects = true
		$scope.viewSingleProject = false

		$scope.index = () ->
			Project.index({}, ($data) ->
				$scope.projects = $data.projects
			)

		$scope.detalles = ($project) ->
			$location.path("/projects/" + $project.id)
			
		$scope.show = () ->
			Project.show({ id: $routeParams.id }, ($data) ->
				$scope.project = $data.project
			)

		$scope.nuevo = ($params) ->
			$log.info($params)
			$scope.project = new Project($params)
			Project.create($scope.project, ($data) ->
				if $data.status == "Guardado"
					$scope.params = angular.copy({})
					$scope.index()
			)

		$scope.destroy = ($id) ->
			Project.destroy({ id: $id }, ($data) ->
				$scope.index()
			)
	]
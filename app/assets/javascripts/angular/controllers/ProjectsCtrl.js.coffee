@app.controller 'ProjectsCtrl', 
	['$scope', '$location', '$log', 'Project', ($scope, $location, $log, Project) ->

		$scope.viewAllProjects = true
		$scope.viewSingleProject = false

		$scope.index = () ->
			Project.index({}, ($data) ->
				$scope.projects = $data.projects
			)

		$scope.show = ($id) ->
			console.log("show")
			Project.show({ id: $id }, ($data) ->
				$scope.project = $data.project
				$scope.verSingle($id)
			)

		$scope.nuevo = ($params) ->
			$log.info($params)
			$scope.project = new Project($params)
			Project.create($scope.project, ($data) ->
				if $data.status == "Guardado"
					$scope.project = angular.copy({})
					$scope.index()
			)

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
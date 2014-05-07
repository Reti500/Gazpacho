# @gazpacho.controller 'ProjectsCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
# 	$scope.projects = []

# 	$http.get('./projects.json').success((data) ->
# 		$scope.projects = data.projects
# 	)

# 	$scope.save = (project) ->
# 		$http.post('./projects.json').success((data) ->
# 			alert(data.status)
# 		)
# ]

# @gazpacho.controller 'ProjectsCtrl', ['$scope', '$routeParams', 'Projects', ($scope, $routeParams, Projects) ->
# 	$scope.p = Projects.get()

# 	alert($scope.p)
# 	console.log($scope.p)
# 	# $scope.tasks = Task(taskListId).all()
# 	# console.log($scope.tasks)
# ]

@gazpacho.controller 'ProjectsCtrl', ($scope, Projects) ->
	$scope.projects = Projects.get()
	console.log($scope.projects.projects)
	# $scope.init = (projectListId) ->
	# @service = new ProjectService(projectListId)
	# $scope.projects = @service.all()

	# $scope.projects
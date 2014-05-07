@gazpacho = angular.module('gazpacho', ['ngResource', 'ngRoute'])

@gazpacho.config(['$routeProvider', ($routeProvider) ->
	$routeProvider.
		when('/home', {
			templateUrl: '../templates/home.html',
			controller: 'HomeCtrl'
		}).
		when('/projects', {
			templateUrl: '../templates/projects.html'
			controller: 'ProjectsCtrl'
		})
])

@gazpacho.factory('Projects', ['$resource', ($resource) ->
	# return $resource('/projects.json', null,
	# 	{
	# 		'view': {method: 'GET'}
	# 	}
	# )
	# alert("hola")
	return $resource('/projects.json', {})
	# return @service.query()
])

# @gazpacho.factory 'ProjectService', ($resource) ->
# 	class ProjectService
# 		constructor: (projectListId) ->
# 			@service = $resource('/projects.json', {project_list_id: projectListId, id: '@id'})

# 		create: (attrs) ->
# 			new @service(project: attrs).$save (project) ->
# 				attrs.id = project.id
# 			attrs

# 		all: ->
# 			@service.query()

# @gazpacho.factory('Projects', ['$log', '$resource', ])
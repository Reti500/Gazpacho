# @gazpacho = angular.module('gazpacho', ['ngResource', 'ngRoute'])

# @gazpacho.config(['$routeProvider', ($routeProvider) ->
# 	$routeProvider.
# 		when('/home', {
# 			templateUrl: '../templates/home.html',
# 			controller: 'HomeCtrl'
# 		}).
# 		when('/projects', {
# 			templateUrl: '../templates/projects.html'
# 			controller: 'ProjectsCtrl'
# 		})
# ])

# @gazpacho.factory('Projects', ['$resource', ($resource) ->
# 	# return $resource('/projects.json', null,
# 	# 	{
# 	# 		'view': {method: 'GET'}
# 	# 	}
# 	# )
# 	# alert("hola")
# 	return $resource('/projects.json', {},
# 		{
# 			'create':  { method: 'POST' },
# 			'index':   { method: 'GET', isArray: true },
# 			'show':    { method: 'GET', isArray: false },
# 			'update':  { method: 'PUT' },
# 			'destroy': { method: 'DELETE' }
# 		}
# 	)
# 	# return @service.query()
# ])

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


@app = angular.module("App", ["ngResource", "ngRoute"])

@app.config(['$routeProvider', ($routeProvider) ->
	$routeProvider
		.when('/home', {templateUrl: '../templates/home.html', controller: 'HomeCtrl'})
		.when('/forms', {templateUrl: '../templates/forms.html', controller: 'FormsIndexCtrl'})
	# 	.when("/contacts", { templateUrl: "<%= asset_path('contacts/index.html') %> ", controller: "ContactsIndexCtrl" })
	#     .when("/contacts/new", { templateUrl: "<%= asset_path('contacts/edit.html') %> ", controller: "ContactsEditCtrl" })
	#     .when("/contacts/:id", { templateUrl: "<%= asset_path('contacts/show.html') %> ", controller: "ContactsShowCtrl" })
	#     .when("/contacts/:id/edit", { templateUrl: "<%= asset_path('contacts/edit.html') %> ", controller: "ContactsEditCtrl" })
	#     .otherwise({ redirectTo: "/contacts" });
])

@app.config(['$httpProvider', ($httpProvider) -> 
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
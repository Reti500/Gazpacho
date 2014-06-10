@app = angular.module('App', ['ngResource', 'ngRoute', 'ui.bootstrap'])

@app.config(['$routeProvider', ($routeProvider) ->
	$routeProvider
		.when('/projects', { templateUrl: '../templates/projects/index.html', controller: 'ProjectsCtrl' })
		.when('/projects/:id', { templateUrl: '../templates/projects/show.html', controller: 'ProjectsCtrl' })
		.when('/forms', { templateUrl: '../templates/forms/index.html', controller: 'FormsCtrl' })
		.when('/login', { templateUrl: '../templates/sessions/login.html', controller: 'SessionsCtrl' })
])

@app.config(['$httpProvider', ($httpProvider) -> 
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
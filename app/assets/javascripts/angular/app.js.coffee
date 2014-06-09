@app = angular.module('App', ['ngResource', 'ngRoute', 'ui.bootstrap'])

@app.config(['$routeProvider', ($routeProvider) ->
	$routeProvider
		.when('/projects', { templateUrl: '../templates/projects/index.html', controller: 'ProjectsCtrl' })
])

@app.config(['$httpProvider', ($httpProvider) -> 
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
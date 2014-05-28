@app = angular.module("App", ["ngResource", "ngRoute", "ui.bootstrap"])

@app.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
	$locationProvider.html5Mode(true)
	$routeProvider
		.when('/home', {templateUrl: '../templates/home.html', controller: 'HomeCtrl'})
		.when('/forms', {templateUrl: '../templates/forms/index.html', controller: 'FormsCtrl'})
		.when('/forms/:id', {templateUrl: '../templates/forms/show.html', controller: 'FormsShowCtrl'})
		.when('/answers', {templateUrl: '../templates/answers/index.html', controller: 'AnswerIndexCtrl'})
		.when('/projects', {templateUrl: '../templates/projects/index.html', controller: 'ProjectsCtrl'})
		.when('/projects/:id', {templateUrl: '../templates/projects/show.html', controller: 'ProjectsCtrl'})
		.when('/login', {templateUrl: '../templates/sessions/new.html.erb', controller: 'AuthServiceCtrl'})
	# 	.when("/contacts", { templateUrl: "<%= asset_path('contacts/index.html') %> ", controller: "ContactsIndexCtrl" })
	#     .when("/contacts/new", { templateUrl: "<%= asset_path('contacts/edit.html') %> ", controller: "ContactsEditCtrl" })
	#     .when("/contacts/:id", { templateUrl: "<%= asset_path('contacts/show.html') %> ", controller: "ContactsShowCtrl" })
	#     .when("/contacts/:id/edit", { templateUrl: "<%= asset_path('contacts/edit.html') %> ", controller: "ContactsEditCtrl" })
	    .otherwise({ redirectTo: "/home" });
])

@app.config(['$httpProvider', ($httpProvider) -> 
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

@app.constant('AUTH_EVENTS', {
	loginSuccess: 'auth-login-success',
	loginFailed: 'auth-login-failed',
	logoutSuccess: 'auth-logout-success',
	sessionTimeout: 'auth-session-timeout',
	notAuthenticated: 'auth-not-authenticated',
	notAuthorized: 'auth-not-authorized'
})
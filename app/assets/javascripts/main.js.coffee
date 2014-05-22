@app = angular.module("App", ["ngResource", "ngRoute"])

@app.config(['$routeProvider', ($routeProvider) ->
	$routeProvider
		.when('/home', {templateUrl: '../templates/home.html', controller: 'HomeCtrl'})
		.when('/forms', {templateUrl: '../templates/forms/index.html', controller: 'FormsCtrl'})
		.when('/forms/:id', {templateUrl: '../templates/forms/show.html', controller: 'FormsShowCtrl'})
		.when('/answers', {templateUrl: '../templates/answers/index.html', controller: 'AnswerIndexCtrl'})
	# 	.when("/contacts", { templateUrl: "<%= asset_path('contacts/index.html') %> ", controller: "ContactsIndexCtrl" })
	#     .when("/contacts/new", { templateUrl: "<%= asset_path('contacts/edit.html') %> ", controller: "ContactsEditCtrl" })
	#     .when("/contacts/:id", { templateUrl: "<%= asset_path('contacts/show.html') %> ", controller: "ContactsShowCtrl" })
	#     .when("/contacts/:id/edit", { templateUrl: "<%= asset_path('contacts/edit.html') %> ", controller: "ContactsEditCtrl" })
	#     .otherwise({ redirectTo: "/contacts" });
])

@app.config(['$httpProvider', ($httpProvider) -> 
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
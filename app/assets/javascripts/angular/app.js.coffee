@app = angular.module('App', ['ngResource', 'ngRoute', 'ui.bootstrap', 'Authentication'])

@authentication = angular.module('Authentication', [])
	.factory 'Session', ->
		@authenticated = false
		@user = null
		isAuthenticated: => @authenticated
		getUser: => @user
		setUser: ($user) ->
			@user = $user
		activate: =>
			@authenticated = true


window.routes = {
	'/projects':{templateUrl:'../templates/projects/index.html', controller:'ProjectsCtrl', requireLogin:true},
	'/projects/:id':{templateUrl:'../templates/projects/show.html', controller:'ProjectsCtrl', requireLogin:true},
	'/forms':{templateUrl:'../templates/forms/index.html', controller:'FormsCtrl', requireLogin:true },
	'/forms/:id':{templateUrl:'../templates/forms/show.html', controller:'FormsCtrl', requireLogin:true},
	'/login':{templateUrl:'../templates/sessions/login.html', controller:'SessionsCtrl', requireLogin:false}
}

@app.config(['$routeProvider', ($routeProvider) ->
	for path of window.routes
		$routeProvider.when(path, window.routes[path])
])

@app.config(['$httpProvider', ($httpProvider) -> 
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

@app.run(($rootScope, $location, Session, Login) ->
	$rootScope.$on("$routeChangeStart", ($event, $next, $current) ->
		# if $next.requireLogin && !Session.isAuthenticated()
		# 	$location.path("/login")
		Login.verify({}, ($data)->
			if $data.user == null && $next.requireLogin
				$location.path("/login")
		)	
	)
	
)

# @app.directive('confirmationNeeded', () ->
# 	@priority: 1
#     @terminal: true
#     link: (scope, element, attr) =>
#     	@msg = attr.confirmationNeeded || "Are you sure?"
#     	clickAction = attr.ngClick
#     	element.bind('click', (click) ->
#     		if window.confirm(msg)
#     			$scope.$eval(clickAction)
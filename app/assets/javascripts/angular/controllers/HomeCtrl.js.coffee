# @gazpacho.controller 'HomeCtrl', ['$scope', ($scope) -> 
# 	$scope.message = "Angular!"

# 	$scope.dates = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1516, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
# ]

@app.controller 'HomeCtrl', ['$scope', '$modal', '$log', ($scope, $modal, $log) ->
	$scope.items = []
	$scope.message = "Angular!"

	# $scope.open = () ->
	# 	$modal.open({
	#       templateUrl: '../templates/projects.html',
	#       controller: 'HomeCtrl',
	#       size: "",
	#       resolve: {
	#         items: () ->
	#           return $scope.items;
	#       }
	#     })
]
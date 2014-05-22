@app.controller 'AnswerIndexCtrl', ['$scope', '$routeParams', 'Answer', ($scope, $routeParams, Answer) ->
	$scope.answers = Answer.index()
]
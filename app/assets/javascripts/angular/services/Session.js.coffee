@app.service 'Session', () ->
	# $scope.logged = false
	this.logged = false
	this.create = () ->
		$scope.logged = true

	this.destroy = () ->
		$scope.logged = false

	return this

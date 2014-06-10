@app.factory("Session", ['$resource', ($resource) ->
	return $resource('./api/sessions', { },
		{
			'create':  { method: 'POST' },
			'destroy': { method: 'DELETE' }
		}
	)
])
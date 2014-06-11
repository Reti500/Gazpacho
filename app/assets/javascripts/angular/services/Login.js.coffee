@app.factory("Login", ['$resource', ($resource) ->
	return $resource('./api/sessions', { },
		{
			'create':  { method: 'POST' },
			'destroy': { method: 'DELETE' },
			'verify': { method: 'GET' }
		}
	)
])
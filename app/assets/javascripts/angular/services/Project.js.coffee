@app.factory("Project", ['$resource', ($resource) ->
	return $resource('./api/projects/:id', { id: "@id" },
		{
			'create':  { method: 'POST' },
			'index':   { method: 'GET', isArray: false}
			'show':    { method: 'GET', isArray: false },
			'update':  { method: 'PUT' },
			'destroy': { method: 'DELETE' }

		}
	)
])
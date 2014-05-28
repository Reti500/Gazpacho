@app.factory("AuthService", ['$resource', ($resource) -> 
	return $resource('./api/sessions', { },
		{
			'create':  { method: 'POST' },
			'destroy': { method: 'DELETE' }

		}
	)
])
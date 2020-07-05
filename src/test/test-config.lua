path_config = {
	
	{
		url = "/resource/1",
		verb = "GET",
		response_crypto = {
			mode = "none"
		}
	},

	{
		url = "/resource/2",
		verb = "GET",
		request_crypto = "all",
		response_crypto = "none"
	},

	{
		url = "/resource/3",
		verb = "GET",
		request_crypto = "all",
		response_crypto = "all"
	},

	{
		url = "/resource/4",
		verb = "GET",

		request_crypto = {
			mode = "json",
			path = "/secret"
		},

		response_crypto = "none"
	},

	{
		url = "/resource/5",
		verb = "GET",
		
		request_crypto = {
			mode = "json",
			path = "/secret"
		},
		
		response_crypto = {
			mode = "json",
			path = "/secret"
		},
	}

}
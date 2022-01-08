from json_utils import JsonUtils

interface OWActionAPI {
	RequestResponse: action( string )( string )
}

service OWAction {
	execution: concurrent
	
	embed JsonUtils as jsonUtils

	inputPort OWActionInput {
		location: "local"
		// protocol: http { format = "json" }
		interfaces: OWActionAPI
	}

	main {  
		action( name )( "Hello, " + name )
	}
}

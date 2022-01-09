from json_utils import JsonUtils
from console import Console

type OWActionType {
  name: string
}

interface OWActionAPI {
	RequestResponse: action( OWActionType )( string )
}

service OWAction {
	execution: concurrent

	embed JsonUtils as jsonUtils
  embed Console as Console

	inputPort OWActionInput {
		location: "local"
		// protocol: http { format = "json" }
		interfaces: OWActionAPI
	}

	main {  
    
		action( param )( response ) {
      response = "Hello, " + param.name
    }
	}
}

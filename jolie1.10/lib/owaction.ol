from .owactioninterface import OWActionAPI

service OWAction {
	execution: concurrent

  inputPort OWActionInput {
    location: "local"
    interfaces: OWActionAPI
  }
  
	main {  
		action( name )( "Hello, " + name )
	}
}

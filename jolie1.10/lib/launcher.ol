from console import Console, ConsoleInputInterface
from file import File
from json_utils import JsonUtils
from .owaction import OWAction

service OWActionLauncher {
	embed Console as console  
	embed File as file
  embed JsonUtils as JsonUtils
	embed OWAction as owAction

	inputPort ConsoleInputPort {
		location: "local"
		interfaces: ConsoleInputInterface
	}
	
	init {
		registerForInput@console()()
	}

	main {
		keepRunning = true
		while( keepRunning ) {
			in( param )
			if( param instanceof string && param != "" ) {
        // extract arguments from JSON  
        getJsonValue@JsonUtils( param )( JsonParam )         
        //getJsonString@JsonUtils( JsonParam.value )( stringValue )     
				action@owAction( JsonParam.value )( actionOut )
				println@console( "Function output: " + actionOut )()
				writeFile@file( {
						filename = "/dev/fd/3"
						content = actionOut 
						append = 1
						format = "json"
				} )()
				writeFile@file( {
						filename = "/dev/fd/3"
						content = "\n"
						append = 1
				} )()
			} else {
				keepRunning = false
			}
		}
	}
}

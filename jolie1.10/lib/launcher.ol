from console import Console, ConsoleInputInterface
from file import File
from .owaction import OWAction

service OWActionLauncher {
	embed Console as console  
	embed File as file
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
				action@owAction( param )( greeting )
				println@console( greeting )()
				writeFile@file( {
						filename = "/dev/fd/3"
						content = greeting 
						append = 1
						format = "json"
				} )()
			} else {
				keepRunning = false
			}
		}
	}
}

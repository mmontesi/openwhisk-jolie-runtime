from console import Console
from console import ConsoleInputInterface

from file import File

include "OW_ActionInterface.iol"

outputPort OWAction { interfaces: OWActionAPI }

inputPort ConsoleInputPort {
  location: "local"
  interfaces: ConsoleInputInterface
}

embedded {
  Jolie: "OW_Action.ol" in OWAction
}

service OWActionLauncher {
  embed Console as Console  
  embed File as File
	
  init {
		registerForInput@Console()()
	}

  main
  {
    keepRunning = true
    while( keepRunning ){
      print@Console( "Type something (ENTER to quit): " )()
      in( param )
      if( param != "" ) {
        action@OWAction( param )( greeting )
        println@Console( greeting )()
        /*
        writeFile@File( {
            filename = "/dev/fd/3"
            content = greeting
            append = 1
        } )()    
        */
      } else {
        keepRunning = false
      }
    }
  }
}

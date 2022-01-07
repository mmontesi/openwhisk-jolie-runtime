from console import Console
include "OW_ActionInterface.iol"

outputPort OWAction { interfaces: OWActionAPI }

embedded {
  Jolie: "OW_Action.ol" in OWAction
}

service OWActionLauncher {
  embed Console as console
  main
  {
    action@OWAction( "param" )( greeting )
    println@console( greeting )()
  }
}

include "console.iol"
include "OW_ActionInterface.iol"

outputPort OWAction { interfaces: OWActionAPI }

embedded {
  Jolie: "OW_Action.ol" in OWAction
}

main
{
	action@OWAction( "Jolie" )( greeting )
	println@Console( greeting )()
}
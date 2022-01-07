execution { concurrent }

include "OW_ActionInterface.iol"
include "json_utils.iol"

main
{  
	action( name )( jsonParsed ) {
    getJsonString@JsonUtils( "Hello, " + name )( jsonParsed )
  }
}
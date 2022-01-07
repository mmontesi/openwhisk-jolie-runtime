include "OW_ActionInterface.iol"
from json_utils import JsonUtils

service OWAction {
  embed JsonUtils as jsonUtils
  main
  {  
    action( name )( jsonParsed ) {
      getJsonString@jsonUtils( "Hello, " + name )( jsonParsed )
    }
  }
}

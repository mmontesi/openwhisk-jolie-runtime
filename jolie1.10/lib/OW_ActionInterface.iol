interface OWActionAPI {
  RequestResponse: action( string )( string )
}

inputPort OWActionInput {
  location: "local"
  protocol: http { format = "json" }
  interfaces: OWActionAPI
}
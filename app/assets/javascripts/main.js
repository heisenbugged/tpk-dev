/** Garber Irish JS-init script **/
JSRouter = {};
Util = {
  exec: function( controller, action ) {
    var ns = JSRouter,
        action = ( action === undefined ) ? "init" : action;
 
    if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {
      ns[controller][action]();
    }
  },
 
  init: function() {
    var body = document.body,
        controller = body.getAttribute( "data-controller" ),
        action = body.getAttribute( "data-action" );
 
    Util.exec( "common" );
    Util.exec( controller );
    Util.exec( controller, action );
  }
}; 
$( document ).ready( Util.init );
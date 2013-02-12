
(function(namespace){

    function removeSwitch( id ){
        alert( "remove switch:" + id );
    }

    function removeEntity( id ){
        alert( "remove entity:" + id );
    }

    function removeField( id ){
        alert( "remove field:" + id );
    }

    function removeProject( id ){
        alert( "remove field:" + id );
    }



    namespace.removeSwitch = removeSwitch;
    namespace.removeField = removeField;
    namespace.removeEntity = removeEntity;
    namespace.removeProject = removeProject;

})( RooGo || (RooGo = {}) )
var RooGo;